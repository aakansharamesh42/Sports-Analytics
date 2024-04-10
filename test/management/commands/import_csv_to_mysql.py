from django.core.management.base import BaseCommand
import pandas as pd
from datetime import datetime
from test.models import PerformanceData, Player  # 确保正确地引用了您的应用名和模型

class Command(BaseCommand):
    help = 'Import data from a CSV file into the MySQL database.'

    def add_arguments(self, parser):
        parser.add_argument('csv_file_path', type=str, help='The path to the CSV file.')

    def handle(self, *args, **options):
        csv_file_path = options['csv_file_path']
        data_frame = pd.read_csv(csv_file_path)

        for _, row in data_frame.iterrows():
            player, created = Player.objects.get_or_create(name=row['Name'])

            PerformanceData.objects.create(
                player=player,
                date=datetime.strptime(row['Date (DD/MM/YYYY)'], '%d-%m-%Y').date(),
                session=row['Session'],
                speed=row['Speed'],
                distance_covered=row['Distance Covered'],
                accuracy=row['Accuracy'] if not pd.isnull(row['Accuracy']) else 0,
                resting_period=row['Resting Period'],
                step_counts=row['Step Counts'],
                stress_levels=row['Stress Levels'],
                hydration_status=row['Hydration Status'],
                heart_rate=row['Heart Rate'],
                calorie_expenditure=row['Calorie Expenditure'],
                sleep_quality=row['Sleep Quality'],

            )

        self.stdout.write(self.style.SUCCESS('Successfully imported data from CSV to database'))
