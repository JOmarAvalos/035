<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="<c:url value='/resources/js/lms/carrera/carreraActividad.js' />" type="text/javascript"></script>

<style>
	.custom-file-tarea {
	  position: relative;
	  display: inline-block;
	  width: 100%;
	  height: calc(1.5em + 0.75rem + 2px);
	  margin-bottom: 0;
	}
	
	.custom-file-tarea-input {
	  position: relative;
	  z-index: 2;
	  width: 100%;
	  height: calc(1.5em + 0.75rem + 2px);
	  margin: 0;
	  opacity: 0;
	}
	
	.custom-file-tarea-input:focus ~ .custom-file-tarea-label {
	  border-color: #80bdff;
	  -webkit-box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
	  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
	}
	
	.custom-file-tarea-input[disabled] ~ .custom-file-tarea-label,
	.custom-file-tarea-input:disabled ~ .custom-file-tarea-label {
	  background-color: #e9ecef;
	}
	
	.custom-file-tarea-input:lang(en) ~ .custom-file-tarea-label::after {
	  content: "<spring:message code='lms.actividad.tarea.file' />";
	}
	
	.custom-file-tarea-input ~ .custom-file-tarea-label[data-browse]::after {
	  content: attr(data-browse);
	}
	
	.custom-file-tarea-label {
	  position: absolute;
	  top: 0;
	  right: 0;
	  left: 0;
	  z-index: 1;
	  height: calc(1.5em + 0.75rem + 2px);
	  padding: 0.375rem 0.75rem;
	  font-weight: 400;
	  line-height: 1.5;
	  color: #495057;
	  background-color: #fff;
	  border: 1px solid #ced4da;
	  border-radius: 0.25rem;
	}
	
	.custom-file-tarea-label::after {
	  position: absolute;
	  top: 0;
	  right: 0;
	  bottom: 0;
	  z-index: 3;
	  display: block;
	  height: calc(1.5em + 0.75rem);
	  padding: 0.375rem 0.75rem;
	  line-height: 1.5;
	  color: #495057;
	  content: "<spring:message code='lms.actividad.tarea.file' />";
	  background-color: #e9ecef;
	  border-left: inherit;
	  border-radius: 0 0.25rem 0.25rem 0;
	}
	
</style>

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
			<li class="breadcrumb-item"><spring:message code="lms.carrera.actividad.tarea.title" /> ${actividadVO.orden}
			
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
					<span>${certificadoName}</span>
					${cursoName}
				</h2>
			</div>
		</div>

		<div class="row actividad align-items-center">
			<div class="col">
				<c:if test="${not empty locale}">
			    	<c:if test="${fn:contains(locale, 'es')}">
						<h3><spring:message code="lms.carrera.actividad.tarea.title" /> ${actividadVO.orden} | ${actividadVO.nombre}</h3>
						<h3><spring:message code="lms.carrera.actividad.tarea.descripcion" /><span>${actividadVO.descripcion}</span></h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'en')}">
						<h3><spring:message code="lms.carrera.actividad.tarea.title" /> ${actividadVO.orden} | ${actividadVO.nombreEn}</h3>
						<h3><spring:message code="lms.carrera.actividad.tarea.descripcion" /><span>${actividadVO.descripcionEn}</span></h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'fr')}">
						<h3><spring:message code="lms.carrera.actividad.tarea.title" /> ${actividadVO.orden} | ${actividadVO.nombreFr}</h3>
						<h3><spring:message code="lms.carrera.actividad.tarea.descripcion" /><span>${actividadVO.descripcionFr}</span></h3>
			    	</c:if>
			    </c:if>
			    <c:if test="${empty locale}">
						<h3><spring:message code="lms.carrera.actividad.tarea.title" /> ${actividadVO.orden} | ${actividadVO.nombre}</h3>
						<h3><spring:message code="lms.carrera.actividad.tarea.descripcion" /><span>${actividadVO.descripcion}</span></h3>
			    </c:if>
				<hr>
			</div>
		</div>
		<div class="row actividad align-items-center">
			<div class="col">
			
			
				<h5>
				
				<c:if test="${not empty locale}">
				    <c:if test="${fn:contains(locale, 'es')}">
				        ${actividadVO.descripcion}
				    </c:if>
				    <c:if test="${fn:contains(locale, 'en')}">
				        <c:if test="${not empty actividadVO.descripcionEn}">
				            ${actividadVO.descripcionEn}
				        </c:if>
				        <c:if test="${ empty actividadVO.descripcionEn}">
				            ${actividadVO.descripcion}
				        </c:if>
				    </c:if>
				    <c:if test="${fn:contains(locale, 'fr')}">
				        <c:if test="${not empty actividadVO.descripcionFr}">
				            ${actividadVO.descripcionFr}
				        </c:if>
				        <c:if test="${ empty actividadVO.descripcionFr}">
				            ${actividadVO.descripcion}
				        </c:if>
				    </c:if>
				</c:if>
				<c:if test="${empty locale}">
				    ${actividadVO.descripcion}
				</c:if>
				
				
				</h5>
				
				
			</div>
		</div>
		
		
		<form role="form" id="formActividadTarea" action="javascript:saveActividadTarea(this, ${actividadVO.id}, ${idInscripcion}, ${actividadVO.idCurso}, '${planName}', '${cursoName}', ${planId},'${idCertificado}');" method="POST" class="" data-parsley-validate="">
			<div class="row actividad align-items-center">
				<div class="col-md-2">
					<div style="text-align:center;">
						<div class="form-group">
							<img
								id="iptActividadTareaIconoImg"
								src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
								alt="documento image" style="width: 90px;" />
						</div>
					</div>
				</div>
			</div>
			<div class="row ">
				<div class="col-md-2">
						<div class="custom-file-tarea">
						<br> <br> <input type="file" class="custom-file-tarea-input"
							name="iptActividadTareaFile"
							id="iptActividadTareaFile" accept=".xlsx, .xls, .doc, .docx, .ppt, .pptx, .pdf, .png, .jpg, .jpeg" 
							onchange="inUploadChange(this)">
							
							<label class="custom-file-tarea-label" for="iptActividadTareaFile" style="color:black !important;  text-align: left;line-height:30px;"
							    id="lblIptPasaporte"><spring:message code='lms.actividad.tarea.file' /></label>
						<p class="help-block">&nbsp;&nbsp;&nbsp;</p>

						</div>	
				</div>
			</div>
			
			<div class="row actividad align-items-center">
				<div class="col">
					<div style="text-align:center;">
						<button type="submit" class="md-btn btn-curso-action"><spring:message code="lms.carrera.actividad.tarea.btn.cargar" /><i class="fas fa-rocket ml-2"></i></button>
					</div>
				</div>
			</div>
		</form>
		
		<br><br>
		
		<c:if test="${not empty actividadVO.consultaActividad}">
			<div class="row actividad align-items-center">
				<div class="col">
					<div style="text-align:center;">
						<button class="md-btn btn-curso-action" onclick="downloadFile(${actividadVO.consultaActividad.id}); return false;" ><spring:message code="lms.carrera.actividad.tarea.btn.descargar" /><i class="fas fa-rocket ml-2"></i></button>
						<br>
						${actividadVO.consultaActividad.nombreArchivo}
					</div>
				</div>
			</div>
		</c:if>

	</div>
</main>

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

