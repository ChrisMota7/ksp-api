from rest_framework import generics
from django.utils.dateparse import parse_datetime
from django.db.models import Q
import json
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from .models import Categoria, Problema, Prioridad, Ticket, Mensaje, Archivo, User, Incidente, TipoIncidente, ArchivoIncidente
from .serializers import CategoriaSerializer, ArchivoSerializer, ProblemaSerializer, PrioridadSerializer, TicketSerializer, MensajeSerializer, TicketCreateSerializer, TableTicketsSerializer, TableCategorySerializer, MensajeCreateSerializer, TipoIncidenteSerializer, IncidenteSerializer, IncidenteCreateSerializer, ArchivoIncidenteSerializer
from .models import Ticket, Problema, Categoria
from django.db.models import Count, Max
from django.core.mail import send_mail
from django.utils.dateparse import parse_date
from django.shortcuts import get_object_or_404


class FilterTicketsByDateRange(APIView):
    """
    Filtra los tickets por un rango de fechas.
    """
    def get(self, request):
        # Obtener los parámetros de fecha desde la solicitud
        start_date = request.query_params.get('start_date')
        end_date = request.query_params.get('end_date')

        if not start_date or not end_date:
            return Response({"error": "Both start_date and end_date are required."}, status=status.HTTP_400_BAD_REQUEST)

        # Convertir las fechas de string a objetos datetime.date
        start_date = parse_date(start_date)
        end_date = parse_date(end_date)

        if start_date > end_date:
            return Response({"error": "start_date must be before end_date."}, status=status.HTTP_400_BAD_REQUEST)

        # Filtrar tickets que están dentro del rango de fechas
        tickets = Ticket.objects.filter(created_at__date__range=[start_date, end_date])

        # Serializar los datos
        serializer = TicketSerializer(tickets, many=True)
        return Response(serializer.data)

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

class UpdateCategoryView(APIView):
    def put(self, request, category_id):
        try:
            categoria = Categoria.objects.get(pk=category_id)
            serializer = CategoriaSerializer(categoria, data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_200_OK)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except Categoria.DoesNotExist:
            return Response({'error': 'Category not found.'}, status=status.HTTP_404_NOT_FOUND)

class DeleteCategoryView(APIView):
    def put(self, request, category_id):
        try:
            categoria = Categoria.objects.get(pk=category_id)
            categoria.isDeleted = '1'
            categoria.save()
            return Response({'status': 'success', 'message': 'Category marked as deleted.'}, status=status.HTTP_204_NO_CONTENT)
        except Categoria.DoesNotExist:
            return Response({'error': 'Category not found.'}, status=status.HTTP_404_NOT_FOUND)

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
    
    def perform_create(self, serializer):
        serializer.save(isDeleted='0')

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
            ticket = serializer.save()
            CreateEmail.sent_email_ticket_created(ticket)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
class CreateEmail(APIView):
    # class CreateEmail(APIView):
    @staticmethod
    def sent_email_ticket_created(ticket):
        correos = User.objects.filter(isAdmin=1)
        destinatarios = [correo.email for correo in correos]

        # Enviar el correo con el asunto y descripción del ticket
        subject = f"Nuevo Ticket #{ticket.id} - {ticket.asunto}"
        message = f"Se ha creado un nuevo ticket con los siguientes detalles:\n\nAsunto: {ticket.asunto}\nDescripción: {ticket.descripcion}"

        send_mail(subject, message, 'support@KSP-IT.com', destinatarios, fail_silently=False)

    @staticmethod
    def sent_email_incidente_created(incidente):
        correos = User.objects.filter(isAdmin=1)
        destinatarios = [correo.email for correo in correos]

        # Enviar el correo con los detalles del incidente de seguridad
        subject = f"Nuevo Incidente de Seguridad #{incidente.id}"
        message = f"Se ha reportado un nuevo incidente de seguridad con los siguientes detalles:\n\nDescripción: {incidente.descripcion}"

        send_mail(subject, message, 'support@KSP-IT.com', destinatarios, fail_silently=False)

    @staticmethod
    def sent_email_incidente_deleted(incidente):
        correos = User.objects.filter(isAdmin=1)
        destinatarios = [correo.email for correo in correos]

        # Enviar el correo notificando la eliminación del incidente
        subject = f"Incidente de Seguridad #{incidente.id} Eliminado"
        message = f"El incidente de seguridad con ID {incidente.id} ha sido eliminado."

        send_mail(subject, message, 'support@KSP-IT.com', destinatarios, fail_silently=False)

    @staticmethod
    def SentEmailMessages(subject, message, recipient_list):
        send_mail(subject, message, 'support@KSP-IT.com', recipient_list, fail_silently=False)

    @staticmethod
    def SentEmailFinishedTicket(ticket, reason):
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
            message=f'El ticket con asunto "{ticket.asunto}" ha sido resuelto. Razón: {reason}',
            from_email='support@KSP-IT.com',
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
            reason = request.data.get('reason', '')
            # Cambiar el estado a "Resuelto" cuando se finaliza el ticket
            ticket.status = 'Resuelto'
            ticket.isDeleted = '1'
            ticket.save()

            CreateEmail.SentEmailFinishedTicket(ticket, reason)
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

            if ticket.first_response_at is None:
                ticket.first_response_at = mensaje.created_at  # Usamos la fecha de creación del mensaje
                ticket.save()

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

class TipoIncidenteListCreateView(generics.ListCreateAPIView):
    queryset = TipoIncidente.objects.all()
    serializer_class = TipoIncidenteSerializer

class UpdateTipoIncidenteView(APIView):
    def put(self, request, tipo_incidente_id):
        try:
            tipo_incidente = TipoIncidente.objects.get(pk=tipo_incidente_id)
            data = request.data

            # Actualizar la instancia de Prioridad si se proporciona en los datos
            if 'prioridad' in data:
                prioridad_id = data['prioridad']
                try:
                    prioridad = Prioridad.objects.get(id=prioridad_id)
                    tipo_incidente.prioridad = prioridad
                except Prioridad.DoesNotExist:
                    return Response({'error': 'Prioridad no encontrada.'}, status=status.HTTP_400_BAD_REQUEST)

            serializer = TipoIncidenteSerializer(tipo_incidente, data=data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_200_OK)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except TipoIncidente.DoesNotExist:
            return Response({'error': 'Tipo de incidente no encontrado.'}, status=status.HTTP_404_NOT_FOUND)
        
class DeleteTipoIncidenteView(APIView):
    def put(self, request, tipo_incidente_id):
        try:
            tipo_incidente = TipoIncidente.objects.get(pk=tipo_incidente_id)
            tipo_incidente.isDeleted = '1'
            tipo_incidente.save()
            return Response({'status': 'success', 'message': 'Tipo de incidente marcado como eliminado.'}, status=status.HTTP_204_NO_CONTENT)
        except TipoIncidente.DoesNotExist:
            return Response({'error': 'Tipo de incidente no encontrado.'}, status=status.HTTP_404_NOT_FOUND)

class IncidenteListCreateView(generics.ListCreateAPIView):
    queryset = Incidente.objects.filter(isDeleted='0')
    serializer_class = IncidenteSerializer

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

class IncidenteCreateView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        serializer = IncidenteCreateSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            incidente = serializer.save()
            # Enviar correo electrónico cuando se cree un incidente
            CreateEmail.sent_email_incidente_created(incidente)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class IncidenteDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Incidente.objects.all()
    serializer_class = IncidenteSerializer

    def put(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(serializer.data)

    def perform_update(self, serializer):
        serializer.save()

class MarkIncidenteDeletedView(APIView):
    def put(self, request, *args, **kwargs):
        try:
            instance = Incidente.objects.get(pk=kwargs['pk'])
            instance.isDeleted = '1'
            instance.save()
            CreateEmail.sent_email_incidente_deleted(instance)
            return Response(status=status.HTTP_204_NO_CONTENT)
        except Incidente.DoesNotExist:
            return Response({'error': 'Not found.'}, status=status.HTTP_404_NOT_FOUND)
        
class IncidenteArchivosView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, incidente_id):
        # Verificar si el incidente existe
        if not Incidente.objects.filter(pk=incidente_id).exists():
            return Response({"error": "Incidente no encontrado"}, status=404)

        # Obtener los archivos asociados con el incidente
        archivos = ArchivoIncidente.objects.filter(incidente_id=incidente_id)
        if archivos.exists():
            serializer = ArchivoIncidenteSerializer(archivos, many=True, context={'request': request})
            return Response(serializer.data)
        else:
            return Response({"message": "No se encontraron archivos para este incidente"}, status=404)