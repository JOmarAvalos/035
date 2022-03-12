<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script
	src="<c:url value='/resources/js/lms/carrera/carreraActividad.js' />"
	type="text/javascript"></script>

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
			<li class="breadcrumb-item"><spring:message code="lms.carrera.actividad.documento.title" /> ${actividadVO.orden}
			
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
						<h3><spring:message code="lms.carrera.actividad.documento.title" /> ${actividadVO.orden} | ${actividadVO.nombre}</h3>
						<h3><spring:message code="lms.carrera.actividad.documento.descripcion" /> <span>${actividadVO.descripcion}</span></h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'en')}">
						<h3><spring:message code="lms.carrera.actividad.documento.title" /> ${actividadVO.orden} | ${actividadVO.nombreEn}</h3>
						<h3><spring:message code="lms.carrera.actividad.documento.descripcion" /> <span>${actividadVO.descripcionEn}</span></h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'fr')}">
						<h3><spring:message code="lms.carrera.actividad.documento.title" /> ${actividadVO.orden} | ${actividadVO.nombreFr}</h3>
						<h3><spring:message code="lms.carrera.actividad.documento.descripcion" /> <span>${actividadVO.descripcionFr}</span></h3>
			    	</c:if>
			    </c:if>
			    <c:if test="${empty locale}">
						<h3><spring:message code="lms.carrera.actividad.documento.title" /> ${actividadVO.orden} | ${actividadVO.nombre}</h3>
						<h3><spring:message code="lms.carrera.actividad.documento.descripcion" /> <span>${actividadVO.descripcion}</span></h3>
			    </c:if>
				<hr>
			</div>
		</div>
		
		<div class="row actividad align-items-center" id="startDocumento">
			<div class="col">
				<div style="text-align:center;">
					<button type="button" class="md-btn btn-curso-action" onclick="startDocumento('${actividadVO.id}', '${idInscripcion}');" id="btnDescargaDoc"><spring:message code="lms.carrera.actividad.documento.btn.descargar" /><i class="fas fa-rocket ml-2"></i></button>
					<button type="button" class="md-btn btn-curso-action" onclick="endDocumento('${actividadVO.id}', '${idInscripcion}',${actividadVO.idCurso}, '${planName}', '${cursoName}', ${planId},'${idCertificado}');" id="btnEndActividadDoc" style="display:none;"><spring:message code="lms.carrera.actividad.documento.btn.terminar" /><i class="fas fa-rocket ml-2"></i></button>
				</div>
			</div>
		</div>
		
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

