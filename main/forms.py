# 引入表单类
from django import forms
# 引入 User 模型
from django.contrib.auth.models import User
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.core.exceptions import ValidationError
from .models import User


# Login form, inheriting the forms.Form class
class UserLoginForm(forms.Form):
    email = forms.EmailField()
    username = forms.CharField()
    password = forms.CharField()

class UserRegistrationForm(forms.ModelForm):
    username = forms.CharField(max_length=50, required=False, help_text='Optional.')
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')
    password = forms.CharField(label='Password', widget=forms.PasswordInput)
    password1 = forms.CharField(label='Confirm password', widget=forms.PasswordInput)
    user_type = forms.CharField(max_length=50, required=False, help_text='user type')

    class Meta:
        model = User
        fields = ('username', 'email', 'password', 'user_type')

    def clean_password2(self):
        cd = self.cleaned_data
        if cd['password'] != cd['password1']:
            raise ValidationError('Passwords don\'t match.')
        return cd['password1']

    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data['password'])
        if commit:
            user.save()
        return user