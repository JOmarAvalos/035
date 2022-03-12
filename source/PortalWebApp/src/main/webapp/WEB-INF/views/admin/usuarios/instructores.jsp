
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script src="<c:url value='/resources/js/admin/funcionarios.js' />"
	type="text/javascript"></script>

<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Instructores</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div id="divInstructores">
			<div>
				<button class="btn btn-primary" onclick="showNewInstructor();">Nuevo
					Instructor</button>
			</div>
			<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatInstructores();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
			<br>
			<div class="box mb-5">
				<div class="box-header"></div>
				<!-- /.box-header -->
				<div class="box-body table-responsive">
					<table id="tblInstructores" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Empresa</th>
								<th>RFC</th>
								<th>Nombre</th>
								<th>Apellidos</th>
								<th>Mail</th>
								<th>C&oacute;digo Empresa</th>
								<th>Activo</th>
								<th>Acciones</th>
							</tr>
						</thead>
						<tbody>
	
							<c:if test="${not empty lstInstructores}">
								<c:forEach items="${lstInstructores}" var="instructor" varStatus="loop">
									<tr>
										<td>${instructor.auxEmpresa}</td>
										<td>${instructor.funcionario.rfc}</td>
										<td>${instructor.funcionario.datosFuncionarioVO.nombres}</td>
										<td>${instructor.funcionario.datosFuncionarioVO.apellidoUno}
											${instructor.funcionario.datosFuncionarioVO.apellidoDos}</td>
										<td>${instructor.funcionario.datosFuncionarioVO.email}</td>
										<td>${instructor.codigoEmpresa}</td>
										<c:if test="${instructor.banActivo == 1}">
											<td><i class="fa fa-check"></i></td>
										</c:if>
										<c:if test="${instructor.banActivo == 0}">
											<td><i class="fa fa-ban"></i></td>
										</c:if>
										<td>
											
											<a href="#" title="Ver" onclick="updateInstructor('${instructor.funcionario.idUsuario}','${instructor.funcionario.rfc}','${instructor.funcionario.datosFuncionarioVO.nombres} ${instructor.funcionario.datosFuncionarioVO.apellidoUno} ${instructor.funcionario.datosFuncionarioVO.apellidoDos}','${instructor.funcionario.idEmpresa}','${instructor.id}','${instructor.banActivo}','${instructor.codigoEmpresa}');"><i class="fa fa-cog"></i></a>&nbsp;
											
											<c:if test="${loop.count != 1}">
												<a href="#" title="Arriba" onclick="orderArribaInstructor('${instructor.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
											</c:if>
				                    		
			                    			<c:if test="${loop.count != fn:length(lstInstructores)}">
												<a href="#" title="Abajo" onclick="orderAbajoInstructor('${instructor.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
											</c:if>
											${instructor.orden}
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
		</div>
		
		<div id="divInstructoresNO" style="display:none;">
			<div>
				<button class="btn btn-primary" onclick="hideNewInstructor();">Cancelar</button>
			</div>
			<br>
			<div class="box mb-5">
				<div class="box-header"></div>
				<!-- /.box-header -->
				<div class="box-body table-responsive">
					<table id="tblInstructoresNO" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Empresa</th>
								<th>RFC</th>
								<th>Nombre</th>
								<th>Apellidos</th>
								<th>Mail</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
	
							<c:if test="${not empty lstInstructoresNO}">
								<c:forEach items="${lstInstructoresNO}" var="funcionario">
									<tr>
										<td>${funcionario.auxEmpresaStr}</td>
										<td>${funcionario.rfc}</td>
										<td>${funcionario.datosFuncionarioVO.nombres}</td>
										<td>${funcionario.datosFuncionarioVO.apellidoUno}
											${funcionario.datosFuncionarioVO.apellidoDos}</td>
										<td>${funcionario.datosFuncionarioVO.email}</td>
										<td><button type="button" class="btn"
												onclick="newInstructor('${funcionario.idUsuario}','${funcionario.rfc}','${funcionario.datosFuncionarioVO.nombres} ${funcionario.datosFuncionarioVO.apellidoUno} ${funcionario.datosFuncionarioVO.apellidoDos}','${funcionario.idEmpresa}');">Asignar</button></td>
									</tr>
								</c:forEach>
							</c:if>
	
						</tbody>
					</table>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>



	</section>
	<!-- /.content -->
</aside>
<!-- /.right-side -->

<div class="modal fade" id="modalNewFuncionario" tabindex="-1"
	role="dialog" aria-labelledby="modalNewFuncionario" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Instructor</h3>
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
							<input type="hidden" id="iptIdInstructor">
							<input type="hidden" id="iptIdUsuario">
							<input type="hidden" id="iptRFCInst">
							<input type="hidden" id="iptNombreInst">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Empresa</label> <select class="form-control"
												id="selectEmpresaInstructor" disabled="disabled">
												<option value="0">Seleccione...</option>
												<c:if test="${not empty lstEmpresa}">
													<c:forEach items="${lstEmpresa}" var="empresa">
														<option value="${empresa.id}">${empresa.nombre}</option>
													</c:forEach>
												</c:if>
											</select>
										</div>
									</div>
								</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptCodigoInterno">C&oacute;digo Interno</label> <input type="text"
											class="form-control" id="iptCodigoInterno" placeholder="C&oacute;digo Interno" maxlength="10">
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkbox">
										<label> <input id="iptCheckInstructorActivo"
											type="checkbox" checked="checked"> Activo
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
				<button type="button" class="btn" onclick="continueNewInstructor();" >Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalConfirmaInstructor" tabindex="-2"
	role="dialog" aria-labelledby="modalPuestoAsignado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Confirmaci&oacute;n</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Se actualizaran los datos del instructor.</h1>
				<br>
				<h2 id="h2NombreInst"> Nombre: </h2>
				<br>
				<h2 id="h2RFCInst"> RFC: </h2>
				<br>
				<h2 id="h2CodigoInInst"> C&oacute;digo Interno: </h2>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="saveInstructor();">Aceptar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalExitoInstructor" tabindex="-2"
	role="dialog" aria-labelledby="modalExitoInstructor" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Instructor actualizado con exito.</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="window.location = ctx + '/funcionarios/instructores';">Aceptar</button>
			</div>
		</div>
	</div>
</div>


<!-- page script -->
<script type="text/javascript">
    $(function() {
        $('#tblInstructores').dataTable({
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
        
        $('#tblInstructoresNO').dataTable({
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

