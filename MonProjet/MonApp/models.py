from django.db import models

# Create your models here.
from django.db import models
from django.contrib.auth.models import AbstractBaseUser,BaseUserManager,User
from django.utils import timezone
class CompteManager(BaseUserManager):

    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('Vous devez fournir une adresse e-mail')

        user = self.model(email=self.normalize_email(email))
        user.set_password(password)
        user.dateJoin = timezone.now()
        user.compteActive = False
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('departement', None)
        user = self.create_user(
            email=self.normalize_email(email),
            password=password,
            **extra_fields
        )
        user.is_admin = True
        user.is_staff = True
        user.is_superuser = True
        user.dateJoin = timezone.now()
        user.compteActive = True
        user.save(using=self._db)
        return user
    
      
class CustomUser(AbstractBaseUser):
    email       = models.EmailField(verbose_name="email", unique=True)
    first_name   = models.CharField(max_length=30,null=False)
    last_name    = models.CharField(max_length=30)
    dateJoin    = models.DateTimeField(verbose_name="date joined",auto_now_add=True)
    last_login  = models.DateTimeField(verbose_name="lastlogin",auto_now=True)
    compteActive = models.BooleanField(default=False)
    is_admin     = models.BooleanField(default=False)
    is_staff    = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    objects = CompteManager() 
    USERNAME_FIELD = 'email'   
    REQUIRED_FIELDS = []  
       
    def has_perm(self,perm, obj=None):
        return self.is_admin
    def has_module_perms(self,app_label):
        return True
