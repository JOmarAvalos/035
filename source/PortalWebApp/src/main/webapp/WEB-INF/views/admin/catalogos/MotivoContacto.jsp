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
	src="<c:url value='/resources/js/plugins/ckeditor/ckeditor.js' />"
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
		<h1>Motivos Contacto</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newMotivoContacto();">Nuevo
				Motivo Contacto</button>
		</div>
				<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatMotivosContacto();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
				<table id="tableMotivoContacto"
					class="table table-bordered table-striped">
					<thead>
						<tr>

							<th>Empresa</th>
							<th>Motivo Contacto</th>
							<th>Activo</th>
							<th></th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstMotivosContacto}">
							<c:forEach items="${lstMotivosContacto}" var="motivo" varStatus="loop">
								<tr>
									<td><c:forEach items="${lstEmpresa}" var="empresa">
											<c:if test="${empresa.id == motivo.idEmpresa}">
												<c:out value="${empresa.nombre}" />
											</c:if>
										</c:forEach></td>
									<td>${motivo.motivoContacto}</td>
									<td>${motivo.banActivo}</td>
									<td>
										<a href="#" title="Ver" onclick="getMotivoContacto('${motivo.id}');"><i class="fa fa-cog"></i></a>&nbsp;
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaMotivoContacto('${motivo.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstMotivosContacto)}">
											<a href="#" title="Abajo" onclick="orderAbajoMotivoContacto('${motivo.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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


<div class="modal fade" id="modalNewMotivoContacto" tabindex="-1"
	role="dialog" aria-labelledby="modalNewMotivoContacto"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formMotivoContacto"
				action="javascript:saveMotivoContacto(this);" method="POST" class=""
				data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptMotivoContactoTitulo">Nuevo
						Motivo Contacto</h3>
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
											id="selectEmpresaMotivoContacto" required="">
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
										<label for="iptNombreMotivoContacto">Motivo Contacto</label> 
										<input
											type="text" class="form-control" id="iptNombreMotivoContacto" maxlength="30"
											required="" placeholder="Motivo Contacto (Español)">
										<input
											type="text" class="form-control" id="iptNombreMotivoContactoEn" maxlength="30"
											required="" placeholder="Motivo Contacto (Inglés)">
										<input
											type="text" class="form-control" id="iptNombreMotivoContactoFr" maxlength="30"
											required="" placeholder="Motivo Contacto (Frances)">
									</div>
								</div>
							</div>

							<div class='row'>
							
								<div class='col-md-12'>
									<div class='box box-info'>
										<div class='box-header'>
											<h3 class='box-title'>
												Contenido de Correo 
											</h3>
											<!-- tools box -->

											<!-- /. tools -->
										</div>
										<!-- /.box-header -->
										<div  class='box-body pad'>

											<textarea id="iptTemplateMotivoContacto"
												name="iptTemplateMotivoContacto" required="" rows="10"
												cols="80">
                                        
                                        </textarea>

										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="checkbox">
										<label> <input id="iptCheckMotivoContactoActivo"
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
					<input type="hidden" id="iptIdMotivoContacto" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>

		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("#tableMotivoContacto").dataTable({
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
				$('#formMotivoContacto').parsley().on('field:validated',
						function() {
							var ok = $('.parsley-error').length === 0;
							$('.bs-callout-info').toggleClass('hidden', !ok);
							$('.bs-callout-warning').toggleClass('hidden', ok);
						}),
				$('#formMotivoContacto').parsley().options.requiredMessage = "Este campo es requerido",
				$('#formMotivoContacto').parsley({
					successClass : 'parsleyCorrect',
					errorClass : 'parsleyError'
				});
	});
</script>

<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('iptTemplateMotivoContacto');
	
	});
	$.fn.modal.Constructor.prototype.enforceFocus = function () {
	    modal_this = this
	    $(document).on('focusin.modal', function (e) {
	        if (modal_this.$element[0] !== e.target && !modal_this.$element.has(e.target).length
	      
	        &&
	        !$(e.target.parentNode).hasClass('cke_dialog_ui_input_select') && !$(e.target.parentNode).hasClass('cke_dialog_ui_input_text')) {
	            modal_this.$element.focus()
	        }
	    })
	};
</script>