<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script src="<c:url value='/resources/js/admin/zonas.js' />" type="text/javascript"></script> 

<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Zonas
        </h1>
    </section>

	<!-- Main content -->
    <section class="content">
	    	<div>
			<button class="btn btn-primary" onclick="newZona();">Nueva Zona</button>  
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatZonas();"><i class="fa fa-file-excel-o"
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
		                    <th >Empresa</th>
		                    <th >Clave</th>
		                    <th >Descripci&oacute;n</th>
		                    <th>Estatus</th>
		                    <th >Acciones</th>
		                </tr>
		            </thead>
		            <tbody>

		                 

	            		<c:if test="${not empty lstZona}">
							<c:forEach items="${lstZona}" var="zona" varStatus="loop">
				                <tr>			                  	   							
									<td>
									<c:forEach items="${lstEmpresa}" var="empresa">								
									<c:if test="${empresa.id == zona.idEmpresa}">
									<c:out value = "${empresa.nombre}"/>
									</c:if>
		                            </c:forEach>
									</td> 				                    				                    
				                    <td>${zona.clave}</td>
				                    <td>${zona.descripcion}</td>
									<td >
										<c:if test="${zona.banActivo == 1}">
											Activo
										</c:if>
										<c:if test="${zona.banActivo == 0}">
											Inactivo
										</c:if>
									</td>
				                    
				                    <td>
				                    	<a href="#" title="Ver" onclick="editZona('${zona.id}');"><i class="fa fa-cog"></i></a>&nbsp;
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaZona('${zona.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstZona)}">
											<a href="#" title="Abajo" onclick="orderAbajoZona('${zona.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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

<div class="modal fade" id="modalNewZona" tabindex="-1" role="dialog"
	aria-labelledby="modalNewZona" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nueva Zona</h3>
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
	                    		<input type="hidden" id="iptIdZona">
	                    		<div class="col-md-6">
			                        <div class="form-group">
										<label>Empresa</label>
										<select class="form-control" id="selectEmpresaLider" onchange="showCveZona();">
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
			                            <label for="iptClaveZona">Clave</label>
			                            <input type="text" class="form-control" id="iptClaveZona" placeholder="Clave Zona" disabled="disabled" onchange="validaZonaDuplicado();">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptDescripcionZona">Descripci&oacute;n</label>
			                            <input type="text" class="form-control" id="iptDescripcionZona" placeholder="Descripcion (Español)">
			                            <input type="text" class="form-control" id="iptDescripcionZonaEn" placeholder="Descripcion (Inglés)">
			                            <input type="text" class="form-control" id="iptDescripcionZonaFr" placeholder="Descripcion (Frances)">
			                        </div>
	                    		</div>
	                    	</div>
	                    </div>
	                </form>
	            </div><!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn"
					onclick="saveZona();" id="btnSaveZona">Aceptar</button>
				<button type="button" class="btn"
					data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalEditZona" tabindex="-1" role="dialog"
	aria-labelledby="modalEditZona" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Detalle de zona</h3>
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
	                    		<c:if test="${not empty zona}">
		                            <input type="hidden" id="iptIdZonaE" value="${zona.id}">
	                            </c:if>
	                            <c:if test="${empty zona}">
		                            <input type="hidden" id="iptIdZonaE">
	                            </c:if>
	                    		<div class="col-md-6">
			                        <div class="form-group">
										<label>Empresa</label>
										<select class="form-control" id="selectEmpresaLiderE"> 
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
			                            <label for="iptClaveZonaE">Clave</label>
			                            <c:if test="${not empty zona}">
				                            <input type="text" class="form-control" id="iptClaveZonaE" placeholder="Clave Zona" value="${zona.clave}" onchange="validaZonaDuplicadoEdit();">
			                            </c:if>
			                            <c:if test="${empty zona}">
				                            <input type="text" class="form-control" id="iptClaveZonaE" placeholder="Clave Zona" onchange="validaZonaDuplicadoEdit();">
			                            </c:if>
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptDescripcionZonaE">Descripcion</label>
			                            <c:if test="${not empty zona}">
				                            <input type="text" class="form-control" id="iptDescripcionZonaE" placeholder="Descripci&oacute;n (Español)" value="${zona.descripcion}">
				                            <input type="text" class="form-control" id="iptDescripcionZonaEEn" placeholder="Descripci&oacute;n (Inglés)" value="${zona.descripcionEn}">
				                            <input type="text" class="form-control" id="iptDescripcionZonaEFr" placeholder="Descripci&oacute;n (Frances)" value="${zona.descripcionFr}">
			                            </c:if>
			                            <c:if test="${empty zona}">
				                            <input type="text" class="form-control" id="iptDescripcionZonaE" placeholder="Descripci&oacute;n (Español)">
				                            <input type="text" class="form-control" id="iptDescripcionZonaEEn" placeholder="Descripci&oacute;n (Inglés)">
				                            <input type="text" class="form-control" id="iptDescripcionZonaEFr" placeholder="Descripci&oacute;n (Frances)">
			                            </c:if>
			                        </div>
	                    		</div>
	                    	</div>
                    		<div class="row">
	                    	
	                    		<div class="col-md-6">
	                    			<div class="checkbox">
			                            <label>
			                                <input id="iptCheckZonaActivo" type="checkbox"> Activo
			                            </label>
			                        </div>
	                    		</div>
                    		</div>
	                    	
	                    </div>
	                </form>
	            </div><!-- /.box -->
	            <div class="box box-primary">
					<div class="box-header">
						<h4>Gerentes</h4>
					</div>
					<div class="box-body">
						<div id="listaGerentes">
							<div class="row">
								<div class="col-md-6"><h3>Asignados</h3></div>
								<div class="col-md-6"><button class="btn btn-primary" onclick="nuevoGerente();">Nuevo Gerente</button></div>
							</div>
							<div class="row">
								<div class="bomb-5">
									<div class="box-body table-responsive">
										<table id="gerentesZona"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>RFC</th>
													<th>Nombre</th>
													<th></th>
												</tr>
											</thead>
											<tbody id="tbodyGerente">
					                            <c:if test="${not empty zona.gerentes}">
					                            	<c:set var="count" value="0" scope="page" />
					                            	<c:forEach items="${zona.gerentes}" var="element">
					                            		<c:set var="count" value="${count + 1}" scope="page"/>
														<tr>
															<td><input type="hidden" id="idZonaGerente${count}" value="${element.id}">${element.gerente.rfc}</td>
															<td>${element.gerente.datosFuncionarioVO.nombres} ${element.gerente.datosFuncionarioVO.apellidoUno}</td>
															<td><button type="button" class="btn" onclick="disabledGerente('${count}');">Eliminar</button></td>
														</tr>
													</c:forEach>
					                            </c:if>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div id="newGerenteZona" style="display:none;">
							<div class="row">
								<div class="col-md-6"><h3>Disponibles</h3></div>
								<div class="col-md-6"><button class="btn btn-primary" onclick="exitNuevoGerente();">Cancelar</button></div>
							</div>
							<div class="row">
								<div class="bomb-5">
									<div class="box-body table-responsive">
										<table id="tblNewGerenteZona"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>RFC</th>
													<th>Nombre</th>
													<th></th>
												</tr>
											</thead>
											<tbody id="tBodyNewGerente">
					                            <c:if test="${not empty zona.funcionariosNO}">
					                            	<c:set var="count" value="0" scope="page" />
					                            	<c:forEach items="${zona.funcionariosNO}" var="element">
					                            		<c:set var="count" value="${count + 1}" scope="page"/>
														<tr>
															<td><input type="hidden" id="idFuncG${count}" value="${element.id}">${element.rfc}</td>
															<td>${element.datosFuncionarioVO.nombres} ${element.datosFuncionarioVO.apellidoUno}</td>
															<td><button type="button" class="btn" onclick="setGerente('${count}');">Asignar</button></td>
														</tr>
													</c:forEach>
					                            </c:if>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn"
					onclick="updateZona();" id="btnUpdateZona">Aceptar</button>
				<button type="button" class="btn"
					data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalZonaDuplicado" tabindex="-1" role="dialog"
	aria-labelledby="modalZonaDuplicado" aria-hidden="true">
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
	                    	<h1>Existe una zona registrada con la misma empresa y clave</h1>
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

    
    <c:if test="${not empty zona}">
	    $('#gerentesZona').dataTable({
			"bRetrieve": true,
			"bDestroy": true,
	        "bPaginate": true,
	        "bLengthChange": true,
	        "bFilter": true,
	        "bSort": true,
	        "bInfo": true,
	        "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
            }
	    });
		
		$('#tblNewGerenteZona').dataTable({
			"bRetrieve": true,
			"bDestroy": true,
			"bPaginate": true,
	        "bLengthChange": true,
	        "bFilter": true,
	        "bSort": true,
	        "bInfo": true,
	        "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
            }
	    });
		
		$('#selectEmpresaLiderE').val(${zona.idEmpresa});
		
		$('#modalEditZona').modal({backdrop: 'static', keyboard: false});
    </c:if>
</script>

