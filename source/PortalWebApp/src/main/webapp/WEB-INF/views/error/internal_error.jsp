<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!-- Cargar archivos CSS -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/util/bootstrap.min.css'/>">    
<!-- Cargar fuente de google fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:400italic,100,100italic,400" rel="stylesheet" type="text/css">


<article class="container" style="background: white;">
	<div class="row">
		<div class="col-md-12">.
		</div>
	 	<div class="col-md-6">
			<label class="text-danger">
		   		<spring:message code="app.error.500_message" argumentSeparator=";" arguments="${errorMessage};" htmlEscape="false" />
		   	</label>
		</div>
		<div class="col-md-6 text-center">
		  	<a href="<c:url value='/'/>" class="btn_chico btn btn-primary" ><span class="glyphicon glyphicon-home">&nbsp;</span><spring:message code="general.label.go_back"/></a>
		</div>
	</div>
   <section class="row">
          <img src="<c:url value='/resources/images/feature_500.png' />" alt="${pageTitle}" class="center-block img-responsive">
    </section>
</article>
        