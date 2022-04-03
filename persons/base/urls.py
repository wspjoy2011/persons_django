from django.urls import path
from .views import *

urlpatterns = [
    path('', index, name='index'),
    path('categories/<int:pk>/', categories, name='categories'),
    path('about/', about, name='about'),
    path('addpage/', addpage, name='add_page'),
    path('feedback/', feedback, name='feedback'),
    path('login/', login, name='login'),
    path('show_post/<int:pk>/', show_post, name='post'),
]


