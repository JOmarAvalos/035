<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true" %>

<article class="container">
	<div class="row">
		<div class="col-md-4">
			<h2>
				<spring:message code="app.error.403_message_user" />&nbsp;${username}
			</h2>
		</div>
		<div class="col-md-4"></div>
		<div class="col-md-4 text-center">
			<h2>
				<a href="<c:url value='/'/>" class="btn_chico btn btn-primary">
					<span class="glyphicon glyphicon-home">&nbsp;</span><spring:message code="general.label.go_back" />
				</a>
			</h2>
		</div>
	</div>
	<br />
	<div class="row ">
		<div class="col-md-12 text-center">
			<h2>
				<span class="label label-danger">&nbsp;<spring:message 	code="app.error.403_message_user_not_acces" /></span>
			</h2>
		</div>
	</div>
	<br />
	<br />
	<br />
	<div class="row ">
		<img alt="images/block_user_403" src="<c:url value='/resources/images/block_user_403.png'/>" 
			class="center-block img-responsive" height="300" width="300">
	</div>
	<br />
	<br />
	<br />
</article>

<!-- -------------- SCRIPTS ---------------- -->
<script src="<c:url value='/resources/js/utils.js'/>"></script>
<!-- -------------- SCRIPTS ---------------- -->
