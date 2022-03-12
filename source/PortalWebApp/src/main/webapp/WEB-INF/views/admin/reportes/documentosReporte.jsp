
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="<c:url value='/resources/css/AdminLTE.css' />"
	rel="stylesheet" type="text/css" />
<script
	src="<c:url value='/resources/js/admin/reportesAdicionales.js' />"
	type="text/javascript"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Documentos de Reportes Adicionales > ${cicloReportes.nombre}</h1>
		<ol class="breadcrumb">
			<li><a href="#" onclick="window.history.back();" class="active">
					<i class="fa fa-arrow-circle-o-left"></i> Atras
			</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
				<div>
			<button class="btn btn-primary" onclick="descargarZip(${cicloReportes.id});">Descargar Zip</button>
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">

				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="width: 20%; text-align: center;">Tipo de Reporte</th>
							<th style="width: 20%;">Archivo</th>
							<th style="width: 20%; text-align: center;">Subido Por</th>
							<th style="width: 20%; text-align: center;">Fecha de subida</th>
							<th style="width: 20%; text-align: center;"></th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstReportes}">
							<c:forEach items="${lstReportes}" var="reporte" varStatus="loop">
								<tr>
									<td style="text-align: center;"><c:forEach
											items="${lstTiposReportes}" var="tipoReporte">
											<c:if test="${tipoReporte.id == reporte.idTipoReporte}">
												<c:out value="${tipoReporte.nombre}" />
											</c:if>
										</c:forEach></td>
									<td>${reporte.auxNombreArchivo}</td>
									<td>${reporte.usuarioVO.dtsFuncionarioVO.nombres}
										${reporte.usuarioVO.dtsFuncionarioVO.apellidoUno}
										${reporte.usuarioVO.dtsFuncionarioVO.apellidoDos}</td>
									<c:if test="${not empty reporte.modificacion}">
										<td><fmt:formatDate value="${reporte.modificacion}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
									</c:if>
									<c:if test="${empty reporte.modificacion}">
										<td><fmt:formatDate value="${reporte.creacion}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
									</c:if>
									<td style="text-align: center;"><a href="#" title="Descargar"
										onclick="descargarFile(${reporte.id});"><i
											class="glyphicon glyphicon-save"></i></a></td>
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
