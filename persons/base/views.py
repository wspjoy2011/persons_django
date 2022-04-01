from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect

menu = ["About us", "Add article", "Feedback", "Login"]


def index(request):
    context = {"menu": menu}
    return render(request, "base/index.html", context)


def categories(request, pk):
    context = {"pk": pk}

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

