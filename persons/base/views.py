from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import ListView, DetailView, CreateView

from .models import Person, Category, Menu
from .forms import AddPostForm


class PersonHome(ListView):
    model = Person
    template_name = 'base/index.html'
    context_object_name = 'persons'
    extra_context = {
        'title': 'Persons page',
    }

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        context['cat_selected'] = 0
        return context

    def get_queryset(self):
        return Person.objects.filter(is_published=True)


class PersonCategory(ListView):
    template_name = 'base/index.html'
    context_object_name = 'persons'
    allow_empty = False

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        context['cat_selected'] = Category.objects.get(slug=self.kwargs['cat_slug']).pk
        context['title'] = f"Category {self.kwargs['cat_slug']}"
        return context

    def get_queryset(self):
        return Person.objects.filter(cat__slug=self.kwargs['cat_slug'], is_published=True)


class ShowPost(DetailView):
    model = Person
    template_name = 'base/show_post.html'
    slug_url_kwarg = 'post_slug'
    # pk_url_kwarg =

    def get_context_data(self, **kwargs):
        context = super(ShowPost, self).get_context_data(**kwargs)
        context['title'] = self.kwargs['post_slug']
        person = Person.objects.get(slug=self.kwargs['post_slug'])
        context['cat_selected'] = Category.objects.get(name=person.cat).pk
        return context


# def index(request):
#     persons = Person.objects.all()
#     context = {
#         "persons": persons,
#         "title": "Main page",
#         'cat_selected': 0
#     }
#     return render(request, "base/index.html", context)


# def categories(request, cat_slug):
#     persons = Person.objects.filter(cat__slug=cat_slug)
#     try:
#         cat = Category.objects.get(slug=cat_slug)
#     except:
#         return redirect('index')
#
#     context = {
#         "persons": persons,
#         'title': f'Category {cat.name}',
#         'cat_selected': cat.pk
#     }
#
#     if request.method == 'GET':
#         if request.GET:
#             context.update(request.GET.items())
#     return render(request, 'base/index.html', context)
#

def show_post(request, post_slug):
    person = get_object_or_404(Person, slug=post_slug)
    print(person.cat.pk)
    context = {
        'title': f'{person.title}',
        'person': person,
        'cat_selected': person.cat.pk

    }

    return render(request, 'base/show_post.html', context)


def about(request):
    cats = Category.objects.all()
    menu = Menu.objects.all()
    context = {
        "menu": menu,
        'title': 'About page',
        'cats': cats
    }
    return render(request, 'base/about.html', context)


def addpage(request):
    if request.method == 'POST':
        form = AddPostForm(request.POST, request.FILES)
        if form.is_valid():
            # print(form.cleaned_data)
            form.save()
            return redirect('index')
    else:
        form = AddPostForm()

    context = {
        'title': 'Add post',
        'form': form
    }

    return render(request, 'base/add_post.html', context)


def feedback(request):
    return HttpResponse('<h1>Feedback</h1>')


def login(request):
    return HttpResponse('<h1>Login</h1>')


def page_not_found(request, exception):
    path = request.path
    context = {
        'title': 'Page not found',
        'path': path
    }
    return render(request, 'base/404.html', context)

