from django.core.paginator import Paginator
from django.db.models import Q
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages
from django.contrib.auth.decorators import login_required 
from .forms import UserRegistrationForm
from django.shortcuts import render
from test.models import PerformanceData, Player
from django.shortcuts import render
import json

from .models import User

times = 0

#open login page and call singin function
def user_login(request):
    global times
    print('Login Page Opened!')
    times += 1
    print(request.path)
    if request.path == '/login/signin/':
        report_loc = '../signin/'
    else:
        report_loc = 'signin/'
    return render(request, 'login.html', {'loc': report_loc, 'error': ''})

#get user's id and password and check the info
#if infor is correct, redirect to data page
#if not, uotput message Invalid email or password
def signin(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        user = authenticate(request, username=email, password=password)

        user_list = list()
        if user is not None:
            global times
            login(request, user)
            print('Login Page Opened!')
            times += 1
            if request.path == '/login/signin/':
                report_loc = '../signin/'
            else:
                report_loc = 'signin/'
            return redirect(f'/data?page=1')
            # return render(request, 'data.html', {"username": user.username, "user_info": user_list})
        else:
            messages.error(request, 'Invalid email or password')
    return render(request, 'login.html')  # The login form page is displayed


times1 = 0
times = 0

#open register page and call signup function
def register(request):
    global times
    print('Register Page Opened!')
    times += 1
    current_url = request.path
    print(current_url)
    print(0)
    if request.path == '/register/signup/':
        report_loc = '../signup/'
    else:
        report_loc = 'signup/'
    return render(request, 'register.html', {'loc': report_loc, 'error': ''})

#get user's id, password and role for coach or player
def signup(request):
    print(request.POST)
    print('111111!')
    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        print(form.is_valid())
        if form.is_valid():
            form.save()
        else:
            print(form.errors)
            # # After registration, you are redirected to the login page
            return redirect('/login')
    else:
        form = UserRegistrationForm()
    return render(request, 'register.html', {'form': form})

#test display function
def display_advice(request, player_name):
    latest_performance = PerformanceData.objects.filter(
        player__id=1,
        session='Game'
    ).order_by('-date').first()

    context = {
        'latest_performance': latest_performance
    }
    return render(request, 'performance_advice.html', context)


#call username page
#search all the data and use paginator to divide 3 parts and then pass to the front end
def data_view(request):
    print('You logged in successfully')
    username = request.GET.get('username')
    page = request.GET.get('page')
    user = User.objects.filter(username=username).first()
    user=request.user
    latest_performances = PerformanceData.objects.filter(
        player__id=user.id
    ).order_by('-date')
    paginator = Paginator(latest_performances, 3)
    user_list = paginator.page(page)
    return render(request, 'data.html', {"user_info": user_list, "username": user.username})

#test train page
def training_view(request):
    # Suppose you want to show suggestions for the last three records for a particular player
    username = request.GET.get('username')
    user = User.objects.filter(username=username).first()
    user=request.user
    latest_performances = PerformanceData.objects.filter(
        player__id=user.id,  # Here, the hard-coded player_id=1 is used, adjusted as needed
    ).order_by('-date')  # Get the last three records
    return render(request, 'TrainingEnhancement.html',
                  {"latest_performances": latest_performances, "username": username})


#get the start date and end data and the username
#search the user's all data
def search_data(request):
    user_list = list()
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')
    abe = request.GET.get('abe')
    username = request.GET.get('username')
    qs_info = PerformanceData.objects.filter(Q(date__range=(start_date, end_date)) & Q(player__name=username))[:3]
    for info in qs_info:
        user_dict = {
            "username": username,
            "date": info.date,
            "session": info.session,
            "speed": info.speed,
            "distance_covered": info.distance_covered,
            "accuracy": info.accuracy,
            "resting_period": info.resting_period,
            "step_counts": info.step_counts,
            "stress_levels": info.stress_levels,
            "hydration_status": info.hydration_status,
            "heart_rate": info.heart_rate,
            "calorie_expenditure": info.calorie_expenditure,
            "sleep_quality": info.sleep_quality,
            "health_advice": info.health_advice,
        }
        user_list.append(user_dict)
    return JsonResponse(data=user_list, safe=False)

#get the start date and end data and the username and the paginator through post or get
#search the user's data
#if user not input date, reture all user's infor
#if user input data, return the infor between date
@login_required()
def search_data2(request):
    if request.method=='POST':
        start_date = request.POST.get('startDate')
        end_date = request.POST.get('endDate')
        username = request.POST.get('username')
        page = request.POST.get('page','1')
        user = User.objects.filter(username=username).first()
        user=request.user
        print(user,user.id,start_date,end_date)
        
        if len(start_date)==0 or len(end_date)==0:
            latest_performances = PerformanceData.objects.filter(player__id=user.id).order_by('-date')
        
        else:
            latest_performances = PerformanceData.objects.filter(
                player__id=user.id
            ).filter(date__range=(start_date, end_date)).order_by('-date')
        for i in latest_performances:
            print(i.date,i.speed)
        paginator = Paginator(latest_performances, 3)
        user_list = paginator.page(page)
        return render(request, 'data2.html', {"user_info": user_list, "username": user.username,"start_date":start_date,"end_date":end_date,"fenye":1})
    else:
        start_date = request.GET.get('start_date')
        end_date = request.GET.get('end_date')
        username = request.GET.get('username')
        page = request.GET.get('page')
        print('第几页',page)
        user = User.objects.filter(username=username).first()
        user=request.user
        print(username,start_date,end_date)
        
        if len(start_date)==0 or len(end_date)==0:
            latest_performances = PerformanceData.objects.filter(player__id=user.id).order_by('-date')
        
        else:
            latest_performances = PerformanceData.objects.filter(
                player__id=user.id
            ).filter(date__range=(start_date, end_date)).order_by('-date')
        for i in latest_performances:
            print(i.date,i.speed)
        paginator = Paginator(latest_performances, 3)
        user_list = paginator.page(page)
        return render(request, 'data2.html', {"user_info": user_list, "username": user.username,"start_date":start_date,"end_date":end_date,"fenye":1})


#get the recommendation's infor
#if user not input date, show all the user's date
#if user input date show the corresponding date
def search_recommend(request):
    recommend_list = list()
    date = request.GET.get('date')
    username = request.GET.get('username')
    username=request.user.username
    search_type=request.GET.get('search_type')

    # Injury Prevention & Technique Enhancement     1
    # Training Recommendations  2
    if search_type=='1' or search_type==1:
        if date=='':
            queryset = PerformanceData.objects.filter(player__name=username).filter(health_advice__isnull=False)
            for info in queryset:
                recommend_dict = {
                    "date": info.date,
                    "session": info.session,
                    "training_advice": info.training_advice
                }
                recommend_list.append(recommend_dict)
            return JsonResponse(data=recommend_list, safe=False)
        else:
            queryset = PerformanceData.objects.filter(date=date).filter(health_advice__isnull=False).filter(player__name=username)
            
            for info in queryset:
                print(info.date,info.health_advice)
                recommend_dict = {
                    "date": info.date,
                    "session": info.session,
                    "training_advice": info.health_advice
                }
                recommend_list.append(recommend_dict)
            return JsonResponse(data=recommend_list, safe=False)
    else:
        if date=='':
            queryset = PerformanceData.objects.filter(player__name=username).filter(training_advice__isnull=False).exclude(training_advice ='')
            for info in queryset:
                recommend_dict = {
                    "date": info.date,
                    "session": info.session,
                    "training_advice": info.training_advice
                }
                recommend_list.append(recommend_dict)
            return JsonResponse(data=recommend_list, safe=False)
        else:
            queryset = PerformanceData.objects.filter(date=date).filter(player__name=username).filter(training_advice__isnull=False).exclude(training_advice ='')
            for info in queryset:
                recommend_dict = {
                    "date": info.date,
                    "session": info.session,
                    "training_advice": info.training_advice
                }
                recommend_list.append(recommend_dict)
            return JsonResponse(data=recommend_list, safe=False)
