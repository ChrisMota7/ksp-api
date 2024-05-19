from rest_framework import generics
from django.utils.dateparse import parse_datetime
from django.db.models import Q
import json
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .models import Categoria, Problema, Prioridad, Ticket, Mensaje, Archivo, User
from .serializers import CategoriaSerializer, ArchivoSerializer, ProblemaSerializer, PrioridadSerializer, TicketSerializer, MensajeSerializer, TicketCreateSerializer, TableTicketsSerializer, TableCategorySerializer, MensajeCreateSerializer
from .models import Ticket, Problema, Categoria
from django.db.models import Count, Max
from django.core.mail import send_mail

class CategoriaList(generics.ListCreateAPIView):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer

class CategoriaCreateAPIView(generics.CreateAPIView):
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

class UpdateProblemView(APIView):
    def put(self, request, problem_id):
        try:
            problema = Problema.objects.get(pk=problem_id)
            serializer = ProblemaSerializer(problema, data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_200_OK)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except Problema.DoesNotExist:
            return Response({'error': 'Problem not found.'}, status=status.HTTP_404_NOT_FOUND)
        
class DeleteProblemView(APIView):
    def put(self, request, problem_id):
        try:
            problema = Problema.objects.get(pk=problem_id)
            problema.isDeleted = '1'
            problema.save()
            return Response({'status': 'success', 'message': 'Problem marked as deleted.'}, status=status.HTTP_204_NO_CONTENT)
        except Problema.DoesNotExist:
            return Response({'error': 'Problem not found.'}, status=status.HTTP_404_NOT_FOUND)
        
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
            # CreateEmail.SentEmail(request.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
class CreateEmail(APIView):
    def SentEmail(data):
        correos = User.objects.filter(isAdmin = 1)
        detinatarios = []
        for correo in correos:
            detinatarios.append(correo.email)
        send_mail(data.get('asunto'), data.get('descripcion'), 'soporte@ksp.com.mx', detinatarios, fail_silently=False)

    def SentEmailMessages(subject, message, recipient_list):
        send_mail(subject, message, 'soporte@ksp.com.mx', recipient_list, fail_silently=False)

    def SentEmailFinishedTicket(ticket):
        # Obtener correos electrónicos de los administradores
        admin_users = User.objects.filter(isAdmin=1)
        admin_emails = [admin.email for admin in admin_users]

        # Correo electrónico del colaborador
        collaborator_email = ticket.user.email

        # Lista de destinatarios
        recipient_list = admin_emails + [collaborator_email]

        # Enviar correo electrónico
        send_mail(
            subject=f'Ticket #{ticket.id} Resuelto',
            message=f'El ticket con asunto "{ticket.asunto}" ha sido resuelto.',
            from_email='soporte@ksp.com.mx',
            recipient_list=recipient_list,
            fail_silently=False
        )

        

        
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

        # Contar los mensajes y obtener el último mensaje
        total_mensajes = Mensaje.objects.filter(ticket=ticket).count()
        ultimo_mensaje = Mensaje.objects.filter(ticket=ticket).order_by('-created_at').first()
        
        # Determinar quién envió el último mensaje
        ultimo_remitente = "Administrador" if ultimo_mensaje and ultimo_mensaje.isFromClient == '0' else "Colaborador"

        serializer = TicketSerializer(ticket, context={'request': request})
        return Response({
            'ticket_data': serializer.data,
            'total_mensajes': total_mensajes,
            'ultimo_remitente': ultimo_remitente
        })

class DeleteTicketView(APIView):
    permission_classes = [IsAuthenticated]

    def put(self, request, ticket_id):
        try:
            ticket = Ticket.objects.get(pk=ticket_id)
            # Cambiar el estado a "Resuelto" cuando se finaliza el ticket
            ticket.status = 'Resuelto'
            ticket.isDeleted = '1'
            ticket.save()

            CreateEmail.SentEmailFinishedTicket(ticket)
            return Response({'status': 'success', 'message': 'Ticket marked as deleted.'}, status=status.HTTP_204_NO_CONTENT)
        except Ticket.DoesNotExist:
            return Response({'error': 'Ticket not found.'}, status=status.HTTP_404_NOT_FOUND)
        
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
        
class MensajeCreate(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        serializer = MensajeCreateSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            mensaje = serializer.save()

            # Obtener el ticket asociado al mensaje
            ticket = mensaje.ticket

            # Determinar los destinatarios del correo electrónico
            if mensaje.isFromClient == '0':  # El administrador envía un mensaje al cliente
                recipient_list = [ticket.user.email]
            else:  # El cliente envía un mensaje al administrador
                admin_users = User.objects.filter(isAdmin='1')
                recipient_list = [admin.email for admin in admin_users]

            # Enviar correo electrónico
            CreateEmail.SentEmailMessages(
                subject=f'Nuevo mensaje en el ticket #{ticket.id}',
                message=mensaje.texto,
                recipient_list=recipient_list
            )

            # Actualizar el estado del ticket dependiendo de quién envía el mensaje
            if mensaje.isFromClient == '0':
                ticket.status = 'Respondido'
            else:
                ticket.status = 'En espera'
            ticket.save()

            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
class MensajeList(generics.ListAPIView):
    serializer_class = MensajeSerializer

    def get_queryset(self):
        ticket_id = self.kwargs['ticket_id']
        return Mensaje.objects.filter(ticket_id=ticket_id)

