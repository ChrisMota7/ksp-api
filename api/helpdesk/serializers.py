from rest_framework import serializers
from .models import Categoria, Problema, Prioridad, Ticket, Mensaje, Archivo, TipoIncidente, Incidente, ArchivoIncidente
from users.serializers import UserSerializer
from django.http import FileResponse

class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = ('id', 'name', 'isDeleted')

class PrioridadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prioridad
        fields = '__all__'

class ProblemaSerializer(serializers.ModelSerializer):
    categoria = CategoriaSerializer(read_only=True)
    prioridad = PrioridadSerializer(read_only=True)
    
    class Meta:
        model = Problema
        fields = ('id', 'name', 'isDeleted', 'categoria', 'prioridad')  

    def create(self, validated_data):
        # Aquí manejas la creación de un problema, asegurándote de que puedas establecer la categoría y la prioridad.
        categoria_id = self.initial_data.get('categoria')  # obtener el ID de categoría desde el request
        prioridad_id = self.initial_data.get('prioridad')  # obtener el ID de prioridad desde el request
        categoria = Categoria.objects.get(id=categoria_id)  # obtener la instancia de Categoria
        prioridad = Prioridad.objects.get(id=prioridad_id)  # obtener la instancia de Prioridad

        problema = Problema.objects.create(
            name=validated_data.get('name'),
            isDeleted=validated_data.get('isDeleted'),
            categoria=categoria,
            prioridad=prioridad
        )
        return problema

class TableCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = ('id', 'name')

class ArchivoSerializer(serializers.ModelSerializer):
    url = serializers.SerializerMethodField()

    class Meta:
        model = Archivo
        fields = ('id', 'archivo', 'tipo', 'url')

    def get_url(self, obj):
        request = self.context.get('request')
        if obj.archivo:
            return self.context['request'].build_absolute_uri(obj.archivo.url)
        return None

class TicketCreateSerializer(serializers.ModelSerializer):    
    archivos = serializers.ListField(
        write_only=True,
        required=False,
        child=serializers.FileField()
    )  # Acepta múltiples archivos.

    class Meta:
        model = Ticket
        fields = ('id', 'asunto', 'descripcion', 'problema', 'archivos')
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
    problema = ProblemaSerializer(read_only=True)
    user = UserSerializer(read_only=True)

    class Meta:
        model = Ticket
        fields = ('id', 'asunto', 'descripcion', 'problema', 'user', 'status', 'isDeleted', 'created_at', 'archivos', 'id_custom')

class TableTicketsSerializer(serializers.ModelSerializer):
    problema = ProblemaSerializer(read_only=True)
    user = UserSerializer(read_only=True)

    class Meta:
        model = Ticket
        fields = ('id', 'asunto', 'descripcion', 'problema', 'user', 'isDeleted', 'status', 'created_at', 'id_custom')

class MensajeSerializer(serializers.ModelSerializer):
    ticket = TicketSerializer(read_only=True)

    class Meta:
        model = Mensaje
        fields = ['id', 'texto', 'created_at', 'ticket', 'archivo', 'isFromClient']  

class MensajeCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = Mensaje
        fields = ['id', 'texto', 'created_at', 'ticket', 'archivo', 'isFromClient'] 

class TipoIncidenteSerializer(serializers.ModelSerializer):
    prioridad = serializers.PrimaryKeyRelatedField(queryset=Prioridad.objects.all())
    prioridad = PrioridadSerializer(read_only=True)

    class Meta:
        model = TipoIncidente
        fields = '__all__'

    def update(self, instance, validated_data):
        prioridad_data = validated_data.pop('prioridad', None)
        if prioridad_data:
            instance.prioridad_id = prioridad_data
        instance.name = validated_data.get('name', instance.name)
        instance.save()
        return instance

class ArchivoIncidenteSerializer(serializers.ModelSerializer):
    url = serializers.SerializerMethodField()

    class Meta:
        model = ArchivoIncidente
        fields = ('id', 'archivo', 'tipo', 'url')

    def get_url(self, obj):
        request = self.context.get('request')
        if obj.archivo:
            return request.build_absolute_uri(obj.archivo.url)
        return None

class IncidenteCreateSerializer(serializers.ModelSerializer):
    archivos = serializers.ListField(
        write_only=True,
        required=False,
        child=serializers.FileField()
    )

    class Meta:
        model = Incidente
        fields = ('id', 'tipoIncidente', 'puesto', 'descripcion', 'acciones', 'personas', 'detalles', 'adicionales', 'archivos')
        read_only_fields = ('user',)

    def create(self, validated_data):
        archivos_data = validated_data.pop('archivos', None)
        incidente = Incidente.objects.create(user=self.context['request'].user, **validated_data)
        
        if archivos_data:
            for archivo_file in archivos_data:
                ArchivoIncidente.objects.create(archivo=archivo_file, incidente=incidente)
        return incidente

# Serializador para visualizar Incidente
class IncidenteSerializer(serializers.ModelSerializer):
    tipoIncidente = serializers.PrimaryKeyRelatedField(queryset=TipoIncidente.objects.all())
    user = UserSerializer(read_only=True)
    tipoIncidente_detail = TipoIncidenteSerializer(read_only=True, source='tipoIncidente')
    archivos = ArchivoIncidenteSerializer(many=True, read_only=True)  # Agregar manejo de archivos

    class Meta:
        model = Incidente
        fields = ['id', 'tipoIncidente', 'tipoIncidente_detail', 'user', 'puesto', 'descripcion', 'acciones', 'personas', 'detalles', 'adicionales', 'created_at', 'isDeleted', 'archivos']  # Incluye tipoIncidente_detail aquí
        extra_kwargs = {
            'user': {'read_only': True}
        }

    def create(self, validated_data):
        user = self.context['request'].user
        tipo_incidente = validated_data.pop('tipoIncidente')
        archivos_data = self.context['request'].FILES.getlist('archivos')  # Manejo de archivos

        incidente = Incidente.objects.create(
            user=user,
            tipoIncidente=tipo_incidente,
            **validated_data
        )

        # Crear archivos asociados al incidente
        if archivos_data:
            for archivo in archivos_data:
                ArchivoIncidente.objects.create(archivo=archivo, incidente=incidente)
                
        return incidente