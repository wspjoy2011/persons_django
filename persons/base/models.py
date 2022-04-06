from django.db import models
from django.urls import reverse


class Person(models.Model):
    title = models.CharField(max_length=255)
    slug = models.SlugField(max_length=255, unique=True, db_index=True, verbose_name='URL')
    content = models.TextField(blank=True)
    photo = models.ImageField(upload_to='photos/%Y/%m/%d/')
    cat = models.ForeignKey('Category', on_delete=models.CASCADE)
    time_create = models.DateTimeField(auto_now_add=True)
    time_update = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(default=True, verbose_name='publish')

    class Meta:
        ordering = ["-time_update", "-time_create"]
        verbose_name_plural = 'Persons'
        verbose_name = 'Famous persons'

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('post', kwargs={'post_slug': self.slug})


class Category(models.Model):
    name = models.CharField(max_length=100, db_index=True, unique=True)
    slug = models.SlugField(max_length=255, unique=True, db_index=True, verbose_name='URL')

    class Meta:
        verbose_name_plural = "categories"
        ordering = ['name']

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('categories', kwargs={'cat_slug': self.slug})


class Menu(models.Model):
    name = models.CharField(max_length=50, db_index=True, unique=True)
    url_name = models.CharField(max_length=100, db_index=True, unique=True)

    class Meta:
        verbose_name_plural = 'menu'

    def __str__(self):
        return self.name
