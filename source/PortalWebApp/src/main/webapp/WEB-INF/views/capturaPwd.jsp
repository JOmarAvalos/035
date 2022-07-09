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
        <title>035 | Log in</title>

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
		<script src="<c:url value='/resources/js/util/util.js' />" type="text/javascript"></script>
    </head>
    <body class="bg-black">

	<div class="form-box" id="login-box">

		<div id="divLogin">
			<div class="login-container">
				<div class="header_login">
					 <img src="<c:url value='/resources/css/img/Logo_035.png' />" alt="035">
				</div>
				<div class="body_login">
					<h1>¡Gracias por confirmar tu cuenta!</h1>
					<p>Captura tu nueva contrase&ntilde;a para poder concluir el proceso de registro.</p>
					<form id="pwdForm" name="pwdForm" class="form"
						action="<c:url value='/registro/confirmaContrasena' />"
						method="POST" role="form">
						
						<input type="hidden" value="${usr}" id="iptHidenUsr" name="iptHidenUsr">
						<input type="hidden" value="${pwd}" id="iptHidenPwd" name="iptHidenPwd">
						<div class="form-group">
							<input type="password" id="password" name="password"
								class="form-control" placeholder="Contrase&ntilde;a" required autocomplete="off"/>
						</div>
						<div class="form-group">
							<input type="password" id="passwordConf" name="passwordConf"
								class="form-control" placeholder="Confirma contrase&ntilde;a" required autocomplete="off"/>
						</div>
						<button type="button" class="btn_light_blue" onclick="validaPwd();">Guardar contrase&ntilde;a</button>
					</form>
					
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="modal fade" id="modalDatosObligatorios" tabindex="-1" role="dialog"
		aria-labelledby="modalDatosObligatorios" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content bg-glass-sknd box box-danger">
				<div class="modal-header bg-glass-sknd ">
					<h3 class="box-title" id="iptCursoTitulo">Datos obligatorios</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<h4>Los campos marcados en rojo son obligatorios o no cumplen con el formato requerido.</h4>
					<h4 id="h4ErrContrasena">Las contrase&ntilde;as no coinciden.</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-dismiss="modal">Aceptar</button>
				</div>	
			</div>
		</div>
	</div>


	<!-- jQuery 2.0.2 -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<!-- Bootstrap -->
	<script src="<c:url value='/resources/js/bootstrap.min.js' />" type="text/javascript"></script>
    <script src="<c:url value='/resources/js/admin/prueba.js' />" type="text/javascript"></script> 
    
    </body>
	<div id="wait" class="loading-img" style="display: none;"></div>
</html>