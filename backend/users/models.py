from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
     email = models.EmailField(unique=True)

     USERNAME_FIELD = 'email'
     REQUIRED_FIELDS = []
     #REQUIRED_FIELDS = ["username", "first_name", "last_name"]
     #OPTIONAL_FIELDS = ["first_name", "last_name"]