from django.db import models
from core.choices import *

# Create your models here.

class Curso(models.Model):
    
    carga_horaria = models.IntegerField("Carga Horária")
    nome = models.CharField("Nome",max_length = 20)
    tipo = models.CharField("Tipo",max_length = 20)
    professor = models.CharField("Professor",max_length=20)

    descricao = models.TextField("Descrição",blank=True)
    ativo = models.BooleanField("Ativo?", default=True)

    def __str__(self):
        return self.nome

class Contato(models.Model):

    assunto = models.CharField("Assunto", choices=assunto_escolha, default=1)
    email = models.EmailField("Email", blank=True)
    nome = models.CharField("Nome", max_lenght=50)
    mensagem = models.TextField("Mensagem")

    def envia_email(self):
        print("ENVIADO")
