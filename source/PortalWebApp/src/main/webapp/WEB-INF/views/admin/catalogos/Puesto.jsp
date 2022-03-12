<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

	<script src="<c:url value='/resources/js/admin/catalogos.js' />" type="text/javascript"></script> 
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>

<aside class="right-side">
	<section class="content-header">
	    <h1>
	       Puestos
	    </h1>
	    
	</section>     
	<section class="content">
	    	<div>
			<button class="btn btn-primary" onclick="newPuesto();">Nuevo Puesto</button>  
		</div>
					<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatPuesto();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
		<br>
		<div class="box mb-5">
		    <div class="box-header">
		    
		    </div><!-- /.box-header -->
		    <div class="box-body table-responsive">
		        <table id="example1" class="table table-bordered table-striped">
		            <thead>
		                <tr>
		                            <th>Empresa</th>
									<th>Grupo de Puestos</th>
									<th>Clave</th>
									<th>C&oacute;digo Agrupaci&oacute;n</th>
									<th>Nombre</th>									
									<th>Periodo Prueba</th>
									<th>Descripci&oacute;n Prueba</th>
									<th>Funcionarios activos</th>
									<th>Estatus</th>
									<th>Acciones</th>
		                    
		                </tr>
		            </thead>
		            <tbody>

	            		<c:if test="${not empty lstPuesto}">
							<c:forEach items="${lstPuesto}" var="puesto" varStatus="loop">
				                <tr>	                           
				                    <td>
									<c:forEach items="${lstEmpresa}" var="empresa">								
									<c:if test="${empresa.id == puesto.idEmpresa}">
									<c:out value = "${empresa.nombre}"/>
									</c:if>
		                            </c:forEach>
									</td>
										<td>${puesto.auxGrupo}</td>
										<td>${puesto.clave}</td>
										<td>${puesto.codigoAgrupacion}</td>
										<td>${puesto.nombre}</td>											
										<td>${puesto.periodoPrueba}</td>
										<td>${puesto.descripcionPrueba}</td>
										<td>${puesto.totalFuncionarios}</td>
										 <td >
											<c:if test="${puesto.banActivo == 1}">
												Activo
											</c:if>
											<c:if test="${puesto.banActivo == 0}">
												Inactivo
											</c:if>
										</td>
				                    	<td>
				                    		<a href="#" title="Ver" onclick="getPuesto('${puesto.id}')"><i class="fa fa-cog"></i></a>&nbsp;
				                    		<a href="#" title="Funcionarios" onclick="verFuncionariosPuesto('${puesto.id}');"><i class="fa fa-users"></i></a>&nbsp;
											
											<c:if test="${loop.count != 1}">
												<a href="#" title="Arriba" onclick="orderArribaPuesto('${puesto.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
											</c:if>
				                    		
			                    			<c:if test="${loop.count != fn:length(lstPuesto)}">
												<a href="#" title="Abajo" onclick="orderAbajoPuesto('${puesto.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
				                    		</c:if>
				                    	</td>
				                </tr>
				          	</c:forEach>
						</c:if>

		            </tbody>
		        </table>
		    </div><!-- /.box-body -->
		</div><!-- /.box -->

	</section><!-- /.content -->
</aside><!-- /.right-side -->  

<div class="modal fade" id="modalNewPuesto" tabindex="-1" role="dialog"
	aria-labelledby="modalNewPuesto" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nuevo Puesto</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
	                <div class="box-header">
	                    
	                </div><!-- /.box-header -->
	                <!-- form start -->
	                <form role="form">
	                    <div class="box-body">
	                    
	                    	<div class="row">
	                    		<input type="hidden" id="iptIdPuesto">
	                    	<div class="col-md-6">
									<div class="form-group">
										<label>Empresa</label>
										<select class="form-control" id="selecEmpresaPuesto" onchange="getGruposByEmpresa()">
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
										<label>Grupo de Puestos</label>
										<select class="form-control" id="selecGrupoPuestoPuesto">
										    <option value="0">Seleccione...</option>
										    
										</select>
									</div>	 
		                   		</div>
	     		
	                    	</div>
                    	
	                    	<div class="row">
	                    	
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptClavePuesto">Clave</label>
			                            <input type="text" class="form-control" id="iptClavePuesto" placeholder="Clave" disabled="disabled" onchange="validaPuestoDuplicado();" maxlength="10">
			                        </div>
	                    		</div>
	                    		
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptCodigoAgrupacionPuesto">C&oacute;digo</label>
			                            <input type="text" class="form-control" id="iptCodigoAgrupacionPuesto" placeholder="C&oacute;digo de Agrupaci&oacute;n" maxlength="10">
			                        </div>
	                    		</div>
	                    		
	                    	</div>
	                    	
	                    	<div class="row">
	                    	
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="ipNombrePuesto">Nombre</label>
			                            <input type="text" class="form-control" id="ipNombrePuesto" placeholder="Nombre del Puesto (Español)" maxlength="100">
			                            <br>
			                            <input type="text" class="form-control" id="ipNombrePuestoEn" placeholder="Nombre del Puesto (Inglés)" maxlength="100">
			                            <br>
			                            <input type="text" class="form-control" id="ipNombrePuestoFr" placeholder="Nombre del Puesto (Frances)" maxlength="100">
			                        </div>
	                    		</div>
	                    		
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptCodigoAreaPuesto">C&oacute;digo Area</label>
			                            <input type="text" class="form-control" id="iptCodigoAreaPuesto" placeholder="C&oacute;digo de Area del Puesto" maxlength="10">
			                        </div>
	                    		</div>
	                    		
	                    	</div>
	                    	
	                    	
	                    	<div class="row">
	                    	
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptPeriodoPruebaPuesto">Periodo de Prueba</label>
			                            <input type="text" class="form-control" id="iptPeriodoPruebaPuesto" placeholder="Periodo de Prueba" onkeypress="return isNumberKey(event)" maxlength="3">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptDescripcionPruebaPuesto">Descripci&oacute;n de Prueba</label>
			                            <input type="text" class="form-control" id="iptDescripcionPruebaPuesto" placeholder="Descripci&oacute;n de Prueba" maxlength="20">
			                        </div>
	                    		</div>
	                    		
	                    		
	                    	</div>
	                    	
	                    	<div class="row">
	                    	
	                    		<div class="col-md-6">
	                    			<div class="checkbox">
			                            <label>
			                                <input id="iptCheckPuestoActivo" type="checkbox"> Activo
			                            </label>
			                        </div>
	                    		</div>
                    		</div>
                    		
                    		<div class="row">
	                    	
	                    		<div id="lstFuncionarios" class="col-md-12">
	                    			
	                    		</div>
                    		</div>
	                    	
	                    </div>
	                    
	                    
	                    
	                </form>
	            </div><!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn"
					onclick="savePuesto();" id="btnSavePuesto">Aceptar</button>
				<button type="button" class="btn"
					data-dismiss="modal">Cancelar</button>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalNumeroFuncionarios" tabindex="-2" role="dialog"
	aria-labelledby="modalNumeroFuncionarios" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Advertencia</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1 id="h1WarnDealers"></h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn"
					data-dismiss="modal" onclick="activaCkeckPuesto();">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalPuestoDuplicado" tabindex="-1" role="dialog"
	aria-labelledby="modalPuestoDuplicado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Puesto duplicado</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
	                <div class="box-header">
	                    
	                </div><!-- /.box-header -->
	               <!-- form start -->
	                <form role="form">
	                    <div class="box-body">
	                    	<h1>Existe un puesto registrado con la misma empresa y clave</h1>
	                    </div>
	                </form>
	            </div><!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn"
					data-dismiss="modal">Aceptar</button>

			</div>
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
    });
</script>
