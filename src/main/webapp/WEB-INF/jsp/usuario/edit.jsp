
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Sistema de Cadastro de Usuários para teste da Datainfo">
	<meta name="author" content="Lucas Moreira de Souza">
	<title>
	Cadastro de Usuários
	</title>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<link type="text/css" rel="stylesheet" href="/datainfo3/resources/css/formstyle.css" />
	<link type="text/css" rel="stylesheet" href="/datainfo3/resources/displaytag/displaytag.css" />
</head>
<body class="text-center">

<form action="/datainfo3/usuario/save" method="post" class="form-default">

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

	<br>
	<h2 class="h3 mb-3 font-weight-normal">Cadastro de Usuários</h2>

	<input type="hidden" name="usuario.idUsuario" value="${ usuario.idUsuario }"/>

	<!-- MENSAGENS DE SUCESSO -->
	<c:if test="${not empty vmessages.success.from('usuario')}">
		<div class="alert alert-success alert-dismissible fade show" data-dismiss="alert">
		<fmt:message key="${ vmessages.success.from('usuario')}"/>
		<button type= "button" class= "close" data-dismiss= "alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		</div>
	</c:if>

	<!-- MENSAGENS DE ERRO -->
	<c:if test="${ not empty errors}">
		<div class="alert alert-danger alert-dismissible fade show" data-dismiss="alert">
			<c:forEach items="${ errors }" var="error">
				<strong><fmt:message key="${ error.category }"/></strong> - ${ error.message }<br>
			</c:forEach>
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
	         	<span aria-hidden="true">&times;</span>
	       	</button>		
		</div>
	</c:if>


	<label for="nome"  class="col-form-label-sm">Nome:</label>
	<input  id="nome"  type="text"  class="form-control form-control-sm"  name="usuario.nome"   value="${ usuario.nome }" />
	<br>
	<label for="email"    class="col-form-label-sm">Email:</label>
	<input  id="email"    type="email" class="form-control form-control-sm"   name="usuario.email"    value="${ usuario.email }"   />
	<br>
	<label for="senha" 	class="col-form-label-sm">Senha:</label>
	<input  id="senha"  	type="password" class="form-control form-control-sm" 	 name="usuario.senha" />
	<br>
	<!-- Confirmação de Senha: <input type="password" name="usuario.confirmacao" /> -->
	<!-- <br> -->
	<label for="numero" class="col-form-label-sm">Telefone (DDD)(XXXXX-XXXX):</label>
	<input  id="numero"	 class="form-control form-control-sm" 	 name="usuario.ddd" value="${ usuario.ddd }" />
	<input  type="tel" 	 class="form-control form-control-sm" 	 name="usuario.numero" value="${ usuario.numero }" />
	<label for="tipo" class="col-form-label-sm">Tipo do Telefone:</label>
	<input  id="tipo"	 class="form-control form-control-sm" 	 name="usuario.tipo" value="${ usuario.tipo }" />
	<br>
	<button class="btn btn-primary btn-sm" type="submit">Gravar</button>
	<button class="btn btn-primary btn-sm" onclick="forms[0].action='/datainfo3/usuario/clear'">Limpar</button>
	<c:if test="${ not empty usuario.idUsuario }">
		<button class="btn btn-primary btn-sm" onclick="forms[0].action='/datainfo3/usuario/delete'">Excluir</button>
	</c:if>
	<button class="btn btn-primary btn-sm" onclick="forms[0].action='/datainfo3/usuario/list'">Voltar</button>
</form>

</body>

</html>