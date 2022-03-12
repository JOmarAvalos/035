<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="<c:url value='/resources/js/lms/cursos/actividadExamen.js' />" type="text/javascript"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Preguntas Examen</h1>
		<ol class="breadcrumb">
            <li><a href="#" onclick="getCursos();"><i class="fa fa-bar-chart-o"></i>Cursos</a></li>
            <li><a href="#" onclick="getCurso(${curso.id});" class="">${curso.nombre}</a></li>
            <li><a href="#" class="active">${actividad.nombre}</a></li>
        </ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newPreguntaExamen();">Crear nueva pregunta</button>
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
				<input type="hidden" class="form-control" id="iptIdActividadExamen" name="iptIdActividadExamen" value="${actividad.actividadExamenVO.id}" >
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="width: 5%; text-align: center;">Orden</th>
							<th style="width: 15%;">Tipo</th>
							<th style="width: 70%;">Pregunta</th>
							<th style="width: 10%; text-align: center;">Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstPreguntasExamen}">
							<c:forEach items="${lstPreguntasExamen}" var="pregunta" varStatus="loop">
								<tr>
									<td style="text-align: center;">${pregunta.orden}</td>
									<td>${pregunta.examenPreguntaTipoVO.nombre}</td>
									<td>
										<c:if test="${pregunta.idExamenTipoPregunta == 2 || pregunta.idExamenTipoPregunta == 3}">
											<a style="cursor: pointer;" onclick="getRespuestaExamen(${curso.id}, ${actividad.id}, ${pregunta.id});">${pregunta.nombre}</a>
										</c:if>
										<c:if test="${pregunta.idExamenTipoPregunta != 2 && pregunta.idExamenTipoPregunta != 3}">
											${pregunta.nombre}
										</c:if>
									</td>
									<td style="text-align: center;">
										<a href="#" title="Editar" onclick="editPreguntaExamen(${pregunta.id});"><i class="fa fa-gear"></i></a> 
										&nbsp; 
										<c:if test="${pregunta.banActivo == 1}">
											<a href="#" title="Estatus" onclick="estatusPreguntaExamen(${curso.id}, ${actividad.id}, ${pregunta.id});"><i class="fa fa-eye"></i></a>
										</c:if>
										<c:if test="${pregunta.banActivo == 0}">
											<a href="#" title="Estatus" onclick="estatusPreguntaExamen(${curso.id}, ${actividad.id}, ${pregunta.id});"><i class="fa fa-eye-slash"></i></a>
										</c:if>
										&nbsp;
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaPreguntaExamen(${curso.id}, ${actividad.id}, ${actividad.actividadExamenVO.id}, ${pregunta.id});"><i class="fa fa-arrow-circle-up"></i></a> &nbsp; 
										</c:if>
				                    		<c:if test="${loop.count != fn:length(lstPreguntasExamen)}">
											<a href="#" title="Abajo" onclick="orderAbajoPreguntaExamen(${curso.id}, ${actividad.id}, ${actividad.actividadExamenVO.id}, ${pregunta.id});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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


<div class="modal fade" id="modalNewPreguntaExamen" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewPreguntaExamen" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPreguntaExamen"
				action="javascript:savePreguntaExamen(this,'${curso.id}','${actividad.id}','${actividad.actividadExamenVO.id}');" method="POST"
				class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptPreguntaExamenTitulo">Nueva pregunta Examen</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividadExamen" name="iptIdActividadExamen" value="${actividad.actividadExamenVO.id}">
							<input type="hidden" class="form-control" id="iptIdPreguntaExamen" name="iptIdPreguntaExamen" value="${actividad.id}">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaExamenNombre">Nombre</label> <input
											type="text" class="form-control"
											id="iptPreguntaExamenNombre"
											placeholder="Nombre de pregunta" maxlength="100" required="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Tipo</label> 
										<select class="form-control" id="selectPreguntaExamenTipo" required="">
										    <option value="">Seleccione...</option>
										    <c:forEach var="preguntaTipos" items="${lstExamenPreguntaTipo}">
												<option value="${preguntaTipos.id}"><c:out value="${preguntaTipos.nombre}"/> </option>
											</c:forEach>	
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectPreguntaExamenEstatus" required="">
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
					<button id="btnAcceptModalPreguntaExamen" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalPreguntaExamen" type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalEstatusPreguntaExamen" tabindex="-1" role="dialog"
	aria-labelledby="modalEstatusPreguntaExamen" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			
		 	<!-- form start -->
	        <form role="form" id="formEstatusPreguntaExamen" action="javascript:estatusPreguntaExamenConfirmacion(this);" method="POST" class="" data-parsley-validate="" >
				
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Pregunta Examen</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
		                <div class="box-header"></div>
	                    <div class="box-body">
	                    		<h4>¿Esta seguro que desea cambiar el estatus de la pregunta?</h4>
	                    </div>
	                </div>
	            </div>
				<div class="modal-footer">
					<input type="hidden" id="iptEstatusCursoId" value="">
					<input type="hidden" id="iptEstatusActividadExamenId" value="">
					<input type="hidden" id="iptEstatusPreguntaExamenId" value="">
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
            "bAutoWidth": true
        });
    });
</script>

<script type="text/javascript">
	$(function () {
  		$('#formPreguntaExamen').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPreguntaExamen').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPreguntaExamen').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
</script>
