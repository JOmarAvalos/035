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
				<p>${sessionScope.currentUser.dtsFuncionarioVO.nombres}</p>
			</div>
		</div>
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="active"><a style="cursor:pointer;" onclick="getHome();"> <i
					class="fa fa-dashboard"></i> <span>Dashboard</span>
			</a></li>
			<c:if test="${admin_funcionarios}">
				<li><a style="cursor:pointer;" onclick="getFuncionarios();"> <i class="fa fa-users"></i>
						<span><spring:message code="home.menu.funcionarios.title" /></span>
				</a></li>
				<li><a style="cursor:pointer;" onclick="getMesa();"> <i
						class="fa fa-tasks" aria-hidden="true"></i> <span><spring:message
								code="home.menu.funcionarios.mesa" /></span>
				</a></li>
			</c:if>
			
			<c:if test="${admin_adicionales}">
				<li>
					<a style="cursor:pointer;" onclick="getReportesAdicionales();"> 
						<i class="fa fa-calendar-check-o" aria-hidden="true"></i> <span><spring:message code="home.menu.reportes.adicionales.title" /></span>
					</a>
				</li>
			</c:if>
			<c:if test="${admin_catalogos}">
				<li class="treeview"><a href="#"> <i class="fa fa-database"></i>
						<span><spring:message code="home.menu.catalgos.title" /></span> <i
						class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
						<li><a style="cursor:pointer;" onclick="getEmpresas();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalgos.empresa" /></a></li>
						<li><a style="cursor:pointer;" onclick="getGrupoPuestos();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogos.GrupoPuestos" /></a></li>
						<li><a style="cursor:pointer;" onclick="getPuestosMenu();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogos.Puesto" /></a></li>
						<li><a style="cursor:pointer;" onclick="getTipoDealers();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogos.TipoDealer" /></a></li>
						<li><a style="cursor:pointer;" onclick="getTallas();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogos.Talla" /></a></li>
						<li><a style="cursor:pointer;" onclick="getGrupoDealers();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogos.grupo.dealers" /></a></li>
						<li><a style="cursor:pointer;" onclick="getZonas();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalgos.zona" /></a></li>
						<li><a style="cursor:pointer;" onclick="getSedes();"><i
								class="fa fa-angle-double-right"></i> Sedes</a></li>
						<li><a style="cursor:pointer;" onclick="getIdiomas();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogos.Idioma" /></a></li>
						<li><a style="cursor:pointer;" onclick="getDealers();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogos.dealers" /></a></li>
						<li><a style="cursor:pointer;" onclick="getGrupos();"><i
								class="fa fa-angle-double-right"></i> Grupos de contacto</a></li>
						<li><a style="cursor:pointer;" onclick="getInstructores();"><i
    							class="fa fa-angle-double-right"></i> Instructores</a></li>
						<li><a style="cursor:pointer;" onclick="getDias();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.dias.title" /></a></li>
									<li><a style="cursor:pointer;" onclick="getMotivosContacto();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogo.motivo.contacto.title" /></a></li>
									<li><a style="cursor:pointer;" onclick="getProyectos();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogo.proyecto.title" /></a></li>
									<li><a style="cursor:pointer;" onclick="getMotivosCancelaciones();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogo.motivo.cancelacion.title" /></a></li>
									<li><a style="cursor:pointer;" onclick="getMotivosCancelacionesCursos();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogo.motivo.cancelacion.curso.title" /></a></li>
									<li><a style="cursor:pointer;" onclick="getTipoReportesAdicionales();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.catalogo.tipo.reportes.title" /></a></li>
					</ul></li>
			</c:if>
			<c:if test="${admin_lms}">
				<li class="treeview"><a href="#"> <i
						class="fa fa-bar-chart-o"></i> <span><spring:message
								code="home.menu.lms.title" /></span> <i
						class="fa fa-angle-left pull-right"></i>
				</a>
					<ul class="treeview-menu">
					
						<li><a style="cursor:pointer;" onclick="getCursos();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.lms.cursos" /></a></li>
						<li><a style="cursor:pointer;" onclick="getCertificados();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.lms.certificados" /></a></li>
						<li><a style="cursor:pointer;" onclick="getPlanesDeCarrera();"><i
								class="fa fa-angle-double-right"></i> <spring:message
									code="home.menu.lms.planesDeCarrera" /></a></li>
									
					</ul></li>
			</c:if>
			
            <li>
                <a style="cursor:pointer;" onclick="getEmail();">
                    <i class="glyphicon glyphicon-envelope"></i> <span><spring:message code="home.menu.email.title"/></span>
                </a>
            </li> 
			<li>
				<a style="cursor:pointer;" onclick="getContacto();"> 
					<i class="fa fa-address-card" aria-hidden="true"></i> <span><spring:message code="home.menu.contacto.title" /></span>
				</a>
			</li>
			<li>
				<a style="cursor:pointer;" onclick="getAdminRepositorio();"> 
					<i class="glyphicon glyphicon-file" aria-hidden="true"></i> <span><spring:message code="home.menu.repositorio.title" /></span>
				</a>
			</li>

			<c:if test="${admin_insumos}">
				<li class="treeview">
					<a href="#"> <i class="fa fa-book"></i> <span><spring:message code="home.menu.insumos.title" /></span> <i class="fa fa-angle-left pull-right"></i></a>
					<ul class="treeview-menu">
					
					<li><a style="cursor:pointer;" onclick="getInsumos();"> <i class="fa fa-book"></i><span>Encuestas de insumos</span> </a></li>	
					<li><a style="cursor:pointer;" onclick="getCicloInsumos();"> <i class="fa fa-book"></i><span>Ciclos de insumos</span></a></li>				
									
					</ul>
				</li>
					
					
			</c:if>

			<li>
				<a style="cursor:pointer;" onclick="getCalificador();"> 
					<i class="glyphicon glyphicon-ok-sign" aria-hidden="true"></i> <span><spring:message code="home.menu.calificador.title" /></span>
				</a>
			</li>
			<c:if test="${admin_reportes}">
				<li>
					<a style="cursor:pointer;" onclick="getReportes();"> 
						<i class="fa fa-file-excel-o" aria-hidden="true"></i> <span>Reportes</span>
					</a>
				</li>
			</c:if>
						<li>
				<a style="cursor:pointer;" onclick="getMonitoreo();"> 
					<i class="glyphicon glyphicon-search" aria-hidden="true"></i> <span><spring:message code="home.menu.monitoreo.title" /></span>
				</a>
			</li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
