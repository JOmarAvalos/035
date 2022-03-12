<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script src="<c:url value='/resources/js/admin/catalogos.js' />"
	type="text/javascript"></script>
	<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script
	src="<c:url value='/resources/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js' />"
	type="text/javascript"></script>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Motivos de Cancelaciones de cursos</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newMotivoCancelacion();">Nuevo
				Motivo de Cancelación de curso</button>
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatMotivosCancelacionesCursos();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
				<table id="tableMotivoCancelacion"
					class="table table-bordered table-striped">
					<thead>
						<tr>

							<th>Empresa</th>
							<th>Motivo de Cancelacion</th>
							<th>Activo</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstMotivosCancelacion}">
							<c:forEach items="${lstMotivosCancelacion}" var="cancelacion" varStatus="loop">
								<tr>
									<td><c:forEach items="${lstEmpresa}" var="empresa">
											<c:if test="${empresa.id == cancelacion.idEmpresa}">
												<c:out value="${empresa.nombre}" />
											</c:if>
										</c:forEach></td>
									<td>${cancelacion.motivoCancelacion}</td>
									<td>${cancelacion.banActivo}</td>
									<td>
										
										<a href="#" title="Ver" onclick="getMotivoCancelacionCurso('${cancelacion.id}');"><i class="fa fa-cog"></i></a>&nbsp;
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaMotivoCancelacionCurso('${cancelacion.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstMotivosCancelacion)}">
											<a href="#" title="Abajo" onclick="orderAbajoMotivoCancelacionCurso('${cancelacion.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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


<div class="modal fade" id="modalNewMotivoCancelacion" tabindex="-1"
	role="dialog" aria-labelledby="modalNewMotivoCancelacion"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formMotivoCancelacion"
				action="javascript:saveMotivoCancelacionCurso(this);" method="POST" class=""
				data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptMotivoCancelacionTitulo">Nuevo
						Motivo Cancelación</h3>
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
										<label>Empresa</label> <select class="form-control"
											id="selectEmpresaMotivoCancelacion" required="">
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
										<label for="iptNombreMotivoCancelacion">Motivo Cancelación</label> 
										<input type="text" class="form-control" id="iptNombreMotivoCancelacion" maxlength="200"
											required="" placeholder="Motivo Cancelación (Español)">
										<input type="text" class="form-control" id="iptNombreMotivoCancelacionEn" maxlength="200"
											required="" placeholder="Motivo Cancelación (Inglés)">
										<input type="text" class="form-control" id="iptNombreMotivoCancelacionFr" maxlength="200"
											required="" placeholder="Motivo Cancelación (Frances)">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="checkbox">
										<label> <input id="iptCheckMotivoCancelacionActivo"
											 type="checkbox"> Activo
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.box -->
				</div>
				<div class="modal-footer">
					<input type="hidden" id="iptIdMotivoCancelacion" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>

		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("#tableMotivoCancelacion").dataTable({
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
	$(function() {
				$('#formMotivoCancelacion').parsley().on('field:validated',
						function() {
							var ok = $('.parsley-error').length === 0;
							$('.bs-callout-info').toggleClass('hidden', !ok);
							$('.bs-callout-warning').toggleClass('hidden', ok);
						}),
				$('#formMotivoCancelacion').parsley().options.requiredMessage = "Este campo es requerido",
				$('#formMotivoCancelacion').parsley({
					successClass : 'parsleyCorrect',
					errorClass : 'parsleyError'
				});
	});
</script>
