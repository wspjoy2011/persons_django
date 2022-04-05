from django.urls import path
from .views import *

urlpatterns = [
    path('', index, name='index'),
    path('categories/<slug:cat_slug>/', categories, name='categories'),
    path('about/', about, name='about'),
    path('addpage/', addpage, name='add_page'),
    path('feedback/', feedback, name='feedback'),
    path('login/', login, name='login'),
    path('show_post/<slug:post_slug>/', show_post, name='post'),
]


