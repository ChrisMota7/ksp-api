# Generated by Django 5.0.2 on 2024-11-12 18:09

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('helpdesk', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ticket',
            name='id_custom',
        ),
    ]
