from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from . import views

urlpatterns = [
    path('categorias/', views.CategoriaList.as_view(), name='categoria_list'),
    path('getProblemByCategory/<int:categoria_id>/', views.ProblemaList.as_view(), name='problema-list-by-category'),
    path('problemas/', views.ProblemaList.as_view(), name='problemas_list'),
    path('prioridad/', views.PrioridadList.as_view(), name='prioridad_list'),
    path('tickets/', views.TicketList.as_view(), name='ticket-list'),
    path('tickets/crear/', views.TicketCreate.as_view(), name='ticket-create'),
    path('mensajes/crear/', views.MensajeCreate.as_view(), name='mensaje-create'),
    path('tickets/<int:ticket_id>/mensajes/', views.MensajeList.as_view(), name='mensaje-list'),
]

urlpatterns = format_suffix_patterns(urlpatterns)
