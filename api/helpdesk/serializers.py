from rest_framework import serializers
from .models import Categoria, Problema, Prioridad, Ticket, Mensaje, Archivo
from users.serializers import UserSerializer

class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = '__all__'

class ProblemaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Problema
        fields = '__all__'

class TableCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = ('id', 'name')

class PrioridadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prioridad
        fields = '__all__'

class ArchivoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Archivo
        fields = ('id', 'archivo', 'tipo')  

class TicketCreateSerializer(serializers.ModelSerializer):    
    archivos = serializers.ListField(
        write_only=True,
        required=False,
        child=serializers.FileField()
    )  # Acepta múltiples archivos.

    class Meta:
        model = Ticket
        fields = ('id', 'asunto', 'descripcion', 'problema', 'prioridad', 'archivos')
        read_only_fields = ('user',)  # user es de solo lectura.

    def create(self, validated_data):
        archivos_data = validated_data.pop('archivos', None)

        # Asegura que 'user' no se pase dos veces.
        # Esto elimina 'user' de validated_data si por alguna razón ya existe.
        validated_data.pop('user', None)
        
        # Crea el ticket asociándolo al usuario autenticado.
        ticket = Ticket.objects.create(
            asunto=validated_data['asunto'],
            descripcion=validated_data['descripcion'],
            problema=validated_data['problema'],
            user=self.context['request'].user,
        )
        
        if archivos_data:
            for archivo_file in archivos_data:
                # Crea una instancia de Archivo para cada archivo subido
                # y asócialo al ticket recién creado.
                Archivo.objects.create(archivo=archivo_file, ticket=ticket)
        return ticket

class TicketSerializer(serializers.ModelSerializer):
    archivos = ArchivoSerializer(many=True, read_only=True)

    class Meta:
        model = Ticket
        fields = ('id', 'asunto', 'descripcion', 'problema', 'user', 'prioridad', 'created_at', 'archivos')

class TableTicketsSerializer(serializers.ModelSerializer):
    problema = ProblemaSerializer(read_only=True)
    user = UserSerializer(read_only=True)

    class Meta:
        model = Ticket
        fields = ('id', 'asunto', 'descripcion', 'problema', 'user', 'prioridad', 'created_at',)

class MensajeSerializer(serializers.ModelSerializer):

    class Meta:
        model = Mensaje
        fields = ['id', 'texto', 'created_at', 'ticket', 'archivo']  