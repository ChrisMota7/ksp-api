# Generated by Django 5.0.2 on 2025-02-17 16:18

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0002_razoncierre_ticket_razones_cierre'),
    ]

    operations = [
        migrations.CreateModel(
            name='ArchivoMensaje',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('archivo', models.FileField(upload_to='mensaje/')),
                ('tipo', models.CharField(choices=[('imagen', 'Imagen'), ('video', 'Video'), ('documento', 'Documento')], max_length=10)),
                ('mensaje', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='archivos', to='helpdesk.mensaje')),
            ],
        ),
    ]
