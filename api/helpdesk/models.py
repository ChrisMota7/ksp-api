from django.db import models
from users.models import User

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
    isDeleted = models.CharField(max_length=1, default='0', null=True, blank=True)

    id_custom = models.CharField(max_length=10, unique=True, blank=True)

    def save(self, *args, **kwargs):
        if not self.id_custom:  # Si aún no tiene un ID personalizado, se genera
            # Obtener las primeras 3 letras de la categoría relacionada al problema
            category_prefix = self.problema.categoria.name[:3].upper()  # Ajusta según cómo obtienes la categoría
            
            # Obtener el último ticket en esta categoría y generar el siguiente ID
            last_ticket = Ticket.objects.filter(problema__categoria=self.problema.categoria).order_by('id_custom').last()
            
            if last_ticket and last_ticket.id_custom:
                # Extraer la parte numérica del último ID y sumarle 1
                next_id = int(last_ticket.id_custom[-1]) + 1
            else:
                # Si es el primer ticket de esta categoría, empezar desde 1
                next_id = 1
            
            # Asignar el nuevo ID personalizado
            self.id_custom = f"{category_prefix}{next_id}"

        super().save(*args, **kwargs)

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