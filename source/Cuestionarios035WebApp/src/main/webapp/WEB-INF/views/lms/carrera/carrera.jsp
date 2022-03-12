<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="<c:url value='/resources/js/lms/carrera/carrera.js' />"
	type="text/javascript"></script>
<main class="l-main">
<nav aria-label="breadcrumb" role="navigation">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#"><spring:message code="lms.carrera.title" /></a></li>
	</ol>
</nav>
<div class="content-wrapper pt-3">
	<input type="hidden" id="idMonitoreoActividad"
		value="${idMonitoreoActividad}">

	<div id="banner-main" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#banner-main" data-slide-to="0" class="active"></li>
			<li data-target="#banner-main" data-slide-to="1"></li>
			<li data-target="#banner-main" data-slide-to="2"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<c:if test="${empty eventoCalendario1.cursoVO.imagen}">
					<img src="<c:url value='/resources/css/img/taller.jpg' />" alt="Taller">
				</c:if>
				<c:if test="${not empty eventoCalendario1.cursoVO.imagen}">
					<img src="<c:url value='/downloadImage?param=${eventoCalendario1.cursoVO.imagen}'/>" alt="User">
				</c:if>
				<div class="carousel-caption">
					<c:if test="${not empty locale}">
				    	<c:if test="${fn:contains(locale, 'es')}">
							<h3>${eventoCalendario1.cursoVO.nombre}</h3>
				    	</c:if>
				    	<c:if test="${fn:contains(locale, 'en')}">
				    		<c:if test="${not empty eventoCalendario1.cursoVO.nombreEn}">
								<h3>${eventoCalendario1.cursoVO.nombreEn}</h3>
				    		</c:if>
				    		<c:if test="${ empty eventoCalendario1.cursoVO.nombreEn}">
								<h3>${eventoCalendario1.cursoVO.nombre}</h3>
				    		</c:if>
				    	</c:if>
				    	<c:if test="${fn:contains(locale, 'fr')}">
				    		<c:if test="${not empty eventoCalendario1.cursoVO.nombreFr}">
								<h3>${eventoCalendario1.cursoVO.nombreFr}</h3>
				    		</c:if>
				    		<c:if test="${ empty eventoCalendario1.cursoVO.nombreFr}">
								<h3>${eventoCalendario1.cursoVO.nombre}</h3>
				    		</c:if>

				    	</c:if>
				    </c:if>
				    <c:if test="${empty locale}">
						<h3>${eventoCalendario1.cursoVO.nombre}</h3>
				    </c:if>
					<p>
						<a href="#" onclick="verCalendario();"><spring:message code="lms.carrera.ver" /></a>
					</p>
				</div>
			</div>
			<div class="carousel-item">
				<c:if test="${empty eventoCalendario2.cursoVO.imagen}">
					<img src="<c:url value='/resources/css/img/taller.jpg' />" alt="Taller">
				</c:if>
				<c:if test="${not empty eventoCalendario2.cursoVO.imagen}">
					<img src="<c:url value='/downloadImage?param=${eventoCalendario2.cursoVO.imagen}'/>" alt="User">
				</c:if>
				<div class="carousel-caption">
					<c:if test="${not empty locale}">
				    	<c:if test="${fn:contains(locale, 'es')}">
							<h3>${eventoCalendario2.cursoVO.nombre}</h3>
				    	</c:if>
				    	<c:if test="${fn:contains(locale, 'en')}">
				    		<c:if test="${not empty eventoCalendario2.cursoVO.nombreEn}">
								<h3>${eventoCalendario2.cursoVO.nombreEn}</h3>
				    		</c:if>
				    		<c:if test="${ empty eventoCalendario2.cursoVO.nombreEn}">
								<h3>${eventoCalendario2.cursoVO.nombre}</h3>
				    		</c:if>
				    	</c:if>
				    	<c:if test="${fn:contains(locale, 'fr')}">
				    		<c:if test="${not empty eventoCalendario2.cursoVO.nombreFr}">
								<h3>${eventoCalendario2.cursoVO.nombreFr}</h3>
				    		</c:if>
				    		<c:if test="${ empty eventoCalendario2.cursoVO.nombreFr}">
								<h3>${eventoCalendario2.cursoVO.nombre}</h3>
				    		</c:if>

				    	</c:if>
				    </c:if>
				    <c:if test="${empty locale}">
						<h3>${eventoCalendario2.cursoVO.nombre}</h3>
				    </c:if>
					<p>
						<a href="#" onclick="verCalendario();"><spring:message code="lms.carrera.ver" /></a>
					</p>
				</div>
			</div>
			<div class="carousel-item">
				<c:if test="${empty eventoCalendario3.cursoVO.imagen}">
					<img src="<c:url value='/resources/css/img/taller.jpg' />" alt="Taller">
				</c:if>
				<c:if test="${not empty eventoCalendario3.cursoVO.imagen}">
					<img src="<c:url value='/downloadImage?param=${eventoCalendario3.cursoVO.imagen}'/>" alt="User">
				</c:if>
				<div class="carousel-caption">
					<c:if test="${not empty locale}">
				    	<c:if test="${fn:contains(locale, 'es')}">
							<h3>${eventoCalendario3.cursoVO.nombre}</h3>
				    	</c:if>
				    	<c:if test="${fn:contains(locale, 'en')}">
				    		<c:if test="${not empty eventoCalendario3.cursoVO.nombreEn}">
								<h3>${eventoCalendario3.cursoVO.nombreEn}</h3>
				    		</c:if>
				    		<c:if test="${ empty eventoCalendario3.cursoVO.nombreEn}">
								<h3>${eventoCalendario3.cursoVO.nombre}</h3>
				    		</c:if>
				    	</c:if>
				    	<c:if test="${fn:contains(locale, 'fr')}">
				    		<c:if test="${not empty eventoCalendario3.cursoVO.nombreFr}">
								<h3>${eventoCalendario3.cursoVO.nombreFr}</h3>
				    		</c:if>
				    		<c:if test="${ empty eventoCalendario3.cursoVO.nombreFr}">
								<h3>${eventoCalendario3.cursoVO.nombre}</h3>
				    		</c:if>

				    	</c:if>
				    </c:if>
				    <c:if test="${empty locale}">
						<h3>${eventoCalendario3.cursoVO.nombre}</h3>
				    </c:if>
					<p>
						<a href="#" onclick="verCalendario();"><spring:message code="lms.carrera.ver" /></a>
					</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#banner-main" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#banner-main"
			data-slide="next"> <span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<div class="row justify-content-center align-items-center dash-numbers">
		<div class="col">
			<h2>${porcentajeCarrera}%</h2>
			<h6><spring:message code="lms.carrera.avance" /></h6>
		</div>
		<div class="col">
			<h2>${cursosInscritos}</h2>
			<h6><spring:message code="lms.carrera.proceso" /></h6>
		</div>
		<div class="col">
			<h2>${cursosComlpetos}</h2>
			<h6><spring:message code="lms.carrera.completo" /></h6>
		</div>
		<div class="col">
			<h2>${cursosPendientes}</h2>
			<h6><spring:message code="lms.carrera.pendiente" /></h6>
		</div>
		<!--  <div class="col">
				<h2>5h 39m</h2>
				<h6>Tiempo de entrenamiento</h6>
			</div>-->
	</div>

	<!-- PROGRESS BAR -->
	<div class="row">
		<div class="col mt-2 mb-3">
			<div class="progress">
				<div class="progress-bar" style="width: ${porcentajeCarrera}%;">
					<div class="progress-value animated swing">${porcentajeCarrera}%</div>
				</div>
			</div>
		</div>
	</div>
	<!-- MIS PLANES DE CARRERA -->
	<div class="row">
		<div class="col-12">
			<h2 class="subtitle"><spring:message code="lms.carrera.planes.title" /></h2>
		</div>
		<c:if test="${not empty planCarreraLst}">
			<c:forEach items="${planCarreraLst}" var="planCarreraVO"
				varStatus="loop">
				<div class="col-sm-6">
					<div class="card planes">
						<div class="card-header">
							<c:if test="${empty planCarreraVO.imagen}">
								<img src="<c:url value='/resources/css/img/plan-de-carrera-1.jpg' />" alt="Card image">
							</c:if>
							<c:if test="${not empty planCarreraVO.imagen}">
								<img src="<c:url value='/downloadImage?param=${planCarreraVO.imagen}'/>" alt="User">
							</c:if>
							<c:if test="${not empty locale}">
						    	<c:if test="${fn:contains(locale, 'es')}">
									<h3>${planCarreraVO.nombre}</h3>
						    	</c:if>
						    	<c:if test="${fn:contains(locale, 'en')}">
						    		<c:if test="${not empty planCarreraVO.nombreEn}">
										<h3>${planCarreraVO.nombreEn}</h3>
						    		</c:if>
						    		<c:if test="${ empty planCarreraVO.nombreEn}">
										<h3>${planCarreraVO.nombre}</h3>
						    		</c:if>
						    	</c:if>
						    	<c:if test="${fn:contains(locale, 'fr')}">
						    		<c:if test="${not empty planCarreraVO.nombreFr}">
										<h3>${planCarreraVO.nombreFr}</h3>
						    		</c:if>
						    		<c:if test="${ empty planCarreraVO.nombreFr}">
										<h3>${planCarreraVO.nombre}</h3>
						    		</c:if>

						    	</c:if>
						    </c:if>
						    <c:if test="${empty locale}">
						    	<h3>${planCarreraVO.nombre}</h3>
						    </c:if>
						</div>
						<div class="card-body">
							<div class="progress progress-modulo">
								<div class="progress-bar"
									style="width: ${planCarreraVO.progreso }%">${planCarreraVO.progreso}%</div>
							</div>
							<p>
								<span> <spring:message code="lms.carrera.planes.inicio" /> <b class="bold">${planCarreraVO.auxFechaInicio}</b>
								</span> <span> <spring:message code="lms.carrera.planes.fin" /> <b class="bold">${planCarreraVO.auxFechaFin}</b>
								</span>
							</p>
							<a class="md-btn md-btn-main" href="#" role="button"
								onclick="getPlan(${planCarreraVO.id})"><spring:message code="lms.carrera.planes.continuar" /></a>
							<c:if test="${not empty planCarreraVO.idPlantilla}">
								<c:if test="${planCarreraVO.progreso == 100}">
									<a class="md-btn md-btn-main" href="#" role="button"
										onclick="descargaCertificado('${planCarreraVO.id}');"><spring:message code="lms.carrera.planes.descarga" /></a>
								</c:if>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<!-- <div class="col-sm-6">
				<div class="card planes done">
					<div class="card-header">
						<img src="assets/img/supervisor-card.jpg" alt="Card image">
						<h3>Supervisor anterior</h3>
					</div>
					<div class="card-body">
						<div class="progress progress-modulo">
							<div class="progress-bar" style="width: 100%">100%</div>
						</div>
						<p>
							<span>
								Inicio: <b class="bold">12-mar-2020</b>
							</span>
							<span>
								Fin: <b class="bold">22-mar-2020</b>
							</span>
						</p>
						<a class="md-btn md-btn-gray" href="#" role="button">Revisar</a>
					</div>
				</div>
			</div> -->
	</div>

</div>
</main>
<div class="modal fade" id="modalRespuesta" tabindex="-1" role="dialog"
	aria-labelledby="modalRespuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"><spring:message code="lms.carrera.plan.title" /></h3>
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
				<button type="button" class="btn" data-dismiss="modal"><spring:message code="lms.carrera.planes.btn.aceptar" /></button>
			</div>

		</div>
	</div>
</div>


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