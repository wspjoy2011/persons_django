from django.core.cache import cache

from base.models import *


class DataMixin:
    menu = list(Menu.objects.all())
    paginate_by = 3
    
    def get_user_context(self, menu=menu, **kwargs):
        context = kwargs
        qty_post = cache.get('qty_post')
        if not qty_post:
            qty_post = Person.objects.all().count()
            cache.set('qty_post', qty_post, 60)

        if 'cat_selected' not in context:
            context['cat_selected'] = 0

        user_menu = menu.copy()
        if not self.request.user.is_authenticated:
            if len(menu) > 0:
                user_menu.pop(0)
        context['qty_post'] = qty_post
        context['menu'] = user_menu
        return context
