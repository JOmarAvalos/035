
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value='/resources/js/admin/funcionarios.js' />"
	type="text/javascript"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Mesa de control</h1>
	</section>

	<!-- Main content -->
	<section class="content">
	
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<c:if test="${not empty lstEmpresa}">
					<c:forEach items="${lstEmpresa}" var="empresa">
						<c:if test="${not empty currentEmpresa}">
							<c:if test="${empresa.id == currentEmpresa.id}">
								<li class="active">
									<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/nuevosEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
								</li>
							</c:if>
							<c:if test="${empresa.id != currentEmpresa.id}">
								<li>
									<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/nuevosEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
								</li>
							</c:if>
						</c:if>
						<c:if test="${empty currentEmpresa}">
							<li>
								<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/nuevosEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
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
							<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/nuevosEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Nuevos</a>
						</li>	
						<li>
							<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/aceptadosEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Validados</a>
						</li>	
						<li>
							<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/rechazadosEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Rechazados</a>
						</li>	
					</c:if>		
					<c:if test="${activos == 2}">
						<li>
							<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/nuevosEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Nuevos</a>
						</li>	
						<li class="active">
							<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/aceptadosEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Validados</a>
						</li>	
						<li>
							<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/rechazadosEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Rechazados</a>
						</li>	
					</c:if>		
					<c:if test="${activos == 3}">
						<li>
							<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/nuevosEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Nuevos</a>
						</li>	
						<li>
							<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/aceptadosEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Validados</a>
						</li>	
						<li class="active">
							<a href="#" onclick="window.location = ctx + '/funcionarios/mesa/rechazadosEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Rechazados</a>
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
				<table id="tblMesaControl" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Empresa</th>
							<th>RFC</th>
							<th>Funcionario</th>
							<th>Usuario Modifica</th>
							<th>Nombre Usuario Modifica</th>
							<th>Accion</th>
							<th>Fecha</th>
							<th>Gerente valida</th>
							<th>Validaci&oacute;n gerente</th>
							<th>Estatus</th>
							<th>Observaciones</th>
							<th style="width: 10%;"></th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstMesa}">
							<c:forEach items="${lstMesa}" var="funcionario">
								<tr>
									<td>${funcionario.empresa}</td>
									<td>${funcionario.rfc}</td>
									<td>${funcionario.nombre}</td>
									<td>${funcionario.rfcModifica}</td>
									<td>${funcionario.nombreModifica}</td>
									<td>${funcionario.accion}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${funcionario.creacion}" /></td>
									<td>
										<c:if test="${not empty funcionario.validacion}">
											${funcionario.gerente}
										</c:if>
										<c:if test="${empty funcionario.validacion}">
											--
										</c:if>
									</td>
									<td>
										<c:if test="${not empty funcionario.validacion}">
											<c:if test="${funcionario.validacion == 0}">Rechazado</c:if>
											<c:if test="${funcionario.validacion == 1}">Aceptado</c:if>
										</c:if>
										<c:if test="${empty funcionario.validacion}">
											Pendiente
										</c:if>
									</td>
									<td>
										<c:if test="${funcionario.estatus == 1}">Nuevo</c:if>
										<c:if test="${funcionario.estatus == 2}">Validado</c:if>
										<c:if test="${funcionario.estatus == 3}">Rechazado</c:if>
									</td>
									<th>${funcionario.observaciones}</th>
									<td>
										<button type="button" class="btn" onclick="modalFuncionario(${funcionario.idFuncionario});">Ver</button>
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

<!-- page script -->
<script type="text/javascript">
    $(function() {
    	$('#tblMesaControl').dataTable({
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

