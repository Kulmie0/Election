from django.db import models
from django.contrib.auth.models import User

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