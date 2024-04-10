from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Player, PerformanceData, Team

admin.site.register(Player)
admin.site.register(PerformanceData)
admin.site.register(Team)
