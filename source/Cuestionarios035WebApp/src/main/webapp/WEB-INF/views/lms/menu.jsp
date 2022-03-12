<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec" uri="http://www.teknei.com/jsp/tags"%>

<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script src="<c:url value='/resources/js/admin/menu.js' />"
	type="text/javascript"></script>


<sec:hasAccess module="ADMIN_CALENDARIO" var="admin_calendario" />
<sec:hasAccess module="ALUMNO" var="alumno_lms" />
<sec:hasAccess module="ADMIN_FUNCIONARIOS" var="admin_funcionarios" />
<sec:hasAccess module="REPORTES" var="reportes_lms" />
<sec:hasAccess module="ADMIN_INSUMOS" var="admin_insumos" />
<sec:hasAccess module="REPORTES_ADIC" var="admin_adicionales" />


<div class="l-sidebar">
    <div class="user">
        <div class="user__image">
        <%--     <img src="<c:url value='/resources/css/img/avatar-user.svg' />" alt="User"> --%>
        <img src="<c:url value='/downloadImagePerfil'/>" alt="User">
        </div>
        <div class="user__txt dropdown">
            <a class="username" data-toggle="dropdown">
				<span>${currentUser.funcionarioVO.datosFuncionarioVO.nombres} </span> 
				<span>${currentUser.funcionarioVO.datosFuncionarioVO.apellidoUno} </span> 
				<span>${currentUser.funcionarioVO.datosFuncionarioVO.apellidoDos}</span>  <i class="fas fa-caret-down"></i>
            </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="#" onclick="getHome();">
                    <i class="fas fa-user-cog"></i>
                    <spring:message code="lms.menu.perfil.title" />
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" onclick="logout();">
                    <i class="fas fa-power-off"></i>
                    <spring:message code="lms.menu.logout" />
                </a>
            </div>
        </div>
        <div class="user__txt">
            <p class="user__rol "><c:if test="${not empty currentUser.funcionarioVO.funcionarioPuestoVO}">${currentUser.funcionarioVO.funcionarioPuestoVO.auxPuesto.nombre}</c:if></p>
        </div>
    </div>
    <div class="l-sidebar__content">
        <nav class="c-menu js-menu">
            <ul class="u-list">
            <c:if test="${admin_calendario ||  admin_funcionarios || reportes_lms || admin_insumos || admin_adicionales || isInstructor || isDSPMFTS}">
               	<li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.administrador.title" />">
                    <div class="c-menu__item__inner js-expand-submenu">
                        <i class="fas fa-cogs"></i>
                        <div class="c-menu-item__title">
                            <span class="regular uppercase" style="font-size: 12px"><spring:message code="lms.menu.administrador.title" /></span>
                        </div>
                        <div class="c-menu-item__expand ">
                            <i class="fa fa-angle-down"></i>
                        </div>
                    </div>

                </li>
                <div class="c-menu__submenu subs-inner">
                	<c:if test="${admin_calendario}">
	                    <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.administrador.inscripciones" />" id="menuInscripciones">
	                        <div class="c-menu__item__inner"  onclick="onInscripciones();">
	                            <i class="fas fa-calendar-check"></i>
	                            <div class="c-menu-item__title"><span><spring:message code="lms.menu.administrador.inscripciones" /></span></div>
	                        </div>
	                    </li>
                    </c:if>
                    <c:if test="${reportes_lms}">
	                    <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.administrador.reportes" />" id="menuReportes">
	                        <div class="c-menu__item__inner"  onclick="onReportes();">
	                            <i class="fas fa-poll"></i>
	                            <div class="c-menu-item__title"><span><spring:message code="lms.menu.administrador.reportes" /></span></div>
	                        </div>
	                    </li>  
                    </c:if>
                    <c:if test="${admin_funcionarios}">
                           <c:if test="${not empty empresa}">
						    <c:if test="${!fn:contains(empresa, 'TOY')}">
			                    <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.administrador.funcionarios" />" id="menuFuncionarios">
			                        <div class="c-menu__item__inner"  onclick="onFuncionarios();">
			                            <i class="fas fa-users-cog"></i>
		                           		<div class="c-menu-item__title"><span><spring:message code="lms.menu.administrador.funcionarios" /></span></div>
			                        </div>
			                    </li>
						    </c:if>
						    <c:if test="${fn:contains(empresa, 'TOY')}">
			                    <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.administrador.censo" />" id="menuFuncionarios">
			                        <div class="c-menu__item__inner"  onclick="onFuncionarios();">
			                            <i class="fas fa-users-cog"></i>
		                           		<div class="c-menu-item__title"><span><spring:message code="lms.menu.administrador.censo" /></span></div>
			                        </div>
			                    </li>
						    </c:if>
					    </c:if>
                    </c:if>
                    <c:if test="${admin_insumos}">
	                    <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.administrador.insumos" />" id="menuInsumos">
	                        <div class="c-menu__item__inner"  onclick="onInsumos();">
	                            <i class="fas fa-book"></i>
	                            <div class="c-menu-item__title"><span><spring:message code="lms.menu.administrador.insumos" /></span></div>
	                        </div>
	                    </li>
	                    <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="Historico de solicitudes de insumos" id="menuInsumosHist">
	                        <div class="c-menu__item__inner"  onclick="onInsumosHist();">
	                            <i class="fas fa-book"></i>
	                            <div class="c-menu-item__title"><span><spring:message code="lms.menu.administrador.hist.insumos" /></span></div>
	                        </div>
	                    </li>
                    </c:if>
                    
                    <c:if test="${admin_adicionales}">
	            	    <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.administrador.rep.adic" />" id="menuReportesAdic">
		                    <div class="c-menu__item__inner"  onclick="getReportesAdicionales();">
		                        <i class="fas fa-chart-bar"></i>
		                        <div class="c-menu-item__title"><span style="font-size: 12px;"><spring:message code="lms.menu.administrador.rep.adic" /></span></div>
		                    </div>
		                </li>
	                </c:if>
	                <c:if test="${isInstructor}">
                        <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.administrador.instructor" />" id="menuInstructor">
			                <div class="c-menu__item__inner"  onclick="onInstructor();">
			                    <i class="fas fa-chalkboard-teacher"></i>
			                    <div class="c-menu-item__title"><span><spring:message code="lms.menu.administrador.instructor" /></span></div>
			                </div>
			            </li>
		            </c:if>
	                <c:if test="${isDSPMFTS}">
                        <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.administrador.validaciones" />" id="menuValidaciones">
			                <div class="c-menu__item__inner"  onclick="onValidaciones();">
			                    <i class="fas fa-chalkboard-teacher"></i>
			                    <div class="c-menu-item__title"><span><spring:message code="lms.menu.administrador.validaciones" /></span></div>
			                </div>
			            </li>
		            </c:if>
		            
		            
		            
		            
					<%-- <c:if test="${isDSPMFTS}"> 
                        <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.administrador.plan.capacitacion" />" id="menuPlanCapacitacion">
			                <div class="c-menu__item__inner"  onclick="onPlanCapacitacion();">
			                    <i class="fas fa-book-reader"></i>
			                    <div class="c-menu-item__title"><span><spring:message code="lms.menu.administrador.plan.capacitacion" /></span></div>
			                </div>
			            </li>
		            </c:if> --%>





                </div>
            </c:if>
	            <c:if test="${alumno_lms}">
	                <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.carrera.title" />" id="menuCarrera">
	                    <div class="c-menu__item__inner"  onclick="onCarrera();">
	                        <i class="fas fa-columns"></i>
	                        <div class="c-menu-item__title"><span><spring:message code="lms.menu.carrera.title" /></span></div>
	                    </div>
	                </li>
	                <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.calificaciones.title" />" id="menuCalificaciones">
	                    <div class="c-menu__item__inner"  onclick="onCalificaciones();">
	                        <i class="fas fa-star"></i>
	                        <div class="c-menu-item__title"><span><spring:message code="lms.menu.calificaciones.title" /></span></div>
	                    </div>
	                </li>
	                <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.agenda.title" />" id="menuAgenda">
	                    <div class="c-menu__item__inner"  onclick="onAgenda();">
	                        <i class="fas fa-calendar-alt"></i>
	                        <div class="c-menu-item__title"><span><spring:message code="lms.menu.agenda.title" /></span></div>
	                    </div>
	                </li>
	                <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.notificaciones.title" />" id="menuNotificaciones">
	                    <div class="c-menu__item__inner"  onclick="onNotificaciones();">
	                        <i class="fas fa-bell"></i>
	                        <div class="c-menu-item__title"><span><spring:message code="lms.menu.notificaciones.title" /></span></div>
	                    </div>
	                </li>
                    <c:if test="${not empty empresa}">
					    <c:if test="${!fn:contains(empresa, 'TOY')}">
			                <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.contacto.title" />" id="menuContacto">
			                    <div class="c-menu__item__inner"  onclick="getContacto();">
			                        <i class="fas fa-envelope-open-text"></i>
			                        <div class="c-menu-item__title"><span><spring:message code="lms.menu.contacto.title" /></span></div>
			                    </div>
			                </li>
					    </c:if>
					    <c:if test="${fn:contains(empresa, 'TOY')}">
			                <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.buzon.title" />" id="menuContacto">
			                    <div class="c-menu__item__inner"  onclick="getContacto();">
			                        <i class="fas fa-envelope-open-text"></i>
			                        <div class="c-menu-item__title"><span><spring:message code="lms.menu.buzon.title" /></span></div>
			                    </div>
			                </li>
					    </c:if>
				    </c:if>
	            </c:if>
	            <li class="c-menu__item has-submenu" data-toggle="tooltip" data-placement="right" title="<spring:message code="lms.menu.documentos.title" />" id="menuDocumentos">
	                    <div class="c-menu__item__inner"  onclick="onDocumentos();">
	                        <i class="fas fa-folder-open"></i>
	                        <div class="c-menu-item__title"><span><spring:message code="lms.menu.documentos.title" /></span></div>
	                    </div>
	                </li>
	                
            </ul>
        </nav>
    </div>
    <div class="cc"><spring:message code="lms.menu.title" /></div>
</div>