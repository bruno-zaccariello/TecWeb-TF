# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-11-27 16:57
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_auto_20171127_1456'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='questao',
            name='turma',
        ),
        migrations.AlterUniqueTogether(
            name='questao',
            unique_together=set([('numero',)]),
        ),
    ]