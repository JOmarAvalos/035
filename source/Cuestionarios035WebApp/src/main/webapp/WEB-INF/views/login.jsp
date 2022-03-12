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
        <link rel="icon" href="<c:url value='/resources/css/img/favicon${empresa}.png' />">

        <title><spring:message code="login.label.header.title" /></title>

        <!-- Bootstrap core CSS -->
       <!-- Bootstrap  CSS -->
        <link rel="stylesheet" href="<c:url value='/resources/libs/bootstrap4/bootstrap.min.css' />" media="all">
        <link rel="stylesheet" href="<c:url value='/resources/css/assets/style.css' />"media="all">
        
        <!-- FONTAWESOME -->
		<link rel="stylesheet" href="<c:url value='/resources/css/assets/all.css' />" media="all">
		
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
			    	background-image: url('<c:url value='/resources/css/img/login-bg-${empresa}.jpg' />');
				  </c:if>
				  <c:if test="${empty empresa}">
				    background-image: url('<c:url value='/resources/css/img/bg-login-auto.jpg' />');
				  </c:if>
    		}
		</style>

    <script>
      function getURLParam(sParam) {
        var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

        for (i = 0; i < sURLVariables.length; i++) {
          sParameterName = sURLVariables[i].split('=');

          if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
          }
        }
      }

       var param = getURLParam("param");
       var urlComplete =  window.location.href ;
       var dns = window.location.href.split('/')[2];

       if( !dns.includes("mitsubishimotors-entrenamiento.mx") && !dns.includes("200.52.90.178") && !dns.includes("localhost") && getURLParam("param")=="MIT"){
           window.location.href = urlComplete.replace(dns,"mitsubishimotors-entrenamiento.mx");
       }
       else if( !dns.includes("capacitaciontoyota.net") && !dns.includes("200.52.90.178") && !dns.includes("localhost") && getURLParam("param")=="TOY"){
           window.location.href = urlComplete.replace(dns,"capacitaciontoyota.net");
       }
       else if( !dns.includes("capacitacionlexus.net") && !dns.includes("200.52.90.178") && !dns.includes("localhost") && getURLParam("param")=="LMEX"){
           window.location.href = urlComplete.replace(dns,"capacitacionlexus.net");
       }
       else if( !dns.includes("audiarotraining.com") && !dns.includes("200.52.90.178") && !dns.includes("localhost") && getURLParam("param")=="AA"){
           window.location.href = urlComplete.replace(dns,"audiarotraining.com");
       }
       
    </script>

		
    </head>

    <body>
        <div class="login-wraper">
            <div class="login-container">
                <div class="header_login">
                	<c:if test="${not empty empresa}">
                       <img src="<c:url value='/resources/css/img/logo-${empresa}-login.svg' />" alt="${empresa}">
                	</c:if>
                	<c:if test="${empty empresa}">
	                    <img src="<c:url value='/resources/css/img/Logo-MD.svg' />" alt="Megadealer">
                	</c:if>
                </div>
                <div class="body_login">
                    <h1><spring:message code="login.label.header.bienvenida" /></h1>
                    <p><spring:message code="login.label.header.sesion" /></p>

                    <form name="loginForm" action="<c:url value='/auth/login_check?targetUrl=${targetUrl}' />" method="POST" role="form">
                        <div class="form-element form-input">
                            <input id="username" name="username" class="form-element-field" placeholder="<spring:message code="login.placeholder.username" />" type="text" required />
                            <div class="form-element-bar"></div>
                            <label class="form-element-label" for="name"><spring:message code="login.label.username" /></label>
                        </div>
                        <div class="form-element form-input"  id="show_hide_password">
                            <input id="password" name="password" class="form-element-field" placeholder="<spring:message code="login.placeholder.password" />" type="password" required />
                           
                            <div class="form-element-bar"></div>
                            <label class="form-element-label" for="name"><spring:message code="login.label.password" /></label>
                             <div class="input-group-addon">
                                <a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                            </div>
                        </div>
                        <button type="submit" class="md-btn md-btn-main mt-4"><spring:message code="login.label.btn.submit" /></button>
                    </form>

                </div>
                <div class="footer_login">
                	<div class="header-icons-group">
						<c:if test="${not empty empresa}">
							<c:if test="${fn:contains(empresa, 'AA')}">
									<div class="user__txt dropdown"  style="left:5px;">
							            <a data-toggle="dropdown">
											<span><spring:message code="lms.header.idioma"/></span>  <i class="fas fa-caret-down"></i>
							            </a>
							            <div class="dropdown-menu">
							                <a class="dropdown-item" href="#" onclick="cambiaLenguaje('<spring:message code='lms.header.idioma.dos.codigo'/>');"><spring:message code="lms.header.idioma.dos"/></a>
							                <div class="dropdown-divider"></div>
							                <a class="dropdown-item" href="#" onclick="cambiaLenguaje('<spring:message code='lms.header.idioma.tres.codigo'/>');"><spring:message code="lms.header.idioma.tres"/></a>
							            </div>
							        </div>
							</c:if>
						</c:if>
					</div>
                </div>
            </div>

        </div>

 		<!-- ***JQUERY*** -->
		<script src="<c:url value='/resources/libs/jquery/jquery-3.5.1.min.js' />"></script>
		<!-- ***POPPER*** -->
		<script src="<c:url value='/resources/libs/bootstrap4/popper.min.js' />"></script>
		<!-- ***BOOTSTRAP 4*** -->
		<script src="<c:url value='/resources/libs/bootstrap4/bootstrap.min.js' />"></script>


        <script src="<c:url value='/resources/js/main.js' />"></script>


    </body>
<script>
	function cambiaLenguaje(lenguaje){
		
	    var urlComplete =  window.location.href ;
	    
	    if(urlComplete.includes("locale")){
	    	urlComplete = urlComplete.replace('&locale=es','');
	    	urlComplete = urlComplete.replace('&locale=en','');
	    	urlComplete = urlComplete.replace('&locale=fr','');
	    	urlComplete = urlComplete.replace('?locale=es','');
	    	urlComplete = urlComplete.replace('?locale=en','');
	    	urlComplete = urlComplete.replace('?locale=fr','');
	    }
	    
	    if(urlComplete.includes("?")){
	    	window.location.href = urlComplete+'&locale='+lenguaje; 
	    }else{
	    	window.location.href = urlComplete+'?locale='+lenguaje;
	    }
	    
	}
</script>
</html>



