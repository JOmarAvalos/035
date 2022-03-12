<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value='/resources/js/insumos/insumos.js' />"
	type="text/javascript"></script>
<main class="l-main">

	<c:if test="${ not empty ciclo}">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="#" onclick="onInsumos();"><spring:message code="lms.insumos.title" /></a>
				</li>
			</ol>
		</nav>
		<div class="content-wrapper pt-3">
			<div class="row">
				<div class="col">
					<div class="cover-plan">
						<img src="assets/img/suspension.jpg" alt="portada">
						<div class="title-carrera">
							<h3><spring:message code="lms.insumos.title" /></h3>
						</div>
					</div>
				</div>
			</div>
	
			<!-- MIS PLANES DE CARRERA -->
	
			<div class="row align-items-end mt-3">
				<div class="col-8">
					<h2 class="subtitle">
						<!-- <span>certificado name</span> -->
						<spring:message code="lms.insumos.solicitudes" /> ${ciclo.nombre}
					</h2>
				</div>
			</div>
			<div class="row align-items-center mt-4">
				<div class="col">
					<div class="table-responsive-sm">
						<table class="table table-striped table-actividades table-hover">
							<thead>
								<tr>
									<th class="text-left"><spring:message code="lms.insumos.table.titulo" /></th>
									<th class="text-left"><spring:message code="lms.insumos.table.solicitudes" /></th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty actividadVOLst}">
									<c:forEach items="${actividadVOLst}" var="actividadVO"
										varStatus="loopActividad">
										<tr>
											<td class="text-left">${actividadVO.nombre}</td>
											<td>${actividadVO.solicitudes }</td>
											<td>
												<a href="#" onclick="getActividad(${actividadVO.id});"><spring:message code="lms.insumos.table.entrar" /></a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
	
	<c:if test="${ empty ciclo}">
		<div class="content-wrapper perfil h-100">
	        <div class="row justify-content-center h-100">
	            <div class="col">
	                <div class="perfil-wrapp">
	                    <div class="info-perfil">
	                        <h1><spring:message code="lms.insumos.msg1" /></h1>
	                        <h4><spring:message code="lms.insumos.msg2" /></h4>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</c:if>
</main>



