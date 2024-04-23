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

class MensajeCreate(generics.CreateAPIView):
    queryset = Mensaje.objects.all()
    serializer_class = MensajeSerializer

class MensajeList(generics.ListAPIView):
    serializer_class = MensajeSerializer

    def get_queryset(self):
        ticket_id = self.kwargs['ticket_id']
        return Mensaje.objects.filter(ticket_id=ticket_id)
