from django.urls import path
from .views import *

urlpatterns = [
    path('', PersonHome.as_view(), name='index'),
    path('categories/<slug:cat_slug>/', PersonCategory.as_view(), name='categories'),
    path('about/', about, name='about'),
    path('addpage/', addpage, name='add_page'),
    path('feedback/', feedback, name='feedback'),
    path('login/', login, name='login'),
    path('show_post/<slug:post_slug>/', ShowPost.as_view(), name='post'),
]


