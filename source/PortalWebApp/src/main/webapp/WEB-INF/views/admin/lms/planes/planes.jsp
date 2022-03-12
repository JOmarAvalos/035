<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript"
	src="<c:url value='/resources/js/lms/planes/planes.js' />"
	type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Planes de carrera</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newPlan();">Crear
				nuevo plan de carrera</button>
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatPlanes();"><i class="fa fa-file-excel-o"
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
							<th style="width: 5%; text-align: center;">Orden</th>
							<th style="width: 10%; text-align: center;">Empresa</th>
							<th style="width: 10%; text-align: center;">Código</th>
							<th style="width: 45%;">Planes de carrera</th>
							<th style="width: 10%; text-align: center;">Puesto</th>
							
							<th style="width: 10%; text-align: center;">Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstPlanes}">
							<c:forEach items="${lstPlanes}" var="plan" varStatus="loop">
								<tr>
									<td style="text-align: center;">${plan.orden}</td>
									<td style="text-align: center;">${plan.empresaVO.nombre}</td>
									<td style="text-align: center;">${plan.codigo}</td>
									<td><a style="cursor: pointer;"
										onclick="getPlanActividades(${plan.id});">${plan.nombre}</a></td>
									<td style="text-align: center;">${plan.puestoVO.nombre}</td>
									<td style="text-align: center;"><a href="#" title="Editar" onclick="editPlan(${plan.id});"><i class="fa fa-gear"></i></a>
										&nbsp; <c:if test="${plan.banActivo == 1}">
											<a href="#" title="Estatus"
												onclick="estatusPlan(${plan.id});"><i class="fa fa-eye"></i></a>
										</c:if> <c:if test="${plan.banActivo == 0}">
											<a href="#" title="Estatus"
												onclick="estatusPlan(${plan.id});"><i
												class="fa fa-eye-slash"></i></a>
										</c:if> &nbsp; <c:if test="${loop.count != 1}">
											<a href="#" title="Arriba"
												onclick="orderArribaPlan(${plan.id});"><i
												class="fa fa-arrow-circle-up"></i></a>&nbsp;
				                    		</c:if> <c:if
											test="${loop.count != fn:length(lstPlanes)}">
											<a href="#" title="Abajo"
												onclick="orderAbajoPlan(${plan.id});"><i
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

<div class="modal fade" id="modalNewPlan" tabindex="-1" role="dialog"
	aria-labelledby="modalNewPlan" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPlan" action="javascript:savePlan(this);"
				method="POST" class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptPlanTitulo">Plan de carrera</h3>
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
										<label for="iptPlanCodigo">Código</label> <input type="text"
											class="form-control" id="iptPlanCodigo" name="iptPlanCodigo"
											placeholder="Código de Plan de Carrera" maxlength="10"
											required="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPlanNombre">Nombre</label> 
										<input type="text"
											class="form-control" id="iptPlanNombre" name="iptPlanNombre"
											placeholder="Nombre de Plan de Carrera (Español)" maxlength="100"
											required="">
										<input type="text"
											class="form-control" id="iptPlanNombreEn" name="iptPlanNombreEn"
											placeholder="Nombre de Plan de Carrera (Inglés)" maxlength="100"
											required="">
										<input type="text"
											class="form-control" id="iptPlanNombreFr" name="iptPlanNombreFr"
											placeholder="Nombre de Plan de Carrera (Frances)" maxlength="100"
											required="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPlanDescripcion">Descripción</label> 
										<input type="text" class="form-control" id="iptPlanDescripcion" name="iptPlanDescripcion"
											placeholder="Descripción de Plan de Carrera (Español)" maxlength="300"
											required="">
										<input type="text" class="form-control" id="iptPlanDescripcionEn" name="iptPlanDescripcionEn"
											placeholder="Descripción de Plan de Carrera (Inglés)" maxlength="300"
											required="">
										<input type="text" class="form-control" id="iptPlanDescripcionFr" name="iptPlanDescripcionFr"
											placeholder="Descripción de Plan de Carrera (Frances)" maxlength="300"
											required="">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Empresa</label> <select class="form-control"
											id="selectPlanEmpresa" name="selectPlanEmpresa" onchange="getSelectsEmpresa();"
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
								<div class="col-md-6">
									<div class="form-group">
										<label>Grupo Puesto</label> <select class="form-control"
											id="selecPlanGrupoPuesto" name="selecPlanGrupoPuesto" onchange="getPuestos();"
											required="">
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Puestos</label> <select class="form-control"
											id="selecPlanPuesto" name="selecPlanPuesto" required="">
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control"
											id="selectPlanEstatus" name="selectPlanEstatus" required="">
											<option value="">Seleccione...</option>
											<option value="1">Activo</option>
											<option value="0">Inactivo</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Plantillas</label> <select class="form-control"
											id="selectPlanPlantilla" name="selectPlanPlantilla">
											<option value="">Seleccione...</option>
											<c:forEach var="plantilla" items="${lstPlantillas}">
												<option value="${plantilla.id}"><c:out
														value="${plantilla.nombre}" />
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							
							
							<div class="row">
								<div class="col-md-6" style="text-align: center;">
									<div class="form-group" style="text-align: left;">
										<label for="iptPlanImagenIcono">Imagen</label> 
									</div>
									<div class="form-group">
										<img id="iptPlanIconoImg" name="iptPlanIconoImg"
											 src="<c:url value='/resources/css/img/icono_imagen_v1.png' />"
											 alt="documento image" style="width: 90px;" />
									</div>
									<div class="form-group" style="text-align: center;">
										<input type="file" id="iptPlanImagenFile" name="iptPlanImagenFile" accept=".jpg" onchange="inUploadChange(this)" style="display: inline;">
										<p class="help-block">&nbsp;&nbsp;&nbsp;Tipo de archivo aceptado: JPG</p>
									</div>
								</div>
								<div class="col-md-6" style="text-align: center;">
									<div id="planRowDownload" class="row" style="display:none">
										<div class="form-group">
											<label for="iptPlanIcono">Archivo actual</label> 
										</div>
										<div class="form-group"> 
											<p id="iptPlanActualFile" class="help-block"> </p>
										</div>
										<div class="form-group"> 
											<button onclick="downloadFile( $('#iptPlanId').val() ); return false;" >Descargar</button>
										</div>
									</div>
								</div>
							</div>
							
							
						</div>
						<!-- /.box -->
					</div>
					<div class="modal-footer">
						<input type="hidden" id="iptPlanId" name="iptPlanId" value="">
						<button type="submit" class="btn">Aceptar</button>
						<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</div>
<div class="modal fade" id="modalEstatusPlan" tabindex="-1"
	role="dialog" aria-labelledby="modalEstatusPlan" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formEstatusPlan"
				action="javascript:estatusPlanConfirmacion(this);" method="POST"
				class="" data-parsley-validate="">

				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Plan de carrera</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<h4>¿Esta seguro que desea cambiar el estatus del plan de
								carrera?</h4>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="iptEstatusPlanId" value="">
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
				<h3 class="box-title">Plan de carrera</h3>
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

<!-- page script -->
<script type="text/javascript">
    $(function() {
        $('#example1').dataTable({
        	"pageLength": 30 ,
            "bPaginate": true,
            "bLengthChange": true,
            "bFilter": true,
            "bSort": true,
            "bInfo": true,
            "bAutoWidth": true,
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
            }
        });
    });
</script>

<script type="text/javascript">
	$(function () {
  		$('#formPlan').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPlan').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPlan').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
	
	$(function () {
  		$('#formEstatusPlan').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formEstatusPlan').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formEstatusPlan').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
</script>



