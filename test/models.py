
from django.db import models

class Player(models.Model):
    name = models.CharField(max_length=100)

class Team(models.Model):
    name = models.CharField(max_length=100)

class PerformanceData(models.Model):
    player = models.ForeignKey(Player, on_delete=models.CASCADE)
    date = models.DateField()
    session = models.CharField(max_length=100)
    speed = models.DecimalField(max_digits=5, decimal_places=2)
    distance_covered = models.DecimalField(max_digits=5, decimal_places=2)
    accuracy = models.DecimalField(max_digits=5, decimal_places=2)
    resting_period = models.IntegerField()  # 单位可以是秒或分钟
    step_counts = models.IntegerField()
    stress_levels = models.CharField(max_length=100)
    hydration_status = models.CharField(max_length=100)
    heart_rate = models.IntegerField()
    calorie_expenditure = models.IntegerField()
    sleep_quality = models.CharField(max_length=100)
    training_advice = models.TextField(blank=True, null=True)
    health_advice = models.TextField(blank=True, null=True)
