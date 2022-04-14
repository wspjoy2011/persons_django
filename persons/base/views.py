from django.contrib.auth import logout, login
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.views import LoginView
from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy
from django.views.generic import ListView, DetailView, CreateView, FormView
from django.contrib.auth.mixins import LoginRequiredMixin

from .models import Person, Category, Menu, Feedback
from .forms import AddPostForm, RegisterUserForm, LoginUserForm, ContactForm
from .utils import DataMixin


class PersonHome(DataMixin, ListView):
    model = Person
    template_name = 'base/index.html'
    context_object_name = 'persons'

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        c_def = self.get_user_context(title='Persons page', cat_selected=0)
        context.update(c_def)
        return context

    def get_queryset(self):
        return Person.objects.filter(is_published=True).select_related('cat')


class PersonCategory(DataMixin, ListView):
    template_name = 'base/index.html'
    context_object_name = 'persons'
    allow_empty = False

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        c = Category.objects.get(slug=self.kwargs['cat_slug'])
        c_def = self.get_user_context(title=f"Category {c.name}",
                                      cat_selected=c.pk)
        context.update(c_def)
        return context

    def get_queryset(self):
        return Person.objects.filter(cat__slug=self.kwargs['cat_slug'], is_published=True).select_related('cat')


class ShowPost(DataMixin, DetailView):
    model = Person
    template_name = 'base/show_post.html'
    slug_url_kwarg = 'post_slug'
    # pk_url_kwarg =

    def get_context_data(self, **kwargs):
        context = super(ShowPost, self).get_context_data(**kwargs)
        person = Person.objects.get(slug=self.kwargs['post_slug'])
        c_def = self.get_user_context(title=self.kwargs['post_slug'],
                                      cat_selected=Category.objects.get(name=person.cat).pk)
        context.update(c_def)
        return context


class AddPage(LoginRequiredMixin, DataMixin, CreateView):
    form_class = AddPostForm
    template_name = 'base/add_post.html'
    success_url = reverse_lazy('index')
    login_url = '/admin/'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        c_def = self.get_user_context(title='Add post')
        context.update(c_def)
        return context


class RegisterUser(DataMixin, CreateView):
    form_class = RegisterUserForm
    template_name = 'base/register.html'
    success_url = reverse_lazy('login')

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(RegisterUser, self).get_context_data(**kwargs)
        c_def = self.get_user_context(title='Registration')
        context.update(c_def)
        return context

    def form_valid(self, form):
        user = form.save()
        login(self.request, user)
        return redirect('index')


class LoginUser(DataMixin, LoginView):
    form_class = LoginUserForm
    template_name = 'base/login.html'

    def get_context_data(self, *, object_list=None, **kwargs):
        contex = super(LoginUser, self).get_context_data(**kwargs)
        c_def = self.get_user_context(title='Login')
        contex.update(c_def)
        return contex

    def get_success_url(self):
        return reverse_lazy('index')


def about(request):
    cats = Category.objects.all()
    menu = Menu.objects.all()
    context = {
        "menu": menu,
        'title': 'About page',
        'cats': cats
    }
    return render(request, 'base/about.html', context)


class ContactFormView(DataMixin, FormView):
    form_class = ContactForm
    template_name = 'base/contact.html'
    success_url = reverse_lazy('index')

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(ContactFormView, self).get_context_data(**kwargs)
        c_def = self.get_user_context(title='Feedback')
        context.update(c_def)
        return context

    def form_valid(self, form):
        form.save()
        return redirect('index')


def logout_user(request):
    logout(request)
    return redirect('login')


def page_not_found(request, exception):
    path = request.path
    context = {
        'title': 'Page not found',
        'path': path
    }
    return render(request, 'base/404.html', context)

