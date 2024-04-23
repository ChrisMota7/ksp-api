from django.urls import path
from .views import RegisterView, LoginView, UserView, LogoutView, UserTypeView

urlpatterns = [
    path('create', RegisterView.as_view()),
    path('login', LoginView.as_view()),
    path('user', UserView.as_view()),
    path('logout', LogoutView.as_view()),
    path('user-type/', UserTypeView.as_view(), name='user-type'),
]