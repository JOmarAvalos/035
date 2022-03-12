<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script src="<c:url value='/resources/js/admin/dealer.js' />" type="text/javascript"></script> 
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Dealers
        </h1>
    </section>

	<!-- Main content -->
    <section class="content">
	    	<div>
			<button class="btn btn-primary" onclick="showNewDealer();">Nuevo Dealer</button>  
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatDealers();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
		<br>
		<div class="box mb-5">
		    <div class="box-header">
		    
		    </div><!-- /.box-header -->
		    <div class="box-body table-responsive">
		        <table id="tableDealers" class="table table-bordered table-striped">
		            <thead>
		                <tr>
		                    <th >Empresa</th>
		                    <th >Grupo</th>
		                    <th >Clave</th>
		                    <th >Nombre</th>
		                    <th >Tipo Dealer</th>
		                    <th >Nivel del Dealer</th>
		                    <th >Funcionarios Activos</th>
		                    <th >Acciones</th>
		                </tr>
		            </thead>
		            <tbody>

		                 

	            		<c:if test="${not empty lstDealers}">
							<c:forEach items="${lstDealers}" var="dealer" varStatus="loop">
				                <tr>			                  	   							
									<td>${dealer.auxEmpresa}</td> 				                    				                    
									<td>${dealer.auxGrupo}</td> 				                    				                    
									<td>${dealer.clave}</td> 				                    				                    
									<td>${dealer.nombre}</td> 				                    				                    
									<td>${dealer.auxTipoDealer}</td> 				                    				                    
									<td>${dealer.auxTalla}</td> 
									<td>${dealer.totalFuncionarios}</td> 				                    				                    
				                    <td> 
				                    	<a href="#" title="Funcionarios" onclick="detalleDealer('${dealer.id}');"><i class="fa fa-users"></i></a>&nbsp;
				                    	
				                    	<a href="#" title="Ver" onclick="getDealer('${dealer.id}');"><i class="fa fa-cog"></i></a>&nbsp;
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaDealer('${dealer.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstDealers)}">
											<a href="#" title="Abajo" onclick="orderAbajoDealer('${dealer.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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

<div class="modal fade" id="modalNewDealer" tabindex="-1" role="dialog"
	aria-labelledby="modalNewDealer" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nuevo dealer</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<form role="form">
					<div class="box box-primary">
		                <div class="box-header">
		                </div><!-- /.box-header -->
		                    <div class="box-body">
		                    	<div class="row">
		                    		<input type="hidden" id="iptIdDealer">
		                    		<div class="col-md-6">
				                        <div class="form-group">
											<label>Empresa</label>
											<select class="form-control" id="selectEmpresaDealer" onchange="getSelectsDealer();">
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
											<label>Grupo Dealer</label>
											<select class="form-control" id="selectGrupoDealerD">
											    <option value="0">Seleccione...</option>
											    
											</select>
				                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
				                        <div class="form-group">
											<label>Tipo Dealer</label>
											<select class="form-control" id="selectTipoDealerD">
											    <option value="0">Seleccione...</option>
											</select>
				                        </div>
		                    		</div>
		                    		<div class="col-md-6">
				                        <div class="form-group">
											<label>Nivel del Dealer</label>
											<select class="form-control" id="selectTallaD">
											    <option value="0">Seleccione...</option>
											</select>
				                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		
		                    		<div class="col-md-6">
				                        <div class="form-group">
											<label>Prioridad</label>
											<select class="form-control" id="selectPrioridadDealerD">
											    <option value="0">Seleccione...</option>
											</select>
				                        </div>
		                    		</div>
		                    	</div>
	
	
		                    	<div class="row">
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptClaveD">Clave</label>
				                            <input type="text" class="form-control" id="iptClaveD" placeholder="Clave" disabled="disabled" onchange="validaDealerDuplicado();" maxlength="10">
				                        </div>
		                    		</div>
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptDescripcionZona">Dealer</label>
				                            <input type="text" class="form-control" id="iptNombreD" placeholder="Dealer" maxlength="200">
				                        </div>
		                    		</div>
		                    	</div>
		                    	
		                    	
		                    	<div class="row">
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptClaveD">C&oacute;digo de planta</label>
				                            <input type="text" class="form-control" id="iptCodigoPlantaD" placeholder="C&oacute;digo de planta" maxlength="10">
				                        </div>
		                    		</div>
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptDescripcionZona">Sitio Web</label>
				                            <input type="text" class="form-control" id="iptWeb" placeholder="Dealer" maxlength="50">
				                        </div>
		                    		</div>
		                    	</div>
		                    	<!-- Direccio dealer -->
		                    	<div class="row">
		                    		<div class="col-md-6">
		                    			
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptCodigoPostal">C&oacute;digo postal</label>
				                            <input type="text" class="form-control" id="iptCodigoPostal" placeholder="C&oacute;digo postal" onkeypress="return isNumberKey(event)" maxlength="5"> 
				                        </div>
		                    		</div>
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptEstado">Estado</label>
				                            <input type="text" class="form-control" id="iptEstado" placeholder="Estado" maxlength="20">
				                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptCiudad">Ciudad</label>
				                            <input type="text" class="form-control" id="iptCiudad" placeholder="Ciudad" maxlength="50">
				                        </div>
		                    		</div>
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptColonia">Colonia</label>
				                            <input type="text" class="form-control" id="iptColonia" placeholder="Colonia" maxlength="50">
				                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptDireccion">Direcci&oacute;n</label>
				                            <input type="text" class="form-control" id="iptDireccion" placeholder="Direcci&oacute;" maxlength="100">
				                        </div>
		                    		</div>
		                    		<div class="col-md-3">
				                        <div class="form-group">
				                            <label for="iptExterior">No. Exterior</label>
				                            <input type="text" class="form-control" id="iptExterior" placeholder="No. Exterior" maxlength="15">
				                        </div>
		                    		</div>
		                    		<div class="col-md-3">
				                        <div class="form-group">
				                            <label for="iptInterior">No. Interior</label>
				                            <input type="text" class="form-control" id="iptInterior" placeholder="No. Interior" maxlength="10">
				                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptReferencia">Referencia</label>
				                            <input type="text" class="form-control" id="iptReferencia" placeholder="Referencia" maxlength="100">
				                        </div>
		                    		</div>
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptTelefono">Tel&eacute;fono</label>
				                            <input type="text" class="form-control" id="iptTelefono" placeholder="Tel&eacute;fono" onkeypress="return isNumberKey(event)" maxlength="10">
				                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
			                         	<div class="checkbox">
				                            <label>
				                                <input id="iptCheckDealerActivo" type="checkbox"> Activo
				                            </label>
				                        </div>
				                    </div>
		                    	</div>
		                    	
		                    </div>
		                
		            </div><!-- /.box -->

					<div class="box box-primary">
		                <div class="box-header">
		                </div><!-- /.box-header -->
		                    <div class="box-body">
		                    	<div class="row">
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptOrdenesT">Total de Ordenes</label>
				                            <input type="text" class="form-control" id="iptOrdenesT" placeholder="Total de ordenes por d&iacute;a" maxlength="3" onkeypress="return isNumberKey(event)" value="0">
				                        </div>
		                    		</div>
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptMantenimientoPorc">% Mantenimiento</label>
				                            <input type="text" class="form-control" id="iptMantenimientoPorc" placeholder="Porcentaje de ordenes de Mantenimiento" maxlength="2" onkeypress="return isNumberKey(event)" value="0" >
				                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptReparacionPorc">% Reparaci&oacute;n</label>
				                            <input type="text" class="form-control" id="iptReparacionPorc" placeholder="Porcentaje de ordenes de Reparaci&oacute;n" maxlength="2" onkeypress="return isNumberKey(event)" value="0" >
				                        </div>
		                    		</div>
		                    		<div class="col-md-6">
				                        <div class="form-group">
				                            <label for="iptDiagnosticoPorc">% Diagnostico</label>
				                            <input type="text" class="form-control" id="iptDiagnosticoPorc" placeholder="Porcentaje de ordenes de Diagnostico" maxlength="2" onkeypress="return isNumberKey(event)" value="0">
				                        </div>
		                    		</div>
		                    	</div>
		                    </div>
		            </div>
	            </form>
	            
	            <div class="box box-primary" id="divDealerZonas" style="display:none;">
	                <div class="box-header">
	                    Zonas
	                </div><!-- /.box-header -->
                    <div class="box-body">
                    	<div class="row">
							<div class="bomb-5">
								<div class="box-body table-responsive">
									<table id="gerentesDealer"
										class="table table-bordered table-striped">
										<thead>
											<tr>
												<th>Zona</th>
												<th>Gerente</th>
												<td></td>
											</tr>
										</thead>
										<tbody id="tbodyGerenteDealer">
										</tbody>
									</table>
								</div>
							</div>
						</div>
                    </div>
                </div>
	            
	            
			</div>
			<div class="modal-footer">
				<button type="button" class="btn"
					onclick="saveDealer();" id="btnsaveDealer">Aceptar</button>
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
					data-dismiss="modal" onclick="activaCkeckDealer();">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalDealerDuplicado" tabindex="-1" role="dialog"
	aria-labelledby="modalDealerDuplicado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Dealer duplicado</h3>
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
	                    	<h1>Existe un dealer registrado con la misma empresa y clave</h1>
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

<!-- page script -->
<script type="text/javascript">
    $(function() {
        $('#tableDealers').dataTable({
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