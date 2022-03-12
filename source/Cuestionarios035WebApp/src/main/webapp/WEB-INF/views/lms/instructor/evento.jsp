<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value='/resources/js/admin/calendario.js' />"
	type="text/javascript"></script>

<main class="l-main">
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">${evento.cursoVO.codigo} ${evento.cursoVO.nombre}</a></li>
		</ol>
	</nav>
	<div class="content-wrapper h-100 calificaciones">
	
		<div>
			<div class="col-12 mb-4">
				<h2 class="subtitle">${evento.cursoVO.codigo} ${evento.cursoVO.nombre} </h2>
			</div>
			<div class="col-12 mb-4">
				<h3><spring:message code="lms.evento.fecha" /> <fmt:formatDate value="${evento.fechaInicio}" type="date" pattern="yyyy-MM-dd HH:mm"/> - <fmt:formatDate value="${evento.fechaFin}" type="date" pattern="yyyy-MM-dd HH:mm"/></h3>
			</div>
			<div class="col-12 mb-4">
				<h3><spring:message code="lms.evento.sede" /> <c:if test="${not empty evento.sedeVO}">${evento.sedeVO.nombre}</c:if></h3>
			</div>
			<div class="col-12 mb-4">
				<h3><spring:message code="lms.evento.instructor" /> ${evento.instructorVO.funcionario.datosFuncionarioVO.nombres} ${evento.instructorVO.funcionario.datosFuncionarioVO.apellidoUno} ${evento.instructorVO.funcionario.datosFuncionarioVO.apellidoDos}</h3>
			</div>
			<div class="col-12 mb-4">
				<h3><spring:message code="lms.evento.assistentes.min" /> ${evento.asistentesMinimo} - <spring:message code="lms.evento.assistentes.max" /> ${evento.asistentesMaximo}</h3>
			</div>
			<div class="col-12 mb-4">
				<button type="button" onclick="exportLista(${evento.id});" class="md-btn md-btn-main mt-4"><spring:message code="lms.evento.btn.exportar" /></button>
			</div>
		</div>
		
		<div class="row justify-content-center">
			<div class="col">
				<!-- TABS -->
				<ul class="nav nav-tabs mb-4" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="actividades-tab" data-toggle="tab" role="tab"  aria-selected="true">
							<i class="fas fa-list"></i><span><spring:message code="lms.evento.actividades.title" /></span>
						</a>
					</li>
				</ul>
	
				<!-- TABS CONTENT -->
				<div class="tab-content">
					<!-- ====TAB Actividades==== -->
	
					<div class="tab-pane fade show active" id="actividades-content"
						role="tabpanel" aria-labelledby="inscribir-tab">
						<div id="accordion" role="tablist">
							<!-- ====CURSO 1 HEADER==== -->
							<div class="card modulo-container">
								<div>
									<table class="table ">
										<thead>
											<tr>
												<th><spring:message code="lms.evento.actividades.table.actividad" /></th>
												<th><spring:message code="lms.evento.actividades.table.tipo" /></th>
												<th><spring:message code="lms.evento.actividades.table.fecha.inicio" /></th>
												<th><spring:message code="lms.evento.actividades.table.fecha.fin" /></th>
												<th><spring:message code="lms.evento.actividades.table.link" /></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty lstActividades}">
												<c:forEach var="actividad" items="${lstActividades}">
													<tr>
														<td>${actividad.actividad.nombre}</td>
														<td>${actividad.actividad.tipoActividad.nombre}</td>
														<td>
															<fmt:formatDate value="${actividad.fechaInicio}" type="date" pattern="yyyy-MM-dd HH:mm"/>
														</td>
														<td>
															<fmt:formatDate value="${actividad.fechaFin}" type="date" pattern="yyyy-MM-dd HH:mm"/>
														</td>
														<td>
															<c:if test="${actividad.actividad.idTipoActividad == 6}">
																<a href="${actividad.url}" target="_blank">${actividad.url}</a>
															</c:if>
															<c:if test="${actividad.actividad.idTipoActividad != 6}">
																<spring:message code="lms.evento.actividades.table.na" />
															</c:if>
														</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
	
					</div>
				</div>
			</div>
		</div>
	
		<div class="row justify-content-center">
			
			<div class="col">
				<!-- TABS -->
				<ul class="nav nav-tabs mb-4" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="inscribir-tab" data-toggle="tab" href="#inscribir-content" role="tab" aria-controls="inscribir-content" aria-selected="true">
							<i class="fas fa-check"></i> <span><spring:message code="lms.evento.inscritos.title" /></span>
						</a>
					</li>
					<li class="nav-item"><a class="nav-link" id="inscritos-tab"
						data-toggle="tab" href="#inscritos-content" role="tab"
						aria-controls="inscritos-content" aria-selected="false"> <i
							class="fas fa-ban"></i> <span><spring:message code="lms.evento.cancelados.title" /> </span>
					</a></li>
	<!-- 				<li class="nav-item"><a class="nav-link" id="solicitudes-tab"
						data-toggle="tab" href="#solicitudes-content" role="tab"
						aria-controls="solicitudes-content" aria-selected="false"> <i
							class="fas fa-chalkboard-teacher"></i> <span>Otros</span>
					</a></li> -->
				</ul>
	
				<!-- TABS CONTENT -->
				<div class="tab-content">
	
					<!-- ====TAB INSCRIBIR==== -->
	
					<div class="tab-pane fade show active" id="inscribir-content"
						role="tabpanel" aria-labelledby="inscribir-tab">
						<div id="accordion" role="tablist">
							<!-- ====CURSO 1 HEADER==== -->
							<div class="card modulo-container">
								<div>
									<table class="table table-cal">
										<thead>
											<tr>
												<th><spring:message code="lms.evento.inscritos.table.rfc" /></th>
												<th><spring:message code="lms.evento.inscritos.table.funcionario" /></th>
												<th><spring:message code="lms.evento.inscritos.table.puesto" /></th>
												<th><spring:message code="lms.evento.inscritos.table.distribuidor" /></th>
												<th><spring:message code="lms.evento.inscritos.table.estatus" /></th>
												<th><spring:message code="lms.evento.inscritos.table.calificacion" /></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty evento.inscritos}">
												<c:forEach items="${evento.inscritos}" var="inscritos" varStatus="loop">
													<tr>
														<td>${inscritos.funcionarioEstatus.rfc}</td> 
														<td>${inscritos.funcionarioEstatus.datosFuncionarioVO.nombres} ${inscritos.funcionarioEstatus.datosFuncionarioVO.apellidoUno} ${inscritos.funcionarioEstatus.datosFuncionarioVO.apellidoDos}</td>
														<td>${inscritos.funcionarioEstatus.auxPuestoPrincipal}</td>
														<td>${inscritos.funcionarioEstatus.auxDealerPrincipal}</td>
														<td>
															<c:if test="${inscritos.estatus == 2}">
																<spring:message code="lms.evento.inscritos.table.estatus.inscrito" />
															</c:if>
															<c:if test="${inscritos.estatus == 5}">
																<spring:message code="lms.evento.inscritos.table.estatus.aprovado" />
															</c:if>
															<c:if test="${inscritos.estatus == 6}">
																<spring:message code="lms.evento.inscritos.table.estatus.no.aprovado" />
															</c:if>
															<c:if test="${inscritos.estatus == 7}">
																<spring:message code="lms.evento.inscritos.table.estatus.show" />
															</c:if>
															<c:if test="${inscritos.estatus == 8}">
																<spring:message code="lms.evento.inscritos.table.estatus.examen" />
															</c:if>
														</td> 
														<td>
															<c:if test="${inscritos.estatus == 2}">
																<spring:message code="lms.evento.inscritos.table.estatus.na" />
															</c:if>
															<c:if test="${inscritos.estatus == 5 || inscritos.estatus == 6}">
																${inscritos.calificacion }
															</c:if>
														</td> 
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
	
					</div>
	
					<!-- ====TAB INSCRITOS==== -->
	
					<div class="tab-pane fade" id="inscritos-content" role="tabpanel"
						aria-labelledby="inscritos-tab">
						<div id="accordion" role="tablist">
							<div class="card modulo-container">
								<div>
									<table class="table ">
										<thead>
											<tr>
												<th><spring:message code="lms.evento.cancelados.table.rfc" /></th>
												<th><spring:message code="lms.evento.cancelados.table.funcionario" /></th>
												<th><spring:message code="lms.evento.cancelados.table.puesto" /></th>
												<th><spring:message code="lms.evento.cancelados.table.distribuidor" /></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty evento.cancelados}">
												<c:forEach items="${evento.cancelados}" var="cancelados" varStatus="loop">
													<tr>
														<td>${cancelados.funcionarioEstatus.rfc}</td> 
														<td>${cancelados.funcionarioEstatus.datosFuncionarioVO.nombres} ${cancelados.funcionarioEstatus.datosFuncionarioVO.apellidoUno} ${cancelados.funcionarioEstatus.datosFuncionarioVO.apellidoDos}</td>
														<td>${cancelados.funcionarioEstatus.auxPuestoPrincipal}</td>
														<td>${cancelados.funcionarioEstatus.auxDealerPrincipal}</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
	
					</div>
					<!-- ====TAB SOLICITUDES==== -->
	
				</div>
			</div>
		</div>
	</div>
</main>

<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/core/main.css' />"
	rel='stylesheet' />
<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/daygrid/main.css' />"
	rel='stylesheet' />
<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/timegrid/main.css' />"
	rel='stylesheet' />
<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/list/main.css' />"
	rel='stylesheet' />
<script
	src="<c:url value='/resources/plugins/fullcalendar/vendor/rrule.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/core/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/interaction/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/daygrid/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/timegrid/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/list/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/rrule/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/core/locales-all.js' />"></script>
