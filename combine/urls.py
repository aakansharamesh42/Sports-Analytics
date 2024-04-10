"""login_register URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

# urlpatterns = [
#     path('admin/', admin.site.urls),
#     path('login/', include('login.urls')),
#     path('register/',include('register.urls'))
# ]

# urls.py

from django.urls import path, include
from django.contrib import admin
from django.views.generic import RedirectView
from main.views import display_advice
from main.views import data_view
from main.views import training_view,search_data2

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', include('main.urls')),
    path('register/', include('register.urls')),
    # Add a redirect from the root URL to the login page
    path('', RedirectView.as_view(url='/login/', permanent=True)),
    #path('performance/advice/<str:player_name>/', display_advice, name='display_advice'),
    path('data/', data_view, name='data'),
    path('training', training_view, name='training'),
    path('search_data2/',search_data2,name='search_data2')
]

