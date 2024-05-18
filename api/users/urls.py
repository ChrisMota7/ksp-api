from django.urls import path
from .views import RegisterView, LogoutView, UserTypeView, UserListView, UpdateUserView, DeleteUserView

urlpatterns = [
    path('create/', RegisterView.as_view()),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('user-type/', UserTypeView.as_view(), name='user-type'),
    path('getAllUsers/', UserListView.as_view(), name='user-list'),
    
    path('<int:user_id>/UpdateUser/', UpdateUserView.as_view(), name='user-update'),
    path('<int:user_id>/delete/', DeleteUserView.as_view(), name='delete-user'),

    
]