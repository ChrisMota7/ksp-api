# Generated by Django 5.0.2 on 2024-09-25 16:11

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0008_categoria_empresas_problema_empresas'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='categoria',
            name='empresas',
        ),
        migrations.RemoveField(
            model_name='problema',
            name='empresas',
        ),
    ]
