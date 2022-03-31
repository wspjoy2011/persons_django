from django.http import HttpResponse
from django.shortcuts import render


def index(request):
    return HttpResponse("<h1>Main page.</h1>")


def categories(request):
    return HttpResponse("<h1>Categories page.</h1>")
