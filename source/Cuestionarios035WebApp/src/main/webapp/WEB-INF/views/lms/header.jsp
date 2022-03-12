<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<header class="l-header">
	<div class="l-header__inner clearfix">
		<div class="c-header-icon js-openM">
			<div class="openmenu">
				<i class="fas fa-arrow-left"></i>
			</div>
		</div>
		<div class="c-header-icon logo-header">
					<c:if test="${not empty empresa}">
                       <img src="<c:url value='/resources/css/img/logo-${empresa}-header.svg' />" alt="${empresa}">
                	</c:if>
                	<c:if test="${empty empresa}">
	                    <img src="<c:url value='/resources/css/img/Logo-MD.svg' />" alt="Megadealer">
                	</c:if>		
		</div>
		
		

		<div class="header-icons-group">
			<c:if test="${not empty empresa}">
				<c:if test="${fn:contains(empresa, 'AA')}">
						<div class="user__txt dropdown"  style="top:15px; right:15px;">
				            <a data-toggle="dropdown">
								<span><spring:message code="lms.header.idioma"/></span>  <i class="fas fa-caret-down"></i>
				            </a>
				            <div class="dropdown-menu">
				                <a class="dropdown-item" href="#" onclick="cambiaLenguaje('<spring:message code='lms.header.idioma.dos.codigo'/>');"><spring:message code="lms.header.idioma.dos"/></a>
				                <div class="dropdown-divider"></div>
				                <a class="dropdown-item" href="#" onclick="cambiaLenguaje('<spring:message code='lms.header.idioma.tres.codigo'/>');"><spring:message code="lms.header.idioma.tres"/></a>
				            </div>
				        </div>
				</c:if>
			</c:if>
			<c:if test="${not empty contacto}">
				<div class="c-header-icon whatsapp">
					<a href="https://wa.me/+52${contacto}" target="blank"> <i class="fab fa-whatsapp"></i>
					</a>
				</div>
			</c:if>
			<div class="c-header-icon">
				<a href="#" onclick="onNotificaciones()"> <i class="fa fa-bell"></i> 
					<c:if test="${not empty currentUser.lstNotificacionVO}">
						<span id="idSpanNotificationsNum" class="c-badge c-badge--orange c-badge--header-icon animated swing">${fn:length(currentUser.lstNotificacionVO)}</span>
					</c:if>
				</a>

			</div>
		</div>
	</div>
</header>

<script>
	function cambiaLenguaje(lenguaje){
		
	    var urlComplete =  window.location.href ;
	    
	    if(urlComplete.includes("locale")){
	    	urlComplete = urlComplete.replace('&locale=es','');
	    	urlComplete = urlComplete.replace('&locale=en','');
	    	urlComplete = urlComplete.replace('&locale=fr','');
	    	urlComplete = urlComplete.replace('?locale=es','');
	    	urlComplete = urlComplete.replace('?locale=en','');
	    	urlComplete = urlComplete.replace('?locale=fr','');
	    }
	    
	    if(urlComplete.includes("#")){
	    	urlComplete = urlComplete.replace('#','');
	    }
	    
	    if(urlComplete.includes("?")){
	    	window.location.href = urlComplete+'&locale='+lenguaje; 
	    }else{
	    	window.location.href = urlComplete+'?locale='+lenguaje;
	    }
	    
	}
</script>