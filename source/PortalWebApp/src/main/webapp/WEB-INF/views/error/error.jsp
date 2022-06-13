<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><spring:message code="app.title" /></title>

<!-- Cargar archivos CSS -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/util/bootstrap.min.css'/>">

<!-- Cargar fuente de google fonts -->
<link href="https://fonts.googleapis.com/css?family=Lato:400,300,700,900" rel="stylesheet" type="text/css">
<style>
body {
	background: #1A325F;
    font-family: 'Lato', sans-serif;
    font-weight: 300;
    font-size: 16px;
}

h1, h2, h3, h4, h5, h6 {
    font-family: 'Lato', sans-serif;
    font-weight: 300;
    color: #fff;
}

h1 {
    padding-top:80px;
	font-size: 90px;
    font-weight:700;
    margin-bottom:30px;
}
h2 {
	font-size: 40px;
    font-weight:400;
     margin-bottom:60px;
}

h3 {
    font-size: 30px;
	font-weight: 200;
    margin-bottom:50px;
}



#links a {
    margin:3px;
}

#wrapper {
	text-align: center;
	padding: 50px 0;
	background-position: center center;
	min-height: 650px;
	width: 100%;	
    -webkit-background-size: 100%;
    -moz-background-size: 100%;
    -o-background-size: 100%;
    background-size: 100%;

    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
</style>

</head>

<body>
	<div id="wrapper">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<h1 class="text">
						<spring:message code="app.error.404_header" />
					</h1>
					<h2>La p&aacute;gina que intentas visitar no existe</h2>
					<h3 class="text">
						<spring:message code="app.error.404_message" />
					</h3>
				</div>

			</div>
			<div id="links" class="row">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<a class="btn btn-danger" href="https://035.com.mx/">
	                    <span class="glyphicon glyphicon-home"></span> SALIR
	                </a>
				</div>
			</div>

		</div>
	</div>
</body>

</html>
