from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect


def index(request):
    return HttpResponse("<h1>Main page.</h1>")


def categories(request, pk):
    response = f"<h1>Category {pk}.</h1>"

    if pk > 100:
        return redirect('index')
        # raise Http404()

    if request.method == 'GET':
        if request.GET:
            for key, value in request.GET.items():
                response += f"<p>{key} => {value}<p>"
    return HttpResponse(response)


def page_not_found(request, exception):
    path = request.path
    return HttpResponseNotFound(f'<h1>Oops... {path} not found.</h1>')

