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
    def _criar_usuario(self, ra, password, **campos):
        if not ra: 
            raise ValueError("RA deve ser declarado!")
        user = self.model(ra=ra, **campos)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, ra, password=None, **campos):
        return self._criar_usuario(ra, password, **campos)

    def create_superuser(self, ra, password=None, **campos):
        campos.setdefault('perfil', 'C')
        return self._criar_usuario(ra, password, **campos)

class Usuario(AbstractBaseUser):

    ra = models.IntegerField("RA",unique=True)
    password = models.CharField("Senha", max_length=200)

    nome = models.CharField("Nome", max_length=100)
    email = models.EmailField("E-Mail", max_length=50)

    perfil = models.CharField("Perfil", max_length=1)
    ativo = models.BooleanField("Ativo", default=True)
    
    USERNAME_FIELD = 'ra'
    REQUIRED_FIELDS = ['nome','email']

    objects = UsuarioManager()

    def get_full_name(self):
        return self.nome

    def get_short_name(self):
        return self.nome

    def __str__(self):
        return self.nome

    @property
    def is_staff(self):
        return self.perfil == "C"

    def has_module_perms(self, package_name):
        return True

    def has_perm(self, perm, obj=None):
        return True

    def has_perms(self, perm_list, obj=None):
        return True

class Curso(models.Model):
    
    carga_horaria = models.IntegerField("Carga Horária")
    nome = models.CharField("Nome",max_length = 20)
    tipo = models.CharField("Tipo",max_length = 20)
    professor = models.CharField("Professor",max_length=20)

    descricao = models.TextField("Descrição",blank=True)
    ativo = models.BooleanField("Ativo?", default=True)

    def __str__(self):
        return self.nome

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

class Aluno(Usuario):

    celular = models.CharField("Celular", max_length=11)
    curso = models.ForeignKey(Curso)
    disciplina = models.ForeignKey(Disciplina)

# Create your models here.		
		
class Contato(models.Model):

    assunto = models.CharField("Assunto", max_length=50)
    email = models.EmailField("Email", blank=True)
    nome = models.CharField("Nome", max_length=50)
    mensagem = models.TextField("Mensagem")

    def envia_email(self):
        print("ENVIADO")		