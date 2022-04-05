from django import forms

from .models import *


class AddPostForm(forms.Form):
    title = forms.CharField(max_length=255)
    slug = forms.CharField(max_length=255, label='URL')
    content = forms.CharField(widget=forms.Textarea(attrs={'cols': 60, 'rows': 10}))
    is_published = forms.BooleanField(initial=True, label='Publish', required=False)
    cat = forms.ModelChoiceField(queryset=Category.objects.all())
