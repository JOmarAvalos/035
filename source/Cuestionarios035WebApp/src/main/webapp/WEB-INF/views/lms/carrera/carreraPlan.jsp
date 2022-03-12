<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="<c:url value='/resources/js/lms/carrera/carreraPlan.js' />"
	type="text/javascript"></script>
<style>
	#divBuscaPlanes {
		overflow: hidden;
	}
	
	.sticky {
	  position: fixed;
	  top: 45px;
	  z-index: 9;
	  background-color: #EAECEE;
	  width: 100%;
	  height: 100px; 
	}
	
</style>
<main class="l-main">
<nav aria-label="breadcrumb" role="navigation">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">
			<!-- <a href="#" onclick="getMiCarrera();">Mi carrera</a> --> <a
			href="#" onclick="getMiCarreraMonitoreo();"><spring:message code="lms.carrera.title" /></a>

		</li>
		<li class="breadcrumb-item">${planCarreraVO.nombre}</li>
	</ol>
</nav>

<div class="content-wrapper pt-3" id="contentPlanes">

	<div>
		<input type="hidden" id="idMonitoreoActividad"
			value="${idMonitoreoActividad}">
		<input type="hidden" id="busquedaActual">
		<input type="hidden" id="indexActual">
		<input type="hidden" id="busquedasTodas">
		<div class="row">
			<div class="col">
				<div class="cover-plan">
					<c:if test="${empty planCarreraVO.imagen}">
						<img src="<c:url value='/resources/css/img/taller.jpg' />" alt="Taller">
					</c:if>
					<c:if test="${not empty planCarreraVO.imagen}">
						<img src="<c:url value='/downloadImage?param=${planCarreraVO.imagen}'/>" alt="User">
					</c:if>
					<div class="title-carrera">
						<p><spring:message code="lms.carrera.plan.title" /></p>
						<c:if test="${not empty locale}">
					    	<c:if test="${fn:contains(locale, 'es')}">
								<h3>${planCarreraVO.nombre}</h3>
					    	</c:if>
					    	<c:if test="${fn:contains(locale, 'en')}">
								<h3>${planCarreraVO.nombreEn}</h3>
					    	</c:if>
					    	<c:if test="${fn:contains(locale, 'fr')}">
								<h3>${planCarreraVO.nombreFr}</h3>
					    	</c:if>
					    </c:if>
					    <c:if test="${empty locale}">
					    	<h3>${planCarreraVO.nombre}</h3>
					    </c:if>
					</div>
				</div>
			</div>
		</div>
	
		<!-- PROGRESS BAR -->
		<div class="row ">
			<div class="col mt-3 mb-1">
				<div class="progress">
					<div class="progress-bar"
						style="width: ${planCarreraVO.progreso }%;">
						<div class="progress-value animated swing">${planCarreraVO.progreso }%</div>
					</div>
				</div>
			</div>
		</div>
		<!-- MIS CERTIFICADOS POR PLAN DE CARRERA -->
	
		<div id="divBuscaPlanes">
			<br>
			<div class="row">
				<div class="col-3">
					<label for="iptSearchInPlan"><spring:message code="lms.planCapacitacion.plan.buscar" /></label>
					<input type="text" class="form-control" id="iptSearchInPlan" placeholder="<spring:message code="lms.planCapacitacion.plan.buscar.hold" />">
				</div>
				<div class="col-3">
					<button type="button" class="md-btn md-btn-main" onclick="javascript:search();"><spring:message code="lms.planCapacitacion.plan.buscar.btn" /></button>
				</div>
			</div>
			<hr>
		</div>
	</div>
	
	<div class="row" style="position:absolute;top:350px;overflow:auto;height:60%;">
		<div class="col-12">
			<div id="accordion">
				<c:if test="${not empty planCarreraVO.planCarreraCertificadoVOLst}">
					<c:forEach items="${planCarreraVO.planCarreraCertificadoVOLst}"
						var="planCarreraCertificadoVO" varStatus="loopPlanCertificados">
						<div class="card modulo-container">
							<div id="headingOne">
								<h4 >

									<c:if test="${not empty locale}">
								    	<c:if test="${fn:contains(locale, 'es')}">
											${planCarreraCertificadoVO.certificado.nombre}	
								    	</c:if>
								    	<c:if test="${fn:contains(locale, 'en')}">
								    		<c:if test="${not empty planCarreraCertificadoVO.certificado.nombreEn}">
												${planCarreraCertificadoVO.certificado.nombreEn}
								    		</c:if>
								    		<c:if test="${ empty planCarreraCertificadoVO.certificado.nombreEn}">
												${planCarreraCertificadoVO.certificado.nombre}
								    		</c:if>
								    	</c:if>
								    	<c:if test="${fn:contains(locale, 'fr')}">
								    		<c:if test="${not empty planCarreraCertificadoVO.certificado.nombreFr}">
												${planCarreraCertificadoVO.certificado.nombreFr}
								    		</c:if>
								    		<c:if test="${ empty planCarreraCertificadoVO.certificado.nombreFr}">
												${planCarreraCertificadoVO.certificado.nombre}
								    		</c:if>
								    	</c:if>
								    </c:if>
								    <c:if test="${empty locale}">
								    	${planCarreraCertificadoVO.certificado.nombre}	
								    </c:if>
																	
									<!--agregar condicion para mostrar el boton  -->
									<c:if
										test="${not empty planCarreraCertificadoVO.certificado.idPlantilla}">
											<button type="button" class="md-btn md-btn-secondary mt-1"
												onclick="descargaCertificado('${planCarreraCertificadoVO.certificado.id}');"
												style="float: right; margin-right: 119px;"><spring:message code="lms.carrera.plan.certificado.btn.descargar" /></button>
									</c:if>
									<div class="up-accordion" data-toggle="collapse" data-target="#collapse${planCarreraCertificadoVO.id}"
									aria-expanded="true" aria-controls="collapseOne">
										<i class="fa" aria-hidden="true"></i>
									</div>
								</h4>
							</div>
							<div id="collapse${planCarreraCertificadoVO.id}" class="collapse show"
								aria-labelledby="headingOne" data-parent="#accordion">
								<div class="row justify-content-center">
									<c:if
										test="${not empty planCarreraCertificadoVO.certificado.certificadoCursoVOLst}">
										<c:forEach
											items="${planCarreraCertificadoVO.certificado.certificadoCursoVOLst}"
											var="certificadoCursoVO" varStatus="loopCertificadoCurso">
											<div class="col-lg-3 col-sm-6">
												<div class="curso-card" id="div-CC${certificadoCursoVO.id}">
													<div class="curso-card-header">
														<div class="progress progress-curso">

															<div class="progress-bar"
																style="width: ${certificadoCursoVO.curso.porcentaje}%">${certificadoCursoVO.curso.porcentaje}%</div>

														</div>
														<c:if test="${not empty locale}">
													    	<c:if test="${fn:contains(locale, 'es')}">
																<h3 data-toggle="tooltip" data-placement="top" title="${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombre}">${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombre}</h3>
													    	</c:if>
													    	<c:if test="${fn:contains(locale, 'en')}">
																<c:if test="${not empty certificadoCursoVO.curso.nombreEn}">
																	<h3 data-toggle="tooltip" data-placement="top" title="${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombreEn}">${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombreEn}</h3>
																</c:if>
																<c:if test="${ empty certificadoCursoVO.curso.nombreEn}">
																	<h3 data-toggle="tooltip" data-placement="top" title="${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombre}">${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombre}</h3>
																</c:if>
													    	</c:if>
													    	<c:if test="${fn:contains(locale, 'fr')}">
																<c:if test="${not empty certificadoCursoVO.curso.nombreFr}">
																	<h3 data-toggle="tooltip" data-placement="top" title="${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombreFr}">${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombreFr}</h3>
																</c:if>
																<c:if test="${ empty certificadoCursoVO.curso.nombreFr}">
																	<h3 data-toggle="tooltip" data-placement="top" title="${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombre}">${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombre}</h3>
																</c:if>
													    	</c:if>
													    </c:if>
													    <c:if test="${empty locale}">
																<h3 data-toggle="tooltip" data-placement="top" title="${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombre}">${certificadoCursoVO.curso.codigo} - ${certificadoCursoVO.curso.nombre}</h3>
													    </c:if>

													</div>
													<div class="curso-card-body ">
														<p class="status-curso terminado">
															<c:choose>
																<c:when
																	test="${certificadoCursoVO.curso.auxVisible == 0 }">
																			<spring:message code="lms.carrera.plan.certificado.pendiente" />
																		</c:when>
																<c:when
																	test="${certificadoCursoVO.curso.auxVisible == 1 }">
																			<spring:message code="lms.carrera.plan.certificado.inscrito" />
																		</c:when>
																<c:when
																	test="${certificadoCursoVO.curso.auxVisible == 2 }">
																			<spring:message code="lms.carrera.plan.certificado.completo" />
																		</c:when>
																<c:otherwise>

																</c:otherwise>
															</c:choose>

														</p>

														<p class="datos-curso">
															<span data-toggle="tooltip" data-placement="top" title="Incio"> 
																<i class="fas fa-calendar-alt"></i>${certificadoCursoVO.curso.auxFechaInciio}
															</span> 
															<span data-toggle="tooltip" data-placement="top" title="Tipo"> 
																<i class="fas fa-tv"></i> ${certificadoCursoVO.curso.tipoCurso.nombre}
															</span> 
															<span data-toggle="tooltip" data-placement="top" title="Fin"> 
																<i class="fas fa-calendar-check"></i>${certificadoCursoVO.curso.auxFechaFin}
															</span>
															<span data-toggle="tooltip" data-placement="top" title="Calificacion"> 
																<i class="fas fa-graduation-cap"></i>${certificadoCursoVO.curso.porcentaje}% 
															</span>
														</p>

														<c:if test="${certificadoCursoVO.curso.auxVisible == 1}">
															<button class="md-btn btn-curso-action"
																onclick="getCurso(${certificadoCursoVO.idCurso},'${planCarreraCertificadoVO.certificado.id}','${certificadoCursoVO.curso.idInscripcion}','${planCarreraVO.id}')"><spring:message code="lms.carrera.plan.certificado.btn.ver" /></button>

														</c:if>
														<c:if test="${certificadoCursoVO.curso.auxVisible == 2  }">
															<button class="md-btn btn-curso-action"
																onclick="getCurso(${certificadoCursoVO.idCurso},'${planCarreraCertificadoVO.certificado.id}','${certificadoCursoVO.curso.idInscripcion}','${planCarreraVO.id}')"><spring:message code="lms.carrera.plan.certificado.btn.ver" /></button>

														</c:if>
														<c:if test="${not empty certificadoCursoVO.curso.idReInscripcion}">
																<br>
																<button class="md-btn btn-curso-action" onclick="getCurso(${certificadoCursoVO.curso.idCursoRevalidacion}, '${planCarreraCertificadoVO.certificado.id}','${certificadoCursoVO.curso.idReInscripcion}','${planCarreraVO.id}')">Recertificar</button>
														
														</c:if>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<!-- <div class="card modulo-container">
						<div id="headingTwo">
							<h4 class="collapsed" data-toggle="collapse"
								data-target="#collapseTwo" aria-expanded="false"
								aria-controls="collapseTwo">
								MÃ³dulo 2
								<div class="up-accordion">
									<i class="fa" aria-hidden="true"></i>
								</div>
							</h4>
						</div>
						<div id="collapseTwo" class="collapse"
							aria-labelledby="headingTwo" data-parent="#accordion">
							<div class="row justify-content-center">
								<div class="col-lg-4 col-sm-6">
									<div class="curso-card">
										<div class="curso-card-header">
											<div class="progress progress-curso">
												<div class="progress-bar" style="width: 0%">0%</div>
											</div>
											<h3>Curso A</h3>
										</div>
										<div class="curso-card-body ">
											<p class="status-curso">Pendiente</p>
											<p class="datos-curso">
												<span data-toggle="tooltip" data-placement="top"
													title="Incio">
													<i class="fas fa-calendar-alt"></i>
													12-03-2020
												</span>
												<span data-toggle="tooltip" data-placement="top"
													title="Tipo">
													<i class="fas fa-tv"></i>
													Online
												</span>
												<span data-toggle="tooltip" data-placement="top"
													title="Terminado">
													<i class="fas fa-calendar-check"></i>
													15-03-2020
												</span>
												<span data-toggle="tooltip" data-placement="top"
													title="Calificacion">
													<i class="fas fa-graduation-cap"></i>
													85 %
												</span>
											</p>
											<p class="seriado clearfix" data-toggle="tooltip"
												data-placement="top" title="Seriado">
												<i class="fas fa-bezier-curve"></i>
											</p>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-6">
									<div class="curso-card">
										<div class="curso-card-header">
											<div class="progress progress-curso">
												<div class="progress-bar" style="width: 0%">0%</div>
											</div>
											<h3>Curso B</h3>
										</div>
										<div class="curso-card-body">
											<p class="status-curso">Pendiente</p>
											<p class="datos-curso">
												<span data-toggle="tooltip" data-placement="top"
													title="Incio">
													<i class="fas fa-calendar-alt"></i>
													12-03-2020
												</span>
												<span data-toggle="tooltip" data-placement="top"
													title="Tipo">
													<i class="fas fa-tv"></i>
													Online
												</span>
												<span data-toggle="tooltip" data-placement="top"
													title="Tiempo">
													<i class="far fa-clock"></i>
													Indefinido
												</span>
												<span data-toggle="tooltip" data-placement="top"
													title="Calificacion">
													<i class="fas fa-link"></i>
													<a href="#"> www.cursos.megadealer.com/curso#2</a>
												</span>
											</p>
											<button class="md-btn btn-curso-action">Reanudar</button>
											<p class="seriado clearfix" data-toggle="tooltip"
												data-placement="top" title="Seriado">
												<i class="fas fa-bezier-curve"></i>
											</p>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-sm-6">
									<div class="curso-card">
										<div class="curso-card-header">
											<div class="progress progress-curso">
												<div class="progress-bar" style="width: 0%">0%</div>
											</div>
											<h3>Curso C</h3>
										</div>
										<div class="curso-card-body">
											<p class="status-curso">Pendiente</p>
											<p class="datos-curso">
												<span data-toggle="tooltip" data-placement="top"
													title="Incio">
													<i class="fas fa-calendar-alt"></i>
													12-03-2020
												</span>
												<span data-toggle="tooltip" data-placement="top"
													title="Tipo">
													<i class="fas fa-tv"></i>
													Online
												</span>
												<span data-toggle="tooltip" data-placement="top"
													title="Tiempo">
													<i class="far fa-clock"></i>
													Indefinido
												</span>
												<span data-toggle="tooltip" data-placement="top"
													title="Calificacion">
													<i class="fas fa-synagogue"></i>
													Sala de juntas 1, edificio B
												</span>
											</p>
											<button class="md-btn btn-curso-action">Reanudar</button>
											<p class="seriado clearfix" data-toggle="tooltip"
												data-placement="top" title="Seriado">
												<i class="fas fa-bezier-curve"></i>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div> -->

			</div>
		</div>
	</div>
</div>
</main>
<div class="modal fade" id="modalRespuesta" tabindex="-1" role="dialog"
	aria-labelledby="modalRespuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"><spring:message code="lms.carrera.plan.certificado.title" /></h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<div class="box-body">
						<h4 id="modalTxtRespuesta" style="color: black;"></h4>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal"><spring:message code="lms.carrera.plan.certificado.btn.aceptar" /></button>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">

	var navbar = document.getElementById("divBuscaPlanes");
	var positionDiv = navbar.offsetTop;
	
	$('#contentPlanes').scroll(function(){
		 if($('#contentPlanes').scrollTop() >= positionDiv){
			 $("#divBuscaPlanes").addClass("sticky");
		 }else{
			 $("#divBuscaPlanes").removeClass("sticky");
		 }
	});
</script>
<script>

$(document).ready(function() {
    function changeNumber() {
    	var idMonitoreoActividad=$("#idMonitoreoActividad").val();
    	if(idMonitoreoActividad > 0){
    	var urltxt=ctx+"/lms/carrera/updateMonitoreoActividad?id="+idMonitoreoActividad; 
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
    			}
    		},
    		error : function(msg) {
    		}
    	});
    }
}
    setInterval(changeNumber, 30000);
});
</script>