<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec" uri="http://www.teknei.com/jsp/tags"%>

<script src="<c:url value='/resources/js/admin/menu.js' />"
	type="text/javascript"></script>


<sec:hasAccess module="ADMIN_LMS" var="admin_lms" />
<sec:hasAccess module="ALUMNO" var="alumno_lms" />
<sec:hasAccess module="CONTACTO" var="contacto_lms" />
<sec:hasAccess module="NOTIFICACION" var="notificacion_lms" />


<!-- Left side column. contains the logo and sidebar -->
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
				<p>Hello, Jane</p>

				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..." /> <span class="input-group-btn">
					<button type='submit' name='seach' id='search-btn'
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<!-- <li class="active">
                <a onclick="getHome();">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
            </li> -->

			<%-- <c:if test="${admin_lms}">
       		<li class="treeview">
               <a href="#">
                   <i class="fa fa-table"></i>
                   <span><spring:message code="lms.menu.catalogos.title"/></span>
                   <i class="fa fa-angle-left pull-right"></i>
               </a>
               <ul class="treeview-menu">
                   <li><a onclick="getEmpresas();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.empresa"/></a></li>
                   <li><a onclick="getZonas();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.zona"/></a></li>
                   <li><a onclick="getGrupoPuestos();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.grupo.puestos"/></a></li>
                   <li><a onclick="getPuestos();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.puesto"/></a></li>
                   <li><a onclick="getTallas();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.talla"/></a></li>
                   <li><a onclick="getIdiomas();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.idioma"/></a></li>
                   <li><a onclick="getTipoDealers();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.tipo.dealer"/></a></li>
                   <li><a onclick="getCalificacionMetodos();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.calificacion.metodo"/></a></li>
                   <li><a onclick="getCategoriaCursos();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.categoria.curso"/></a></li>
                   <li><a onclick="getPrioridades();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.prioridad"/></a></li>
                   <li><a onclick="getTipoActividades();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.tipo.actividad"/></a></li>
                   <li><a onclick="getTipoCursos();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.tipo.curso"/></a></li>
                   <li><a onclick="getTipoPreguntas();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.tipo.pregunta"/></a></li>
                   <li><a onclick="getModulosWeb();"><i class="fa fa-angle-double-right"></i> <spring:message code="lms.menu.catalogos.modulo.web"/></a></li>
               </ul>
           </li>
       	</c:if> --%>
			<%-- Ejemplo para validar por MODULO --%>
			<c:if test="${admin_lms}">
				<li><a onclick="onInscripciones();"> <i class="fa fa-users"></i>
						<span><spring:message code="lms.menu.administrador.inscripciones" /></span>
				</a></li>
				<li><a onclick="onReportes();"> <i
						class="glyphicon glyphicon-envelope"></i> <span><spring:message
								code="lms.menu.administrador.reportes" /></span>
				</a></li>
				<li><a onclick="onFuncionarios();"> <i
						class="glyphicon glyphicon-envelope"></i> <span><spring:message
								code="lms.menu.administrador.funcionarios" /></span>
				</a></li>
			</c:if>
			<c:if test="${alumno_lms || admin_lms}">
				<li><a onclick="onCarrera();"> <i
						class="glyphicon glyphicon-envelope"></i> <span><spring:message
								code="lms.menu.carrera.title" /></span>
				</a></li>
				<li><a onclick="onCalificaciones();"> <i
						class="glyphicon glyphicon-envelope"></i> <span><spring:message
								code="lms.menu.calificaciones.title" /></span>
				</a></li>
				<li><a onclick="onAgenda();"> <i
						class="glyphicon glyphicon-envelope"></i> <span><spring:message
								code="lms.menu.agenda.title" /></span>
				</a></li>


			</c:if>
			<c:if test="${notificacion_lms}">
				<li><a onclick="onNotificaciones();"> <i
						class="glyphicon glyphicon-envelope"></i> <span><spring:message
								code="lms.menu.notificaciones.title" /></span>
				</a></li>
			</c:if>
			<c:if test="${contacto_lms}">
				<li><a onclick="getContacto();"> <i
						class="fa fa-address-card" aria-hidden="true"></i> <span><spring:message
								code="lms.menu.contacto.title" /></span>
				</a></li>
			</c:if>
			<li><a onclick="onDocumentos();"> 
				<i class="fas fa-folder-open"></i><spring:message
								code="lms.menu.documentos.title" />
				</a>
			</li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>