<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript"
	src="<c:url value='/resources/js/lms/insumos/insumo.js' />"
	type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Insumos</h1>
		<%-- <ol class="breadcrumb">
            <li><a href="#" onclick="getCursos();"><i class="fa fa-bar-chart-o"></i>Cursos</a></li>
            <li><a href="#" class="active">${curso.nombre}</a></li>
        </ol> --%>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newActividad();">Crear
				nueva encuesta de insumos</button>
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="width: 5%; text-align: center;">Empresa</th>
							<th style="width: 75%;">Actividad</th>
							<th style="width: 10%; text-align: center;">Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstInsumoActividad}">
							<c:forEach items="${lstInsumoActividad}" var="actividad"
								varStatus="loop">
								<tr>
									<td style="text-align: center;">${actividad.auxEmpresa}</td>
									<td>
										<a style="cursor: pointer;"
											onclick="getActividadPreguntas( ${actividad.id});">${actividad.nombre}</a>
									</td>
									<td style="text-align: center;">
										<a href="#" title="Editar"
											onclick="editActividad(${actividad.id});">
											<i class="fa fa-gear"></i>
										</a>
										&nbsp;
										<c:if test="${actividad.banActivo == 1}">
											<a href="#" title="Estatus"
												onclick="estatusActividad( ${actividad.id});">
												<i class="fa fa-eye"></i>
											</a>
										</c:if>
										<c:if test="${actividad.banActivo == 0}">
											<a href="#" title="Estatus"
												onclick="estatusActividad(${actividad.id});">
												<i class="fa fa-eye-slash"></i>
											</a>
										</c:if>
										<%-- &nbsp;		
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaActividad(${curso.id}, ${actividad.id});"><i class="fa fa-arrow-circle-up"></i></a> &nbsp; 
										</c:if>
				                    		<c:if test="${loop.count != fn:length(lstInsumoActividad)}">
											<a href="#" title="Abajo" onclick="orderAbajoActividad(${curso.id}, ${actividad.id});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
										</c:if> --%>
									</td>
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




<div class="modal fade" id="modalNewEncuesta" tabindex="-1"
	role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewEncuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadEncuesta"
				action="javascript:saveActividadEncuesta(this);" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptActividadEncuestaTitulo">Nueva
						solicitud de Insumos</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control"
								id="iptIdActividadEncuesta" name="iptIdActividadEncuesta">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadEncuestaNombre">Titulo</label>
										<input type="text" class="form-control"
											id="iptActividadEncuestaNombre" placeholder="Titulo"
											maxlength="100" required="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadEncuestaDescripcion">Descripción</label>
										<textarea class="form-control" required
											id="iptActividadEncuestaDescripcion" rows="4"
											placeholder="Descripción ..." maxlength="500" required=""></textarea>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Empresa</label>
										<select class="form-control" required
											id="selectActividadEncuestaEmpresa">
											<option value="">Seleccione...</option>
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
										<label>Estatus</label>
										<select class="form-control" required
											id="selectActividadEncuestaEstatus">
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
					<button id="btnAcceptModalEncuesta" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalEncuesta" type="button" class="btn">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="modalEstatusActividad" tabindex="-1"
	role="dialog" aria-labelledby="modalEstatusActividad"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formEstatusActividad"
				action="javascript:estatusActividadConfirmacion(this);"
				method="POST" class="" data-parsley-validate="">

				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Actividad</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<h4>¿Esta seguro que desea cambiar el estatus de la
								actividad?</h4>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <input type="hidden" id="iptEstatusCursoId" value=""> -->
					<input type="hidden" id="iptEstatusActividadId" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>

			</form>
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
            "bSort": false,
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
  		$('#formActividadEncuesta').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadEncuesta').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadEncuesta').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
	
	
</script>


<script type="text/javascript">
    $(function() {
    	$('input[name="daterange"]').daterangepicker({
    	    "timePicker": true,    	
    	    "maxSpan": {
    	        "days": 60
    	    },
    	    "locale": {
    	        "format": "DD/MM/YYYY hh:mm A",
    	        "separator": " - ",
    	        "applyLabel": "Aplicar",
    	        "cancelLabel": "Cancelar",
    	        "fromLabel": "Desde",
    	        "toLabel": "Hasta",
    	        "customRangeLabel": "Custom",
    	        "weekLabel": "S",
    	        "daysOfWeek": [
    	            "Lu",
    	            "Ma",
    	            "Mi",
    	            "Ju",
    	            "Vi",
    	            "Sa",
    	            "Do"
    	        ],
    	        "monthNames": [
    	            "Enero",
    	            "Febrero",
    	            "Marzo",
    	            "Abril",
    	            "Mayo",
    	            "Junio",
    	            "Julio",
    	            "Agosto",
    	            "Septiembre",
    	            "Octubre",
    	            "Noviembre",
    	            "Diciembre"
    	        ]
    	        ,"firstDay": 1
    	    },
    	   "linkedCalendars": true,
    	    "showCustomRangeLabel": false,
    	    "startDate": moment().startOf('hour'),
    	    "endDate": moment().startOf('hour').add(2, 'hour')
    	}
    	, function(start, end, label) {        	
    	  console.log('New date range selected: ' + start.format('DD/MM/YYYY hh:mm A') + ' to ' + end.format('DD/MM/YYYY hh:mm A') + ' (predefined range: ' + label + ')');
    	}
    	);
    });
</script>

