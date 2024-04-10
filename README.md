# Sports Insight

Sports Insight is designed to revolutionize training and performance in football and other sports through advanced data analytics. Utilizing a robust and flexible system developed with the Scrum methodology, Sports Insight offers comprehensive performance insights and tailored recommendations to enhance player performance, refine techniques, and reduce injury risks.

Please note that the main codebase is currently maintained in the master branch.
Switch to the master branch to view the latest code.

## Features

- **Data-Driven Insights:** Through the meticulous collection and analysis of data, we provide actionable insights to improve player performance and well-being.
- **Dual-Module System:** Comprising the Data Module for acquisition and presentation, and the Recommendations Module for personalized training and injury prevention.
- **Real-Time Analysis:** Utilizing sensors and recording devices, our system captures real-time data on player movements and wellness.
- **User-Friendly:** Designed with the user in mind, ensuring accessibility for coaches and players to crucial information.
- **Extensively Tested:** Rigorous testing phases ensure the system operates flawlessly under various conditions.

## Getting Started
### Prerequisites

Before you get started with Sports Insight, ensure you have the following installed:

- Python (version 3.8.9)
- Django (version 3.1.2)
- MySQL (version 8.0.0 or higher)
- pandas
- numpy
- A Terminal

*Note: You can install all required tools for our Django project using: `pip install -r requirements.txt`*

## Code File Function Outline

- **test/management/commands/test_data_generate.py**: Generates datasets required for testing.
- **test/management/commands/import_csv_to_mysql.py**: Imports the generated data into the MySQL database.
- **test/management/commands/analyze_performance.py**: Contains core analysis of performance data, providing training suggestions.
- **test/tests.py**: Checks for outliers and null values in the analysis.
- **test/test_database.py**: Tests database connection.

## Running The Server On Localhost

### Initial Setup

- Ensure you have a code compiler or IDE (PyCharm or VS Code recommended).
- Enter the virtual environment: `myenv\Scripts\activate`

### Set Up Your MySQL Database

- Log in to MySQL: `mysql -u username -p`
- Create your database: `create database sport_Data1;`
- Select your database: `use sport_Data1;`
- Import database structure/data: `source /your_absolute_path/sport_data1.sql`

### Configure Django to Connect to MySQL

- Go to `combine/settings.py`.
- Update the `DATABASES` configuration with your MySQL user and password information.

### Run the Server

- In the terminal, run: `python manage.py runserver`
- Visit `localhost:8000` in your browser. To stop the server, press CTRL-C.

## Logging In

- Preloaded user credentials are available (e.g., Marco_Rossi@gmail.com with password MarcoRossi).
- Visit the login page at `http://localhost:8000/login` to access. Incorrect login details will trigger a Bootstrap Alert.
![image](https://github.com/aakansharamesh42/Sports-Analytics/assets/68271524/b5423902-a503-400b-93c9-0e19aedf6d42)
- To register a new account, go to the registration page at `http://localhost:8000/login/register`.
![image](https://github.com/aakansharamesh42/Sports-Analytics/assets/68271524/87553426-b3c6-455f-b901-40733af00cea)



## Features

### The Player Session Data Page

- Displays current and past performance data for logged-in players.
![image](https://github.com/aakansharamesh42/Sports-Analytics/assets/68271524/35b1fac8-2dac-44ca-832a-9198659d9fe1)

- Allows data filtering by date and attribute for detailed analysis.

![image](https://github.com/aakansharamesh42/Sports-Analytics/assets/68271524/67472f29-5b04-4e5d-a463-dcd53c1a1ee9)
![image](https://github.com/aakansharamesh42/Sports-Analytics/assets/68271524/7b77aa19-12c0-43a1-a6db-aac6097b456b)

### The Player Recommendation Page

- Provides automated training recommendations based on performance and health data.
![image](https://github.com/aakansharamesh42/Sports-Analytics/assets/68271524/77a6024e-4588-4a46-b0f0-2a5d5fce898e)

- Includes a date filter for customized data retrieval.
![image](https://github.com/aakansharamesh42/Sports-Analytics/assets/68271524/e3348d4b-c850-4570-8c5e-e4b8f1851f80)
