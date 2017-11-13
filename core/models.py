from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

ALUNO = "A"
PROFESSOR = "P"
COORDENADOR = "C"
PERFIS = (
    (ALUNO, 'Aluno'),
    (PROFESSOR, 'Professor'),
    (COORDENADOR, 'Coordenador')
)

class UsuarioManager(BaseUserManager):
    use_in_migrations = True
    
    def _create_user(self, ra, password, **extra_fields):
        if not ra:
            raise ValueError("RA precisa ser preenchido")
        user = self.model(ra=ra, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user
    
    def create_user(self, ra, password=None, **extra_fields):
        return self._create_user(ra, password, **extra_fields)
    
    def create_superuser(self, ra, password, **extra_fields):
        return self._create_user(ra, password, **extra_fields)

class Usuario(AbstractBaseUser):
    ra = models.IntegerField("RA", unique=True)
    nome = models.CharField("Nome", max_length=100, blank=True)
    email = models.EmailField("E-mail", unique="True")
    ativo = models.BooleanField("Ativo", default=True)
    perfil = models.CharField("Perfil", max_length=1, choices=PERFIS)
    
    USERNAME_FIELD = "ra"
    
    objects = UsuarioManager()
    
    REQUIRED_FIELDS = ["nome", "email"]
    
    def get_full_name(self):
        return self.nome
    
    def get_shot_name(self):
        return self.nome
    
    def __str__(self):
        return self.nome
    
    def has_perm(self, perm, obj=None):
        return True
    
    def has_module_perms(self, app_label):
        return True
    
    @property
    def is_staff(self):
        return self.perfil == 'C'

# Create your models here.

class Aluno(Usuario):
    parent_link = models.OneToOneField(Usuario,primary_key=True,db_column="usuario_id",parent_link=True)
    curso = models.ForeignKey('core.Curso',blank=True,null=True,)
    celular = models.CharField("Celular", max_length=11)


		
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
