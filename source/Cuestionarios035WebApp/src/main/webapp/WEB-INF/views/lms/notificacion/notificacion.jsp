<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script
	src="<c:url value='/resources/js/lms/notificacion/notificacion.js' />"
	type="text/javascript"></script>

<main class="l-main inscripciones">
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#"><spring:message
						code="lms.notificacion.title" /></a></li>
		</ol>
	</nav>
	<div class="content-wrapper admin_wrap">
		<h1>
			<spring:message code="lms.notificacion.title" />
		</h1>


		<div class="row">
			<div class="col" >
				<!-- Sólo se agrega la clase --pending-- para los no leidos -->
				<c:if test="${not empty lstNotificaciones}">
					<c:forEach items="${lstNotificaciones}" var="notificacionVO" varStatus="loop">
						<div id="${notificacionVO.id}" class="
							<c:choose>
								<c:when test="${notificacionVO.idEstatus == 3}">
								  	pending
								</c:when>
								<c:when test="${(notificacionVO.idEstatus == 2 || notificacionVO.idEstatus == 1) && notificacionVO.idPrioridad == 2}">
								  	urgent
								</c:when>
								<c:when test="${(notificacionVO.idEstatus == 2 || notificacionVO.idEstatus == 1) && notificacionVO.idPrioridad != 2}">
								  	received
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							notify">
							<div id="heading_${notificacionVO.id}" data-toggle="collapse" data-target="#collapse${loop.index}" aria-expanded="true" aria-controls="collapse${loop.index}" class="head-notify clearfix">
								<h1>
									
									<c:if test="${not empty locale}">
									    <c:if test="${fn:contains(locale, 'es')}">
									       ${notificacionVO.titulo}
									    </c:if>
									    <c:if test="${fn:contains(locale, 'en')}">
									        ${notificacionVO.tituloEn}
									    </c:if>
									    <c:if test="${fn:contains(locale, 'fr')}">
									        ${notificacionVO.tituloFr}
									    </c:if>
									</c:if>
									<c:if test="${empty locale}">
									    ${notificacionVO.titulo}
									</c:if>
									
								</h1>
								<h2>
									<span>&nbsp;&nbsp;<i class="far fa-clock"></i>&nbsp;&nbsp;</span>
									<span><fmt:formatDate pattern="dd-MM-yyyy | HH:mm" value="${notificacionVO.creacion}" /></span>
								</h2>
							</div>
							<p id="collapse${loop.index}" class="collapse " role="tabpanel" aria-labelledby="heading_${notificacionVO.id}" data-parent="#heading_${notificacionVO.id}">
							
								<c:if test="${not empty locale}">
								    <c:if test="${fn:contains(locale, 'es')}">
								       ${notificacionVO.notificacion}
								    </c:if>
								    <c:if test="${fn:contains(locale, 'en')}">
								        ${notificacionVO.notificacionEn}
								    </c:if>
								    <c:if test="${fn:contains(locale, 'fr')}">
								        ${notificacionVO.notificacionFr}
								    </c:if>
								</c:if>
								<c:if test="${empty locale}">
								    ${notificacionVO.notificacion}
								</c:if>
							
							</p>
						</div>
					</c:forEach>
				</c:if>
				<!-- <div class="pending notify">
					<div class="head-notify clearfix">
						<h1>Has concluido con éxito el curso "Titulo del curso # 3"</h1>
						<h2>
							25-05-2020 <span class="regular">|</span> 13:16
						</h2>
					</div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Hic maxime fuga quibusdam ipsam error, magni eveniet atque et
						optio distinctio accusamus inventore itaque dolorum dolor, nihil
						corrupti iste consectetur molestias.</p>
				</div> -->				
			</div>
		</div>

	</div>
</main>

<script type="text/javascript">
    $(function() {
    	$(".collapse").on('shown.bs.collapse', function(e){
	    	var clickedElement = $($(e.target).data('bs.collapse')._triggerArray);
	    	//console.log($(clickedElement).attr('id'));
	    	var idStrNot = $(clickedElement).attr('id')
	    	readNotificacion(idStrNot);
		});
    });
</script>