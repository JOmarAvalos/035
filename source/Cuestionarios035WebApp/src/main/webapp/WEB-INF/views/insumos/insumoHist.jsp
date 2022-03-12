<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<c:url value='/resources/js/insumos/insumos.js' />"
	type="text/javascript"></script>
<main class="l-main">

		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="#" onclick="onInsumos();"><spring:message code="lms.hist.insumos.title" /></a>
				</li>
			</ol>
		</nav>
		<div class="content-wrapper pt-3">
			<div class="row">
				<div class="col">
					<div class="cover-plan">
						<img src="assets/img/suspension.jpg" alt="portada">
						<div class="title-carrera">
							<h3><spring:message code="lms.hist.insumos" /></h3>
						</div>
					</div>
				</div>
			</div>
	
			<!-- MIS PLANES DE CARRERA -->
	
			<div class="row align-items-end mt-3">
				<div class="col-8">
					<h2 class="subtitle">
						<!-- <span>certificado name</span> -->
						<spring:message code="lms.hist.insumos.subtitle" />
					</h2>
				</div>
			</div>
			<div class="row align-items-center mt-4">
				<div class="col">
					<div class="table-responsive-sm">
						<table class="table table-striped table-actividades table-hover">
							<thead>
								<tr>
									<th style="text-align: center;"><spring:message code="lms.hist.insumos.table.nombre" /></th>
									<th style="text-align: center;"><spring:message code="lms.hist.insumos.table.folio" /></th>
									<th style="text-align: center;"><spring:message code="lms.hist.insumos.table.estatus" /></th>
									<th style="text-align: center;"><spring:message code="lms.hist.insumos.table.usuario.solic" /></th>
									<th style="text-align: center;"><spring:message code="lms.hist.insumos.table.fecha.solicitud" /></th>
									<th style="text-align: center;"><spring:message code="lms.hist.insumos.table.usuario.recibe" /></th>
									<th style="text-align: center;"><spring:message code="lms.hist.insumos.table.fecha.recibido" /></th>
									<th style="text-align: center;"><spring:message code="lms.hist.insumos.table.usuario.atiende" /></th>
									<th style="text-align: center;"><spring:message code="lms.hist.insumos.table.fecha.atencion" /></th>
								</tr>
							</thead>
							<tbody>
								
								<c:if test="${not empty lstConsultas}">
									<c:forEach items="${lstConsultas}" var="cunsulta" varStatus="loop">
										<tr>
											<td style="text-align: center;"><c:forEach
													items="${lstInsumoActividad}" var="insumoActividad">
													<c:if test="${insumoActividad.id == cunsulta.idActividad}">
														<c:out value="${insumoActividad.nombre}" />
													</c:if>
												</c:forEach></td>
											<td>${cunsulta.folio}</td>
											<td>
												<c:if test="${cunsulta.idEstatus == 1}"><spring:message code="lms.hist.insumos.table.estatus.solicitado" /></c:if>
												<c:if test="${cunsulta.idEstatus == 2}"><spring:message code="lms.hist.insumos.table.estatus.recibido" /></c:if>
												<c:if test="${cunsulta.idEstatus == 3}"><spring:message code="lms.hist.insumos.table.estatus.atendido" /></c:if>
											</td>
											<td>${cunsulta.usuarioVO.dtsFuncionarioVO.nombres}
												${cunsulta.usuarioVO.dtsFuncionarioVO.apellidoUno}
												${cunsulta.usuarioVO.dtsFuncionarioVO.apellidoDos}</td>
											<td><fmt:formatDate value="${cunsulta.creacion}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
											
											<td>
												<c:if test="${cunsulta.idEstatus == 2 || cunsulta.idEstatus == 3}">
													${cunsulta.usuarioRecibe.dtsFuncionarioVO.nombres}
													${cunsulta.usuarioRecibe.dtsFuncionarioVO.apellidoUno}
													${cunsulta.usuarioRecibe.dtsFuncionarioVO.apellidoDos}
												</c:if>
												<c:if test="${cunsulta.idEstatus == 1}">
													--
												</c:if>
											</td>
											<td>
												<c:if test="${cunsulta.idEstatus == 2 || cunsulta.idEstatus == 3}">
													<fmt:formatDate value="${cunsulta.modificacion}" type="date" pattern="yyyy-MM-dd HH:mm"/>
												</c:if>
												<c:if test="${cunsulta.idEstatus == 1}">
													--
												</c:if>
												
											</td>
											
											<td>
												<c:if test="${cunsulta.idEstatus == 3}">
													${cunsulta.usuarioAtiende.dtsFuncionarioVO.nombres}
													${cunsulta.usuarioAtiende.dtsFuncionarioVO.apellidoUno}
													${cunsulta.usuarioAtiende.dtsFuncionarioVO.apellidoDos}
												</c:if>
												<c:if test="${cunsulta.idEstatus == 1 || cunsulta.idEstatus == 2}">
													--
												</c:if>
											</td>
											<td>
												<c:if test="${cunsulta.idEstatus == 3}">
													<fmt:formatDate value="${cunsulta.atencion}" type="date" pattern="yyyy-MM-dd HH:mm"/>
												</c:if>
												<c:if test="${cunsulta.idEstatus == 1 || cunsulta.idEstatus == 2}">
													--
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
		</div>
</main>



