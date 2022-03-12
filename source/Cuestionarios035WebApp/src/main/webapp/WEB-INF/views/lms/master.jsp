<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.teknei.com/jsp/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="es">

<!-- Inicio head -->
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <meta name="description" content="Admin Remoto">
        <meta name="author" content="Teknei">
        <link rel="icon" href="<c:url value='/resources/css/img/favicon${empresa}.png' />">

        <title>LMS</title>

       <!-- Bootstrap  CSS -->
        <link rel="stylesheet" href="<c:url value='/resources/libs/bootstrap4/bootstrap.min.css' />" media="all">
        <!-- Animate -->
        <link rel="stylesheet" href="<c:url value='/resources/libs/animate/animate.min.css'/>">
        <!-- Bootstrap selects -->
        <link rel="stylesheet" href="<c:url value='/resources/libs/boot-select/bootstrap-select.min.css' />">
        <!-- FONTAWESOME -->
        <link rel="stylesheet" href="<c:url value='/resources/css/assets/all.css' />" media="all">

        <style type="text/css">
        	:root {
			    
   			    --color-main :${colorPrimario};
			    --color-secondary:${colorSecundario};
			    --color-secondarylt:${colorContraste};  
			    --color-text:${colorTexto};
			    
			    /*TOYOTA colores en OOOORDEN*/

 			/*
 				 --color-main :#969595;
    			 --color-secondary:#37474f;
    			 --color-secondarylt:#CC0033;  
    			 --color-text:#42525a;
 			
 			*/
  
			    
			
			    --color-green:#05AF16;
			    --color-orange:#EB9829;
			    --color-red:#EE4D4D;
			
			    --color-gray:#A1B0B8;
			    --color-graylt:#9CBECB;
			
			    --color-graysc:#DAE3E8;
			    --color-graytrd:#999999;
			
			    --flight:"montserratlight", sans-serif;
			    --fregular:"montserratregular", sans-serif;
			    --fbold:"montserratbold", sans-serif;
			    --fblack:"montserratblack", sans-serif;
			}
			.login-wraper{
    			background-image:url('../img/bg-login-auto.jpg');
    		}
    		
    		 /* ------ TOYOTA ------ */
    		/* ====== DEGRADADO CURSOS DE PLANES DE CARRERA ====== */
    		/* ====== Sólo hay que cambiar los dos colores hexadecimales el primero es MD el segundo es Toyota ====== */
    		.curso-card{
     			background: transparent linear-gradient(90deg, #004F6E 30%, #002837 100%) 0% 0% no-repeat padding-box;
     			background: transparent linear-gradient(90deg, #959594 30%, #3A3C3D 100%) 0% 0% no-repeat padding-box;
     		}
        </style>

        <link rel="stylesheet" href="<c:url value='/resources/css/assets/style.css' />"media="all">
        <link rel="stylesheet" href="<c:url value='/resources/css/assets/aplicador.css' />"media="all">
        <link rel="stylesheet" href="<c:url value='/resources/css/assets/admin.css' />"media="all">

		  <script>
			var ctx = "${pageContext.request.contextPath}"
		</script>
 		<!-- ***JQUERY*** -->
		<script src="<c:url value='/resources/libs/jquery/jquery-3.5.1.min.js' />"></script>
		<!-- ***POPPER*** -->
		<script src="<c:url value='/resources/libs/bootstrap4/popper.min.js' />"></script>
		<!-- ***BOOTSTRAP 4*** -->
		<script src="<c:url value='/resources/libs/bootstrap4/bootstrap.min.js' />"></script>
		
		<!-- BOOTSTRAP SELECTS with search  libreria en: https://developer.snapappointments.com/bootstrap-select/-->
		<script src="<c:url value='/resources/libs/boot-select/bootstrap-select.min.js' />"></script>
		<!-- Bootstrap selects lang with search-->
		<script src="<c:url value='/resources/libs/boot-select/i18n/defaults-es_ES.min.js' />"></script>
		
		<!-- Scorm Viewer -->
		<script src="<c:url value='/resources/js/tsp.js' />"></script>
		<script>
			<c:if test="${not empty locale}">
		    	<c:if test="${fn:contains(locale, 'en')}">
		    		<c:if test="${!fn:contains(empresa, 'AA')}">
		    			window.location = ctx+"/?locale=es"
		    		</c:if>
		    	</c:if>
		    	<c:if test="${fn:contains(locale, 'fr')}">
		    		<c:if test="${!fn:contains(empresa, 'AA')}">
		    			window.location = ctx+"/?locale=es"
		    		</c:if>
		    	</c:if>
		    </c:if>
		</script>
		
	</head>
<!-- Fin head -->

<!-- Inicio body -->
	<body class="sidebar-is-reduced sidebar-is-expanded">
	
		  <div class="sidebar-is-reduced">
	  		<tiles:insertAttribute name="header" />
	  		<tiles:insertAttribute name="menu" />
		  </div>
		  	
		  <tiles:insertAttribute name="body" />
		  
		
	</body>
	
	<!-- Scripts para cambio de colores primearios -->
	<!--
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
-->
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

<div class="modal fade" id=modalErrGenerico tabindex="-1"
	role="dialog" aria-labelledby="modalErrGenerico" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
			</div>
	        <div class="modal-body">
	            <div class="row my-4">
	
	                <div class="col">
	                	<p>Ocurrio un error inesperado, intentelo mas tarde o contacte al administrador.</p>
	                </div>
	            </div>
	            <hr>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal">Cerrar</button>
            </div>

        </div>
    </div>
</div>
<c:url value="/j_spring_security_logout" var="logoutUrl" />
<form action="${logoutUrl}" method="post" id="logoutForm"
	class="logout_form">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>

<div id="wait" class="loading-img" style="display: none;"></div>
		 <script>
			var global = {menuClass: ".c-menu" };
			$(global.menuClass + " .is-active").removeClass("is-active");
			<c:if test="${not empty menuActive}">
				setMenuActive('${menuActive}');
			</c:if>
		
		</script>
		
		<script src="<c:url value='/resources/js/main.js' />"></script>
		<script src="<c:url value='/resources/js/table.js' />"></script>
		<script src="<c:url value='/resources/js/util/util.js' />"></script>

</html>

