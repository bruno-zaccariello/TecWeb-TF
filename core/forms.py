from django import forms
from core.models import Disciplina
from core.models import Contato

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