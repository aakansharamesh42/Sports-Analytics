from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.user_login),
    path('signin/', views.signin),    #login
    path('register/', views.register),    #register
    path('register/signup/', views.signup),    #register
    path('serach_data', views.search_data),    #search
    path('serach_data2/', views.search_data2),
    path('search_recommend', views.search_recommend),
]

