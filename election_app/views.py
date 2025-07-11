from django.shortcuts import get_object_or_404, render, redirect
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .models import Candidate, UserProfile, Vote
from django.db.models import Count, Max
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.safestring import mark_safe


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


def logout_view(request):
    logout(request)
    messages.info(request, "You are logged out. Please log in now.")
    return redirect('login')  # replace 'login' with your actual login URL name


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


        # Password long
        if len(password1) < 4:
            messages.error(request, "Password is too short")
            return render(request, 'register.html')


        # # Check if username is taken
        # if User.objects.filter(username=username).exists():
        #     messages.error(request, "Username already exists")
        #     return render(request, 'register.html')

        # Check if email is already used
        if User.objects.filter(email=email).exists():
            messages.error(request, "Email is already registered")
            return render(request, 'register.html')

        # Create user
        user = User.objects.create_user(username=username, email=email, password=password1)
        user.save()
        messages.success(
    request,
    mark_safe('<span style="color: green;">Account created successfully.<br>Please login.</span>')
)

        return redirect('login')  # use your login URL name here

    return render(request, 'register.html')



@login_required
def dashboard(request):
    # Annotate each candidate with total votes and latest vote date
    candidates = Candidate.objects.annotate(
        total_votes=Count('vote'),
        latest_vote=Max('vote__voted_at')
    ).order_by('-total_votes')

    return render(request, 'dashboard.html', {
        'candidates': candidates,
    })




@login_required
def candidate_detail(request, pk):
    candidate = get_object_or_404(Candidate, pk=pk)
    existing_vote = Vote.objects.filter(voter=request.user).first()  # user vote (if any)

    if request.method == 'POST':
        action = request.POST.get('action')

        if action == 'vote':
            if existing_vote:
                messages.error(request, "You already voted. Please unvote first to vote for another candidate.")
            else:
                Vote.objects.create(candidate=candidate, voter=request.user)
                messages.success(request, f"You voted for {candidate.name}!")
                return redirect('candidate_detail', pk=pk)

        elif action == 'unvote':
            if existing_vote and existing_vote.candidate == candidate:
                existing_vote.delete()
                messages.success(request, "Your vote has been removed.")
                return redirect('candidate_detail', pk=pk)
            else:
                messages.error(request, "You can't unvote this candidate.")

    context = {
        'candidate': candidate,
        'existing_vote': existing_vote,
    }
    return render(request, 'candidate_detail.html', context)


# @login_required
# def user_profile(request):
#     profile, created = UserProfile.objects.get_or_create(user=request.user)
#     vote = Vote.objects.filter(voter=request.user).first()

#     # Get nationality choices safely
#     nationality_choices = UserProfile._meta.get_field('nationality').choices

#     if request.method == 'POST':
#         bio = request.POST.get('bio')
#         gender = request.POST.get('gender')
#         nationality = request.POST.get('nationality')
#         profile_image = request.FILES.get('profile_image')

#         if bio is not None:
#             profile.bio = bio
#         if gender in ['M', 'F']:
#             profile.gender = gender
#         if nationality:
#             profile.nationality = nationality
#         if profile_image:
#             profile.profile_image = profile_image

#         profile.save()
#         return redirect('user_profile')

#     context = {
#         'profile': profile,
#         'voted_candidate': vote.candidate if vote else None,
#         'nationality_choices': nationality_choices,  # pass choices here
#     }
#     return render(request, 'user_profile.html', context)



# @receiver(post_save, sender=User)
# def create_user_profile(sender, instance, created, **kwargs):
#     if created:
#         UserProfile.objects.create(user=instance)

# @receiver(post_save, sender=User)
# def save_user_profile(sender, instance, **kwargs):
#     try:
#         instance.userprofile.save()
#     except UserProfile.DoesNotExist:
#         UserProfile.objects.create(user=instance)

        
# for user in User.objects.all():
#     UserProfile.objects.get_or_create(user=user)
