ç<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="<c:url value='/resources/js/lms/insumos/insumoPregunta.js' />" type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Respuestas</h1>
		<ol class="breadcrumb">
            <li><a href="#" onclick="getInsumos();"><i class="fa fa-bar-chart-o"></i>Insumos</a></li>
            <%-- <li><a href="#" onclick="getCurso(${curso.id});" class="">${curso.nombre}</a></li> --%>
            <li><a href="#" onclick="getInsumoActividad( ${actividad.id});" class="">${actividad.nombre}</a></li>
            <li><a href="#" class="active">${actividadPregunta.nombre}</a></li>
        </ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			
			<c:if test="${botonEstatus == 'HABILITADO'}">
				<button class="btn btn-primary" onclick="newRespuesta();">Crear nueva respuesta</button>
			</c:if>
			<c:if test="${botonEstatus == 'INHABILITADO'}">
				<button class="btn btn-primary" onclick="" disabled>Crear nueva respuesta</button>
				<ul class="parsley-errors-list filled" id="parsley-id-5" aria-hidden="false">
				    <li class="parsley-required">Respuestas agotadas por ser del tipo: Verdadero / Falso</li>
				</ul>
			</c:if>
			
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
				<input type="hidden" class="form-control" id="iptIdEncuestaPregunta" name="iptIdEncuestaPregunta" value="${encuestaPregunta.id}" >
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="width: 5%; text-align: center;">Orden</th>
							<th style="width: 75%;">Respuesta</th>
							<th style="width: 10%; text-align: center;">Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstRespuestas}">
							<c:forEach items="${lstRespuestas}" var="respuesta" varStatus="loop">
								<tr>
									<td style="text-align: center;">${respuesta.orden}</td>
									<td>
										<c:if test="${actividadPregunta.idTipoPregunta == 5}">${respuesta.nombre} / ${respuesta.nombre2}</c:if>
										<c:if test="${actividadPregunta.idTipoPregunta != 5}">${respuesta.nombre}</c:if>
										
									</td>

									<td style="text-align: center;">
										<a href="#" title="Editar" onclick="editRespuesta(${respuesta.id});"><i class="fa fa-gear"></i></a> 
										&nbsp; 
										<c:if test="${respuesta.banActivo == 1}">
											<a href="#" title="Estatus" onclick="estatusRespuesta(${actividad.id}, ${actividadPregunta.id}, ${respuesta.id});"><i class="fa fa-eye"></i></a>
										</c:if>
										<c:if test="${respuesta.banActivo == 0}">
											<a href="#" title="Estatus" onclick="estatusRespuesta(${actividad.id}, ${actividadPregunta.id}, ${respuesta.id});"><i class="fa fa-eye-slash"></i></a>
										</c:if>
										&nbsp;
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaRespuesta(${actividad.id}, ${actividadPregunta.id}, ${respuesta.id});"><i class="fa fa-arrow-circle-up"></i></a> &nbsp; 
										</c:if>
				                    		<c:if test="${loop.count != fn:length(lstRespuestas)}">
											<a href="#" title="Abajo" onclick="orderAbajoRespuesta(${actividad.id}, ${actividadPregunta.id}, ${respuesta.id});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
										</c:if>
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


<div class="modal fade" id="modalNewRespuesta" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewRespuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formRespuesta"
				action="javascript:saveRespuesta(this, ${actividad.id},'${actividadPregunta.id}','${respuesta.id}');" method="POST"
				class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptRespuestaTitulo">Nueva Respuesta</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividad" name="iptIdActividad" value="${actividad.id}">
							<input type="hidden" class="form-control" id="iptIdPregunta" name="iptIdPregunta" value="${actividadPregunta.id}">
							<input type="hidden" class="form-control" id="iptIdRespuesta" name="iptIdRespuesta" value="${respuesta.id}">
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label id="iptRespuestaTituloNombre" for="iptRespuestaNombre">
											<!-- Solo se muestra para tipo de pregunta comparacion de columnas  -->
											<c:if test="${actividadPregunta.idTipoPregunta == 5}">Columna Izquierda</c:if>
											<c:if test="${actividadPregunta.idTipoPregunta != 5}">Respuesta</c:if>
										</label> <input
											type="text" class="form-control"
											id="iptRespuestaNombre"
											placeholder="Nombre de respuesta" maxlength="100" required="">
									</div>
								</div>
							</div>
							
							<!-- Solo se muestra para tipo de pregunta comparacion de columnas  -->
							<c:if test="${actividadPregunta.idTipoPregunta == 5}">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label id="iptRespuestaTituloNombre2" for="iptRespuestaNombre2">Columna Derecha</label> <input
												type="text" class="form-control"
												id="iptRespuestaNombre2"
												placeholder="Nombre de respuesta" maxlength="100" required="">
										</div>
									</div>
								</div>
							</c:if>
							

							<!-- No se muestra para tipo de pregunta comparacion de columnas  -->
							<!-- actividad.idTipoActividad == 4 (Examen) -->
							<!-- actividadPregunta.idTipoPregunta != 5 (Relacion de columnas) -->
							<%-- <c:if test="${actividad.idTipoActividad == 4 && actividadPregunta.idTipoPregunta != 5}"> 
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>Correcta</label>
											<select class="form-control" id="selectRespuestaCorrecta" required="">
											    <option value="">Seleccione...</option>
												<option value="1">Si</option>
												<option value="0">No</option>
											</select>
										</div>
									</div>
								</div>
							</c:if> --%>
							
							<%-- <c:if test="${actividad.idTipoActividad == 4}">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>Ponderaci&oacute;n</label> 
											<input type="number" class="form-control" id="iptRespuestaPonderacion" name="iptRespuestaPonderacion" value="0"
												   min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
											       onKeyDown="" required="">
										</div>
									</div>
								</div>
							</c:if> --%>
							
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectRespuestaEstatus" required="">
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
					<button id="btnAcceptModalRespuesta" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalRespuesta" type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalEstatusRespuesta" tabindex="-1" role="dialog"
	aria-labelledby="modalEstatusRespuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			
		 	<!-- form start -->
	        <form role="form" id="formEstatusRespuesta" action="javascript:estatusRespuestaConfirmacion(this);" method="POST" class="" data-parsley-validate="" >
				
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Respuesta</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
		                <div class="box-header"></div>
	                    <div class="box-body">
	                    		<h4>¿Esta seguro que desea cambiar el estatus de la respuesta?</h4>
	                    </div>
	                </div>
	            </div>
				<div class="modal-footer">
					<input type="hidden" id="iptEstatusActividadId" value="">
					<input type="hidden" id="iptEstatusPreguntaId" value="">
					<input type="hidden" id="iptEstatusRespuestaId" value="">
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
  		$('#formRespuesta').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formRespuesta').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formRespuesta').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
</script>
