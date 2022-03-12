<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">function iniciar(){}</script>

<script src="<c:url value='/resources/js/lms/carrera/carreraActividad.js' />" type="text/javascript"></script>

<main class="l-main">
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="#" onclick="getMiCarreraMonitoreo();"><spring:message code="lms.carrera.title" /></a>
			</li>
			<li class="breadcrumb-item">
				<a href="#" onclick="getMiPlanMonitoreo(${planId});">${planName}</a>
			</li>
			<li class="breadcrumb-item">
				<a href="#" onclick="getMiCertificadoCursoMonitoreo(${actividadVO.idCurso}, '${planName}', '${certificadoName}', '${cursoName}', ${idInscripcion}, ${planId}, ${idCertificado});">${certificadoName} | ${cursoName}</a>
			</li>
			<li class="breadcrumb-item"><spring:message code="lms.carrera.actividad.encuesta.title" /> ${actividadVO.orden}
				
				<c:if test="${not empty locale}">
				    <c:if test="${fn:contains(locale, 'es')}">
				        ${actividadVO.tipoActividad.nombre}
				    </c:if>
				    <c:if test="${fn:contains(locale, 'en')}">
				        <c:if test="${not empty actividadVO.tipoActividad.nombreEn}">
				            ${actividadVO.tipoActividad.nombreEn}
				        </c:if>
				        <c:if test="${ empty actividadVO.tipoActividad.nombreEn}">
				            ${actividadVO.tipoActividad.nombre}
				        </c:if>
				    </c:if>
				    <c:if test="${fn:contains(locale, 'fr')}">
				        <c:if test="${not empty actividadVO.tipoActividad.nombreFr}">
				            ${actividadVO.tipoActividad.nombreFr}
				        </c:if>
				        <c:if test="${ empty actividadVO.tipoActividad.nombreFr}">
				            ${actividadVO.tipoActividad.nombre}
				        </c:if>
				    </c:if>
				</c:if>
				<c:if test="${empty locale}">
				    ${actividadVO.tipoActividad.nombre}
				</c:if>
			
			</li>
		</ol>
	</nav>
	<div class="content-wrapper pt-3">
	<input type="hidden" id="idMonitoreoActividadActi" value="${idMonitoreoActividadActi}">
    <input type="hidden" id="idMonitoreoActividadCursoPadre" value="${idMonitoreoActividadCursoPadre}">
    <input type="hidden" id="idMonitoreoActividadPadre" value="${idMonitoreoActividadPadre}">
		<div class="row align-items-end mt-3">
			<div class="col">
				<h2 class="subtitle">
					<span>${certificadoName}</span> ${cursoName}
				</h2>
			</div>
		</div>
		<div class="row actividad align-items-center ">
			<div class="col">
				<c:if test="${not empty locale}">
			    	<c:if test="${fn:contains(locale, 'es')}">
						<h3><spring:message code="lms.carrera.actividad.encuesta.title" /> ${actividadVO.orden} | <span>${actividadVO.nombre}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.encuesta.descripcion" /> <span>${actividadVO.descripcion}</span></h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'en')}">
						<h3><spring:message code="lms.carrera.actividad.encuesta.title" /> ${actividadVO.orden} | <span>${actividadVO.nombreEn}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.encuesta.descripcion" /> <span>${actividadVO.descripcionEn}</span></h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'fr')}">
						<h3><spring:message code="lms.carrera.actividad.encuesta.title" /> ${actividadVO.orden} | <span>${actividadVO.nombreFr}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.encuesta.descripcion" /> <span>${actividadVO.descripcionFr}</span></h3>
			    	</c:if>
			    </c:if>
			    <c:if test="${empty locale}">
						<h3><spring:message code="lms.carrera.actividad.encuesta.title" /> ${actividadVO.orden} | <span>${actividadVO.nombre}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.encuesta.descripcion" /> <span>${actividadVO.descripcion}</span></h3>
			    </c:if>
				<hr>
			</div>
		</div>
		<div class="row" id="startExamen">
			<div class="col">
				<input type="hidden" id="idConsultaActividad">
				<c:if test="${not empty locale}">
			    	<c:if test="${fn:contains(locale, 'es')}">
						<h3><spring:message code="lms.carrera.actividad.encuesta.inicio.msg1" /> <span
							class="bold">"${actividadVO.nombre}"</span><spring:message code="lms.carrera.actividad.encuesta.inicio.msg2" />
						</h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'en')}">
						<h3><spring:message code="lms.carrera.actividad.encuesta.inicio.msg1" /> <span
							class="bold">"${actividadVO.nombreEn}"</span><spring:message code="lms.carrera.actividad.encuesta.inicio.msg2" />
						</h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'fr')}">
						<h3><spring:message code="lms.carrera.actividad.encuesta.inicio.msg1" /> <span
							class="bold">"${actividadVO.nombreFr}"</span><spring:message code="lms.carrera.actividad.encuesta.inicio.msg2" />
						</h3>
			    	</c:if>
			    </c:if>
			    <c:if test="${empty locale}">
						<h3><spring:message code="lms.carrera.actividad.encuesta.inicio.msg1" /> <span
							class="bold">"${actividadVO.nombre}"</span><spring:message code="lms.carrera.actividad.encuesta.inicio.msg2" />
						</h3>
			    </c:if>

				<button type="button" class="md-btn md-btn-main d-block mt-4 ml-0"
					onclick="startExamen('${actividadVO.id}', '${idInscripcion}');"><spring:message code="lms.carrera.actividad.encuesta.btn.comenzar" /> <i class="fas fa-rocket ml-2"></i></button>
			</div>
		</div>

		<c:if test="${not empty actividadVO.actividadExamenVO.preguntas}">
			<c:set var="count" value="1" scope="page" />
			<c:forEach items="${actividadVO.actividadExamenVO.preguntas}"
				var="pregunta">
				<div id="pregunta${count}" style="display: none;background:#f7f7f7;" class="examen container-fluid" >
					<c:set var="countActual" value="${count}" scope="page" />
					<c:set var="count" value="${count + 1}" scope="page" />
					<div class="row bg-white">
						<div class="col">
							<c:if test="${not empty locale}">
						    	<c:if test="${fn:contains(locale, 'es')}">
									<h6 class="bold uppercase mt-2 mb-4">${pregunta.nombre}</h6>
						    	</c:if>
						    	<c:if test="${fn:contains(locale, 'en')}">
									<h6 class="bold uppercase mt-2 mb-4">${pregunta.nombreEn}</h6>
						    	</c:if>
						    	<c:if test="${fn:contains(locale, 'fr')}">
									<h6 class="bold uppercase mt-2 mb-4">${pregunta.nombreFr}</h6>
						    	</c:if>
						    </c:if>
						    <c:if test="${empty locale}">
									<h6 class="bold uppercase mt-2 mb-4">${pregunta.nombre}</h6>
						    </c:if>
						</div>
					</div>
					<c:if test="${pregunta.idTipoPregunta == 1}">
						<div class="row">
							<div class="col" >
								<textarea rows="3" cols="10" id="ta${pregunta.id}"></textarea>
							</div>
						</div>
					</c:if>
					<c:if
						test="${pregunta.idTipoPregunta == 2 || pregunta.idTipoPregunta == 3}">
						<c:if test="${not empty pregunta.respuestas}">
							<c:forEach items="${pregunta.respuestas}" var="respuesta">
								<div class="row">
									<div class="col my-2">
										
										<c:if test="${not empty locale}">
									    	<c:if test="${fn:contains(locale, 'es')}">
												<label class="radio"> ${respuesta.nombre}  
													<input type="radio" id="check${pregunta.id}" name="check${pregunta.id}" value="${respuesta.id}"> 
													<span class="checkround"></span>
												</label>
									    	</c:if>
									    	<c:if test="${fn:contains(locale, 'en')}">
												<label class="radio"> ${respuesta.nombreEn}  
													<input type="radio" id="check${pregunta.id}" name="check${pregunta.id}" value="${respuesta.id}"> 
													<span class="checkround"></span>
												</label>
									    	</c:if>
									    	<c:if test="${fn:contains(locale, 'fr')}">
												<label class="radio"> ${respuesta.nombreFr}  
													<input type="radio" id="check${pregunta.id}" name="check${pregunta.id}" value="${respuesta.id}"> 
													<span class="checkround"></span>
												</label>
									    	</c:if>
									    </c:if>
									    <c:if test="${empty locale}">
												<label class="radio"> ${respuesta.nombre}  
													<input type="radio" id="check${pregunta.id}" name="check${pregunta.id}" value="${respuesta.id}"> 
													<span class="checkround"></span>
												</label>
									    </c:if>
										
									</div>
								</div>
							</c:forEach>
						</c:if>
					</c:if>
					<c:if test="${pregunta.idTipoPregunta == 4}">
						<c:if test="${not empty pregunta.respuestas}">
							<c:forEach items="${pregunta.respuestas}" var="respuesta">
								<div class="row">
									<div class="col my-2" >

										<div class="chiller_cb">
											<c:if test="${not empty locale}">
										    	<c:if test="${fn:contains(locale, 'es')}">
													<label> ${respuesta.nombre} <input type="checkbox"
														id="check${pregunta.id}" name="check${pregunta.id}"
														value="${respuesta.id}"> <span></span>
													</label>
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'en')}">
													<label> ${respuesta.nombreEn} <input type="checkbox"
														id="check${pregunta.id}" name="check${pregunta.id}"
														value="${respuesta.id}"> <span></span>
													</label>
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'fr')}">
													<label> ${respuesta.nombreFr} <input type="checkbox"
														id="check${pregunta.id}" name="check${pregunta.id}"
														value="${respuesta.id}"> <span></span>
													</label>
										    	</c:if>
										    </c:if>
										    <c:if test="${empty locale}">
													<label> ${respuesta.nombre} <input type="checkbox"
														id="check${pregunta.id}" name="check${pregunta.id}"
														value="${respuesta.id}"> <span></span>
													</label>
										    </c:if>
										</div>

									</div>
								</div>
							</c:forEach>
						</c:if>
					</c:if>
					<c:if test="${pregunta.idTipoPregunta == 5}">
						<c:if test="${not empty pregunta.respuestas}">
							<c:set var="countResp" value="0" scope="page" />
							<c:set var="countRespShow" value="1" scope="page" />
							<c:forEach items="${pregunta.respuestas}" var="respuesta">
								<div class="row" >
									<div class="col-md-6" style="background:#f7f7f7;">


										<div class="row">
											<div class="col-sm-2">
												<input type="hidden"
													id="iptIzquierda${pregunta.id}${countResp}"
													value="${respuesta.id}"> <input
													class="my-2 form-control" type="number"
													placeholder="--" min="1"
													max="${pregunta.respuestas.size()}"
													id="iptRelacion${pregunta.id}${countResp}">
											</div>
											<c:if test="${not empty locale}">
										    	<c:if test="${fn:contains(locale, 'es')}">
													<label for="staticEmail" class="col-sm-8 col-form-label pl-0" style="line-height:2.3;">${respuesta.nombre}</label>
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'en')}">
													<label for="staticEmail" class="col-sm-8 col-form-label pl-0" style="line-height:2.3;">${respuesta.nombreEn}</label>
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'fr')}">
													<label for="staticEmail" class="col-sm-8 col-form-label pl-0" style="line-height:2.3;">${respuesta.nombreFr}</label>
										    	</c:if>
										    </c:if>
										    <c:if test="${empty locale}">
													<label for="staticEmail" class="col-sm-8 col-form-label pl-0" style="line-height:2.3;">${respuesta.nombre}</label>
										    </c:if>
										</div>



									</div>
									<div class="col-md-6" style="background:#eaeaea;">
										<input  type="hidden" id="iptDerecha${pregunta.id}${countRespShow}" value="${respuesta.auxIdRespuestaCorrecta}">
											<c:if test="${not empty locale}">
										    	<c:if test="${fn:contains(locale, 'es')}">
													<span class="my-2 d-inline-block"><span class="bold mr-1 txt-secondary">${countRespShow} -</span> ${respuesta.nombre2} </span>
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'en')}">
													<span class="my-2 d-inline-block"><span class="bold mr-1 txt-secondary">${countRespShow} -</span> ${respuesta.nombre2En} </span>
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'fr')}">
													<span class="my-2 d-inline-block"><span class="bold mr-1 txt-secondary">${countRespShow} -</span> ${respuesta.nombre2Fr} </span>
										    	</c:if>
										    </c:if>
										    <c:if test="${empty locale}">
													<span class="my-2 d-inline-block"><span class="bold mr-1 txt-secondary">${countRespShow} -</span> ${respuesta.nombre2} </span>
										    </c:if>
									</div>
								</div>
								<c:set var="countResp" value="${countResp+1}" scope="page" />
								<c:set var="countRespShow" value="${countRespShow+1}" scope="page" />
							</c:forEach>
						</c:if>
					</c:if>
					<div class="row bg-white">
						<div class="col">
							<button type="button" class="md-btn md-btn-main ml-0 mt-4 mb-3"
								onclick="saveRespuesta('${countActual}','${count}','${pregunta.idTipoPregunta}', 
							'${actividadVO.actividadExamenVO.preguntas.size()}','${pregunta.id}','${pregunta.respuestas.size()}');"><spring:message code="lms.carrera.actividad.encuesta.btn.siguiente" /> <i class="fas fa-arrow-right ml-2"></i></button>								
						</div>
												
					</div>
					
				</div>
			</c:forEach>
		</c:if>
<hr>
		<div id="endExamen" style="display: none;">
			<input type="hidden" id="iptCalificacionExamen" value="100">
			<div class="row">
				<div class="col">
					<c:if test="${not empty locale}">
				    	<c:if test="${fn:contains(locale, 'es')}">
							<h5 class="regular my-4 txt-graytrd"><spring:message code="lms.carrera.actividad.encuesta.concluido.msg" />
								<span class="bold italic txt-gray">"${actividadVO.nombre}"</span></h5>
				    	</c:if>
				    	<c:if test="${fn:contains(locale, 'en')}">
							<h5 class="regular my-4 txt-graytrd"><spring:message code="lms.carrera.actividad.encuesta.concluido.msg" />
								<span class="bold italic txt-gray">"${actividadVO.nombreEn}"</span></h5>
				    	</c:if>
				    	<c:if test="${fn:contains(locale, 'fr')}">
							<h5 class="regular my-4 txt-graytrd"><spring:message code="lms.carrera.actividad.encuesta.concluido.msg" />
								<span class="bold italic txt-gray">"${actividadVO.nombreFr}"</span></h5>
				    	</c:if>
				    </c:if>
				    <c:if test="${empty locale}">
							<h5 class="regular my-4 txt-graytrd"><spring:message code="lms.carrera.actividad.encuesta.concluido.msg" />
								<span class="bold italic txt-gray">"${actividadVO.nombre}"</span></h5>
				    </c:if>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<button type="button" class="md-btn md-btn-main ml-0"
						onclick="terminaActividadExamen(${actividadVO.idCurso}, '${planName}', '${certificadoName}', '${cursoName}', ${idInscripcion}, ${planId}, '${actividadVO.id}', '${idCertificado}');" ><spring:message code="lms.carrera.actividad.encuesta.btn.terminar" /> <i class="fas fa-check ml-2"></i></button>
						<hr>
				</div>
			</div>
		</div>

		<div id="divCalificacion" style="display: none;">
			<div class="row">
				<div class="col">
					<h5 class="bold my-4 txt-graytrd"><spring:message code="lms.carrera.actividad.encuesta.calificacion" /> 
					<span style="font-size:1.2em;" class="txt-gray ml-2" id="spanCalifExamen"></span></h5>
				</div>
			</div>
			<div class="row">
				<div class="col">
						<hr>
				</div>
			</div>
		</div>

	</div>
</main>


<div class="modal fade" id="modalAdvertenciaExamen" tabindex="-1"
	role="dialog" aria-labelledby="modalAdvertenciaExamen"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header">
				<h4 class="modal-title txt-orange uppercase bold text-center">
					<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> <br>
					<spring:message code="lms.carrera.actividad.examen.advertencia" />
				</h4>
			</div>
			<div class="modal-body">
				<div class="row my-4">

					<div class="col">
					
						<c:if test="${not empty locale}">
						    <c:if test="${fn:contains(locale, 'es')}">
						        <p class="bold" id="pMsjAdvertenciaExamen"></p>
						    </c:if>
						    <c:if test="${fn:contains(locale, 'en')}">
						        <p class="bold" id="pMsjAdvertenciaExamenEn"></p>
						    </c:if>
						    <c:if test="${fn:contains(locale, 'fr')}">
						        <p class="bold" id="pMsjAdvertenciaExamenFr"></p>
						    </c:if>
						</c:if>
						<c:if test="${empty locale}">
						        <p class="bold" id="pMsjAdvertenciaExamen"></p>
						</c:if>

						
					</div>
				</div>
				<hr>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="md-btn md-btn-close "
					data-dismiss="modal"><spring:message code="lms.carrera.actividad.examen.btn.cerrar" /></button>
			</div>

		</div>
	</div>
</div>

<script>


$(document).ready(function() {
    function changeNumber() {
    	var idMonitoreoActividadActi=$("#idMonitoreoActividadActi").val();
    	if(idMonitoreoActividadActi > 0){
    	var urltxt=ctx+"/lms/carrera/updateMonitoreoActividad?id="+idMonitoreoActividadActi; 
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
