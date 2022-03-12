
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<link href="<c:url value='/resources/css/AdminLTE.css' />"
	rel="stylesheet" type="text/css" />
<script
	src="<c:url value='/resources/js/admin/catalogos.js' />"
	type="text/javascript"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Tipo de Reportes Adicionales</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newTipoReporte();">Crear
				tipo de reporte</button>
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatTipoReportes();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">

				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="width: 20%; text-align: center;">Empresa</th>
							<th style="width: 50%;">Tipo de Reporte</th>
							<th style="width: 15%; text-align: center;">Acciones</th>

						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstTiposReportes}">
							<c:forEach items="${lstTiposReportes}" var="tipoReporte" varStatus="loop">
								<tr>
									<td style="text-align: center;"><c:forEach
											items="${lstEmpresa}" var="empresa">
											<c:if test="${empresa.id == tipoReporte.idEmpresa}">
												<c:out value="${empresa.nombre}" />
											</c:if>
										</c:forEach></td>
									<td>${tipoReporte.nombre}</td>
									<td style="text-align: center;">
										<c:if test="${tipoReporte.banActivo == 1}">
											<a href="#" title="Visible" onclick="estatusTipoReporte(${tipoReporte.id});"><i class="fa fa-eye"></i></a>&nbsp;
										</c:if> <c:if test="${tipoReporte.banActivo == 0}">
											<a href="#" title="Visible" onclick="estatusTipoReporte(${tipoReporte.id});"><i class="fa fa-eye-slash"></i></a>&nbsp;
										</c:if>
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaTipoReporte(${tipoReporte.id});"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstTiposReportes)}">
											<a href="#" title="Abajo" onclick="orderAbajoTipoReporte(${tipoReporte.id});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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


<div class="modal fade" id="modalNewTipoReporte" tabindex="-1"
	role="dialog" aria-labelledby="modalNewTipoReporte" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formTipoReporte"
				action="javascript:saveTipoReporte(this);" method="POST" class=""
				data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptTipoReporteTitulo">Crear Tipo de
						Reporte</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptNombreTipoReporte">Nombre del tipo de
											reporte</label> <input type="text" class="form-control"
											id="iptNombreTipoReporte"
											placeholder="Nombre del tipo de reporte" maxlength="300"
											required="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptDescripcionTipoReporte">Descripción del
											tipo de reporte</label> <input type="text" class="form-control"
											id="iptDescripcionTipoReporte"
											placeholder="Descripción del tipo de reporte" maxlength="300"
											required="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Empresa</label> <select class="form-control"
											id="selecTipoReporteEmpresa" required="">
											<option value="">Seleccione...</option>
											<c:forEach var="empresa" items="${lstEmpresa}">
												<option value="${empresa.id}"><c:out
														value="${empresa.nombre}" />
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Activo</label> <select class="form-control"
											id="selectTipoReporteActivo" name="selectTipoReporteActivo"
											required="">
											<option value="">Seleccione...</option>
											<option value="1">Activo</option>
											<option value="0">Inactivo</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.box -->
				</div>
				<div class="modal-footer">

					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>

		</div>
	</div>
</div>
<div class="modal fade" id="modalRespuesta" tabindex="-1" role="dialog"
	aria-labelledby="modalRespuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Tipos de Reportes Adicionales</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<div class="box-body">
						<h4 id="modalTxtRespuesta"></h4>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Aceptar</button>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
				$('#formTipoReporte').parsley().on('field:validated', function() {
					var ok = $('.parsley-error').length === 0;
					$('.bs-callout-info').toggleClass('hidden', !ok);
					$('.bs-callout-warning').toggleClass('hidden', ok);
				}),
				$('#formTipoReporte').parsley().options.requiredMessage = "Este campo es requerido",
				$('#formTipoReporte').parsley({
					successClass : 'parsleyCorrect',
					errorClass : 'parsleyError'
				});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#example1").dataTable({
			"pageLength": 30 ,
            "bPaginate": true,
            "bLengthChange": true,
            "bFilter": true,
            "bSort": false,
            "bInfo": true,
            "bAutoWidth": true,
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
            }
        });
	});
</script>