from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class Empresa(models.Model):
    nombre = models.CharField(max_length=255)
    isDeleted = models.CharField(max_length=1, default=0)

class User(AbstractUser):
    firstName = models.CharField(max_length=255)
    lastName = models.CharField(max_length=255)
    email = models.CharField(max_length=255, unique=True)
    password = models.CharField(max_length=255)
    telefono = models.CharField(max_length=15, null=True, blank=True)
    isDeleted = models.CharField(max_length=1, default=0)
    isAdmin = models.CharField(max_length=1)
    createdAt = models.DateTimeField(auto_now_add=True)
    username = None
    activeDirectory = models.CharField(max_length=255, null=True, blank=True)
    empresa = models.ForeignKey(Empresa, on_delete=models.SET_NULL, null=True, blank=True)
    
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []