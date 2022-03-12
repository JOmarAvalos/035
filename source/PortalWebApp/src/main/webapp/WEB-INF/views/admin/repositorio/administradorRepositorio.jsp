
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="<c:url value='/resources/css/AdminLTE.css' />"
	rel="stylesheet" type="text/css" />
<script
	src="<c:url value='/resources/js/admin/administradorRepositorio.js' />"
	type="text/javascript"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Repositorio</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newCarpeta();">Nueva
				Carpeta</button>
		</div>
		<br>
		
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<c:if test="${not empty lstEmpresa}">
					<c:forEach items="${lstEmpresa}" var="empresa">
						<c:if test="${not empty currentEmpresa}">
							<c:if test="${empresa.id == currentEmpresa.id}">
								<li class="active">
									<a href="#" onclick="window.location = ctx + '/administradorRepositorioEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
								</li>
							</c:if>
							<c:if test="${empresa.id != currentEmpresa.id}">
								<li>
									<a href="#" onclick="window.location = ctx + '/administradorRepositorioEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
								</li>
							</c:if>
						</c:if>
						<c:if test="${empty currentEmpresa}">
							<li>
								<a href="#" onclick="window.location = ctx + '/administradorRepositorioEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
							</li>
						</c:if>
						
					</c:forEach>
				</c:if>
			</ul>
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
							<th style="width: 70%;">Nombre de la Carpeta</th>
							<th style="width: 10%; text-align: center;">Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstCarpetas}">
							<c:forEach items="${lstCarpetas}" var="carpeta" varStatus="loop">
								<tr>
									<td style="text-align: center;"><c:forEach
											items="${lstEmpresa}" var="empresa">
											<c:if test="${empresa.id == carpeta.idEmpresa}">
												<c:out value="${empresa.nombre}" />
											</c:if>
										</c:forEach></td>
									<td><a style="cursor: pointer;"
										onclick="getCarpetasArchivos(${carpeta.id});">${carpeta.nombre}</a></td>
									<td style="text-align: center;"><c:if
											test="${carpeta.tipo == 1}">
											<a href="#" title="Descargar Zip"
																onclick="descargarZip(${carpeta.id});"><i
																class="glyphicon glyphicon-save"></i></a>
																&nbsp;
										</c:if> <c:if test="${carpeta.visible == 1}">
											<a href="#" title="Visible" onclick="visibilidadCarpetaRaiz(${carpeta.id});"><i
												class="fa fa-eye"></i></a>
																&nbsp;
														</c:if> <c:if test="${carpeta.visible == 0}">
											<a href="#" title="Visible" onclick="visibilidadCarpetaRaiz(${carpeta.id});"><i
												class="fa fa-eye-slash"></i></a>
																&nbsp;
														</c:if></td>
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


<div class="modal fade" id="modalNewCarpeta" tabindex="-1" role="dialog"
	aria-labelledby="modalNewCarpeta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formCarpeta"
				action="javascript:saveCarpeta(this);" method="POST" class=""
				data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptCarpetaTitulo">Nueva Carpeta</h3>
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
										<label for="iptNombreCarpeta">Nombre de la carpeta</label> <input
											type="text" class="form-control" id="iptNombreCarpeta"
											placeholder="Nombre de la carpeta" maxlength="300"
											required="" onkeypress="return isValidChar(event)">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Empresa</label> <select class="form-control"
											id="selecCarpetaEmpresa"
											required="">
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
										<label>Visible</label> <select class="form-control"
											id="selectCarpetaVisible" name="selectCarpetaVisible"
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
				<h3 class="box-title">Carpeta</h3>
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
				$('#formCarpeta').parsley().on('field:validated', function() {
					var ok = $('.parsley-error').length === 0;
					$('.bs-callout-info').toggleClass('hidden', !ok);
					$('.bs-callout-warning').toggleClass('hidden', ok);
				}),
				$('#formCarpeta').parsley().options.requiredMessage = "Este campo es requerido",
				$('#formCarpeta').parsley({
					successClass : 'parsleyCorrect',
					errorClass : 'parsleyError'
				});
	});
</script>