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
<!-- Theme style -->
<link href="<c:url value='/resources/css/AdminLTE.css' />"
	rel="stylesheet" type="text/css" />

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
<!-- parsleyjs -->
<script
	src="https://parsleyjs.org/dist/parsley.js"></script>	
<script
	src="<c:url value='/resources/js/plugins/morris/morris.min.js' />"
	type="text/javascript"></script>
<!-- jQuery Knob Chart -->
<script
	src="<c:url value='/resources/js/plugins/jqueryKnob/jquery.knob.js' />"
	type="text/javascript"></script>
<!-- Bootstrap WYSIHTML5 -->
<script
	src="<c:url value='/resources/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js' />"
	type="text/javascript"></script>

	

<!-- AdminLTE dashboard demo (This is only for demo purposes)
	<script src="<c:url value='/resources/js/AdminLTE/dashboard.js' />" type="text/javascript"></script> -->
<script src="<c:url value='/resources/js/util/util.js' />" type="text/javascript"></script>
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

<div id="wait" class="loading-img" style="display: none;"></div>
</html>

