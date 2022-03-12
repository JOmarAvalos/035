<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script
	src="<c:url value='/resources/js/admin/diainhabil/diainhabil.js' />"
	type="text/javascript"></script>
	
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>


<aside class="right-side">
	<section class="content-header">
		<h1>
			<spring:message code="home.menu.dias.title" />
		</h1>

	</section>
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newDia();">
				<spring:message code="home.menu.dias.bnt.new" />
			</button>
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatDiasInhabiles();"><i class="fa fa-file-excel-o"
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
							<th><spring:message code="home.menu.dias.table.empresa" /></th>
							<th><spring:message code="home.menu.dias.table.fecha" /></th>
							<th><spring:message code="home.menu.dias.table.estatus" /></th>
							<th><spring:message code="home.menu.dias.table.creacion" /></th>
							<th style="width: 10%; text-align: center;"> Acciones</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty lstDiasInhabiles}">
							<c:forEach items="${lstDiasInhabiles}" var="diaInhabil" varStatus="loop">
								<tr>
									<td>${diaInhabil.empresaVO.nombre}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${diaInhabil.fecha}" /></td>
									<td><c:if test="${diaInhabil.banActivo == 1}">
											<spring:message code="home.menu.dias.estatus.activo" />
										</c:if> <c:if test="${diaInhabil.banActivo == 0}">
											<spring:message code="home.menu.dias.estatus.inactivo" />
										</c:if></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${diaInhabil.fchCreacion}" /></td>
									<td style="text-align: center;">

										<a href="#" title="Ver" onclick="getDia('${diaInhabil.id}');"><i class="fa fa-cog"></i></a>&nbsp;
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaDia('${diaInhabil.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstDiasInhabiles)}">
											<a href="#" title="Abajo" onclick="orderAbajoDia('${diaInhabil.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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

<div class="modal fade" id="modalNewDia" tabindex="-1" role="dialog"
	aria-labelledby="modalNewDia" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">
					<spring:message code="home.menu.dias.title.modal" />
				</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<form role="form" id="formActividadDia" >
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<!-- /.box-header -->
						<!-- form start -->

						<div class="box-body">

							<div class="row">
								<input type="hidden" id="iptIdDia">
								<div class="col-md-12">
									<div class="form-group">
										<label><spring:message
												code="home.menu.dias.modal.empresa" /></label> <select required
											class="form-control" id="selecEmpresaDia">
											<option value=""><spring:message
													code="home.menu.dias.modal.selecciona" /></option>
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
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptDiaFecha">Fecha Inh&aacute;bil</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="date" class="form-control" id="iptDiaFecha" placeholder="d&iacute;a" >
										</div>
										<!-- /.input group -->
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control" required
											id="selectDiaEstatus">
											<option value=""><spring:message
													code="home.menu.dias.modal.selecciona" /></option>
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
					<button type="button" class="btn" onclick="saveDia();">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>

				</div>
			</form>
		</div>
	</div>
</div>

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

		 //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
        
        $("[data-mask]").inputmask();
	});
</script>
