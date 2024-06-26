from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from . import views

urlpatterns = [
    path('categorias/', views.CategoriaList.as_view(), name='categoria_list'),
    path('getProblemByCategory/<int:categoria_id>/', views.ProblemaList.as_view(), name='problema-list-by-category'),
    path('problemas/', views.ProblemaList.as_view(), name='problemas_list'),
    path('categorias/table/', views.ProblemaList.as_view(), name='categorias_table'),
    path('categorias/crear/', views.CategoriaCreateAPIView.as_view(), name='crear-categoria'),
    path('problems/<int:problem_id>/update/', views.UpdateProblemView.as_view(), name='update-problem'),
    path('problems/<int:problem_id>/delete/', views.DeleteProblemView.as_view(), name='delete-problem'),
    
    path('prioridad/', views.PrioridadList.as_view(), name='prioridad_list'),

    path('tickets/', views.TicketList.as_view(), name='ticket-list'),
    path('tickets/crear/', views.TicketCreate.as_view(), name='ticket-create'),
    path('tickets/table/', views.TicketTable.as_view(), name='ticket-table'),

    path('tickets/<int:ticket_id>/archivos/', views.TicketArchivosView.as_view(), name='ticket-archivos'),
    
    #News
    path('tickets/<int:ticket_id>/', views.TicketDetailView.as_view(), name='ticket-detail'),
    path('tickets/<int:ticket_id>/delete/', views.DeleteTicketView.as_view(), name='delete-ticket'),
    path('tickets/<int:ticket_id>/update-priority/', views.UpdateTicketView.as_view(), name='update-ticket-priority'),
    path('tickets/<int:ticket_id>/update-status/', views.UpdateTicketView.as_view(), name='update-ticket-status'),

    path('stats/tickets/', views.TicketStatsView.as_view(), name='ticket-stats'),

    path('mensajes/crear/', views.MensajeCreate.as_view(), name='mensaje-create'),
    path('tickets/<int:ticket_id>/mensajes/', views.MensajeList.as_view(), name='mensaje-list'),

]

urlpatterns = format_suffix_patterns(urlpatterns)
