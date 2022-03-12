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


<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Sedes
        </h1>
    </section>

	<!-- Main content -->
    <section class="content">
	    	<div>
			<button class="btn btn-primary" onclick="newSede();">Nueva Sede</button>  
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatSedes();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
		<br>
		<div class="box mb-5">
		    <div class="box-header">
		    
		    </div><!-- /.box-header -->
		    <div class="box-body table-responsive">
		        <table id="tableSedes" class="table table-bordered table-striped">
		            <thead>
		                <tr>
		                  
		                    <th >Empresa</th>
		                    <th >Sede</th>
		                    <th >Mapa</th>
		                    <th >Acciones</th>
		                </tr>
		            </thead>
		            <tbody>

	            		<c:if test="${not empty lstSedes}">
							<c:forEach items="${lstSedes}" var="sede" varStatus="loop">
				                <tr>
				                   
				                    <td>${sede.auxEmpresa}</td>
				                    <td>${sede.nombre}</td>
				                    <td><a href="${sede.url}" target="_blank">Ver</a></td>
				                    <td>
				                    	
				                    	<a href="#" title="Ver" onclick="getSede('${sede.id}');"><i class="fa fa-cog"></i></a>&nbsp;
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaSede('${sede.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstSedes)}">
											<a href="#" title="Abajo" onclick="orderAbajoSede('${sede.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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

<div class="modal fade" id="modalNewSede" tabindex="-1" role="dialog"
	aria-labelledby="modalNewEmpresa" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nueva Sede</h3>
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
	                    		<input type="hidden" id="iptIdSede">
	                    		<div class="col-md-6">
			                        <div class="form-group">
										<label>Empresa</label>
										<select class="form-control" id="selectEmpresaSede">
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
			                            <label for="iptNombreSede">Nombre</label>
			                            <input type="text" class="form-control" id="iptNombreSede" placeholder="Nombre (Español)" maxlength="100">
			                            <input type="text" class="form-control" id="iptNombreSedeEn" placeholder="Nombre (Inglés)" maxlength="100">
			                            <input type="text" class="form-control" id="iptNombreSedeFr" placeholder="Nombre (Frances)" maxlength="100">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptDescSede">Descripci&oacute;n</label>
			                            <input type="text" class="form-control" id="iptDescSede" placeholder="Descripci&oacute;n (Español)" maxlength="300">
			                            <input type="text" class="form-control" id="iptDescSedeEn" placeholder="Descripci&oacute;n (Inglés)" maxlength="300">
			                            <input type="text" class="form-control" id="iptDescSedeFr" placeholder="Descripci&oacute;n (Frances)" maxlength="300">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptCPSede">Codigo Postal</label>
			                            <input type="text" class="form-control" id="iptCPSede" placeholder="Codigo postal" onkeypress="return isNumberKey(event)" maxlength="5">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptEstadoSede">Estado</label>
			                            <input type="text" class="form-control" id="iptEstadoSede" placeholder="Estado" maxlength="100">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptCiudadSede">Ciudad</label>
			                            <input type="text" class="form-control" id="iptCiudadSede" placeholder="Ciudad" maxlength="100">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptColoniaSede">Colonia</label>
			                            <input type="text" class="form-control" id="iptColoniaSede" placeholder="Colonia" maxlength="100">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptDireccionSede">Direcci&oacute;n</label>
			                            <input type="text" class="form-control" id="iptDireccionSede" placeholder="Direcci&oacute;n" maxlength="100">
			                        </div>
	                    		</div>
	                    		<div class="col-md-3">
			                        <div class="form-group">
			                            <label for="iptExteriorSede">Exterior</label>
			                            <input type="text" class="form-control" id="iptExteriorSede" placeholder="No. Exterior" maxlength="10">
			                        </div>
	                    		</div>
	                    		<div class="col-md-3">
			                        <div class="form-group">
			                            <label for="iptInteriorSede">Interior</label>
			                            <input type="text" class="form-control" id="iptInteriorSede" placeholder="No. Interior" maxlength="10">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptRefSede">Referencia</label>
			                            <input type="text" class="form-control" id="iptRefSede" placeholder="Referencia" maxlength="100">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptTelefonoSede">Telefono</label>
			                            <input type="text" class="form-control" id="iptTelefonoSede" placeholder="Telefono" onkeypress="return isNumberKey(event)" maxlength="10">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptURLSede">URL</label>
			                            <input type="text" class="form-control" id="iptURLSede" placeholder="URL" maxlength="300">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                         <div class="checkbox">
			                            <label>
			                                <input id="iptCheckSedeActivo" type="checkbox"> Activo
			                            </label>
			                        </div>
	                    		</div>
	                    	</div>
	                    </div>
	                </form>
	            </div><!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="saveSede();">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal">Cancelar</button>

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
    $(function() {
        $('#tableSedes').dataTable({
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
