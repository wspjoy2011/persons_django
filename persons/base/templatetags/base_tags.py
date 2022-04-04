from django import template
from base.models import *


register = template.Library()


@register.simple_tag()
def get_categories(filter=None):
    if filter is None:
        return Category.objects.all()
    return Category.objects.filter(pk=filter)


@register.simple_tag()
def get_menu():
    return Menu.objects.all()

