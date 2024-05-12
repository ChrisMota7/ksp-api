from rest_framework import generics
from django.utils.dateparse import parse_datetime
from django.db.models import Q
import json
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .models import Categoria, Problema, Prioridad, Ticket, Mensaje, Archivo
from .serializers import CategoriaSerializer, ArchivoSerializer, ProblemaSerializer, PrioridadSerializer, TicketSerializer, MensajeSerializer, TicketCreateSerializer, TableTicketsSerializer, TableCategorySerializer, MensajeCreateSerializer
from .models import Ticket, Problema, Categoria
from django.db.models import Count

class CategoriaList(generics.ListCreateAPIView):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer

class PrioridadList(generics.ListCreateAPIView):
    queryset = Prioridad.objects.all()
    serializer_class = PrioridadSerializer
    
class CategoryTable(generics.ListAPIView):
    queryset = Ticket.objects.all()
    serializer_class = TableCategorySerializer

class ProblemaList(generics.ListCreateAPIView):
    serializer_class = ProblemaSerializer

    def get_queryset(self):
        queryset = Problema.objects.all()
        categoria_id = self.kwargs.get('categoria_id')
        prioridad_id = self.kwargs.get('prioridad_id')

        if categoria_id:
            queryset = queryset.filter(categoria_id=categoria_id)
        if prioridad_id:
            queryset = queryset.filter(prioridad_id=prioridad_id)

        return queryset

class TicketList(generics.ListAPIView):
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer

class TicketCreate(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        print("TicketCreate post")
        serializer = TicketCreateSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
class TicketTable(generics.ListAPIView):
    queryset = Ticket.objects.all()
    serializer_class = TableTicketsSerializer

class TicketDetailView(APIView):
    permission_classes = [IsAuthenticated]

    def get_object(self, ticket_id):
        try:
            return Ticket.objects.prefetch_related('ticket_archivos').get(pk=ticket_id)
        except Ticket.DoesNotExist:
            return Response({'error': 'Not found.'}, status=status.HTTP_404_NOT_FOUND)

    def get(self, request, ticket_id, format=None):
        ticket = self.get_object(ticket_id)
        if ticket is None:
            return Response({'error': 'Not found.'}, status=status.HTTP_404_NOT_FOUND)
        serializer = TicketSerializer(ticket, context={'request': request})
        return Response(serializer.data)

class DeleteTicketView(APIView):
    permission_classes = [IsAuthenticated]

    def put(self, request, ticket_id):
        # Intentar obtener el ticket basado en el ID
        try:
            ticket = Ticket.objects.get(pk=ticket_id)
        except Ticket.DoesNotExist:
            return Response({'error': 'Ticket not found.'}, status=status.HTTP_404_NOT_FOUND)
        
        # Verificar si el usuario es el creador del ticket o un administrador
        if ticket.user == request.user or request.user.is_staff:
            ticket.isDeleted = '1'  # '1' indica que el ticket está eliminado.
            ticket.save()
            return Response({'status': 'success', 'message': 'Ticket marked as deleted.'}, status=status.HTTP_204_NO_CONTENT)
        else:
            return Response({'error': 'Permission denied.'}, status=status.HTTP_403_FORBIDDEN)
        
class UpdateTicketView(APIView):
    permission_classes = [IsAuthenticated]

    def put(self, request, ticket_id):
        try:
            ticket = Ticket.objects.get(pk=ticket_id)
            data = request.data
            serializer = TicketSerializer(ticket, data=data, partial=True) 
            if serializer.is_valid():
                serializer.save()
                return Response({'status': 'success', 'message': 'Ticket updated.', 'ticket': serializer.data})
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        except Ticket.DoesNotExist:
            return Response({'error': 'Ticket not found.'}, status=status.HTTP_404_NOT_FOUND)

class TicketArchivosView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, ticket_id):
        # Verificar si el ticket existe
        if not Ticket.objects.filter(pk=ticket_id).exists():
            return Response({"error": "Ticket not found"}, status=404)

        # Obtener los archivos asociados con el ticket
        archivos = Archivo.objects.filter(ticket_id=ticket_id)
        if archivos.exists():
            serializer = ArchivoSerializer(archivos, many=True, context={'request': request})
            return Response(serializer.data)
        else:
            return Response({"message": "No files found for this ticket"}, status=404)
        
class TicketStatsView(APIView):
    """
    View para obtener estadísticas de los tickets, problemas y categorías.
    """
    def get(self, request, *args, **kwargs):
        total_tickets = Ticket.objects.count()  # Total de tickets

        # Conteo de problemas asociados a los tickets
        problema_stats = Ticket.objects.values('problema__name').annotate(total=Count('problema')).order_by('-total')

        # Conteo de categorías asociadas a los problemas en los tickets
        categoria_stats = Ticket.objects.values('problema__categoria__name').annotate(total=Count('problema__categoria')).order_by('-total')

        return Response({
            'total_tickets': total_tickets,
            'problema_stats': list(problema_stats),
            'categoria_stats': list(categoria_stats)
        })
        
class MensajeCreate(generics.CreateAPIView):
    queryset = Mensaje.objects.all()
    serializer_class = MensajeCreateSerializer

class MensajeList(generics.ListAPIView):
    serializer_class = MensajeSerializer

    def get_queryset(self):
        ticket_id = self.kwargs['ticket_id']
        return Mensaje.objects.filter(ticket_id=ticket_id)

