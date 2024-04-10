from django.core.management.base import BaseCommand
from django.db.models import Avg, Q
from app.models import PerformanceData, Player

class Command(BaseCommand):
    help = 'Analyzes the performance of players and updates their training advice.'

    def handle(self, *args, **kwargs):
        # Get the average accuracy of training sessions for the entire team
        # Assuming null values are filtered out for team average calculation
        team_average_accuracy = PerformanceData.objects.filter(session='Training').exclude(accuracy__isnull=True).aggregate(Avg('accuracy'))['accuracy__avg']

        # Get all player IDs
        all_player_ids = Player.objects.values_list('id', flat=True)

        # Iterate through all player IDs
        for player_id in all_player_ids:
            # Get all performance data for this player, excluding sessions with null values in critical metrics
            player_sessions = PerformanceData.objects.filter(player__id=player_id).exclude(Q(heart_rate__isnull=True) | Q(speed__isnull=True) | Q(accuracy__isnull=True))

            # Generate advice for each player's each session
            for session in player_sessions:
                # Analyze heart rate, excluding outlier values directly within advice logic
                if session.heart_rate and 40 < session.heart_rate < 200:  # Validating against defined outlier range
                    heart_rate_advice = (
                        "Poor cardiorespiratory function, consider increasing aerobic exercise duration. Example: 4 sets of 4-minute runs at 90-95% maximum heart rate, with 3 minutes of rest or light jogging between sets."
                        if session.heart_rate > 160 else ""
                    )
                else:
                    heart_rate_advice = ""

                # Analyze speed, considering valid range and team average
                if session.speed and 1.0 < session.speed < 15.0:  # Adjust based on your outlier definition
                    speed_advice = (
                        "Running speed below team average, need to strengthen running training and increase sprints. Example: Sprint Drills: Perform 8-10 sprints of 30-50 meters, focusing on maximum effort. Ensure full recovery between sprints, roughly 1-2 minutes of walking or light jogging."
                        if session.speed < 7 else ""  # Assuming 7 as an example threshold
                    )
                else:
                    speed_advice = ""

                # Calculate accuracy advice for the player, excluding nulls and outliers
                if session.accuracy and 0.0 < session.accuracy <= 1.0:  # Assuming accuracy within 0 and 1 is valid
                    accuracy_advice = (
                        "Shooting accuracy is poor, need to improve shooting technique including angle and power control. Example: Target Practice: Set up targets in the goal (e.g., cones or small goals within the goal) and practice hitting specific targets from various distances and angles. Start close to increase confidence and gradually increase distance."
                        if session.accuracy < 0.1 else ""
                    )
                else:
                    accuracy_advice = ""

                # Build the full training advice text
                full_advice = f"{heart_rate_advice} {speed_advice} {accuracy_advice}".strip()

                # Update the advice field of the session record
                session.training_advice = full_advice
                session.save()

        self.stdout.write(self.style.SUCCESS('Successfully updated training advice for all players.'))
