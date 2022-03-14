<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.teknei.com/jsp/tags"%>

<script src="<c:url value='/resources/js/admin/menu.js' />"
	type="text/javascript"></script>


<!-- Left side column. contains the logo and sidebar -->

<sec:hasAccess module="ADMIN_CATALOGOS" var="admin_catalogos" />
<sec:hasAccess module="ADMIN_USER" var="admin_user" />
<sec:hasAccess module="ADMIN_LMS" var="admin_lms" />
<sec:hasAccess module="ADMIN_CALENDARIO" var="admin_calendario" />
<sec:hasAccess module="ADMIN_FUNCIONARIOS" var="admin_funcionarios" />
<sec:hasAccess module="REPORTES" var="admin_reportes" />
<sec:hasAccess module="ADMIN_INSUMOS" var="admin_insumos" />
<sec:hasAccess module="REPORTES_ADIC" var="admin_adicionales" />

<aside class="left-side sidebar-offcanvas">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="<c:url value='/resources/css/img/avatar3.png' />"
					class="img-circle" alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>nombre</p>
			</div>
		</div>
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="active"><a style="cursor:pointer;" onclick="getHome();"> <i
					class="fa fa-dashboard"></i> <span>Dashboard</span>
			</a></li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
