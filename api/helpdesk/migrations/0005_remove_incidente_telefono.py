# Generated by Django 5.0.2 on 2024-08-21 14:58

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0004_rename_insidente_incidente_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='incidente',
            name='telefono',
        ),
    ]