from django import forms
from core.choices import *
from core.models import Contato

class ContatoForm(forms.Form):

    class Meta:
        model = Contato
        fields = "__all__"

    def envia_email(self, contato):
    	print("ENVIADO")
