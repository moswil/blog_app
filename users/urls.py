from django.urls import path

from users import views

urlpatterns = [
    path('register', views.register, name='users-register'),
    path('login', views.login, name='users-login')
]
