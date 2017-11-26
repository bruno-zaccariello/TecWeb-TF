# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Aluno(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    ra = models.IntegerField(db_column='RA', unique=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=120)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=80)  # Field name made lowercase.
    celular = models.CharField(db_column='Celular', max_length=11)  # Field name made lowercase.
    id_curso = models.ForeignKey('Curso', models.DO_NOTHING, db_column='ID_Curso')  # Field name made lowercase.
    sigla_curso = models.CharField(db_column='Sigla_Curso', max_length=2)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Aluno'


class Arquivosquestao(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_questao = models.ForeignKey('Questao', models.DO_NOTHING, db_column='ID_Questao')  # Field name made lowercase.
    arquivo = models.CharField(db_column='Arquivo', max_length=500)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ArquivosQuestao'
        unique_together = (('id_questao', 'arquivo'),)


class Arquivosresposta(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_resposta = models.ForeignKey('Resposta', models.DO_NOTHING, db_column='ID_Resposta')  # Field name made lowercase.
    arquivo = models.CharField(db_column='Arquivo', max_length=500)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ArquivosResposta'
        unique_together = (('id_resposta', 'arquivo'),)


class Curso(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    sigla = models.CharField(db_column='Sigla', unique=True, max_length=5)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', unique=True, max_length=50)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Curso'


class Cursoturma(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_curso = models.ForeignKey(Curso, models.DO_NOTHING, db_column='ID_Curso')  # Field name made lowercase.
    id_turma = models.ForeignKey('Turma', models.DO_NOTHING, db_column='ID_Turma')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CursoTurma'
        unique_together = (('id_curso', 'id_turma'),)


class Disciplina(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', unique=True, max_length=240)  # Field name made lowercase.
    cargahoraria = models.SmallIntegerField(db_column='CargaHoraria')  # Field name made lowercase.
    teoria = models.DecimalField(db_column='Teoria', max_digits=3, decimal_places=0)  # Field name made lowercase.
    pratica = models.DecimalField(db_column='Pratica', max_digits=3, decimal_places=0)  # Field name made lowercase.
    ementa = models.TextField(db_column='Ementa')  # Field name made lowercase. This field type is a guess.
    competencias = models.TextField(db_column='Competencias')  # Field name made lowercase. This field type is a guess.
    habilidades = models.TextField(db_column='Habilidades')  # Field name made lowercase. This field type is a guess.
    conteudo = models.TextField(db_column='Conteudo')  # Field name made lowercase. This field type is a guess.
    bibliografia_basica = models.TextField(db_column='Bibliografia_Basica')  # Field name made lowercase. This field type is a guess.
    biliografia_complementar = models.TextField(db_column='Biliografia_Complementar')  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'Disciplina'


class Disciplinaofertada(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_disciplina = models.ForeignKey(Disciplina, models.DO_NOTHING, db_column='ID_Disciplina')  # Field name made lowercase.
    ano = models.SmallIntegerField(db_column='Ano')  # Field name made lowercase.
    semestre = models.CharField(db_column='Semestre', max_length=1)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'DisciplinaOfertada'
        unique_together = (('id_disciplina', 'ano', 'semestre'),)


class Gradecurricular(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_curso = models.ForeignKey(Curso, models.DO_NOTHING, db_column='ID_Curso')  # Field name made lowercase.
    ano = models.SmallIntegerField(db_column='Ano')  # Field name made lowercase.
    semestre = models.CharField(db_column='Semestre', max_length=1)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'GradeCurricular'
        unique_together = (('id_curso', 'ano', 'semestre'),)


class Matricula(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_aluno = models.ForeignKey(Aluno, models.DO_NOTHING, db_column='ID_Aluno')  # Field name made lowercase.
    id_turma = models.ForeignKey('Turma', models.DO_NOTHING, db_column='ID_Turma')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Matricula'
        unique_together = (('id_aluno', 'id_turma'),)


class Periodo(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_gradecurricular = models.ForeignKey(Gradecurricular, models.DO_NOTHING, db_column='ID_GradeCurricular')  # Field name made lowercase.
    numero = models.SmallIntegerField(db_column='Numero')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Periodo'
        unique_together = (('id_gradecurricular', 'numero'),)


class Periododisciplina(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_periodo = models.ForeignKey(Periodo, models.DO_NOTHING, db_column='ID_Periodo')  # Field name made lowercase.
    id_disciplina = models.ForeignKey(Disciplina, models.DO_NOTHING, db_column='ID_Disciplina')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PeriodoDisciplina'
        unique_together = (('id_periodo', 'id_disciplina'),)


class Professor(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    ra = models.IntegerField(db_column='RA', unique=True)  # Field name made lowercase.
    apelido = models.CharField(db_column='Apelido', unique=True, max_length=30)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=120)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=80)  # Field name made lowercase.
    celular = models.CharField(db_column='Celular', max_length=11)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Professor'


class Questao(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_turma = models.ForeignKey('Turma', models.DO_NOTHING, db_column='ID_Turma')  # Field name made lowercase.
    numero = models.IntegerField(db_column='Numero')  # Field name made lowercase.
    data_limite_entrega = models.CharField(db_column='Data_Limite_Entrega', max_length=10)  # Field name made lowercase.
    descricao = models.TextField(db_column='Descricao')  # Field name made lowercase. This field type is a guess.
    data = models.CharField(db_column='Data', max_length=10)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Questao'
        unique_together = (('id_turma', 'numero'),)


class Resposta(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_questao = models.ForeignKey(Questao, models.DO_NOTHING, db_column='ID_Questao')  # Field name made lowercase.
    id_aluno = models.ForeignKey(Aluno, models.DO_NOTHING, db_column='ID_Aluno')  # Field name made lowercase.
    data_avaliacao = models.CharField(db_column='Data_Avaliacao', max_length=10)  # Field name made lowercase.
    nota = models.DecimalField(db_column='Nota', max_digits=4, decimal_places=2)  # Field name made lowercase.
    avaliacao = models.TextField(db_column='Avaliacao')  # Field name made lowercase. This field type is a guess.
    descricao = models.TextField(db_column='Descricao')  # Field name made lowercase. This field type is a guess.
    data_de_envio = models.CharField(db_column='Data_de_Envio', max_length=10)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Resposta'
        unique_together = (('id_questao', 'id_aluno'),)


class Turma(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_disciplinaofertada = models.ForeignKey(Disciplinaofertada, models.DO_NOTHING, db_column='ID_DisciplinaOfertada')  # Field name made lowercase.
    identificacao_turma = models.CharField(db_column='Identificacao_Turma', max_length=1)  # Field name made lowercase.
    turno = models.CharField(db_column='Turno', max_length=15)  # Field name made lowercase.
    id_professor = models.ForeignKey(Professor, models.DO_NOTHING, db_column='ID_Professor')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Turma'
        unique_together = (('id_disciplinaofertada', 'id_professor'),)


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class CoreContato(models.Model):
    assunto = models.CharField(max_length=50)
    email = models.CharField(max_length=254)
    nome = models.CharField(max_length=50)
    mensagem = models.TextField()

    class Meta:
        managed = False
        db_table = 'core_contato'


class CoreDisciplina(models.Model):
    nome = models.CharField(max_length=50)
    carga_horaria = models.IntegerField()
    teoria = models.DecimalField(max_digits=5, decimal_places=2)
    pratica = models.DecimalField(max_digits=5, decimal_places=2)
    ementa = models.TextField()
    competencias = models.TextField()
    habilidades = models.TextField()
    conteudo = models.TextField()
    bibliografia_basica = models.TextField()
    bibliografia_complementar = models.TextField()

    class Meta:
        managed = False
        db_table = 'core_disciplina'


class CoreUsuario(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    ra = models.IntegerField(unique=True)
    nome = models.CharField(max_length=100)
    email = models.CharField(unique=True, max_length=254)
    ativo = models.BooleanField()
    perfil = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'core_usuario'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(CoreUsuario, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'
