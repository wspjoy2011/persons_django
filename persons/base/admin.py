from django.contrib import admin

from .models import Category, Person, Menu


class PersonAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'time_create', 'photo', 'is_published')
    list_display_links = ('id', 'title')
    search_fields = ('title', 'content')
    empty_value_display = '-empty-'
    list_editable = ('is_published',)
    list_filter = ('is_published', 'time_create')


class MenuAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'url_name')
    list_display_links = ('id', 'name')
    search_fields = ('name', 'url_name')


class CategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')
    list_display_links = ('id', 'name')
    search_fields = ('name',)


admin.site.register(Person, PersonAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Menu, MenuAdmin)


