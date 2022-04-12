<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
		<div class="row" id="startExamen">
			<div class="col">
				<input type="hidden" id="idConsultaActividad">
				<h3>
					Estas a punto de contestar los siguientes cuestionarios: 
				</h3>
			</div>
		</div>

		<div id="cuestionario" style="background:#a4a4a4;" class="examen container-fluid" >
			<div class="row bg-white">
				<div class="col-md-6">
					<h4 class="bold mt-2 mb-4">Eventos traumáticos severos</h4>
				</div>
				<div class="col-md-6">
					<button type="button" class="md-btn md-btn-main ml-0 mt-4 mb-3" onclick="openCuestionario(1);">
						Ir<i class="fas fa-arrow-right ml-2"></i>
					</button>								
				</div>
			</div>
			<div class="row bg-white">
										
			</div>
			
		</div>
		<div id="cuestionario2" style="background:#a4a4a4;" class="examen container-fluid" >
			<div class="row bg-white">
				<div class="col-md-6">
					<h4 class="bold mt-2 mb-4">Riesgos Psicosociales</h4>
				</div>
				<div class="col-md-6">
					<button type="button" class="md-btn md-btn-main ml-0 mt-4 mb-3" onclick="openCuestionario(2);">
						Ir<i class="fas fa-arrow-right ml-2"></i>
					</button>								
				</div>
			</div>
			<div class="row bg-white">
										
			</div>
			
		</div>
		<div id="cuestionario3" style="background:#a4a4a4;" class="examen container-fluid" >
			<div class="row bg-white">
				<div class="col-md-6">
					<h4 class="bold mt-2 mb-4">Riesgos Psicosociales y Ambiente laboral</h4>
				</div>
				<div class="col-md-6">
					<button type="button" class="md-btn md-btn-main ml-0 mt-4 mb-3" onclick="openCuestionario(3);">
						Ir<i class="fas fa-arrow-right ml-2"></i>
					</button>								
				</div>
			</div>
			<div class="row bg-white">
										
			</div>
			
		</div>
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