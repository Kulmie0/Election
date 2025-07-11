from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
import pycountry

class Candidate(models.Model):
    name = models.CharField(max_length=100)
    bio = models.TextField()
    photo = models.ImageField(upload_to='candidates/')

    def __str__(self):
        return self.name

    @property
    def votes_count(self):
        return self.vote_set.count()


class Vote(models.Model):
    candidate = models.ForeignKey(Candidate, on_delete=models.CASCADE)
    voter = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    voted_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.voter.username} voted for {self.candidate.name}"
    

def get_country_choices():
    return sorted(
        [(country.alpha_2, country.name) for country in pycountry.countries],
        key=lambda x: x[1]
    )

class UserProfile(models.Model):
    GENDER_CHOICES = [
        ('M', 'Male'),
        ('F', 'Female'),
    ]

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    bio = models.TextField(blank=True)
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES, blank=True)

    nationality = models.CharField(
        max_length=2,  # 2-letter country code
        choices=get_country_choices(),
        blank=True
    )

    profile_image = models.ImageField(
        upload_to='profile_images/',
        default='profile_images/default.png'
    )

    def __str__(self):
        return self.user.username

    def get_nationality_name(self):
        try:
            return pycountry.countries.get(alpha_2=self.nationality).name
        except:
            return "Unknown"

# Automatically create or update the profile
@receiver(post_save, sender=User)
def create_or_update_user_profile(sender, instance, created, **kwargs):
    if created:
        UserProfile.objects.create(user=instance)
    instance.userprofile.save()