
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="now" class="java.util.Date" />

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
		<h1>Funcionarios</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newFuncionario();">Nuevo
				Funcionario</button>
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatFuncionarios();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
		
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<c:if test="${not empty lstEmpresa}">
					<c:forEach items="${lstEmpresa}" var="empresa">
						<c:if test="${not empty currentEmpresa}">
							<c:if test="${empresa.id == currentEmpresa.id}">
								<li class="active">
									<a href="#" onclick="window.location = ctx + '/funcionarios/getByEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
								</li>
							</c:if>
							<c:if test="${empresa.id != currentEmpresa.id}">
								<li>
									<a href="#" onclick="window.location = ctx + '/funcionarios/getByEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
								</li>
							</c:if>
						</c:if>
						<c:if test="${empty currentEmpresa}">
							<li>
								<a href="#" onclick="window.location = ctx + '/funcionarios/getByEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
							</li>
						</c:if>
						
					</c:forEach>
				</c:if>
			</ul>
		</div>
		<c:if test="${not empty currentEmpresa}">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<c:if test="${activos == 1}">
						<li class="active">
							<a href="#" onclick="window.location = ctx + '/funcionarios/getByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Activos</a>
						</li>	
						<li>
							<a href="#" onclick="window.location = ctx + '/funcionarios/getInactivosByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Inactivos</a>
						</li>	
					</c:if>		
					<c:if test="${activos == 0}">
						<li >
							<a href="#" onclick="window.location = ctx + '/funcionarios/getByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Activos</a>
						</li>	
						<li class="active">
							<a href="#" onclick="window.location = ctx + '/funcionarios/getInactivosByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Inactivos</a>
						</li>	
					</c:if>		
				</ul>
			</div>
		</c:if>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Empresa</th>
							<th>RFC</th>
							<th>Nombre</th>
							<th>Apellidos</th>
							<th>Fecha nacimiento</th>
							<th>Mail</th>
							<th>Work ID</th>
							<th>Dealer</th>
							<th>Puesto</th>
							<th>Estatus</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstFuncionarios}">
							<c:forEach items="${lstFuncionarios}" var="funcionario">
								<c:set var="selectedUser" value="${funcionario}" scope="request" />
								<tr>
									<td>${funcionario.auxEmpresaStr}</td>
									<td>${funcionario.rfc}</td>
									<td>${funcionario.datosFuncionarioVO.nombres}</td>
									<td>${funcionario.datosFuncionarioVO.apellidoUno}
										${funcionario.datosFuncionarioVO.apellidoDos}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${funcionario.datosFuncionarioVO.fechaNacimiento}" /></td>
									<td>${funcionario.datosFuncionarioVO.email}</td>
									<td>${funcionario.workId}</td>
									<td>${funcionario.auxDealerPrincipal}</td>
									<td>${funcionario.auxPuestoPrincipal}</td>
									<c:if test="${funcionario.idEstatusFuncionario eq 1}">
										<td>Email pendiente de confirmar</td>
									</c:if>
									<c:if test="${funcionario.idEstatusFuncionario eq 2 || funcionario.idEstatusFuncionario eq 6 || funcionario.idEstatusFuncionario eq 7 || funcionario.idEstatusFuncionario eq 12 || funcionario.idEstatusFuncionario eq 13}">
										<td>Activo</td>
									</c:if>
									<c:if test="${funcionario.idEstatusFuncionario eq 3 || funcionario.idEstatusFuncionario eq 4 || funcionario.idEstatusFuncionario eq 8}">
										<td>Inactivo</td>
									</c:if>
									<c:if test="${funcionario.idEstatusFuncionario eq 5}">
										<td>Reingreso pendiente</td>
									</c:if>
									<c:if test="${funcionario.idEstatusFuncionario eq 9}">
										<td>Email Confirmado</td>
									</c:if>
									<c:if test="${funcionario.idEstatusFuncionario eq 10}">
										<td>Funcionario rechazado</td>
									</c:if>
									<c:if test="${funcionario.idEstatusFuncionario eq 11}">
										<td>Eliminado</td>
									</c:if>
									<td><button type="button" class="btn"
											onclick="modalFuncionario(${funcionario.id});">Ver</button></td>
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

<div class="modal fade" id="modalNewFuncionario" tabindex="-1"
	role="dialog" aria-labelledby="modalNewFuncionario" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nuevo Funcionario</h3>
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
					<form role="form" >
						<div class="box-body">
							<input type="hidden" id="iptIdFuncionario">
							<c:if
								test="${sessionScope.currentUser.idEmpresa == null || sessionScope.currentUser.idEmpresa == 1 }">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Empresa</label> <select class="form-control"
												id="selectEmpresaFuncionario" onchange="getSelectsEmpresa();">
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
							</c:if>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Selecciona si el funcionario es Extranjero o Nacional</label> <select class="form-control"
											id="selectExtranjero" onchange="validateExtranjero();">
											<option value="">Seleccione...</option>
											<option value="0">Nacional</option>
											<option value="1">Extranjero</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row" id="rowDocumentoExtranjero" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
                                          <label for="extranjeroFile">Documento</label>
                                          <input type="file" id="extranjeroFile"  accept="application/pdf,image/jpeg,image/x-png" onchange="validaSize(this);">
                                    </div>
								</div>
							</div>
							<div class="row" id="rowIdDocumento" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptIdDocumento">Id documento</label> <input type="text"
											class="form-control" id="iptIdDocumento" placeholder="Id Documento" maxlength="50">
									</div>
								</div>								
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptRfcFuncionario">RFC</label> <input type="text" style="text-transform: uppercase;"
											class="form-control" id="iptRfcFuncionario" placeholder="RFC" onchange="validaRFC();" maxlength="30">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptNombresFuncionario">Nombre</label> <input
											type="text" class="form-control" id="iptNombresFuncionario"
											placeholder="Nombre" maxlength="50">
									</div>
								</div>
							</div>
							<div class="row" id="rowDocumentoRFC" >
								<div class="col-md-12">
									<div class="form-group">
                                          <label for="rfcFile">Documento RFC</label>
                                          <input type="file" id="rfcFile" accept="application/pdf,image/jpeg,image/x-png" onchange="validaSize(this);">
                                    </div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptApellidoPaternoFuncionario">Apellido
											Paterno</label> <input type="text" class="form-control"
											id="iptApellidoPaternoFuncionario"
											placeholder="Apellido Paterno" maxlength="50">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptApellidoMaternoFuncionario">Apellido
											Materno</label> <input type="text" class="form-control"
											id="iptApellidoMaternoFuncionario"
											placeholder="Apellido Materno" maxlength="50">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptNacimientoFuncionario">Fecha de
											nacimiento</label> <input type="date" class="form-control"
											id="iptNacimientoFuncionario"
											placeholder="Fecha de Nacimiento">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptSexoFuncionario">Sexo: </label><br> <input
											type="radio" name="hm" id="iptSexoFuncionarioM" value="M"
											checked="checked"> Mujer <input type="radio"
											name="hm" id="iptSexoFuncionarioH" value="H"> Hombre
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptEmail1Funcionario">Email</label> <input
											type="text" class="form-control" id="iptEmail1Funcionario"
											placeholder="Email" maxlength="50">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptEmail2Funcionario">Email Adicional</label> <input
											type="text" class="form-control" id="iptEmail2Funcionario"
											placeholder="Email Adicional" maxlength="50">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptCurpFuncionario">CURP</label> <input
											type="text" class="form-control" id="iptCurpFuncionario"
											placeholder="CURP" maxlength="18">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptNssFuncionario">NSS</label> <input type="text"
											onkeypress="return isNumberKey(event)" class="form-control"
											id="iptNssFuncionario" placeholder="NSS" maxlength="11">
									</div>
								</div>
							</div>
							<div class="row" id="rowDocumentoCURP" >
								<div class="col-md-12">
									<div class="form-group">
                                          <label for="curpFile">Documento CURP</label>
                                          <input type="file" id="curpFile" accept="application/pdf,image/jpeg,image/x-png" onchange="validaSize(this);">
                                    </div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptClinicaFuncionario">Cl&iacute;nica</label> <input
											type="text" class="form-control" id="iptClinicaFuncionario"
											placeholder="Clinica" maxlength="50">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptNoClinicaFuncionario">No Cl&iacute;nica</label> <input type="text"
											onkeypress="return isNumberKey(event)" class="form-control"
											id="iptNoClinicaFuncionario" placeholder="No Clinica" maxlength="8">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptTelefonoFuncionario">Tel&eacute;fono:</label> <input
											type="text" onkeypress="return isNumberKey(event)"
											class="form-control" id="iptTelefonoFuncionario"
											placeholder="Telefono" maxlength="10">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label for="iptExtensionFuncionario">Extensi&oacute;n:</label> <input
											type="text" onkeypress="return isNumberKey(event)"
											class="form-control" id="iptExtensionFuncionario"
											placeholder="Extensión" maxlength="5">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="iptMovilFuncionario">M&oacute;vil:</label> <input
											type="text" onkeypress="return isNumberKey(event)"
											class="form-control" id="iptMovilFuncionario"
											placeholder="Movil" maxlength="10">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptWorkidFuncionario">Work ID</label> <input
											type="text" onkeypress="return isNumberKey(event)"
											class="form-control" id="iptWorkidFuncionario"
											placeholder="Work Id" maxlength="10">
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkbox">
										<label> <input id="iptCheckFuncionarioActivo"
											type="checkbox" checked="checked"> Activo
										</label>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- /.box -->
				<div class="box box-primary" id="divPuestosFuncionario" style="display:none">
					<div class="box-header">
						<h4>Puestos</h4>
					</div>
					<div class="box-body">
						<div id="divNuevoPuesto">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Grupo Puesto</label> <select class="form-control"
												id="selecGrupoPuesto" onchange="getPuestos()">
												<option value="0">Seleccione...</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Puestos</label> <select class="form-control"
												id="selecPuesto">
												<option value="0">Seleccione...</option>
	
											</select>
										</div>
									</div>
								</div>
	
	
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Grupo Dealer</label> <select class="form-control"
												id="selecGrupoDealer" onchange="getDealer()">
												<option value="0">Seleccione...</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Dealer</label> <select class="form-control"
												id="selecDealer">
												<option value="0">Seleccione...</option>
	
											</select>
										</div>
									</div>
								</div>	
								
								
								
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="iptIngresoPuesto">Fecha de ingreso</label> 
											<input type="date" class="form-control" id="iptIngresoPuesto" onkeydown="return false" placeholder="Fecha de ingreso" min="${MIN_FECHA}" max="${MAX_FECHA}" value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>'>
										</div>
									</div>
									<div class="col-md-6">
										<div class="checkbox">
				                            <label>
				                                <input id="iptCheckPuestoPrincipal" type="checkbox"> Principal
				                            </label>
				                        </div>
									</div>
								</div>	
								
								<div class="row">
									<div class="col-md-6" id="divBtnAsignaPuesto">
										<button type="button" class="btn btn-primary" onclick="asignarPuesto();">Asignar puesto</button>
									</div>
								</div>							
							</div>
						
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="saveFuncionario();" id="btnSaveFuncionario">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalCoincidencias" tabindex="-1"
	role="dialog" aria-labelledby="modalcoincidencias" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Mensaje</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div id="divMensajesC"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalFuncionarioCreado" tabindex="-1"
	role="dialog" aria-labelledby="modalFuncionarioCreado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Funcionario creado con &eacute;xito</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="showAsignaPuesgos();">Asignar puesto</button>
				<button type="button" class="btn btn-primary" onclick="window.location = ctx + '/funcionarios';">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalPuestoAsignado" tabindex="-1"
	role="dialog" aria-labelledby="modalPuestoAsignado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Se asigno el puesto al funcionario</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="window.location = ctx + '/funcionarios';">Aceptar</button>
				<button type="button" class="btn btn-primary" onclick="verFuncionario();">Ver Funcionario</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalTamanioExedido" tabindex="-1"
	role="dialog" aria-labelledby="modalTamanioExedido" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Alerta</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>El archivo seleccionado excede el tamaño permitido (200 kb)</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
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

