<!doctype html>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>

<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Sistema de Cadastro de Usuário para teste da Datainfo">
	<meta name="author" content="Lucas Moreira de Souza">
<title>
Listagem de Usuários
</title>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<link type="text/css" rel="stylesheet" href="/datainfo3/resources/displaytag/displaytag.css" />
</head>

<body class="text-center">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="edit"> Meu Cadastro<span class="sr-only"></span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="list">Lista de Usuários</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/datainfo3/login/formLogin">Sair</a>
      </li>
    </ul>
    </div>
</nav>

<form action="/datainfo3/usuario/edit" method="post" class="form-default">

	<br>
	<h2 class="h3 mb-3 font-weight-normal">Lista de Usuários</h2>
	
	<button class="btn btn-primary btn-sm" onclick="forms[0].action='/datainfo3/usuario/edit'">Novo Usuário</button>
	<br><br>
	<div style="display:flex; justify-content: center; align-items: center; ">
		<div id="div_displaytagTable">
		
			<display:table name="usuarios" requestURI="/datainfo3/usuario/list" sort="page" export="true">
				<display:caption media="pdf">Cadastro de Usuários</display:caption>
								
				<display:column property="nome" title="nome" sortable="true"/>
				<display:column property="email" title="email" sortable="true"/>
				<display:column property="senha" title="senha" sortable="true"/>
				<display:column property="ddd" title="ddd" sortable="true"/>
				<display:column property="numero" title="número" sortable="true"/>
				<display:column property="tipo" title="tipo" sortable="true"/>
				
				<display:column href="read" paramId="usuario.idUsuario" paramProperty="idUsuario" media="html">
					editar
				</display:column>
				
			</display:table>
		
		</div>
	</div>
</form>

</body>

</html>



