<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="<c:url value='/resources/js/admin/catalogos.js' />"
	type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>

<aside class="right-side">
	<section class="content-header">
		<h1>Grupo Puesto</h1>
	</section>

	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newGrupoPuesto();">Nuevo
				Grupo Puesto</button>
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatGrupoPuesto();"><i
				class="fa fa-file-excel-o" style="font-size: 24px; color: green"></i></a>
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Empresa</th>
							<th>Clave</th>
							<th>Descripci&oacute;n</th>
							<th>Funcionarios Activos</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstGrupoPuesto}">
							<c:forEach items="${lstGrupoPuesto}" var="grupoPuesto"
								varStatus="loop">
								<tr>
									<td><c:forEach items="${lstEmpresa}" var="empresa">
											<c:if test="${empresa.id == grupoPuesto.idEmpresa}">
												<c:out value="${empresa.nombre}" />
											</c:if>
										</c:forEach></td>
									<td>${grupoPuesto.clave}</td>
									<td>${grupoPuesto.descripcion}</td>
									<td>${grupoPuesto.totalFuncionarios}</td>
									<td><a href="#" title="Ver"
										onclick="getGrupoPuesto('${grupoPuesto.id}')"><i
											class="fa fa-cog"></i></a>&nbsp; <c:if test="${loop.count != 1}">
											<a href="#" title="Arriba"
												onclick="orderArribaGrupoPuesto('${grupoPuesto.id}');"><i
												class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if> <c:if test="${loop.count != fn:length(lstGrupoPuesto)}">
											<a href="#" title="Abajo"
												onclick="orderAbajoGrupoPuesto('${grupoPuesto.id}');"><i
												class="fa fa-arrow-circle-down"></i></a>&nbsp;
				                    	</c:if></td>
								</tr>
							</c:forEach>
						</c:if>

					</tbody>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->

	</section>
	<!-- /.content -->
</aside>
<!-- /.right-side -->
<div class="modal fade" id="modalNewGrupoPuesto" tabindex="-1"
	role="dialog" aria-labelledby="modalNewGrupoPuesto" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nuevo GrupoPuesto</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<form role="form">
						<div class="box-body">
							<div class="row">
								<input type="hidden" id="iptIdGrupoPuesto">
								<div class="col-md-6">
									<div class="form-group">
										<label>Empresa</label> <select class="form-control"
											id="selectEmpresaGrupoP" onchange="empresaGrupoPSelected();">
											<option value="0">Seleccione...</option>
											<c:if test="${not empty lstEmpresa}">
												<c:forEach items="${lstEmpresa}" var="empresa">
													<option value="${empresa.id}">${empresa.nombre}</option>
												</c:forEach>
											</c:if>

										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptClaveGrupoPuesto">Clave</label> <input
											type="text" class="form-control" id="iptClaveGrupoPuesto"
											placeholder="Clave del Puesto" disabled="disabled"
											onchange="validaGrupoPuestoDuplicado();">
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptDescripcionGrupoPuesto">Descripcion</label> <input
											type="text" class="form-control"
											id="iptDescripcionGrupoPuesto"
											placeholder="Descripcion del Puesto (Español)"> <br>
										<input type="text" class="form-control"
											id="iptDescripcionGrupoPuestoEn"
											placeholder="Descripcion del Puesto (Inglés)"> <br>
										<input type="text" class="form-control"
											id="iptDescripcionGrupoPuestoFr"
											placeholder="Descripcion del Puesto (Frances)">
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkbox">
										<label> <input id="iptCheckGrupoPuestoActivo"
											type="checkbox"> Activo
										</label>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="saveGrupoPuesto();"
					id="btnSaveGrupoPuesto">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal">Cancelar</button>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalNumeroFuncionarios" tabindex="-2"
	role="dialog" aria-labelledby="modalNumeroFuncionarios"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Advertencia</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1 id="h1WarnDealers"></h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal"
					onclick="activaCkeckGrupoPuesto();">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalGrupoPuestoDuplicado" tabindex="-1"
	role="dialog" aria-labelledby="modalGrupoPuestoDuplicado"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Grupo duplicado</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<form role="form">
						<div class="box-body">
							<h1>Existe un grupo de puestos registrado con la misma
								empresa y clave</h1>
						</div>
					</form>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Aceptar</button>

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('#example1')
				.dataTable(
						{
							"pageLength" : 30,
							"bPaginate" : true,
							"bLengthChange" : true,
							"bFilter" : true,
							"bSort" : false,
							"bInfo" : true,
							"bAutoWidth" : true,
							"language" : {
								"url" : "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
							}
						});
	});
</script>


