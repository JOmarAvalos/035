<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
	#form {
	  width: 250px;
	  margin: 0 auto;
	  height: 50px;
	}
	
	#form p {
	  text-align: center;
	}
	
	#form label {
	  font-size: 20px;
	}
	
	input[type="radio"] {
	  display: none;
	}
	
	label {
	  color: grey;
	}
	
	.clasificacion {
	  direction: rtl;
	  unicode-bidi: bidi-override;
	}
	
	label:hover,
	label:hover ~ label {
	  color: orange;
	}
	
	input[type="radio"]:checked ~ label {
	  color: orange;
	}
</style>

<script
	src="<c:url value='/resources/js/lms/carrera/carreraCurso.js' />"
	type="text/javascript"></script>
<main class="l-main">
<nav aria-label="breadcrumb" role="navigation">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#"
			onclick="getMiCarreraMonitoreo();"><spring:message code="lms.carrera.title" /></a></li>
		<li class="breadcrumb-item"><a href="#"
			onclick="getMiPlanMonitoreo(${planId});">${planName}</a></li>
		<c:if test="${not empty locale}">
		    <c:if test="${fn:contains(locale, 'es')}">
				<li class="breadcrumb-item">${certificadoName}| ${cursoVO.nombre}</li>
		    </c:if>
		    <c:if test="${fn:contains(locale, 'en')}">
				<li class="breadcrumb-item">${certificadoName}| ${cursoVO.nombreEn}</li>
		    </c:if>
		    <c:if test="${fn:contains(locale, 'fr')}">
				<li class="breadcrumb-item">${certificadoName}| ${cursoVO.nombreFr}</li>
		    </c:if>
		</c:if>
		<c:if test="${empty locale}">
				<li class="breadcrumb-item">${certificadoName}| ${cursoVO.nombre}</li>
		</c:if>
	</ol>
</nav>
<div class="content-wrapper pt-3">
	<div class="row">
		<div class="col">
			<div class="cover-plan">
				<c:if test="${empty cursoVO.imagen}">
					<img src="<c:url value='/resources/css/img/taller.jpg' />" alt="Taller">
				</c:if>
				<c:if test="${not empty cursoVO.imagen}">
					<img src="<c:url value='/downloadImage?param=${cursoVO.imagen}'/>" alt="User">
				</c:if>
				<div class="title-carrera">
				
					<c:if test="${not empty locale}">
					    <c:if test="${fn:contains(locale, 'es')}">
							<p>${certificadoName}</p>
							<h3>${cursoVO.nombre}</h3>
					    </c:if>
					    <c:if test="${fn:contains(locale, 'en')}">
							<p>${certificadoName}</p>
							<h3>${cursoVO.nombreEn}</h3>
					    </c:if>
					    <c:if test="${fn:contains(locale, 'fr')}">
							<p>${certificadoName}</p>
							<h3>${cursoVO.nombreFr}</h3>
					    </c:if>
					</c:if>
					<c:if test="${empty locale}">
						<p>${certificadoName}</p>
						<h3>${cursoVO.nombre}</h3>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!-- MIS PLANES DE CARRERA -->
	<input type="hidden" id="idMonitoreoActividadCurso"
		value="${idMonitoreoActividadCurso}"> <input type="hidden"
		id="idMonitoreoActividadPadre" value="${idMonitoreoActividadPadre}">
	<div class="row align-items-end mt-3">
		<div class="col-8">
		
		
			<h2 class="subtitle">
				<span>${certificadoName}</span> 
				
				<c:if test="${not empty locale}">
				    <c:if test="${fn:contains(locale, 'es')}">
				        ${cursoVO.nombre}
				    </c:if>
				    <c:if test="${fn:contains(locale, 'en')}">
				        <c:if test="${not empty cursoVO.nombreEn}">
				            ${cursoVO.nombreEn}
				        </c:if>
				        <c:if test="${ empty cursoVO.nombreEn}">
				            ${cursoVO.nombre}
				        </c:if>
				    </c:if>
				    <c:if test="${fn:contains(locale, 'fr')}">
				        <c:if test="${not empty cursoVO.nombreFr}">
				            ${cursoVO.nombreFr}
				        </c:if>
				        <c:if test="${ empty cursoVO.nombreFr}">
				            ${cursoVO.nombre}
				        </c:if>
				    </c:if>
				</c:if>
				<c:if test="${empty locale}">
				    ${cursoVO.nombre}
				</c:if>
			</h2>

			
		</div>
		<div class="col-4">
			<p class="info-actividades">
				<span> 
					<i class="fas fa-calendar-alt"></i> ${cursoVO.auxFechaInciio}
				</span> 
				<span> 
				<i class="fas fa-tv"></i>${cursoVO.tipoCurso.nombre} 
				</span>
			</p>
		</div>
	</div>
	<div class="row align-items-center mt-4">
		<div class="col">
			<div class="table-responsive-sm">
				<table class="table table-striped table-actividades table-hover">
					<thead>
						<tr>
							<th>&nbsp;</th>
							<th class="text-left"><spring:message code="lms.carrera.curso.table.actividades" /></th>
							<th><spring:message code="lms.carrera.curso.table.tiempo" /></th>
							<th><spring:message code="lms.carrera.curso.table.calificacion" /></th>
							<th><spring:message code="lms.carrera.curso.table.intentos" /></th>
							<th><spring:message code="lms.carrera.curso.table.fecha" /></th>
							<th>&nbsp; <c:if test="${estatusCurso == 2}">
									<c:if test="${not empty cursoVO.idPlantilla}">
										<button type="button" class="md-btn md-btn-secondary mt-1"
											onclick="decargaCertificado('${cursoVO.idInscripcion}', '${cursoVO.id}');"
											style="float: right;"><spring:message code="lms.carrera.curso.table.btn.descarga" /></button>
									</c:if>
								</c:if>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty cursoVO.eventoSesionVOLst}">
							<c:forEach items="${cursoVO.eventoSesionVOLst}" var="eventoSesionVO" varStatus="loopActividad">
								<tr>
									<td>${eventoSesionVO.actividad.orden}</td>
									<td>
										<c:if test="${not empty locale}">
									    	<c:if test="${fn:contains(locale, 'es')}">
												${eventoSesionVO.actividad.nombre}
									    	</c:if>
									    	<c:if test="${fn:contains(locale, 'en')}">
												<c:if test="${not empty eventoSesionVO.actividad.nombreEn}">
													${eventoSesionVO.actividad.nombreEn}
												</c:if>
												<c:if test="${ empty eventoSesionVO.actividad.nombreEn}">
													${eventoSesionVO.actividad.nombre}
												</c:if>
									    	</c:if>
									    	<c:if test="${fn:contains(locale, 'fr')}">
												<c:if test="${not empty eventoSesionVO.actividad.nombreFr}">
													${eventoSesionVO.actividad.nombreFr}
												</c:if>
												<c:if test="${ empty eventoSesionVO.actividad.nombreFr}">
													${eventoSesionVO.actividad.nombre}
												</c:if>
									    	</c:if>
									    </c:if>
									    <c:if test="${empty locale}">
											${eventoSesionVO.actividad.nombre}
									    </c:if>

									</td>
									<td>${eventoSesionVO.actividad.tiempoEstimado}</td>
									<td><c:if
											test="${not empty eventoSesionVO.actividad.consultaActividad}">${eventoSesionVO.actividad.consultaActividad.calificacion} %</c:if>
										<c:if test="${empty eventoSesionVO.actividad.consultaActividad}"><spring:message code="lms.carrera.curso.table.porcentaje" /></c:if>
									</td>
									<td>
									  <c:if test="${eventoSesionVO.actividad.idTipoActividad == 4 || eventoSesionVO.actividad.idTipoActividad == 9 || eventoSesionVO.actividad.idTipoActividad == 12}">
									    ${eventoSesionVO.actividad.intentos}
									  </c:if>
									  <c:if test="${eventoSesionVO.actividad.idTipoActividad == 1 || eventoSesionVO.actividad.idTipoActividad == 2 || eventoSesionVO.actividad.idTipoActividad == 3|| 
									        eventoSesionVO.actividad.idTipoActividad == 5 || eventoSesionVO.actividad.idTipoActividad == 6 || eventoSesionVO.actividad.idTipoActividad == 7 ||
									        eventoSesionVO.actividad.idTipoActividad == 8 || eventoSesionVO.actividad.idTipoActividad == 10 || eventoSesionVO.actividad.idTipoActividad == 11 || eventoSesionVO.actividad.idTipoActividad == 13}">
									    -
									  </c:if>
									</td>
									<td>
										<fmt:formatDate value="${eventoSesionVO.fechaInicio}" type="date" pattern="yyyy-MM-dd HH:mm"/> - <fmt:formatDate value="${eventoSesionVO.fechaFin}" type="date" pattern="yyyy-MM-dd HH:mm"/>
									</td>
									<td>
										<c:if test="${eventoSesionVO.actividad.muestraBoton}">
											<a href="#" onclick="getActividad(${eventoSesionVO.actividad.id}, '${cursoVO.id}','${cursoVO.idInscripcion}', '${planId}','${idCertificado}');"><spring:message code="lms.carrera.curso.table.entrar" /></a>
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
	<div class="row">
		<div class="col text-right">
			<c:if test="${estatusCurso == 1}">
				<button type="button" class="md-btn md-btn-secondary mt-1"
					onclick="terminaCurso('${cursoVO.idInscripcion}', '${cursoVO.id}', '${planId}','${idCertificado}');"><spring:message code="lms.carrera.curso.btn.terminar" /></button>
			</c:if>
			<button type="button" class="md-btn md-btn-main mt-1"
				onclick="salirCurso('${planId}');"><spring:message code="lms.carrera.curso.btn.salir" /></button>
		</div>
	</div>
</div>

<div class="modal fade" id="modalEstrellas" tabindex="-1" role="dialog"
	aria-labelledby="modalEstrellas" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"><spring:message code="lms.carrera.curso.califica.title" /></h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<div class="box-body">
						<form>
						  <p class="clasificacion">
						    <input id="radio1" type="radio" name="estrellas" value="5"><!--
						    --><label for="radio1">★</label><!--
						    --><input id="radio2" type="radio" name="estrellas" value="4"><!--
						    --><label for="radio2">★</label><!--
						    --><input id="radio3" type="radio" name="estrellas" value="3"><!--
						    --><label for="radio3">★</label><!--
						    --><input id="radio4" type="radio" name="estrellas" value="2"><!--
						    --><label for="radio4">★</label><!--
						    --><input id="radio5" type="radio" name="estrellas" value="1"><!--
						    --><label for="radio5">★</label>
						  </p>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="md-btn md-btn-main my-0" onclick="sendEstrellas('${cursoVO.idInscripcion}');"><spring:message code="lms.carrera.curso.btn.calificar" /></button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalEstrellasOblig" tabindex="-1" role="dialog"
	aria-labelledby="modalEstrellasOblig" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"><spring:message code="lms.carrera.curso.error" /></h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body" >
				<div class="box box-primary">
					<div class="box-header"></div>
					<div class="box-body">
						 <div class="row">
			                <div class="col">
			                	<p class="bold"><spring:message code="lms.carrera.curso.selecciona" /></p>
			                </div>
			            </div>
			            <hr>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="md-btn md-btn-main my-0" data-dismiss="modal"><spring:message code="lms.carrera.curso.btn.aceptar" /></button>
			</div>

		</div>
	</div>
</div>
</main>


<script>

$(document).ready(function() {
	

	<c:if test="${estatusCurso == 1 && estrellas <= 0}">
		$('#modalEstrellas').modal({backdrop: 'static', keyboard: false});
	</c:if>
	
    function changeNumber() {
    	var idMonitoreoActividadCurso=$("#idMonitoreoActividadCurso").val();
    	if(idMonitoreoActividadCurso > 0){
    	var urltxt=ctx+"/lms/carrera/updateMonitoreoActividad?id="+idMonitoreoActividadCurso; 
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
    
    function refresPage(){
    	location.reload();
    }
    setInterval(refresPage, 60000);
});
</script>