from django.db import models
from users.models import User
from django.utils import timezone

class Categoria(models.Model):
    name = models.CharField(max_length=50,)
    isDeleted = models.CharField(max_length=1, default=0, null=True, blank=True)

class Prioridad(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.archivo.url

class Problema(models.Model):
    name = models.CharField(max_length=255)
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    isDeleted = models.CharField(max_length=1, default=0, null=True, blank=True)
    prioridad = models.ForeignKey(Prioridad, on_delete=models.CASCADE) 

class Ticket(models.Model):
    asunto = models.TextField()
    descripcion = models.TextField()
    problema = models.ForeignKey('Problema', on_delete=models.CASCADE)  
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    status = models.CharField(
        max_length=10,
        choices=(('Nuevo', 'Nuevo'), ('En espera', 'En espera'), ('Respondido', 'Respondido'), ('Resuelto', 'Resuelto')), 
        default='Nuevo', 
        blank=True
    )
    created_at = models.DateTimeField(auto_now_add=True)
    closed_at = models.DateTimeField(null=True, blank=True)
    isDeleted = models.CharField(max_length=1, default='0', null=True, blank=True)
    first_response_at = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return self.asunto
    
    def save(self, *args, **kwargs):
        # Si el estado cambia a "Resuelto" y aún no tiene fecha de cierre, establecer la fecha
        if self.status == "Resuelto" and not self.closed_at:
            self.closed_at = timezone.now()
        super().save(*args, **kwargs)

class Archivo(models.Model):
    ARCHIVO_TIPOS = (
        ('imagen', 'Imagen'),
        ('video', 'Video'),
    )
    archivo = models.FileField(upload_to='ticket/')
    tipo = models.CharField(max_length=10, choices=ARCHIVO_TIPOS)
    ticket = models.ForeignKey(Ticket, related_name='ticket_archivos', on_delete=models.CASCADE, null=True, blank=True)

class Mensaje(models.Model):
    texto = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    ticket = models.ForeignKey(Ticket, on_delete=models.CASCADE)
    archivo = models.FileField(upload_to='mensaje/', null=True, blank=True)
    isFromClient = models.CharField(max_length=1, null=True, blank=True)

class TipoIncidente(models.Model):
    name = models.TextField()
    prioridad = models.ForeignKey(Prioridad, on_delete=models.CASCADE)
    isDeleted = models.CharField(max_length=1, default='0', null=True, blank=True)

class Incidente(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    tipoIncidente = models.ForeignKey(TipoIncidente, on_delete=models.CASCADE)
    puesto = models.TextField()
    descripcion = models.TextField()
    acciones = models.TextField(null=True, blank=True)
    personas = models.TextField(null=True, blank=True)
    detalles = models.TextField(null=True, blank=True)
    adicionales = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    isDeleted = models.CharField(max_length=1, default='0', null=True, blank=True)

class ArchivoIncidente(models.Model):
    ARCHIVO_TIPOS = (
        ('imagen', 'Imagen'),
        ('video', 'Video'),
    )
    archivo = models.FileField(upload_to='incidentes/')
    tipo = models.CharField(max_length=10, choices=ARCHIVO_TIPOS)
    incidente = models.ForeignKey(Incidente, related_name='incidente_archivos', on_delete=models.CASCADE, null=True, blank=True)