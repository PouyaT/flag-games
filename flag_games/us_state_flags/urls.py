from django.urls import path
from . import views
urlpatterns = [
    path('', views.index, name='index'),
    path("randomize", views.randomize, name="state_randomize")
]