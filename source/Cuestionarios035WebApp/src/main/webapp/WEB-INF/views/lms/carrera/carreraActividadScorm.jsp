<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
			<li class="breadcrumb-item"><spring:message code="lms.carrera.actividad.scorm.title" /> ${actividadVO.orden}
				
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
						<h3><spring:message code="lms.carrera.actividad.scorm.title" /> ${actividadVO.orden} | <span>${actividadVO.nombre}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.scorm.descripcion" /> <span>${actividadVO.descripcion}</span></h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'en')}">
						<h3><spring:message code="lms.carrera.actividad.scorm.title" /> ${actividadVO.orden} | <span>${actividadVO.nombreEn}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.scorm.descripcion" /> <span>${actividadVO.descripcionEn}</span></h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'fr')}">
						<h3><spring:message code="lms.carrera.actividad.scorm.title" /> ${actividadVO.orden} | <span>${actividadVO.nombreFr}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.scorm.descripcion" /> <span>${actividadVO.descripcionFr}</span></h3>
			    	</c:if>
			    </c:if>
			    <c:if test="${empty locale}">
						<h3><spring:message code="lms.carrera.actividad.scorm.title" /> ${actividadVO.orden} | <span>${actividadVO.nombre}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.scorm.descripcion" /> <span>${actividadVO.descripcion}</span></h3>
			    </c:if>
				<hr>
			</div>
		</div>
	
		<div class="row" id="startScorm">
			<div class="col">
				<c:if test="${not empty locale}">
			    	<c:if test="${fn:contains(locale, 'es')}">
						<h3><spring:message code="lms.carrera.actividad.scorm.inicio.msg" /><span
							class="bold">"${actividadVO.nombre}"</span>.
						</h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'en')}">
						<h3><spring:message code="lms.carrera.actividad.scorm.inicio.msg" /><span
							class="bold">"${actividadVO.nombreEn}"</span>.
						</h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'fr')}">
						<h3><spring:message code="lms.carrera.actividad.scorm.inicio.msg" /><span
							class="bold">"${actividadVO.nombreFr}"</span>.
						</h3>
			    	</c:if>
			    </c:if>
			    <c:if test="${empty locale}">
						<h3><spring:message code="lms.carrera.actividad.scorm.inicio.msg" /><span
							class="bold">"${actividadVO.nombre}"</span>.
						</h3>
			    </c:if>
				<button type="button" class="md-btn md-btn-main d-block mt-4 ml-0" onclick="startScorm('${actividadVO.id}', '${idInscripcion}', '${rutaScorm}');"><spring:message code="lms.carrera.actividad.scorm.btn.comenzar" /> <i class="fas fa-rocket ml-2"></i></button>
			</div>
		</div>
		
		<div class="row" id="endScorm" style="display: none;">
			<div class="col">
				<c:if test="${not empty locale}">
			    	<c:if test="${fn:contains(locale, 'es')}">
						<h3><spring:message code="lms.carrera.actividad.scorm.terminar.msg" /> <span class="bold">"${actividadVO.nombre}"</span>.</h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'en')}">
						<h3><spring:message code="lms.carrera.actividad.scorm.terminar.msg" /> <span class="bold">"${actividadVO.nombreEn}"</span>.</h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'fr')}">
						<h3><spring:message code="lms.carrera.actividad.scorm.terminar.msg" /> <span class="bold">"${actividadVO.nombreFr}"</span>.</h3>
			    	</c:if>
			    </c:if>
			    <c:if test="${empty locale}">
						<h3><spring:message code="lms.carrera.actividad.scorm.terminar.msg" /> <span class="bold">"${actividadVO.nombre}"</span>.</h3>
			    </c:if>
				<button type="button" class="md-btn md-btn-main d-block mt-4 ml-0" onclick="endScorm('${actividadVO.id}', '${idInscripcion}', '${actividadVO.idCurso}', '${planName}', '${cursoName}', '${planId}', ${idCertificado});"><spring:message code="lms.carrera.actividad.scorm.btn.terminar" /><i class="fas fa-rocket ml-2"></i></button>
				<div style="text-align:center; display:none;">
					<iframe src="${rutaScorm}" name="course" frameborder="0" style="overflow:hidden;overflow-x:hidden;overflow-y:hidden;height:600px;width:800px"></iframe>
				</div>
			</div>
		</div>

	</div>
</main>

 

<script>

    // Herramientas del scorm viewer
    function supports_html5_storage() {
        try {
            return 'localStorage' in window && window['localStorage'] !== null;
        } catch (e) {
            return false;
        }
    }

    //users of old browsers will not be able to save their progress localy (but they will be able to store it server side)
    if (!supports_html5_storage()) {
        window.localStorage = {};
    }

    tspInit(
        window,
        window.localStorage,
        //this has to be unique per each scorm you serve
        'SCORM_ID.',
        function(progress) {
            //this will be called whenever student makes a progress in test.
            console.log(progress);
        });
    

    
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












