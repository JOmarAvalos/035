<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">function iniciar(){}</script>

<script src="<c:url value='/resources/js/035/custionarios.js' />" type="text/javascript"></script>

<main class="l-main">
	<div class="content-wrapper pt-3">
		<div class="row align-items-end mt-3">
			<div class="col">
				<h2 class="subtitle">
					<span class="bold">NOM 035</span>
				</h2>
			</div>
		</div>
		<div class="row actividad align-items-center ">
			<div class="col">
				<span class="bold">${cuestionario.nombre}</span> 
				<hr>
			</div>
		</div>
		<div class="row" id="startExamen">
			<div class="col">
				<input type="hidden" id="idConsultaActividad">
					<h3>
						Estas a punto de comenzar el custionario <span class="bold">"${cuestionario.nombre}"</span>, una vez que inicies no debes cerrar la ventana hasta concluir con todas las preguntas.
					</h3>

				<button type="button" class="md-btn md-btn-main d-block mt-4 ml-0"
					onclick="startCuestionario();">Comenzar <i class="fas fa-rocket ml-2"></i></button>
			</div>
		</div>

		<c:if test="${not empty cuestionario.preguntas}">
			<c:set var="count" value="1" scope="page" />
			<c:forEach items="${cuestionario.preguntas}"
				var="pregunta">
				<div id="pregunta${count}" style="display: none;background:#a4a4a4;" class="examen container-fluid" >
					<c:set var="countActual" value="${count}" scope="page" />
					<c:set var="count" value="${count + 1}" scope="page" />
					<div class="row bg-white">
						<div class="col">
							<h2 class="bold uppercase mt-2 mb-4">${pregunta.seccion}</h2>
						</div>
						<div class="col">
							<h4 class="bold uppercase mt-2 mb-4">${pregunta.titulo}</h4>
						</div>
						<div class="col">
							<h6 class="bold uppercase mt-2 mb-4">${pregunta.nombre}</h6>
						</div>
					</div>
					<c:if test="${pregunta.idPreguntaTipo == 3}">
						<div class="row">
							<div class="col" >
								<textarea rows="3" cols="10" id="ta${pregunta.id}"></textarea>
							</div>
						</div>
					</c:if>
					<c:if
						test="${pregunta.idPreguntaTipo == 1 || pregunta.idPreguntaTipo == 2}">
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
					<div class="row bg-white">
						<div class="col">
							<button type="button" class="md-btn md-btn-main ml-0 mt-4 mb-3"
								onclick="saveRespuesta('${countActual}','${count}','${pregunta.idPreguntaTipo}', 
							'${cuestionario.preguntas.size()}','${pregunta.id}','${pregunta.respuestas.size()}');">Siguiente <i class="fas fa-arrow-right ml-2"></i></button>								
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
					<h5 class="regular my-4 txt-graytrd">Has concluido con el cuestionario
					<span class="bold italic txt-gray">"${cuestionario.nombre}"</span></h5>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<button type="button" class="md-btn md-btn-main ml-0"
						onclick="terminaActividadExamen(${actividadVO.idCurso}, '${planName}', '${certificadoName}', '${cursoName}', ${idInscripcion}, ${planId}, '${actividadVO.id}', '${idCertificado}');" >Terminar <i class="fas fa-check ml-2"></i></button>
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
					Advertencia
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
				<button type="button" class="md-btn md-btn-close "
					data-dismiss="modal">Cerrar</button>
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
