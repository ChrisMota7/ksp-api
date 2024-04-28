from rest_framework import generics
from django.utils.dateparse import parse_datetime
from django.db.models import Q
import json
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .models import Categoria, Problema, Prioridad, Ticket, Mensaje
from .serializers import CategoriaSerializer, ProblemaSerializer, PrioridadSerializer, TicketSerializer, MensajeSerializer, TicketCreateSerializer, TableTicketsSerializer, TableCategorySerializer

class CategoriaList(generics.ListCreateAPIView):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer

class CategoryTable(generics.ListAPIView):
    queryset = Ticket.objects.all()
    serializer_class = TableCategorySerializer

class ProblemaList(generics.ListCreateAPIView):
    serializer_class = ProblemaSerializer

    def get_queryset(self):
        queryset = Problema.objects.all()
        categoria_id = self.kwargs.get('categoria_id')
        if categoria_id is not None:
            queryset = queryset.filter(categoria_id=categoria_id)
        return queryset

class PrioridadList(generics.ListCreateAPIView):
    queryset = Prioridad.objects.all()
    serializer_class = PrioridadSerializer

class TicketList(generics.ListAPIView):
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer

class TicketCreate(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        print("TicketCreate post")
        # El contexto ahora incluye la request para acceso al usuario en el serializer
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
            return Ticket.objects.get(pk=ticket_id)
        except Ticket.DoesNotExist:
            return Response({'error': 'Not found.'}, status=status.HTTP_404_NOT_FOUND)

    def get(self, request, ticket_id, format=None):
        ticket = self.get_object(ticket_id)
        if ticket is None:
            return Response({'error': 'Not found.'}, status=status.HTTP_404_NOT_FOUND)
        serializer = TicketSerializer(ticket)
        return Response(serializer.data)

class DeleteTicketView(APIView):
    permission_classes = [IsAuthenticated]

    def put(self, request, ticket_id):
        try:
            ticket = Ticket.objects.get(pk=ticket_id, user=request.user)
            ticket.isDeleted = '1'  # '1' indica que el ticket está eliminado.
            ticket.save()
            return Response({'status': 'success', 'message': 'Ticket marked as deleted.'}, status=status.HTTP_204_NO_CONTENT)
        except Ticket.DoesNotExist:
            return Response({'error': 'Ticket not found.'}, status=status.HTTP_404_NOT_FOUND)
        
class UpdateTicketView(APIView):
    permission_classes = [IsAuthenticated]

    def put(self, request, ticket_id):
        try:
            ticket = Ticket.objects.get(pk=ticket_id)
            # Asegúrate de que el usuario tiene permiso para actualizar este ticket.
            if request.user != ticket.user:
                return Response({'error': 'Unauthorized'}, status=status.HTTP_403_FORBIDDEN)

            # Aquí deberías obtener todos los campos que se esperan actualizar
            # desde el body de la solicitud, incluyendo la prioridad.
            data = request.data
            serializer = TicketSerializer(ticket, data=data, partial=True)  # Establecer partial=True para permitir actualizaciones parciales con PUT
            if serializer.is_valid():
                serializer.save()
                return Response({'status': 'success', 'message': 'Ticket updated.', 'ticket': serializer.data})
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        except Ticket.DoesNotExist:
            return Response({'error': 'Ticket not found.'}, status=status.HTTP_404_NOT_FOUND)

class MensajeCreate(generics.CreateAPIView):
    queryset = Mensaje.objects.all()
    serializer_class = MensajeSerializer

class MensajeList(generics.ListAPIView):
    serializer_class = MensajeSerializer

    def get_queryset(self):
        ticket_id = self.kwargs['ticket_id']
        return Mensaje.objects.filter(ticket_id=ticket_id)

