from django.contrib import admin

from MonProjet.MonApp.models import CustomUser

from django.contrib.auth.admin import UserAdmin
from django import forms
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.forms import UserChangeForm, UserCreationForm
# from .forms import *


class ViewAdmin():
    list_display = ('email', 'centre','departement')
    search_fields = ('email','departement')
    list_filter = ('departement',)

from django.contrib.auth.forms import UserChangeForm, UserCreationForm
class CustomUserAdmin(UserAdmin):
    
    form = UserChangeForm
    add_form = UserCreationForm

    list_display = ('email', 'first_name', 'last_name', 'is_admin')
    list_filter = ('is_admin',)

    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal Info', {'fields': ('first_name', 'last_name')}),
        ('Permissions', {'fields': ('is_admin',)}),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2')}
        ),
    )
    search_fields = ('email', 'first_name', 'last_name')
    ordering = ('email',)
    filter_horizontal = ()

admin.site.register(CustomUser, CustomUserAdmin)
