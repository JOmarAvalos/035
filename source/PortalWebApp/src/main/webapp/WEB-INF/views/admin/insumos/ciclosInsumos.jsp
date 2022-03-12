
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
		<h1>Ciclos de Insumos</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newCicloInsumo();">Crear
				ciclo de insumos</button>
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
							<th style="width: 35%;">Nombre</th>
							<th style="width: 15%; text-align: center;">Fecha de Inicio</th>
							<th style="width: 15%; text-align: center;">Fecha de Cierre</th>
							<th style="width: 15%; text-align: center;"></th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstciclos}">
							<c:forEach items="${lstciclos}" var="cicloInsumos"
								varStatus="loop">
								<tr>
									<td style="text-align: center;"><c:forEach
											items="${lstEmpresa}" var="empresa">
											<c:if test="${empresa.id == cicloInsumos.idEmpresa}">
												<c:out value="${empresa.nombre}" />
											</c:if>
										</c:forEach></td>
									<td>${cicloInsumos.nombre}</td>
									<td style="text-align: center;"><fmt:formatDate value="${cicloInsumos.fchInicio}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
									<td style="text-align: center;"><fmt:formatDate value="${cicloInsumos.fchCierre}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
									<td style="text-align: center;">
										<button class="btn btn-primary" onclick="verDetalle(${cicloInsumos.id});" >Ver detalle </button>
										<button class="btn btn-primary" onclick="verEditar('${cicloInsumos.id}','${cicloInsumos.idEmpresa}', '${cicloInsumos.nombre}', '<fmt:formatDate value="${cicloInsumos.fchInicio}" type="date" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${cicloInsumos.fchInicio}" type="date" pattern="HH:mm"/>' ,'<fmt:formatDate value="${cicloInsumos.fchCierre}" type="date" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${cicloInsumos.fchCierre}" type="date" pattern="HH:mm"/>' );" >Editar </button>
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


<div class="modal fade" id="modalNewCicloInsumo" tabindex="-1"
	role="dialog" aria-labelledby="modalNewCicloInsumo" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formCicloInsumo">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptCicloInsumoTitulo">Crear Ciclo
						de Insumos</h3>
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
										<label for="iptNombreCicloInsumo">Nombre del ciclo
											de insumos</label> <input type="text" class="form-control"
											id="iptNombreCicloInsumo"
											placeholder="Nombre del ciclo de insumos" maxlength="300"
											>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Empresa</label> <select class="form-control" required
											id="selecCicloInsumoEmpresa" onchange="showFechas()">
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
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptFechaInicioCicloInsumo">Fecha de
											inicio</label> <input type="datetime-local" class="form-control"
											id="iptFechaInicioCicloInsumo"
											name="iptFechaInicioCicloInsumo" onchange="setMinDateFin();" disabled>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptFechaFinCicloInsumo">Fecha de
											t&eacute;rmino</label> <input type="datetime-local"
											class="form-control" id="iptFechaFinCicloInsumo"
											name="iptFechaFinCicloInsumo" onchange="validacion();" disabled>
									</div>
								</div>
							</div> 
						</div>
					</div>
					<!-- /.box -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" onclick="saveCicloInsumo();" id="btnGuardaCiclo">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>

		</div>
	</div>
</div>

<div class="modal fade" id="modalEditCicloInsumo" tabindex="-1"
	role="dialog" aria-labelledby="modalEditCicloInsumo" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formCicloInsumo">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptCicloInsumoTitulo">Editar Ciclo
						de insumos</h3>
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
								<input type="hidden" id="iptIdCicloEdit">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptNombreCicloInsumoEdit">Nombre del ciclo
											de insumos</label> <input type="text" class="form-control"
											id="iptNombreCicloInsumoEdit"
											placeholder="Nombre del ciclo de insumos" maxlength="300"
											>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Empresa</label> <select class="form-control" required
											id="selecCicloInsumoEmpresaEdit" disabled="disabled">
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
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptFechaInicioCicloInsumoEdit">Fecha de
											inicio</label> <input type="datetime-local" class="form-control"
											id="iptFechaInicioCicloInsumoEdit"
											name="iptFechaInicioCicloInsumoEdit" >
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptFechaFinCicloInsumoEdit">Fecha de
											t&eacute;rmino</label> <input type="datetime-local"
											class="form-control" id="iptFechaFinCicloInsumoEdit"
											name="iptFechaFinCicloInsumoEdit" >
									</div>
								</div>
							</div> 
						</div>
					</div>
					<!-- /.box -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" onclick="editCicloInsumo();" id="btnActualizaCiclo">Aceptar</button>
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
				<h3 class="box-title">Insumos</h3>
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
<div class="modal fade" id="modalDatosObligatorios" tabindex="-1" role="dialog"
	aria-labelledby="modalDatosObligatorios" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">DATOS OBLIGATORIOS</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<div class="box-body">
						<h4 id="modalTxtRespuesta"><h4>Los campos marcados en rojo son obligatorios o no cumplen con el formato requerido.</h4></h4>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Aceptar</button>
			</div>

		</div>
	</div>
</div>
<div class="modal fade" id="modalDatosFechaCiclo" tabindex="-1" role="dialog"
	aria-labelledby="modalDatosFechaCiclo" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">DATOS OBLIGATORIOS</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<div class="box-body">
						<h4 id="modalTxtRespuesta">Las fechas seleccionadas ya se encuentran registradas.<br> Favor de seleccionar una fecha mayor</h4>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Aceptar</button>
			</div>

		</div>
	</div>
</div>
