from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect

from .models import Person, Category, Menu


def index(request):
    persons = Person.objects.all()
    context = {
        "persons": persons,
        "title": "Main page",
        'cat_selected': 0
    }
    return render(request, "base/index.html", context)


def categories(request, pk):
    persons = Person.objects.filter(cat=pk)
    try:
        cat_name = Category.objects.get(pk=pk)
    except:
        return redirect('index')

    context = {
        "persons": persons,
        'title': f'Category {cat_name.name}',
        'cat_selected': pk
    }

    if request.method == 'GET':
        if request.GET:
            context.update(request.GET.items())
    return render(request, 'base/index.html', context)


def show_post(request, pk):
    person = Person.objects.get(pk=pk)

    context = {
        'title': 'Person page',
        'person': person,
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
    return HttpResponse('<h1>Add page</h1>')


def feedback(request):
    return HttpResponse('<h1>Feedback</h1>')


def login(request):
    return HttpResponse('<h1>Login</h1>')


def page_not_found(request, exception):
    path = request.path
    return HttpResponseNotFound(f'<h1>Oops... {path} not found.</h1>')

