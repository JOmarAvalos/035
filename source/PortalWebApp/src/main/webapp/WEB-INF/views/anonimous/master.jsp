<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.teknei.com/jsp/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="es">

<!-- Inicio head -->
<head>
<meta charset="UTF-8">
<title>Master</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- bootstrap 3.0.2 -->
<link href="<c:url value='/resources/css/bootstrap.min.css' />"
	rel="stylesheet" type="text/css" />
<!-- font Awesome 4.0.3-->
<%-- <link href="<c:url value='/resources/css/font-awesome.min.css' />" rel="stylesheet" type="text/css" /> --%>
<!-- font Awesome 4.7-->
<link href="<c:url value='/resources/css/font-awesome.css' />" rel="stylesheet" type="text/css" /> 
<!-- Ionicons -->
<link href="<c:url value='/resources/css/ionicons.min.css' />"
	rel="stylesheet" type="text/css" />
<!-- Morris chart -->
<link href="<c:url value='/resources/css/morris/morris.css' />"
	rel="stylesheet" type="text/css" />
<!-- jvectormap -->
<link
	href="<c:url value='/resources/css/jvectormap/jquery-jvectormap-1.2.2.css' />"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link
	href="<c:url value='/resources/css/daterangepicker/daterangepicker.css' />"
	rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link
	href="<c:url value='/resources/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css' />"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="<c:url value='/resources/css/AdminLTE.css' />"
	rel="stylesheet" type="text/css" />
<!-- Toastr -->	
<link href="<c:url value='/resources/css/toastr.min.css' />"
	rel="stylesheet" type="text/css" />
<!-- Bootstrap Color Picker -->
<link href="<c:url value='/resources/css/colorpicker/bootstrap-colorpicker.css' />" rel="stylesheet" type="text/css"/>
<!-- Parsley custom -->
<link href="<c:url value='/resources/css/parsley-custom.css' />" rel="stylesheet" type="text/css" />

<script>
	var ctx = "${pageContext.request.contextPath}"
</script>
<!-- jQuery 2.0.2 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- jQuery UI 1.10.3 -->
<script src="<c:url value='/resources/js/jquery-ui-1.10.3.min.js' />"
	type="text/javascript"></script>
<!-- Bootstrap -->
<script src="<c:url value='/resources/js/bootstrap.min.js' />"
	type="text/javascript"></script>
<!-- Morris.js charts -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<!-- parsleyjs -->
<script
	src="https://parsleyjs.org/dist/parsley.js"></script>	
<script
	src="<c:url value='/resources/js/plugins/morris/morris.min.js' />"
	type="text/javascript"></script>
<!-- Sparklinehttps://parsleyjs.org/dist/parsley.js -->
<script
	src="<c:url value='/resources/js/plugins/sparkline/jquery.sparkline.min.js' />"
	type="text/javascript"></script>
<!-- jvectormap -->
<script
	src="<c:url value='/resources/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js' />"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js' />"
	type="text/javascript"></script>
<!-- jQuery Knob Chart -->
<script
	src="<c:url value='/resources/js/plugins/jqueryKnob/jquery.knob.js' />"
	type="text/javascript"></script>
<!-- daterangepicker -->
<script
	src="<c:url value='/resources/js/plugins/daterangepicker/moment-with-locales.min.js' />"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/js/plugins/daterangepicker/daterangepicker.js' />"
	type="text/javascript"></script>
<!-- Bootstrap WYSIHTML5 -->
<script
	src="<c:url value='/resources/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js' />"
	type="text/javascript"></script>
<!-- iCheck -->
<script
	src="<c:url value='/resources/js/plugins/iCheck/icheck.min.js' />"
	type="text/javascript"></script>

<!-- AdminLTE App -->
<script src="<c:url value='/resources/js/AdminLTE/app.js' />"
	type="text/javascript"></script>

<!-- DATA TABES SCRIPT -->
<script
	src="<c:url value='/resources/js/plugins/datatables/jquery.dataTables.js' />"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/js/plugins/datatables/dataTables.bootstrap.js' />"
	type="text/javascript"></script>
	
<!-- bootstrap color picker -->
<script src="<c:url value='/resources/js/plugins/colorpicker/bootstrap-colorpicker.js' />" type="text/javascript"></script>


<!-- AdminLTE dashboard demo (This is only for demo purposes)
	<script src="<c:url value='/resources/js/AdminLTE/dashboard.js' />" type="text/javascript"></script> -->
<script src="<c:url value='/resources/js/util/util.js' />"
	type="text/javascript"></script>
	<!-- InputMask -->
	<script src="<c:url value='/resources/js/plugins/input-mask/jquery.inputmask.js' />" type="text/javascript"></script>
	<script src="<c:url value='/resources/js/plugins/input-mask/jquery.inputmask.date.extensions.js' />" type="text/javascript"></script>
	<script src="<c:url value='/resources/js/plugins/input-mask/jquery.inputmask.extensions.js' />" type="text/javascript"></script>
	
	
<!-- AdminLTE App -->
<script src="<c:url value='/resources/js/toastr.min.js' />"
	type="text/javascript"></script>	

</head>
<!-- Fin head -->

<!-- Inicio body -->
<body class="skin-blue">
	<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />

</body>
<!-- Fin body -->
<!-- Modal Success -->
<div class="modal fade" id="modalSuccess" tabindex="-1" role="dialog"
	aria-labelledby="modalNewExamen" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd box box-success">
			<div class="modal-header bg-glass-sknd ">
				<h3 class="box-title" id="iptCursoTitulo">Success</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
			</div>			
		</div>
	</div>
</div>
<!-- Modal Error -->
<div class="modal fade" id="modalError" tabindex="-1" role="dialog"
	aria-labelledby="modalNewExamen" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd box box-danger">
			<div class="modal-header bg-glass-sknd ">
				<h3 class="box-title" id="iptCursoTitulo">Error</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
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
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Aceptar</button>
			</div>	
		</div>
	</div>
</div>

<div class="modal fade" id="modalErrGenerico" tabindex="-1" role="dialog"
	aria-labelledby="modalErrGenerico" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd box box-danger">
			<div class="modal-header bg-glass-sknd ">
				<h3 class="box-title" id="iptCursoTitulo">Error</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h4>Ocurrio un error inesperado, intentelo mas tarde o contacte al administrador.</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Aceptar</button>
			</div>	
		</div>
	</div>
</div>

<!-- Modal Login -->
<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog"
	aria-labelledby="modalLogin" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd box box-success" style="background-color:#c7c7c7;">
			<div class="modal-header bg-glass-sknd " style="border-bottom:0px !important">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: black;">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			
				<div class="login-container" style="background-color:#c7c7c7;">
					<div class="body_login">
						<h1>¡Bienvenido!</h1>
						
						<form name="loginForm" class="form"
							action="<c:url value='/auth/login_check?targetUrl=${targetUrl}' />"
							method="POST" role="form">
							<div class="form-group">
								<input type="text" id="username" name="username"
									class="form-control" placeholder="Usario" required/>
							</div>
							<div class="form-group">
								<input type="password" id="password" name="password"
									class="form-control" placeholder="Contrase&ntilde;a" required/>
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember_me" /> &nbsp; Recordar cuenta
							</div>
								<button type="submit" class="btn">Iniciar sesión</button>
						</form>
						<p><a href="#" onclick="alert('ndejo');">Olvide mi contraseña</a></p>
						<p><a href="#" onclick="alert('arre');">Registro</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal Registro -->
<div class="modal fade" id="modalRegistro" tabindex="-1" role="dialog"
	aria-labelledby="modalRegistro" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd box box-success" style="background-color:#c7c7c7;">
			<div class="modal-header bg-glass-sknd " style="border-bottom:0px !important">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: black;">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			
				<div class="login-container" style="background-color:#c7c7c7;">
					<div class="body_login">
						<h1>¡Bienvenido!</h1>
						
						<form name="loginForm" class="form"
							action="<c:url value='/auth/login_check?targetUrl=${targetUrl}' />"
							method="POST" role="form">
							<div class="form-group">
								<input type="text" id="username" name="username"
									class="form-control" placeholder="Usario" required/>
							</div>
							<div class="form-group">
								<input type="password" id="password" name="password"
									class="form-control" placeholder="Contrase&ntilde;a" required/>
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember_me" /> &nbsp; Recordar cuenta
							</div>
								<button type="submit" class="btn">Iniciar sesión</button>
						</form>
						<p><a href="#" onclick="alert('ndejo');">Olvide mi contraseña</a></p>
						<p><a href="#" onclick="alert('arre');">Registro</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="wait" class="loading-img" style="display: none;"></div>
</html>

