# Generated by Django 5.0.2 on 2025-05-27 18:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='activeDirectory',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
