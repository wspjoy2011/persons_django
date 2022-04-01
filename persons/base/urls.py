from django.urls import path
from .views import *

urlpatterns = [
    path('', index, name='index'),
    path('categories/<int:pk>/', categories, name='categories'),
]


