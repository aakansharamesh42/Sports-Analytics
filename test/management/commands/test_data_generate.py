import pandas as pd
from datetime import datetime, timedelta
import numpy as np

# Names list for variety
names_list = ["Marco Rossi", "Luca Bianchi", "Alessandro Romano",
              "Andrea Colombo", "Stefano Ricci", "Angelo Marino"]


# Function to generate random data with various names
def generate_random_data_with_names():
    data = []
    for name in names_list:
        for session in ['Game', 'Training']:
            for _ in range(3):
                date = (datetime(2024, 1, 1) + timedelta(days=np.random.randint(0, 365))).strftime('%d-%m-%Y')
                speed = round(np.random.uniform(4.0, 11.0), 1)
                accuracy = round(np.random.uniform(0.0, 1.0), 2)
                resting_period = format(np.random.randint(20, 35))
                distance_covered = np.random.randint(10, 12)
                step_counts = np.random.randint(9000, 10000)
                stress_levels = np.random.choice(['Low', 'Moderate', 'High'])
                hydration_status = np.random.choice(['Adequate', 'Good', 'High'])
                heart_rate = np.random.randint(65, 180)
                calorie_expenditure = np.random.randint(2500, 2800)
                sleep_quality = np.random.choice(['Poor', 'Fair', 'Good', 'Excellent'])

                data.append({
                    'Name': name,
                    'Date (DD/MM/YYYY)': date,
                    'Session': session,
                    'Speed': speed,
                    'Accuracy': accuracy,
                    'Resting Period': resting_period,
                    'Distance Covered': distance_covered,
                    'Step Counts': step_counts,
                    'Stress Levels': stress_levels,
                    'Hydration Status': hydration_status,
                    'Heart Rate': heart_rate,
                    'Calorie Expenditure': calorie_expenditure,
                    'Sleep Quality': sleep_quality
                })

    return data


# Generating the data with different names
random_data_with_names = generate_random_data_with_names()
df_random_data_with_names = pd.DataFrame(random_data_with_names)

# Save to a CSV file
output_file_path_with_names = '/random_athlete_data_with_names.csv'
df_random_data_with_names.to_csv(output_file_path_with_names, index=False)

df_random_data_with_names, output_file_path_with_names
