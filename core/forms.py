from django import forms
from core.models import Disciplina
from core.models import Contato

class ContatoForm(forms.Form):

    class Meta:
        model = Contato
        fields = "__all__"

    def envia_email(self, contato):
    	print("ENVIADO")

class DisciplinaForm(forms.Form):

    class Meta:
        model = Disciplina
        fields = "__all__"

    def envia_email(self, contato):
    	print("ENVIADO")
