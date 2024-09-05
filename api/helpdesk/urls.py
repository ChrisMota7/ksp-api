from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from . import views

urlpatterns = [
    path('categorias/', views.CategoriaList.as_view(), name='categoria_list'),
    path('categories/<int:category_id>/update/', views.UpdateCategoryView.as_view(), name='update-category'),
    path('categories/<int:category_id>/delete/', views.DeleteCategoryView.as_view(), name='delete-category'),

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

    path('tipos-incidente/', views.TipoIncidenteListCreateView.as_view(), name='tipo-incidente-list-create'),
    path('tipos-incidente/<int:tipo_incidente_id>/update/', views.UpdateTipoIncidenteView.as_view(), name='update-tipo-incidente'),
    path('tipos-incidente/<int:tipo_incidente_id>/delete/', views.DeleteTipoIncidenteView.as_view(), name='delete-tipo-incidente'),

    path('incidentes/', views.IncidenteListCreateView.as_view(), name='incidente-list-create'),
    path('incidentes/crear/', views.IncidenteCreateView.as_view(), name='incidente-create'),
    path('incidentes/<int:pk>/', views.IncidenteDetailView.as_view(), name='incidente-detail'),
    path('incidentes/<int:pk>/delete/', views.MarkIncidenteDeletedView.as_view(), name='mark-incidente-deleted'),

    path('incidentes/<int:incidente_id>/archivos/', views.IncidenteArchivosView.as_view(), name='incidente-archivos'),

]

urlpatterns = format_suffix_patterns(urlpatterns)
