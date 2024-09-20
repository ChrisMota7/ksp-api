from django.urls import path
from .views import RegisterView, LogoutView, UserTypeView, UserListView, UpdateUserView, DeleteUserView, SendPasswordResetEmail, ResetPassword
from . import views

urlpatterns = [
    path('create/', RegisterView.as_view()),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('user-type/', UserTypeView.as_view(), name='user-type'),
    path('getAllUsers/', UserListView.as_view(), name='user-list'),
    path('<int:user_id>/UpdateUser/', UpdateUserView.as_view(), name='user-update'),
    path('<int:user_id>/delete/', DeleteUserView.as_view(), name='delete-user'),

    path('send-reset-email/', SendPasswordResetEmail.as_view(), name='send-reset-email'),
    path('reset-password/<uidb64>/<token>/', ResetPassword.as_view(), name='reset-password'),
   
    # path('empresas/', EmpresaListCreateView.as_view(), name='empresa-list-create'),

    path('empresas/', views.EmpresaList.as_view(), name='empresa-list'),
    path('empresas/table/', views.EmpresaTable.as_view(), name='empresa-table'),
    path('empresas/<int:pk>/', views.EmpresaDetailView.as_view(), name='empresa-detail'),
    path('empresas/<int:empresa_id>/delete/', views.DeleteEmpresaView.as_view(), name='delete-empresa'),

    path('tickets/by_company/', views.TicketListByCompany.as_view(), name='tickets-by-company'),
]