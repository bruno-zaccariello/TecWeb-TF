"""impacta URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from core.views import index
from core.views import page_lista_cursos
from core.views import page_noticias
from core.views import page_login
from core.views import page_nova_senha
from core.views import page_cadastro_disciplina
from core.views import page_contato
from core.views import page_cadastro_usuario
from core.views import page_detalhes_cursos
from core.views import page_detalhes_segdainf

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', index),
    url(r'^home/', index),
    url(r'^Lista_Cursos/', page_lista_cursos),
    url(r'^Noticias/', page_noticias),
    url(r'^Login/', page_login),
    url(r'^Nova_Senha/', page_nova_senha),
    url(r'^Disciplinas/Nova_Disciplina', page_cadastro_disciplina),
    url(r'^Contato/', page_contato),
    url(r'^Cadastre-se/', page_cadastro_usuario),
    url(r'^Detalhes/Cursos/$', page_detalhes_cursos),
    url(r'^Detalhes/Cursos/SegDaInformacao/', page_detalhes_segdainf)
]
