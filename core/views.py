from django.shortcuts import render
from django.http import request
from core.forms import ContatoForm
from core.forms import DisciplinaForm
from django.views.generic.edit import FormView
# Create your views here.

def index(request):
    return render(request, "index.html")

def page_lista_cursos(request):
    contexto = {
        "cursos":[
        {"nome":"Segurança Da Informação","link":"/Disciplinas/SegDaInformacao"}, 
        {"nome":"Arquitetura de Software","link":"PADS"}, 
        {"nome":"Jogos Digitais","link":"JD"},
        {"nome":"Redes de Computadores","link":"RC"},
        {"nome":"Sistemas de Informação","link":"SI"}
        ],
        "faculdade":"Faculdade Lorenzinni",
    }
    return render(request, "ListaCursos.html", contexto)

def page_noticias(request):
    return render(request, "noticias.html")

def page_login(request):
    return render(request, "LoginPage.html")

def page_nova_senha(request):
    return render(request, "ForgotPass.html")
    
def page_cadastro_disciplina(request):
	if request.POST:
		form = DisciplinaForm(request.POST)
		if form.is_valid():
			form.save()
	else :
		form = DisciplinaForm()
	context = {
		"form":form
	}
	return render(request,"CadastrarDisciplina.html",context)
	
def page_contato(request) :
    contexto = {
		"form":form
    }
    return render(request, "Contato.html", contexto)

def page_cadastro_usuario(request):
    return render(request, "CadastroPage.html")

def page_detalhes_cursos(request):
    return render(request, "DesCurso.html")

def page_detalhes_segdainf(request):
    return render(request, "SegDaInf.html")

def page_disciplinas_segdainf(request):
    return render(request, "dSegDaInfo.html")

def page_disciplina_seginfoatualidade(request):
    return render(request, "SegInfoAtualidade.html")