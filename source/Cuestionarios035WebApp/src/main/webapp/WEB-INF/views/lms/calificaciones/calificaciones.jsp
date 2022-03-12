<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<main class="l-main">
<nav aria-label="breadcrumb" role="navigation">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#"><spring:message code="lms.calificaciones.title" /></a></li>
	</ol>
</nav>
<div class="content-wrapper h-100 calificaciones">

	<div class="row justify-content-center">
		<div class="col-12 mb-4">
			<h2 class="subtitle"><spring:message code="lms.calificaciones.title" /></h2>
		</div>
		<input type="hidden" id="idMonitoreoActividad" value="${idMonitoreoActividad}">
		<div class="col">
			<!-- TABS -->
			<ul class="nav nav-tabs mb-4" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					id="inscribir-tab" data-toggle="tab" href="#inscribir-content"
					role="tab" aria-controls="inscribir-content" aria-selected="true">
						<i class="fas fa-vote-yea"></i> <span><spring:message code="lms.calificaciones.carrera.actual" /></span>
				</a></li>
				<li class="nav-item"><a class="nav-link" id="inscritos-tab"
					data-toggle="tab" href="#inscritos-content" role="tab"
					aria-controls="inscritos-content" aria-selected="false"> <i
						class="fas fa-paste"></i> <span><spring:message code="lms.calificaciones.carrera.anterior" /> </span>
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
						<c:if test="${not empty lstCursosActuales}">
							<c:forEach items="${lstCursosActuales}" var="curso"
								varStatus="loop">
								<div class="card modulo-container">
									<div id="heading${curso.idInscripcion}">
										<div class="califica-head-mods" data-toggle="collapse"
											data-target="#collapse${curso.idInscripcion}" aria-expanded="true"
											aria-controls="collapse${curso.idInscripcion}">
											<table class="table table-cal">
												<thead>
													<tr>
														<th scope="col" width="37%">
															<div class="titulo-modulo">
																<h3>
																	<span>${curso.curso}</span> 
																</h3>
																<c:if test="${curso.estatus == 5}">
																	<span> <i class="fas fa-check"></i> <spring:message code="lms.calificaciones.carrera.actual.aprobado" /> </span>
																</c:if>
															</div>
														</th>
														<th scope="col" width="25%">
															<div class=" fin-curso">
																<span><spring:message code="lms.calificaciones.carrera.actual.fecha.incio" /></span>
															</div>
														</th>
														<th scope="col" width="24%">
															<div class=" fin-curso">
																<span><spring:message code="lms.calificaciones.carrera.actual.fecha.termino" /></span>
															</div>
														</th>
														<th scope="col" width="10%">
															<div class=" cal-curso">${curso.calificacion}</div>
														</th>
														<th>
															<div class="down-accordion">
																<i class="fa" aria-hidden="true"></i>
															</div>
														</th>
													</tr>
												</thead>
											</table>
										</div>
									</div>

									<!-- ====CURSO 1 BODY==== -->
									<div id="collapse${curso.idInscripcion}" class="collapse show" role="tabpanel"
										aria-labelledby="heading${curso.idInscripcion}" data-parent="#accordion">
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-striped table-cal">
													<tbody>
														<c:if test="${not empty curso.detalleActividades}">
															<c:forEach items="${curso.detalleActividades}"
																var="actividad" varStatus="loop">
																<tr>
																	<td width="19%">${actividad.nombre}</td>
																	<c:if
																		test="${actividad.consultaActividad.idEstatus == 1}">
																		<td width="18%">&nbsp;</td>
																	</c:if>
																	<c:if
																		test="${actividad.consultaActividad.idEstatus == 2}">
																		<td width="18%"><i class="fas fa-check"></i></td>
																	</c:if>
																	<td width="25%"><fmt:formatDate
																			pattern="dd-MM-yyyy" value="${actividad.consultaActividad.creacion}" 
																		 /></td>
																	<td width="24%"><fmt:formatDate
																			pattern="dd-MM-yyyy"
																			value="${actividad.consultaActividad.modificacion}" /></td>

																	<td width="10%">${actividad.consultaActividad.calificacion} %</td>
																	<td>&nbsp;</td>
																</tr>
															</c:forEach>
														</c:if>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>

				</div>

				<!-- ====TAB INSCRITOS==== -->

				<div class="tab-pane fade" id="inscritos-content" role="tabpanel"
					aria-labelledby="inscritos-tab">
					<div id="accordion" role="tablist">
						<!-- ====CURSO 1 HEADER==== -->
						<c:if test="${not empty lstCursosAnteriores}">
							<c:forEach items="${lstCursosAnteriores}" var="cursoAnterior"
								varStatus="loop">
								<div class="card modulo-container">
									<div id="headingOne">
										<div class="califica-head-mods" data-toggle="collapse"
											data-target="#collapseOne" aria-expanded="true"
											aria-controls="collapseOne">
											<table class="table table-cal">
												<thead>
													<tr>
														<th scope="col" width="37%">
															<div class="titulo-modulo">
																<h3>
																	<span><spring:message code="lms.calificaciones.carrera.anterior.modulo" /></span> ${cursoAnterior.nombre}
																</h3>
																<span> <i class="fas fa-check"></i> <spring:message code="lms.calificaciones.carrera.anterior.completado" />
																</span>
															</div>
														</th>
														<th scope="col" width="25%">
															<div class=" fin-curso">
																<span><spring:message code="lms.calificaciones.carrera.anterior.fecha.inicio" /></span>
															</div>
														</th>
														<th scope="col" width="24%">
															<div class=" fin-curso">
																<span><spring:message code="lms.calificaciones.carrera.anterior.fecha.termino" /></span>
															</div>
														</th>
														<th scope="col" width="10%">
															<div class=" cal-curso">${cursoAnterior.porcentaje} %</div>
														</th>
														<th>
															<div class="down-accordion">
																<i class="fa" aria-hidden="true"></i>
															</div>
														</th>
													</tr>
												</thead>
											</table>
										</div>
									</div>

									<!-- ====CURSO 1 BODY==== -->
									<div id="collapseOne" class="collapse show" role="tabpanel"
										aria-labelledby="headingOne" data-parent="#accordion">
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-striped table-cal">
													<tbody>
														<c:if test="${not empty cursoAnterior.actividadVOLst}">
															<c:forEach items="${cursoAnterior.actividadVOLst}"
																var="actividadCursoAnterior" varStatus="loop">
																<tr>
																	<td width="19%">${actividadCursoAnterior.nombre}</td>
																	<c:if
																		test="${actividadCursoAnterior.consultaActividad.idEstatus == 1}">
																		<td width="18%">&nbsp;</td>
																	</c:if>
																	<c:if
																		test="${actividadCursoAnterior.consultaActividad.idEstatus == 2}">
																		<td width="18%"><i class="fas fa-check"></i></td>
																	</c:if>
																	<td width="25%"><fmt:formatDate
																			pattern="dd-MM-yyyy" value="${actividadCursoAnterior.consultaActividad.creacion}" 
																		 /></td>
																	<td width="24%"><fmt:formatDate
																			pattern="dd-MM-yyyy"
																			value="${actividadCursoAnterior.consultaActividad.modificacion}" /></td>

																	<c:if
																		test="${actividadCursoAnterior.consultaActividad.idEstatus == 1}">
																		<td width="10%">0 %</td>
																	</c:if>
																	<c:if
																		test="${actividadCursoAnterior.consultaActividad.idEstatus == 2}">
																		<td width="10%">100 %</td>
																	</c:if>
																	<td>&nbsp;</td>
																</tr>
															</c:forEach>
														</c:if>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${ empty lstCursosAnteriores}">
							<p><spring:message code="lms.calificaciones.carrera.anterior.msg" /></p>
						</c:if>
					</div>

				</div>
				<!-- ====TAB SOLICITUDES==== -->

				<div class="tab-pane fade" id="solicitudes-content" role="tabpanel"
					aria-labelledby="solicitudes-tab">3</div>
			</div>
		</div>
	</div>
</div>
</main>
<script>

$(document).ready(function() {
    function changeNumber() {
    	var idMonitoreoActividad=$("#idMonitoreoActividad").val();
    	
    	var urltxt=ctx+"/lms/calificaciones/updateMonitoreoActividad?id="+idMonitoreoActividad; 
    	$.ajax({
    		type : "POST",
    		url : urltxt,
    		contentType : "application/json",
    		beforeSend : function() {
    		},
    		complete : function() {
    		},
    		success : function(response) {
    			
    			if (response[0]) {				
    			} else {
    				$('#modalTxtRespuesta').html('');
    				$('#modalTxtRespuesta').append('Error');
    				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
    			}
    		},
    		error : function(msg) {
    		}
    	});
    }
    setInterval(changeNumber, 30000);
});
</script>