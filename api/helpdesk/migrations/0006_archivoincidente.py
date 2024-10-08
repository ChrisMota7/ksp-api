# Generated by Django 5.0.2 on 2024-08-22 18:40

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0005_remove_incidente_telefono'),
    ]

    operations = [
        migrations.CreateModel(
            name='ArchivoIncidente',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('archivo', models.FileField(upload_to='incidentes/')),
                ('tipo', models.CharField(choices=[('imagen', 'Imagen'), ('video', 'Video')], max_length=10)),
                ('incidente', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='incidente_archivos', to='helpdesk.incidente')),
            ],
        ),
    ]
