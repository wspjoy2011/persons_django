from django.contrib import admin

from .models import Category, Person, Menu

admin.site.register(Person)
admin.site.register(Category)
admin.site.register(Menu)


