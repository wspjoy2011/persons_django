from django.urls import path
from .views import *

urlpatterns = [
    path('', PersonHome.as_view(), name='index'),
    path('categories/<slug:cat_slug>/', PersonCategory.as_view(), name='categories'),
    path('about/', about, name='about'),
    path('addpage/', AddPage.as_view(), name='add_page'),
    path('feedback/', feedback, name='feedback'),
    path('login/', LoginUser.as_view(), name='login'),
    path('register/', RegisterUser.as_view(), name='register'),
    path('show_post/<slug:post_slug>/', ShowPost.as_view(), name='post'),
]


