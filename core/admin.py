from django import forms
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from core.models import Curso, Aluno, Disciplina, Professor, Coordenador, Turma, Gradecurricular, Periodo, Periododisciplina

class CursoAdmin(admin.ModelAdmin):
    list_display = ["sigla", "nome"]
    

class AlunoForm(forms.ModelForm):

    def save(self, commit=True):
        aluno = super(AlunoForm,self).save(commit=False)
        aluno.set_password("123@mudar")
        aluno.perfil = 'A'
        if commit:
            aluno.save()
        return aluno

    class Meta:
        model = Aluno
        fields = ["ra", "nome", "email", "curso"]

class AlunoAlterarForm(forms.ModelForm):

    class Meta:
        model = Aluno
        fields = ["nome", "email", "curso"]


class AlunoAdmin(UserAdmin):
    add_form = AlunoForm
    form = AlunoAlterarForm
    add_fieldsets = ((None, { "fields": ("ra", "nome", "email", "curso")}),)
    fieldsets = ((None, { "fields": ("nome", "email", "curso")}),)
    list_display = ["ra","nome","email","curso"]
    filter_horizontal = []
    ordering = ["ra"]
    list_filter = ["curso"]

class ProfessorForm(forms.ModelForm):

    def save(self, commit=True):
        professor = super(ProfessorForm,self).save(commit=False)
        professor.set_password("123@mudar")
        professor.perfil = 'P'
        if commit:
            Professor.save()
        return professor

    class Meta:
        model = Professor
        fields = ["ra", "nome", "email", "apelido", "celular"]

class ProfessorAlterarForm(forms.ModelForm):

    class Meta:
        model = Professor
        fields = ["apelido", "email", "celular"]


class ProfessorAdmin(UserAdmin):
    add_form = ProfessorForm
    form = ProfessorAlterarForm
    add_fieldsets = ((None, { "fields": ("ra", "nome", "email", "apelido", "celular")}),)
    fieldsets = ((None, { "fields": ("nome", "email", "apelido", "celular")}),)
    list_display = ["ra","nome","email", "apelido", "celular"]
    filter_horizontal = []
    ordering = ["ra"]
    list_filter = []

class CoordenadorForm(forms.ModelForm):

    def save(self, commit=True):
        coordenador = super(CoordenadorForm,self).save(commit=False)
        coordenador.set_password("123@mudar")
        coordenador.perfil = 'C'
        if commit:
            Coordenador.save()
        return coordenador

    class Meta:
        model = Coordenador
        fields = ["ra", "nome", "email", "apelido"]

class CoordenadorAlterarForm(forms.ModelForm):

    class Meta:
        model = Coordenador
        fields = ["apelido", "email"]


class CoordenadorAdmin(UserAdmin):
    add_form = CoordenadorForm
    form = CoordenadorAlterarForm
    add_fieldsets = ((None, { "fields": ("ra", "nome", "email", "apelido")}),)
    fieldsets = ((None, { "fields": ("nome", "email", "apelido")}),)
    list_display = ["ra","nome","email", "apelido"]
    filter_horizontal = []
    ordering = ["ra"]
    list_filter = []

# Register your models here.
admin.site.register(Curso, CursoAdmin)
admin.site.register(Aluno, AlunoAdmin)
admin.site.register(Professor, ProfessorAdmin)
admin.site.register(Coordenador, CoordenadorAdmin)
admin.site.register(Disciplina)
admin.site.register(Turma)
admin.site.register(Gradecurricular)
admin.site.register(Periodo)
admin.site.register(Periododisciplina)