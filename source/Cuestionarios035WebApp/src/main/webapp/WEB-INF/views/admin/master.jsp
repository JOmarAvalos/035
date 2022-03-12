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
<title>Mega Dealer || Dashboard</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- bootstrap 3.0.2 -->
<link href="<c:url value='/resources/css/bootstrap.min.css' />"
	rel="stylesheet" type="text/css" />
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
<!-- fullCalendar -->
<link
	href="<c:url value='/resources/css/fullcalendar/fullcalendar.css' />"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link
	<%-- href="<c:url value='/resources/css/daterangepicker/daterangepicker-bs3.css' />" --%>
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
<script>
	var ctx = "${pageContext.request.contextPath}"
</script>

<!-- jQuery 2.0.2 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- jQuery UI 1.10.3 -->
<script src="<c:url value='/resources/js/jquery-ui-1.10.3.min.js' />"
	type="text/javascript"></script>
<!-- Bootstrap -->
<script src="<c:url value='/resources/js/bootstrap.min.js' />"
	type="text/javascript"></script>
<!-- Morris.js charts -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script  
	src="<c:url value='/resources/js/plugins/morris/morris.min.js' />"
	type="text/javascript"></script>
<!-- Sparkline -->
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
<!-- fullCalendar -->
<script
	src="<c:url value='/resources/js/plugins/fullcalendar/fullcalendar.min.js' />"
	type="text/javascript"></script>
<!-- jQuery Knob Chart -->
<script
	src="<c:url value='/resources/js/plugins/jqueryKnob/jquery.knob.js' />"
	type="text/javascript"></script>
<!-- daterangepicker -->
<script
	src="<c:url value='/resources/js/plugins/daterangepicker/moment-with-locales.min.js'/>"
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

<script
	src="<c:url value='/resources/js/plugins/datatables/jquery.dataTables.js' />"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/js/plugins/datatables/dataTables.bootstrap.js' />"
	type="text/javascript"></script>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<c:url value='/resources/js/AdminLTE/dashboard.js' />"
	type="text/javascript"></script>
<script src="<c:url value='/resources/js/util/util.js' />"
	type="text/javascript"></script>

</head>
<!-- Fin head -->

<!-- Inicio body -->
<body class="skin-blue">
	<tiles:insertAttribute name="header" />
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<tiles:insertAttribute name="menu" />
		<tiles:insertAttribute name="body" />
	</div>
	<tiles:insertAttribute name="footer" />

	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm"
		class="logout_form">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	
</body>
<!-- Fin body -->
<script>
	<c:if test="${not empty colorPrimario}">
	setTimeout(function() {
		$("#navHeader").css('background-color', '${colorPrimario}');
	}, 3000);
	</c:if>
	<c:if test="${not empty colorSecundario}">
	setTimeout(function() {
		$("#divCentralContent").css('background-color', '${colorSecundario}');
	}, 3000);
	</c:if>
</script>

<div class="modal fade full-modal" id="modalCursosModulo" tabindex="-1"
	role="dialog" aria-labelledby="modalCursosModulo" aria-hidden="true"
	data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-dialog-centered modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title">Ejemplo cursos</h1>
			</div>
			<div class="modal-body text-white">
				<p onclick="alert('Se abre el curso/opciones');">curso 1</p>
				<p>curso 2</p>
				<p>curso 3</p>
				<p>curso 4</p>
			</div>
			<div class="modal-footer">
				<button data-dismiss="modal" class="btn btn-primary btn-sm">Cerrar</button>
			</div>
		</div>
	</div>
</div>

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

</html>

