<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>AdminLTE | Log in</title>

        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	    <!-- bootstrap 3.0.2 -->
	    <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet" type="text/css" />
	    <!-- font Awesome -->
	    <link href="<c:url value='/resources/css/font-awesome.min.css' />" rel="stylesheet" type="text/css" />
	    <!-- Theme style -->
	    <link href="<c:url value='/resources/css/AdminLTE.css' />" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
            <script>
      var ctx = "${pageContext.request.contextPath}"
    </script>
    
    <script src="<c:url value='/resources/js/035/login.js' />" type="text/javascript"></script>
    </head>
    <body class="bg-black">

	<div class="form-box" id="login-box">

		<div id="divLogin">
			<div class="login-container">
				<div class="header_login">
					 <img src="<c:url value='/resources/css/img/logo_disolit.png' />" alt="DISOLIT">
				</div>
				<div class="body_login">
					<h1>¡Bienvenido!</h1>
					<p>Inicia sesión</p>
					<form name="loginForm" class="form"
						action="<c:url value='/auth/login_check?targetUrl=${targetUrl}' />"
						method="POST" role="form">
						<div class="form-group">
							<input type="text" id="username" name="username"
								class="form-control" placeholder="User ID" required/>
						</div>
						<div class="form-group">
							<input type="password" id="password" name="password"
								class="form-control" placeholder="Password" required/>
						</div>
						<div class="form-group">
							<input type="checkbox" name="remember_me" /> &nbsp; Recordar cuenta
						</div>
							<button type="submit" class="btn">Iniciar sesión</button>
					</form>
					
					<p><a href="#" onclick="showRecuperaPwd();">Olvide mi contraseña</a></p>
					<p><a href="#" onclick="showRegistro();">Registro</a></p>
					
				</div>
			</div>
		</div>
		
		<div id="divRegistro" style="display:none;">
			<div class="login-container">
				<div class="header_login">
					 <img src="<c:url value='/resources/css/img/logo_disolit.png' />" alt="DISOLIT">
				</div>
				<div class="body_login">
					<h1>Registro</h1>
					<p>Captura la siguiente informaci&oacute;n</p>
					<div class="form-group">
						<input type="text" id="email" name="email"
							class="form-control" placeholder="Email" required/>
					</div>
					<div class="form-group">
						<input type="text" id="confirmEmail" name="confirmEmail"
							class="form-control" placeholder="Confirma Email" required/>
					</div>
					<div class="form-group">
						<input type="password" id="passwordRegistro" name="passwordRegistro"
							class="form-control" placeholder="Contrasentilde;a" required/>
					</div>
					<div class="form-group">
						<input type="password" id="confirmPasswordRegistro" name="confirmPasswordRegistro"
							class="form-control" placeholder="Confirma contrase&ntilde;a" required/>
					</div>
					
					<p><a href="#" onclick="showLogin();">Ya tengo cuenta</a></p>
					
				</div>
			</div>
		</div>
		
		<div id="divRecuperaPwd" style="display:none;">
			<div class="login-container">
				<div class="header_login">
					 <img src="<c:url value='/resources/css/img/logo_disolit.png' />" alt="DISOLIT">
				</div>
				<div class="body_login">
					<h1>Olvide mi contrase&ntilde;a</h1>
					<p>Captura tu usuario o email</p>
					<div class="form-group">
						<input type="text" id="confirmEmail" name="confirmEmail"
							class="form-control" placeholder="" required/>
					</div>
					
					<p><a href="#" onclick="showLogin();">Cancelar</a></p>
					
				</div>
			</div>
		</div>

	</div>



	<!-- jQuery 2.0.2 -->
   
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<!-- Bootstrap -->
		<script src="<c:url value='/resources/js/bootstrap.min.js' />" type="text/javascript"></script>

       <script src="<c:url value='/resources/js/admin/prueba.js' />" type="text/javascript"></script> 
    </body>
</html>