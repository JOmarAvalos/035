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
		<h1>Empresas</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newEmpresa();">Nueva
				Empresa</button>
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatEmpresas();"><i class="fa fa-file-excel-o"
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

							<th>Clave</th>
							<th>Nombre</th>
							<th>Activo</th>
							<th>Creacion</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstEmpresa}">
							<c:forEach items="${lstEmpresa}" var="empresa" varStatus="loop">
								<tr>
									<td>${empresa.clave}</td>
									<td>${empresa.nombre}</td>
									<td>${empresa.banActivo}</td>
									<td><fmt:formatDate value="${empresa.creacion}" type="date" pattern="yyyy-MM-dd" /></td>
									<td>
										<a href="#" title="Ver" onclick="getEmpresa(${empresa.id});"><i class="fa fa-cog"></i></a>&nbsp;
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaEmpresa(${empresa.id});"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstEmpresa)}">
											<a href="#" title="Abajo" onclick="orderAbajoEmpresa(${empresa.id});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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

<div class="modal fade" id="modalNewEmpresa" tabindex="-1" role="dialog"
	aria-labelledby="modalNewEmpresa" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nueva Empresa</h3>
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
						<input type="hidden" id="iptIdEmpresa">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptClaveEmpresa">Clave</label> <input type="text"
											class="form-control" id="iptClaveEmpresa"
											placeholder="Clave de Empresa"
											onchange="validaEmpresaDuplicada();"
											style="text-transform: uppercase" maxlength="10">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptNombreEmpresa">Nombre</label> <input
											type="text" class="form-control" id="iptNombreEmpresa"
											placeholder="Nombre Empresa" maxlength="20">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Color primario</label>
										<div class="input-group my-colorpicker1" id="my_colorPicker1">
											<input type="text" class="form-control" id="iptColorPrimario" />
											<div class="input-group-addon">
												<i></i>
											</div>
										</div>
										<!-- /.input group -->
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Color secundario</label>
										<div class="input-group my-colorpicker2" id="my_colorPicker2">
											<input type="text" class="form-control"
												id="iptColorSecundario" />
											<div class="input-group-addon">
												<i></i>
											</div>
										</div>
										<!-- /.input group -->
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Color secundario contraste</label>
										<div class="input-group my-colorpicker3" id="my_colorPicker3">
											<input type="text" class="form-control" id="iptColorSecContraste" />
											<div class="input-group-addon">
												<i></i>
											</div>
										</div>
										<!-- /.input group -->
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Color texto</label>
										<div class="input-group my-colorpicker4" id="my_colorPicker4">
											<input type="text" class="form-control"
												id="iptColorTexto" />
											<div class="input-group-addon">
												<i></i>
											</div>
										</div>
										<!-- /.input group -->
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Empresa lider</label> <select class="form-control"
											id="selectEmpresaLider">
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
										<label for="iptContactoEmpresa">Contacto</label> <input
											type="text" class="form-control" id="iptContactoEmpresa"
											placeholder="Tel&eacute;fono de contacto" maxlength="10" onkeypress="return isNumberKey(event)">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="checkbox">
										<label> <input id="iptCheckEmpresaActivo"
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
				<button type="button" class="btn" onclick="saveEmpresa();"
					id="btnSaveEmpresa">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal">Cancelar</button>

			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalEmpresaDuplicada" tabindex="-1"
	role="dialog" aria-labelledby="modalEmpresaDuplicada"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Empresa duplicada</h3>
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
							<h1>Existe una empresa registrada con la misma clave</h1>
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
                $(".my-colorpicker1").colorpicker();
                //color picker with addon
                $(".my-colorpicker2").colorpicker();
                $(".my-colorpicker3").colorpicker();
                //color picker with addon
                $(".my-colorpicker4").colorpicker();
            });
            
            
        </script>
