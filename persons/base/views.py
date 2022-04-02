from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect

from .models import Person

menu = ["About us", "Add article", "Feedback", "Login"]


def index(request):
    persons = Person.objects.all()
    context = {
        "menu": menu,
        "persons": persons,
        "title": "Main page"
    }
    return render(request, "base/index.html", context)


def categories(request, pk):
    person = Person.objects.get(pk=pk)
    context = {
        "person": person
    }
    if pk > 100:
        return redirect('index')
        # raise Http404()

    if request.method == 'GET':
        if request.GET:
            context.update(request.GET.items())
            # for key, value in request.GET.items():
            #     response += f"<p>{key} => {value}<p>"
    return render(request, 'base/categories.html', context)


def page_not_found(request, exception):
    path = request.path
    return HttpResponseNotFound(f'<h1>Oops... {path} not found.</h1>')

