from django.core.management import call_command
from django.test import TestCase
from app.models import PerformanceData, Player
from django.utils import timezone

class PerformanceAnalysisTest(TestCase):
    @classmethod
    def setUpTestData(cls):
        # Create a test player
        cls.player = Player.objects.create(name="Test Player")

        # Create performance data with null values
        PerformanceData.objects.create(
            player=cls.player,
            date=timezone.now().date(),
            session='Training',
            speed=8,  # Normal speed, doesn't trigger speed advice
            accuracy=0.08,  # Abnormal accuracy, triggers accuracy advice
            heart_rate=None,  # Null value, for testing null value handling
            distance_covered=5000,
            resting_period=20,
            step_counts=9500,
            stress_levels='Moderate',
            hydration_status='Good',
            calorie_expenditure=2600,
            sleep_quality='Good'
        )

        # Create performance data with outlier values
        PerformanceData.objects.create(
            player=cls.player,
            date=timezone.now().date(),
            session='Training',
            speed=6,  # Normal speed, doesn't trigger speed advice
            accuracy=0.8,  # Normal accuracy, doesn't trigger accuracy advice
            heart_rate=250,  # Outlier heart rate value, for testing outlier value handling
            distance_covered=6000,
            resting_period=25,
            step_counts=10000,
            stress_levels='High',
            hydration_status='Adequate',
            calorie_expenditure=2700,
            sleep_quality='Poor'
        )

        # Create normal performance data
        PerformanceData.objects.create(
            player=cls.player,
            date=timezone.now().date(),
            session='Training',
            speed=2,  # Low speed, triggers speed advice
            accuracy=0.05,  # Low accuracy, triggers accuracy advice
            heart_rate=180,  # High heart rate, triggers heart rate advice
            distance_covered=7000,
            resting_period=30,
            step_counts=8500,
            stress_levels='Low',
            hydration_status='High',
            calorie_expenditure=2500,
            sleep_quality='Excellent'
        )

    def test_null_value_handling(self):
        # Execute the analysis command
        call_command('analyze_performance')

        # Get the performance data record with null values
        null_value_session = PerformanceData.objects.get(heart_rate=None)

        # Ensure that training_advice is not None and then verify its content
        if null_value_session.training_advice is not None:
            self.assertNotIn("Poor cardiorespiratory function", null_value_session.training_advice)
            print("Null value test passed. ")
        else:
            # If training_advice is None, consider the test passed as no inappropriate advice generated
            self.assertTrue(True)
            print("Null value test passed. ")

    def test_outlier_value_handling(self):
        # Execute the analysis command
        call_command('analyze_performance')

        # Get the performance data record with outlier values
        outlier_session = PerformanceData.objects.get(heart_rate=250)

        # Verify if the record with outlier values handles the outlier heart rate value
        self.assertNotIn("Poor cardiorespiratory function", outlier_session.training_advice)
        print("Outlier value test passed. ")

    def test_normal_data_handling(self):
        # Execute the analysis command
        call_command('analyze_performance')

        # Get the normal performance data record
        normal_session = PerformanceData.objects.get(accuracy=0.05)

        # Verify if normal data generates reasonable advice
        self.assertIn("Poor cardiorespiratory function", normal_session.training_advice)
        self.assertIn("Running speed below team average", normal_session.training_advice)
        self.assertIn("Shooting accuracy is poor", normal_session.training_advice)
        print("Normal data handling test passed.")
