from base.models import *


class DataMixin:
    menu = list(Menu.objects.all())
    paginate_by = 3
    
    def get_user_context(self, menu=menu, **kwargs):
        contex = kwargs

        if 'cat_selected' not in contex:
            contex['cat_selected'] = 0

        user_menu = menu.copy()
        if not self.request.user.is_authenticated:
            if len(menu) > 0:
                user_menu.pop(0)
        contex['menu'] = user_menu
        return contex
