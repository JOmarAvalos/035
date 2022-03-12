<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.teknei.com/jsp/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Admin Remoto">
        <meta name="author" content="Megadealer">
        <link rel="icon" href="<c:url value='/resources/css/img/favicon.png' />">

        <title>Confirmaci&oacute;n de cuenta</title>

        <!-- Bootstrap core CSS -->
       <!-- Bootstrap  CSS -->
        <link rel="stylesheet" href="<c:url value='/resources/libs/bootstrap4/bootstrap.min.css' />" media="all">
        <link rel="stylesheet" href="<c:url value='/resources/css/assets/style.css' />"media="all">
        
        <!-- FONTAWESOME -->
		<link rel="stylesheet" href="<c:url value='/resources/css/assets/all.css' />" media="all">
		<script>
			var ctx = "${pageContext.request.contextPath}"
		</script>
		
		<style>
		
			:root {
				<c:if test="${not empty empresa}">
	   			    --color-main :${colorPrimario};
				    --color-secondary:${colorSecundario};
				    --color-secondarylt:${colorContraste};  
				    --color-text:${colorTexto};
				</c:if>
				
			    
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
    			<c:if test="${not empty empresa}">
			    <c:if test="${fn:contains(empresa, 'TOY')}">
			        background-image: url('<c:url value='/resources/css/img/login-bg-toyota.jpg' />');
			    </c:if>
			    <c:if test="${fn:contains(empresa, 'MIT')}">
			        background-image: url('<c:url value='/resources/css/img/login-bg-mitsubishi.jpg' />');
			    </c:if>
			  </c:if>
			  <c:if test="${empty empresa}">
			    background-image: url('<c:url value='/resources/css/img/bg-login-auto.jpg' />');
			  </c:if>
    		}
		</style>
		
    </head>

    <body>
    
    <div class="mailConfirm">
            <div class="container mc-container">
                <div class="row align-items-center h-100">
                    <div class="col">
                        <!-- <img class="logoMail" src="assets/img/Toyota/toyota-logo-color.png" alt=""> -->
                        <c:if test="${not empty empresa}">
	                       <img class="logoMail" src="<c:url value='/resources/css/img/logo-${empresa}-login.svg' />" alt="${empresa}">
	                	</c:if>
	                	<c:if test="${empty empresa}">
		                    <img class="logoMail" src="<c:url value='/resources/css/img/Logo-MD.svg' />" alt="Megadealer">
	                	</c:if>

						<c:if test="${ empty error}">
	                        <h3>¡Bienvenido al centro de capacitación!</h3>
	                         <img class="mailIcon" src="<c:url value='/resources/css/img/mail-confirm.svg' />" alt="mail">
	                        <h1>Gracias por confirmar tu correo electrónico</h1>
	                       
	                        <p class="bold mb-2"></p>
	                        <p>
	                            Tu cuenta ha sido activada exitósamente, <br> ahora puedes ingresar con tu usuario y contraseña 
	                        </p>
	                       <!--  <a href="#" class="md-btn md-btn-main btn-small">Iniciar sesión <i class="fas fa-arrow-right ml-2"></i></a> -->
	                         <button type="button" class="md-btn md-btn-secondary btn-small" onclick="window.location = ctx+'/?param=${empresa}';">Entrar <i class="fas fa-arrow-right ml-2"></i></button>
                         </c:if>
                    
                    
                    <!-- ERROR -->
                    <c:if test="${not empty error}">
	            	<div class="">
	            		<c:if test="${not empty empresa}">
	                       <img src="<c:url value='/resources/css/img/logo-${empresa}-login.svg' />" alt="${empresa}">
	                	</c:if>
	                </div>
	                <div class="">
	                    <h1>¡Error!</h1>
	                    <c:if test="${not empty mensaje}">
		                    <p>${mensaje}</p>
	                    </c:if>
	                    
	                    
	                    <p>Para continuar ingresa con tu usuario y contraseña.</p>
	                    <p>El usuario y contraseña ser&aacute; proporcionado por el administrador de tu distribuidor</p>
	                    
	                    <c:if test="${not empty empresa}">
		                    <button type="button" class="md-btn md-btn-secondary btn-small" onclick="window.location = ctx+'/?param=${empresa}';">Entrar</button>
	                    </c:if>
	                    <c:if test="${empty empresa}">
		                    <button type="button" class="md-btn md-btn-secondary btn-small" onclick="window.location = ctx+'/';">Entrar</button>
	                    </c:if>
	
	                </div>
            	</c:if>
                    </div>
                </div>
            </div>
        </div>
        
        
        <%-- <div class="login-wraper">
            <div class="login-container">
            
            	<c:if test="${empty error}">
	            	<div class="header_login">
	                	
	                </div>
	                <div class="body_login">
	                    <h1>¡Bienvenido al centro de capacitaci&oacute;n!</h1>
	                    <p>Gracias por confirmar tus datos, para poder continuar ingresa con tu usuario y contraseña.</p>
	                    
	                    <button type="button" class="md-btn md-btn-main mt-4" onclick="window.location = ctx+'/?param=${empresa}';">Entrar</button>
	
	                </div>
            	</c:if>
            	
            	<c:if test="${not empty error}">
	            	<div class="header_login">
	            		<c:if test="${not empty empresa}">
	                       <img src="<c:url value='/resources/css/img/logo-${empresa}-login.svg' />" alt="${empresa}">
	                	</c:if>
	                </div>
	                <div class="body_login">
	                    <h1>¡Error!</h1>
	                    <p>Para continuar ingresa con tu usuario y contraseña.</p>
	                    
	                    <c:if test="${not empty empresa}">
		                    <button type="button" class="md-btn md-btn-main mt-4" onclick="window.location = ctx+'/?param=${empresa}';">Entrar</button>
	                    </c:if>
	                    <c:if test="${empty empresa}">
		                    <button type="button" class="md-btn md-btn-main mt-4" onclick="window.location = ctx+'/';">Entrar</button>
	                    </c:if>
	
	                </div>
            	</c:if>
            </div>
        </div> --%>

 		<!-- ***JQUERY*** -->
		<script src="<c:url value='/resources/libs/jquery/jquery-3.5.1.min.js' />"></script>
		<!-- ***POPPER*** -->
		<script src="<c:url value='/resources/libs/bootstrap4/popper.min.js' />"></script>
		<!-- ***BOOTSTRAP 4*** -->
		<script src="<c:url value='/resources/libs/bootstrap4/bootstrap.min.js' />"></script>


        <script src="<c:url value='/resources/js/main.js' />"></script>


    </body>
</html>



