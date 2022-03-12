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

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Proyectos</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newProyecto();">Nuevo
				Proyecto</button>
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatProyectos();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
				<table id="tableProyecto" class="table table-bordered table-striped">
					<thead>
						<tr>

							<th>Empresa</th>
							<th>Clave</th>
							<th>Nombre</th>
							<th>Activo</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstProyectos}">
							<c:forEach items="${lstProyectos}" var="proyecto" varStatus="loop">
								<tr>
									<td>${proyecto.auxEmpresa}</td>
									<td>${proyecto.clave}</td>
									<td>${proyecto.nombre}</td>
									<td>${proyecto.banActivo}</td>
									<td>
										
										<a href="#" title="Ver" onclick="getProyecto('${proyecto.id}');"><i class="fa fa-cog"></i></a>&nbsp;
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaProyecto('${proyecto.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstProyectos)}">
											<a href="#" title="Abajo" onclick="orderAbajoProyecto('${proyecto.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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


<div class="modal fade" id="modalNewProyecto" tabindex="-1"
	role="dialog" aria-labelledby="modalNewProyecto" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formProyecto"
				action="javascript:saveProyecto(this);" method="POST" class=""
				data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptProyectoTitulo">Nuevo Proyecto</h3>
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
											id="selectEmpresaproyecto" required="">
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
										<label for="iptClaveProyecto">Clave</label> <input type="text"
											class="form-control" id="iptClaveProyecto" required=""
											placeholder="Clave" maxlength="10">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptNombreProyecto">Nombre</label> 
										<input type="text" class="form-control" id="iptNombreProyecto"
											required="" placeholder="Nombre (Español)" maxlength="20">
										<input type="text" class="form-control" id="iptNombreProyectoEn"
											required="" placeholder="Nombre (Inglés)" maxlength="20">
										<input type="text" class="form-control" id="iptNombreProyectoFr"
											required="" placeholder="Nombre (Frances)" maxlength="20">
									</div>
								</div>
							</div>
							<div class="row">

								<div class="col-md-12">
									<div class="checkbox">
										<label> <input id="iptCheckProyectoActivo" 
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
					<input type="hidden" id="iptProyectoId" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>

		</div>
	</div>
</div>
<script type="text/javascript">
            $(function() {
                $("#tableProyecto").dataTable({
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
  		$('#formProyecto').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formProyecto').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formProyecto').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
</script>