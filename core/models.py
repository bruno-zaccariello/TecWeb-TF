from django.db import models

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

    assunto = models.CharField("Assunto", max_length=50)
    email = models.EmailField("Email", blank=True)
    nome = models.CharField("Nome", max_length=50)
    mensagem = models.TextField("Mensagem")

    def envia_email(self):
        print("ENVIADO")		

class Disciplina(models.Model):

	nome = models.CharField("Nome",max_length=50)
	carga_horaria = models.IntegerField("Carga Horária")
	teoria = models.DecimalField("Teoria", max_digits=5, decimal_places=2)
	pratica = models.DecimalField("Prática", max_digits=5, decimal_places=2)
	ementa = models.TextField("Ementa")
	competencias = models.TextField("Competencias")
	habilidades = models.TextField("Habilidades")
	conteudo = models.TextField("Conteudo")
	bibliografia_basica = models.TextField("Bibliografia Básica")
	bibliografia_complementar = models.TextField("Bibliografia Complementar")
