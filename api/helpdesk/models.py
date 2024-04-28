from django.db import models
from users.models import User

class Categoria(models.Model):
    name = models.CharField(max_length=50,)

class Problema(models.Model):
    name = models.CharField(max_length=255)
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    isDeleted = models.CharField(max_length=1, default=0, null=True, blank=True)

class Prioridad(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.archivo.url
    
class Ticket(models.Model):
    asunto = models.TextField()
    descripcion = models.TextField()
    problema = models.ForeignKey('Problema', on_delete=models.CASCADE)  # Asegúrate de que 'Problema' está definido
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    prioridad = models.ForeignKey('Prioridad', on_delete=models.SET_NULL, null=True, blank=True)  # Asegúrate de que 'Prioridad' está definido
    status = models.CharField(
        max_length=10,
        choices=(('0', 'Inactivo'), ('1', 'Activo')),  # Corregido para usar el formato correcto
        default='0',  # Estado predeterminado correcto
        blank=True
    )
    created_at = models.DateTimeField(auto_now_add=True)
    isDeleted = models.CharField(max_length=1, default='0', null=True, blank=True)

    def __str__(self):
        return self.asunto

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
