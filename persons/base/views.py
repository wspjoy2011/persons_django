from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect

from .models import Person, Category, Menu

# menu = [
#     {'title': 'Add article', 'url_name': 'add_page'},
#     {'title': 'Feedback', 'url_name': 'feedback'},
#     {'title': 'About', 'url_name': 'about'},
#     {'title': 'Login', 'url_name': 'login'},
# ]


def index(request):
    persons = Person.objects.all()
    cats = Category.objects.all()
    menu = Menu.objects.all()
    context = {
        "menu": menu,
        "persons": persons,
        'cats': cats,
        "title": "Main page"
    }
    return render(request, "base/index.html", context)


def categories(request, pk):
    person = Person.objects.get(pk=pk)
    context = {
        "person": person
    }
    # if pk > 100:
    #     return redirect('index')
    #     # raise Http404()

    if request.method == 'GET':
        if request.GET:
            context.update(request.GET.items())
    return render(request, 'base/categories.html', context)


def show_post(request, pk):
    person = Person.objects.get(pk=pk)
    menu = Menu.objects.all()
    cats = Category.objects.all()
    context = {
        'title': 'Person page',
        'menu': menu,
        'person': person,
        'cats': cats
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

