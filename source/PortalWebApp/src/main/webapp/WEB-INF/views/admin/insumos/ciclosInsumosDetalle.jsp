
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="<c:url value='/resources/css/AdminLTE.css' />"
	rel="stylesheet" type="text/css" />
<script
	src="<c:url value='/resources/js/lms/insumos/insumo.js' />"
	type="text/javascript"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Encuestas de Insumos > ${cicloInsumos.nombre}</h1>
		<ol class="breadcrumb">
			<li><a href="#" onclick="window.history.back();" class="active">
					<i class="fa fa-arrow-circle-o-left"></i> Atras
			</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
				<div>
			<button class="btn btn-primary" onclick="exportaCiclo(${cicloInsumos.id});">Exportar ciclo</button>
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">

				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="text-align: center;">Nombre de la solicitud</th>
							<th style="text-align: center;">Folio</th>
							<th style="text-align: center;">Estatus</th>
							<th style="text-align: center;">Usuario Solicita</th>
							<th style="text-align: center;">Distribuidor</th>
							<th style="text-align: center;">Fecha de solicitud</th>
							<th style="text-align: center;">Usuario recibe</th>
							<th style="text-align: center;">Fecha de recibido</th>
							<th style="text-align: center;">Usuario atiende</th>
							<th style="text-align: center;">Fecha de atenci&oacute;n</th>
							<th style="text-align: center;">Acciones</th>
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
										<c:if test="${cunsulta.idEstatus == 1}">Solcitado</c:if>
										<c:if test="${cunsulta.idEstatus == 2}">Recibido</c:if>
										<c:if test="${cunsulta.idEstatus == 3}">Atendido</c:if>
									</td>
									<td>${cunsulta.usuarioVO.dtsFuncionarioVO.nombres}
										${cunsulta.usuarioVO.dtsFuncionarioVO.apellidoUno}
										${cunsulta.usuarioVO.dtsFuncionarioVO.apellidoDos}</td>
									<td>${cunsulta.auxDistribuidor}</td>
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
									
									<td style="text-align: center;">
										<a href="#" title="Descargar" onclick="exportaSolicitud(${cunsulta.id});"><i class="glyphicon glyphicon-save"></i></a>
										<c:if test="${cunsulta.idEstatus == 1}">
											<button type="button" class="btn" onclick="actualizaConsulta('${cunsulta.id}', '2','${cicloInsumos.id}');">Recibido</button>
										</c:if>
										<c:if test="${cunsulta.idEstatus == 2}">
											<button type="button" class="btn" onclick="actualizaConsulta('${cunsulta.id}', '3','${cicloInsumos.id}');">Atendido</button>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>

					</tbody>
				</table>
			</div>
		</div>
	</section>

	<!-- /.content -->
</aside>
<!-- /.right-side -->
