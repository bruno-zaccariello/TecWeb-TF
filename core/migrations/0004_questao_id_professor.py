# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-11-27 16:50
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_auto_20171127_1449'),
    ]

    operations = [
        migrations.AddField(
            model_name='questao',
            name='id_professor',
            field=models.ForeignKey(default='2', on_delete=django.db.models.deletion.CASCADE, to='core.Professor'),
            preserve_default=False,
        ),
    ]