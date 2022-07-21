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
					<h1>¡Bienvenido!</h1>
					<p>Inicia sesión</p>
					<form name="loginForm" class="form"
						action="<c:url value='/auth/login_check?targetUrl=${targetUrl}' />"
						method="POST" role="form">
						<div class="form-group">
							<input type="text" id="username" name="username"
								class="form-control" placeholder="N&uacute;mero de contrato" required autocomplete="off"/>
						</div>
						<div class="form-group">
							<input type="password" id="password" name="password"
								class="form-control" placeholder="Contrase&ntilde;a" required/>
						</div>
						<div class="form-group">
							<input type="checkbox" name="remember_me" /> &nbsp; Recordar cuenta
						</div>
						<button type="submit" class="btn_light_blue">Iniciar sesi&oacute;n</button>
						<button type="button" class="btn_dark_blue_bold" onclick="showRegistro();">Registro</button>
						<button type="button" class="btn_dark_blue" onclick="showRecuperaPwd();">Olvide mi contrase&ntilde;a</button>
					</form>

				</div>
			</div>
		</div>
		
		<div id="divRegistro" style="display:none;">
			<div class="login-container">
				<div class="header_login">
					 <img src="<c:url value='/resources/css/img/Logo_035.png' />" alt="035">
				</div>
				<div class="body_login">
					<h1>Registro</h1>
					<p>Captura la siguiente informaci&oacute;n</p>
					<form id="registroForm" name="registroForm" class="form"
						action="javascript:validaRegisto();" role="form">
						<div class="form-group">
							<label for="email">Email:</label>
							<input type="text" id="email" name="email"
								class="form-control" placeholder="Email"  />
						</div>
						<div class="form-group">
							<label for="confirmEmail">Confirmaci&oacute;n de email:</label>
							<input type="text" id="confirmEmail" name="confirmEmail"
								class="form-control" placeholder="Confirma Email" />
						</div>
						<div class="form-group">
							<label for="centro">Alias del dentro de trabajo:</label>
							<input type="text" id="centroNombre" name="centroNombre"
								class="form-control" placeholder="Alias del centro de trabajo"  />
						</div>
						<div class="form-group">
							<label for="centro">Nombre de contacto del centro de trabajo:</label>
							<input type="text" id="centroContacto" name="centroContacto"
								class="form-control" placeholder="Nombre completo"  />
						</div>
						<div class="form-group">
							<label for="centro">Número de empleados del centro de trabajo:</label>
							<input type="number" id="centroTamanio" name="centroTamanio" class="form-control" placeholder="Número de empleados del centro de trabajo"  min="0" />
						</div>
						<div class="form-group">
							<label for="">Giro</label> 
							<select class="form-control" id="selectGiroCentro">
								<option value="0">Seleccione...</option>
								<c:if test="${not empty lstGiro}">
									<c:forEach items="${lstGiro}" var="giro">
										<c:if test="${not empty centro }">
											<c:if test="${giro.id == centro.idGiro}">
												<option value="${giro.id}" selected="selected">${giro.nombre}</option>
											</c:if>
											<c:if test="${giro.id != centro.idGiro}">
												<option value="${giro.id}">${giro.nombre}</option>
											</c:if>
										</c:if>
										<c:if test="${empty centro}">
												<option value="${giro.id}">${giro.nombre}</option>
										</c:if>
									</c:forEach>
								</c:if>
	
							</select>
						</div>
						<div class="form-group">
							<label for="">Estado</label> 
							<select required class="form-control" id="selectEstadoCentro" >
								<option value="0">Seleccione...</option>
								<c:if test="${not empty lstEstados}">
									<c:forEach items="${lstEstados}" var="estado">
										<c:if test="${not empty centro }">
											<c:if test="${estado.id == centro.idEstadoRepublica}">
												<option value="${estado.id}" selected="selected">${estado.nombre}</option>
											</c:if>
											<c:if test="${estado.id != centro.idEstadoRepublica}">
												<option value="${estado.id}">${estado.nombre}</option>
											</c:if>
										</c:if>
										<c:if test="${empty centro}">
												<option value="${estado.id}">${estado.nombre}</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select>
						</div>
						
						
						<p style="text-align:left; display:none;">LA CONTRASE&Ntilde;A DEBE TENER COMO M&Iacute;NIMO OCHO CARACTERES CON UNA COMBINACI&Oacute;N DE N&Uacute;MEROS, LETRAS (MAY&Uacute;SCULAS Y MIN&Uacute;SCULAS) Y ALGUNO DE LOS SIGUIENTES S&Iacute;MBOLOS V&Aacute;LIDOS: @$!%*?&</p>
						<br>
						
						<p id="pObligatorios" style="color:#B51101; text-align:left;"><span class="bold">Todos los datos son obligatorios.</span></p>
						<p id="pEmailFormato" style="color:#B51101; text-align:left;"><span class="bold">El formato del email no es valido</span></p>
						<p id="pEmailNoCoincide" style="color:#B51101; text-align:left;"><span class="bold">El email y la confirmaci&oacute;n del email no coiniden.</span></p>
						<p id="pContrasenaFormato" style="color:#B51101; text-align:left;"><span class="bold">La contrase&ntilde;a no cumple con el formato.</span></p>
						<p id="pPwdNoCoincide" style="color:#B51101; text-align:left;"><span class="bold">La contrase&ntilde;a y la confirmaci&oacute;n de la contrase&ntilde;a no coiniden.</span></p>
						<p id="pEmailRepetido" style="color:#B51101; text-align:left;"><span class="bold">El email ya se encuentra registado.</span></p>
						
						<button id="btnRegistro" type="submit" class="btn_light_blue">Registro</button>
						<button type="button" class="btn_dark_blue" onclick="showLogin();">Cancelar</button>
					</form>

				</div>
			</div>
		</div>
		
		<div id="divRecuperaPwd" style="display:none;">
			<div class="login-container">
				<div class="header_login">
					 <img src="<c:url value='/resources/css/img/Logo_035.png' />" alt="035">
				</div>
				<div class="body_login">
					<h1>Olvide mi contrase&ntilde;a</h1>
					<p>Captura tu contrato o email</p>
					<div class="form-group">
						<input type="text" id="emailRecover" name="emailRecover"
							class="form-control" placeholder="" required/>
					</div>
					
					<p>
						<button type="button" class="btn_dark_blue" onclick="showLogin();">Cancelar</button>
					</p>
					
				</div>
			</div>
		</div>
		
		<div id="divRegistrado" style="display:none;">
			<div class="login-container">
				<div class="header_login">
					 <img src="<c:url value='/resources/css/img/Logo_035.png' />" alt="035">
				</div>
				<div class="body_login">
					<h1>Te hemos enviado un correo para confirmar tu cuenta</h1>
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

	<div class="modal fade" id="modalCoincidencias" tabindex="-1" role="dialog"
		aria-labelledby="modalCoincidencias" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content bg-glass-sknd box box-danger">
				<div class="modal-header bg-glass-sknd ">
					<h3 class="box-title">Email registrado previamente</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<h4>Se encontraron los siguientes contratos con el email proporcionado:</h4>
					<p id="pCoincidencias"></p>
					<h4>¿Desea registrar un nuevo centro?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn" onclick="creaContrato();">Continuar</button>
				</div>	
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalCredo" tabindex="-1" role="dialog"
		aria-labelledby="modalCredo" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content bg-glass-sknd box box-danger">
				<div class="modal-header bg-glass-sknd ">
					<h3 class="box-title">Contrato creado</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<h4>Hemos enviado un correo electronico a la cuenta registrada para continuar con el proceso.</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" onclick="goInfoHome();">Continuar</button>
				</div>	
			</div>
		</div>
	</div>

	<!-- jQuery 2.0.2 -->
   
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
		<!-- Bootstrap -->
		<script src="<c:url value='/resources/js/bootstrap.min.js' />" type="text/javascript"></script>

       <script src="<c:url value='/resources/js/admin/prueba.js' />" type="text/javascript"></script> 
    </body>
<div id="wait" class="loading-img" style="display: none;"></div>
</html>