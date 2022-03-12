<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value='/resources/js/insumos/insumoActividad.js' />" type="text/javascript"></script>

<main class="l-main">
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="#" onclick="terminaActividadExamen();">Insumos</a>
			</li>
		</ol>
	</nav>
	<div class="content-wrapper pt-3">

		<div class="row actividad align-items-center ">
			<div class="col">
				<h3>
					<span>${actividadVO.nombre}</span>
				</h3>
				<hr>
			</div>
		</div>
		
		<div class="row actividad align-items-center ">
			<div class="col">
				<h4>Descripci&oacute;n: <span>${actividadVO.descripcion}</span></h4>
				<hr>
			</div>
		</div>
		<div class="row" id="startExamen">
			<div class="col">
				<input type="hidden" id="idConsultaActividad">
				<span class="bold">Estas a punto de comenzar una nueva solicitud de insumos, una vez que inicies no
					debes cerrar la ventana o tu solicitud podria no guardarse de forma correcta.
				</span>

				<button type="button" class="md-btn md-btn-main d-block mt-4 ml-0"
					onclick="startExamen('${actividadVO.id}', '${actividadVO.idCiclo}');">Comenzar <i class="fas fa-rocket ml-2"></i></button>
			</div>
		</div>

		<c:if test="${not empty actividadVO.actividadExamenVO.preguntas}">
			<c:set var="count" value="1" scope="page" />
			<c:forEach items="${actividadVO.actividadExamenVO.preguntas}"
				var="pregunta">
				<div id="pregunta${count}" style="display: none;background:#f7f7f7;" class="examen container-fluid" >
					<c:set var="countActual" value="${count}" scope="page" />
					<c:set var="count" value="${count + 1}" scope="page" />
					<c:if test="${not empty pregunta.imagen}">
						<div class="row">
							<div class="col-md-12 img-examen">
								<img class="" src="${pregunta.imagen}" alt="Taller">
							</div>
						</div>
					</c:if>
					<div class="row bg-white">
						<div class="col">
							<h5 class="bold uppercase mt-2 mb-4">${pregunta.nombre}</h5>
						</div>
					</div>
					<div class="row bg-white">
						<div class="col">
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
										
										
										<label class="radio"> ${respuesta.nombre}  
											<input type="radio" id="check${pregunta.id}" name="check${pregunta.id}" value="${respuesta.id}"> 
											<span class="checkround"></span>
										</label>
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
											<label> ${respuesta.nombre} <input type="checkbox"
												id="check${pregunta.id}" name="check${pregunta.id}"
												value="${respuesta.id}"> <span></span>
											</label>
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
											<label for="staticEmail" class="col-sm-8 col-form-label pl-0" style="line-height:2.3;">${respuesta.nombre}</label>
										</div>



									</div>
									<div class="col-md-6" style="background:#eaeaea;">
										<input  type="hidden" id="iptDerecha${pregunta.id}${countRespShow}" value="${respuesta.auxIdRespuestaCorrecta}">
										<span class="my-2 d-inline-block"><span class="bold mr-1 txt-secondary">${countRespShow} -</span> ${respuesta.nombre2} </span>
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
							'${actividadVO.actividadExamenVO.preguntas.size()}','${pregunta.id}','${pregunta.respuestas.size()}');">Siguiente <i class="fas fa-arrow-right ml-2"></i></button>								
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
					<h5 class="regular my-4 txt-graytrd">Haz concluido con la solicitud 
						<span class="bold italic txt-gray">"${actividadVO.nombre}"</span></h5>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<button type="button" class="md-btn md-btn-main ml-0 mt-4 mb-3" onclick="terminaActividadExamen();">Salir <i class="fas fa-arrow-right ml-2"></i></button>
						<hr>
				</div>
			</div>
		</div>

	</div>
</main>


<div class="modal fade" id="modalAdvertenciaExamen" tabindex="-1"
	role="dialog" aria-labelledby="modalAdvertenciaExamen" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header">
				<h4 class="modal-title txt-orange uppercase bold text-center">
				 <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
				 <br> Advertencia
				 </h4>
			</div>
	        <div class="modal-body">
	            <div class="row my-4">
	
	                <div class="col">
	                	<p class="bold" id="pMsjAdvertenciaExamen"></p>
	                </div>
	            </div>
	            <hr>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal">Cerrar</button>
            </div>

        </div>
    </div>
</div>
