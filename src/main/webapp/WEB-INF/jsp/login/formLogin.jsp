
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Sistema de Cadastro de Usuário para teste da Datainfo">
    <meta name="author" content="Lucas Moreira de Souza">

    <title>Tela de Login</title>

    <!-- Principal CSS do Bootstrap -->
    <link href="/datainfo3/resources/bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Estilos customizados para esse template -->
    <link href="/datainfo3/resources/css/formlogin.css" rel="stylesheet">
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
  </head>

  <body class="text-center">
    <form action="/datainfo3/login/check" method="post" class="form-signin">
      <h1 class="h3 mb-3 font-weight-normal">Faça login</h1>
      
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
      
      <label for="login" class="sr-only">Endereço de email:</label>
      <input type="email" id="login" class="form-control" placeholder="Seu email" required autofocus>
      <label for="senha" class="sr-only">Senha:</label>
      <input type="password" id="senha" class="form-control" placeholder="Senha" required name="senha">
      <div class="checkbox mb-3">
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      <p class="mt-5 mb-3 text-muted">&copy; LMS</p>
    </form>
  </body>
</html>