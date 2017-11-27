from django import forms
from core.models import Disciplina, Contato, Avisos, MensagemAluno, Questao, Resposta, Usuario
from django.contrib.auth.forms import UserCreationForm

class ContatoForm(forms.ModelForm):

    class Meta:
        model = Contato
        fields = ["assunto", "nome", "email", "mensagem"]

    def envia_email(self, contato):
    	print("ENVIADO")

class DisciplinaForm(forms.ModelForm):

    class Meta:
        model = Disciplina
        fields = "__all__"
        
    def save(self):
        nova_disciplina = super(DisciplinaForm, self).save()
        self.envia_email(contato='ok')
        return nova_disciplina
    
    def envia_email(self, contato):
        message = "DISCIPLINA CADASTRADA"
        print("OK - ", message)

class AvisosForm(forms.ModelForm):

    class Meta :
        model = Avisos
        fields = ["titulo", "turma", "texto"]

class MensagemAlunoForm(forms.ModelForm):

    class Meta :
        model = MensagemAluno
        fields = ["assunto", "professor", "mensagem"]

class QuestaoForm(forms.ModelForm):

    class Meta :
        model = Questao
        fields = ["id_turma","numero", "data_limite_entrega", "descricao"]

class RespostaForm(forms.ModelForm):
    
    class Meta :
        model = Resposta
        fields = ["id_questao", "descricao"]

class CadastroForm(UserCreationForm):

    class Meta:
        model = Usuario
        fields = ("nome", "ra", "email")