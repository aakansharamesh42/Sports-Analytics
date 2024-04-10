from django.shortcuts import render, HttpResponse
from django.urls import resolve
import json
times = 0
def register(request):
    global times
    print('Register Page Opened!')
    times += 1
    current_url = request.path
    print(current_url)
    print(0)
    if request.path == '/register/signup/':
        report_loc = '../signup/'
    else: report_loc = 'signup/'
    return render(request, 'register.html', {'loc':report_loc,'error': ''})
def signup(request):
    print('Register Request Made!')
    print('Reading Data from JSON')
    if request.path == '/register/signup/':
        report_loc = '../signup/'
    else: report_loc = 'signup/'
    json2 = open('user_data.json',) 
    data = json.load(json2) 
    l1 = data['u_data'][0]
    emails = list(l1.keys())
    passwords = list(l1.values())
    json2.close() 
    print('Read data from JSON')
    email = request.POST['email']
    password = request.POST['password']
    password1 = request.POST['password1']
    usernames = []
    if email not in emails:
        if password == password1:
            emails.append(email)
            passwords.append(password)
            d4 = {emails[len(emails)-1]: passwords[len(emails)-1]}
            for x in range(len(emails)-1):
                d4 = dict(list(d4.items()) + list({emails[x]:passwords[x]}.items()))
            json_object = '{"u_data": ['+json.dumps(d4, indent = 4)+']}'
            a = open('user_data.json', 'w')
            a.write(json_object)
            a.close()
            times = 0
            print('Registered new user, returning HTTP response')
            return HttpResponse('You are now registered')
        else:
            print('Passwords do not match, returning HTTP response')
            return render(request, 'register.html', {'loc':report_loc,'errorclass':'alert alert-danger','error': 'Sorry. The Passwords do not match.'})
    else:
        print('The Username or Email ID is already taken, returning HTTP response')
        return render(request, 'register.html', {'loc':report_loc,'errorclass':'alert alert-danger','error': 'Sorry. The Username or Email ID is already taken.'})


"""
from django.shortcuts import render, HttpResponse
from django.shortcuts import render, redirect
import json
times = 0
def login(request):
    global times
    print('Login Page Opened!')
    times += 1
    if request.path == '/login/signin/':
        report_loc = '../signin/'
    else: report_loc = 'signin/'
    return render(request, 'login.html', {'loc':report_loc,'error': ''})


def signin(request):
    print('Login Request Made!')
    print('Reading Data from JSON')

    with open('user_data.json', 'r') as json2:
        data = json.load(json2)

    l1 = data['u_data'][0]
    emails = list(l1.keys())
    passwords = list(l1.values())

    print('Read data from JSON')

    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        if email in emails and passwords[emails.index(email)] == password:
            print('Logged in User, redirecting to performance page')
            # 替换 'Macro Rossi' 为实际的玩家名称变量
            # 如果你有存储玩家名字的变量，应该在这里使用那个变量
            #return redirect('display_advice', player_name='Macro Rossi')
            return redirect('data')
        else:
            error_message = 'Sorry. The Email and Password do not match.' if email in emails else 'Sorry. No such account exists. Consider signing up!'
            return render(request, 'login.html', {
                'errorclass': 'alert alert-danger',
                'error': error_message
            })
    else:
        # 如果不是 POST 请求，只显示登录页面
        return render(request, 'login.html')
"""

