from django.contrib.auth.models import AbstractUser
from django.db import models

class User(AbstractUser):
    # Optional: If you want to keep the username field, you can keep this line
    # If you do not want to use the username, you can remove it and set it in the Meta class below
    username = models.CharField(max_length=50, unique=True, null=True, blank=True)
    email = models.EmailField('email address', unique=True)
    user_type = models.CharField(max_length=50, blank=True, null=True)
    USERNAME_FIELD = 'email'    # Use email as the login identifier
    REQUIRED_FIELDS = ['username']   # Fields that must be filled in when creating a user, except for password and USERNAME_FIELD

    def __str__(self):
        return self.email

# store user information
class CustomUser(models.Model):
    GENDER_CHOICES = [
        ('M', 'Male'),
        ('F', 'Female'),
        ('O', 'Other'),
    ]

    name = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    age = models.PositiveIntegerField()
    position = models.CharField(max_length=100)
    team = models.CharField(max_length=100)
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES)
    nation = models.CharField(max_length=100)

    def __str__(self):
        return self.name