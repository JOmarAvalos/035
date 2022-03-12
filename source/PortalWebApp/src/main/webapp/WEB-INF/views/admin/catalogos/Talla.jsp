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
	        Niveles de Dealer      
	    </h1>
	
	</section>     
	<!-- Main content -->
    <section class="content">
	    	<div>
			<button class="btn btn-primary" onclick="newTalla();">Nuevo Nivel de Dealer</button>  
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatTalla();"><i class="fa fa-file-excel-o"
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
					                <th>Clave</th>
					                <th>Descripci&oacute;n</th>
					                <th>M&iacute;nimo Atenci&oacute;n</th>
					                <th>M&aacute;ximo Atenci&oacute;n</th>
					                <th>Dealers activos</th>
					                <th>Acciones</th>
		                </tr>
		            </thead>
		            <tbody>

	            		<c:if test="${not empty lstTalla}">
							<c:forEach items="${lstTalla}" var="talla" varStatus="loop">
								<c:set var="selectedTalla" value="${talla}" scope="request" />
				              <tr>													   
								    <td>
									<c:forEach items="${lstEmpresa}" var="empresa">	
																
									<c:if test="${empresa.id == talla.idEmpresa}">
									<c:out value = "${empresa.nombre}"/>
									</c:if>
		                            </c:forEach>
									</td>
											<td>${talla.clave}</td>
											<td>${talla.descripcion}</td>
											<td>${talla.minAtencion}</td>
											<td>${talla.maxAtencion}</td>
											<td>${talla.totalDealers}</td>
											<td>
												<a href="#" title="Ver" onclick="getTalla('${talla.id}')"><i class="fa fa-cog"></i></a>&nbsp;
												
												<c:if test="${loop.count != 1}">
													<a href="#" title="Arriba" onclick="orderArribaTalla('${talla.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
												</c:if>
				                    		
			                    				<c:if test="${loop.count != fn:length(lstTalla)}">
													<a href="#" title="Abajo" onclick="orderAbajoTalla('${talla.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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

<div class="modal fade" id="modalNewTalla" tabindex="-1" role="dialog"
	aria-labelledby="modalNewTalla" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nuevo Nivel de Dealer</h3>
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
	                    	<input type="hidden" id="iptIdTallaN">
	                    	<div class="row">
	                    		<div class="col-md-6">
									<div class="form-group">
										<label>Empresa</label>
										<select class="form-control" id="selecEmpresaTalla" onchange="empresaTallaSelected();">
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
			                            <label for="iptClaveTalla">Clave</label>
			                            <input type="text" class="form-control" id="iptClaveTalla" placeholder="Clave" disabled="disabled" onchange="validaTallaDuplicado();" maxlength="10">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptDescripcionTalla">Descripci&oacute;n</label>
			                            <input type="text" class="form-control" id="iptDescripcionTalla" placeholder="Descripci&oacute;n (Español)" maxlength="20">
			                            <input type="text" class="form-control" id="iptDescripcionTallaEn" placeholder="Descripci&oacute;n (Inglés)" maxlength="20">
			                            <input type="text" class="form-control" id="iptDescripcionTallaFr" placeholder="Descripci&oacute;n (Frances)" maxlength="20">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="ipMinAtencionTalla">M&iacute;nimo Atenci&oacute;n</label>
			                            <input type="text" class="form-control" id="ipMinAtencionTalla" placeholder="M&iacute;nimo De Atenci&oacute;n" onkeypress="return isNumberKey(event)" maxlength="3">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    	<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="ipMaxAtencionTalla">M&aacute;ximo Atenci&oacute;n</label>
			                            <input type="text" class="form-control" id="ipMaxAtencionTalla" placeholder="M&aacute;ximo de Atenci&oacute;n" onkeypress="return isNumberKey(event)" maxlength="3">
			                        </div>
	                    		</div>    		
	                    		<div class="col-md-6" >
			                         <div class="checkbox">
			                            <label>
			                                <input id="iptCheckTallaActivo" type="checkbox" > Activo
			                            </label>
			                        </div>
	                    		</div>
	                    	</div>
	                    </div>
	                </form>
	            </div><!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn"
					onclick="saveTalla();" id="btnSaveTalla">Aceptar</button>
				<button type="button" class="btn"
					data-dismiss="modal">Cancelar</button>

			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalTallaDetalle" tabindex="-1" role="dialog"
	aria-labelledby="modalTallaDetalle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Detalle de Nivel de Dealer</h3>
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
	                    	<input type="hidden" id="iptIdTallaEdit">
	                    	<div class="row">
	                    		<div class="col-md-6">
									<div class="form-group">
										<label>Empresa</label>
										<select class="form-control" id="iptEmpresaEdit" disabled="disabled">
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
			                            <label for="iptClaveEdit">Clave</label>
			                            <input type="text" class="form-control" placeholder="Clave" id="iptClaveEdit" onchange="validaTallaDuplicadoEdit();" maxlength="10">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="ipMinAtencionTallaEdit">M&iacute;nimo Atenci&oacute;n</label>
			                            <input type="text" class="form-control" id="ipMinAtencionTallaEdit" placeholder="M&iacute;nimo De Atenci&oacute;n" onkeypress="return isNumberKey(event)" maxlength="3">
			                        </div>
	                    		</div>
								<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="ipMaxAtencionTallaEdit">M&aacute;ximo Atenci&oacute;n</label>
			                            <input type="text" class="form-control" id="ipMaxAtencionTallaEdit" placeholder="M&aacute;ximo de Atenci&oacute;n" onkeypress="return isNumberKey(event)" maxlength="3">
			                        </div>
	                    		</div>    		
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptDescripcionTallaEdit">Descripci&oacute;n</label>
			                            <input type="text" class="form-control" id="iptDescripcionTallaEdit" placeholder="Descripci&oacute;n (Español)" maxlength="20">
			                            <input type="text" class="form-control" id="iptDescripcionTallaEditEn" placeholder="Descripci&oacute;n (Inglés)" maxlength="20">
			                            <input type="text" class="form-control" id="iptDescripcionTallaEditFr" placeholder="Descripci&oacute;n (Frances)" maxlength="20">
			                        </div>
	                    		</div>
                    			<div class="col-md-6" >
			                         <div class="checkbox">
			                            <label>
			                                <input id="iptCheckTallaActivoEdit" type="checkbox" > Activo
			                            </label>
			                        </div>
	                    		</div>
	                    		
	                    	</div>
	                    </div>
	                </form>
	            </div><!-- /.box -->
	            <div class="box box-primary">
					<div class="box-header">
						<h4>Puestos</h4>
					</div>
					<div class="box-body">
						<div id="listaPuestos">
							<div class="row">
								<div class="bomb-5">
									<div class="box-body table-responsive">
										<table id="puestoFuncionario"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th style="width: 50%;">Puesto</th>
													<th style="width: 10%;">M&iacute;nimo</th>
													<th style="width: 10%;">M&aacute;ximo</th>
													<th style="width: 30%;"></th>
												</tr>
											</thead>
											<tbody id="tbodyTalla">
	
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
				<button type="button" class="btn" onclick="updateTalla();" id="btnUpdateTalla">Aceptar</button>
				<button type="button" class="btn"
					data-dismiss="modal">Cancelar</button>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalNumeroDealers" tabindex="-2" role="dialog"
	aria-labelledby="modalNumeroDealers" aria-hidden="true">
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
					data-dismiss="modal" onclick="activaCkeckTallaD();">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalTallaDuplicado" tabindex="-1" role="dialog"
	aria-labelledby="modalTallaDuplicado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nivel de Dealer duplicado</h3>
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
	                    	<h1>Existe un nivel de Dealer registrado con la misma empresa y clave</h1>
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
