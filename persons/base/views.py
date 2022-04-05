from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404

from .models import Person, Category, Menu
from .forms import AddPostForm


def index(request):
    persons = Person.objects.all()
    context = {
        "persons": persons,
        "title": "Main page",
        'cat_selected': 0
    }
    return render(request, "base/index.html", context)


def categories(request, cat_slug):
    persons = Person.objects.filter(cat__slug=cat_slug)
    try:
        cat = Category.objects.get(slug=cat_slug)
    except:
        return redirect('index')

    context = {
        "persons": persons,
        'title': f'Category {cat.name}',
        'cat_selected': cat.pk
    }

    if request.method == 'GET':
        if request.GET:
            context.update(request.GET.items())
    return render(request, 'base/index.html', context)


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
        form = AddPostForm(request.POST)
        if form.is_valid():
            print(form.cleaned_data)
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
    return HttpResponseNotFound(f'<h1>Oops... {path} not found.</h1>')

