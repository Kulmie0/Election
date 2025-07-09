from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .models import Candidate



def login_view(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        # First, check if this email exists
        try:
            user_obj = User.objects.get(email=email)
        except User.DoesNotExist:
            messages.error(request, "This email is not registered.")
            print("❌ LOGIN FAILED: Email not found")
            return render(request, 'login.html')

        # Now use the username to authenticate
        user = authenticate(request, username=user_obj.username, password=password)
        if user is not None:
            login(request, user)
            print("✅ LOGIN SUCCESS")
            return redirect('dashboard')
        else:
            messages.error(request, "Incorrect password.")
            print("❌ LOGIN FAILED: Wrong password")

    return render(request, 'login.html')


def logout(request):
    logout(request)  # logs the user out
    return redirect('login')  # redirect to login page (or dashboard or home)

def register(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')

        # Password match check
        if password1 != password2:
            messages.error(request, "Passwords do not match")
            return render(request, 'register.html')

        # Check if username is taken
        if User.objects.filter(username=username).exists():
            messages.error(request, "Username already exists")
            return render(request, 'register.html')

        # Check if email is already used
        if User.objects.filter(email=email).exists():
            messages.error(request, "Email is already registered")
            return render(request, 'register.html')

        # Create user
        user = User.objects.create_user(username=username, email=email, password=password1)
        user.save()
        messages.success(request, "Account created successfully. Please log in.")
        return redirect('login')  # use your login URL name here

    return render(request, 'register.html')


@login_required
def dashboard(request):
    # Add your dashboard logic here, e.g. get candidates to show
    return render(request, 'dashboard.html')




def dashboard(request):
    candidates = Candidate.objects.all()
    return render(request, 'dashboard.html', {'candidates': candidates})
