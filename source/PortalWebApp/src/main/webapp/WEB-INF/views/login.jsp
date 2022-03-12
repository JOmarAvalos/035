<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html class="bg-gray">
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
    </head>
    <body class="bg-login">

	<div class="form-box" id="login-box">

		<div class="login-container">
			<div class="header_login">
				 <img src="<c:url value='/resources/css/img/Logo-MD.svg' />" alt="Megadealer">
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
			</div>
		</div>

		<!--        <a href="<c:url value='/home/document'/>" target="_blank" class="text-center">Reporte 2</a>
		  <button onclick="javascript:generateDepartmentReport();" id="btnGenerateReport" class="btn btn-info pull-right">
		  <spring:message code="generate.report" /> 
		</button> -->



	</div>


	<!-- jQuery 2.0.2 -->
   
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<!-- Bootstrap -->
		<script src="<c:url value='/resources/js/bootstrap.min.js' />" type="text/javascript"></script>

       <script src="<c:url value='/resources/js/admin/prueba.js' />" type="text/javascript"></script> 
    </body>
</html>