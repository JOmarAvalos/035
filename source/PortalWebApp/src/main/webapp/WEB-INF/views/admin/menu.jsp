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
		<ul class="sidebar-menu">
			<c:if test="${usuario.idPerfil == 1}">
				<li>
					<a style="cursor:pointer;" onclick="goUsuarios();"> 
						<i class="fa fa-user"></i> 
						<span>Usuarios</span>
					</a>
				</li>
				
			</c:if>
			<c:if test="${usuario.idPerfil == 2}">
				<li>
					<a style="cursor:pointer;" onclick="goPerfil();"> 
						<i class="fa fa-user"></i> 
						<span>Perfil</span>
					</a>
				</li>
				<li>
					<a style="cursor:pointer;" onclick="goCentros();"> 
						<i class="fa fa-group"></i> 
						<span>Centro de trabajo</span>
					</a>
				</li>
				<li>
					<a style="cursor:pointer;" onclick="goCuestionarios();"> 
						<i class="fa fa-book"></i> 
						<span>Resultados de evaluaciones/Cuestonarios</span>
					</a>
				</li>
			</c:if>
			<li>
				<a style="cursor:pointer;" onclick="logout();"> 
					<i class="fa fa-sign-out"></i> 
					<span>Salir</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
