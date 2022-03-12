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
	       Tipo Dealer
	    </h1>
	</section>     
	<!-- Main content -->
    <section class="content">
	    	<div>
			<button class="btn btn-primary" onclick="newTipoDealer();">Nuevo Tipo Dealer</button>  
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatTipoDealer();"><i class="fa fa-file-excel-o"
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
					                <th>Dealers activos</th>
					                <th>Acciones</th>
					            </tr>
		            </thead>
		            <tbody>

	            		<c:if test="${not empty lstTipoDealer}">
							<c:forEach items="${lstTipoDealer}" var="tipoDealer" varStatus="loop">
				                <tr>													    
								    <td>
										<c:forEach items="${lstEmpresa}" var="empresa">								
										<c:if test="${empresa.id == tipoDealer.idEmpresa}">
										<c:out value = "${empresa.nombre}"/>
										</c:if>
			                            </c:forEach>
									</td>
									<td>${tipoDealer.clave}</td>
									<td>${tipoDealer.descripcion}</td>
									<td>${tipoDealer.totalDealers}</td>
									<td>
										<a href="#" title="Ver" onclick="updateTipoDealer('${tipoDealer.id}','${tipoDealer.idEmpresa}','${tipoDealer.clave}','${tipoDealer.descripcion}','${tipoDealer.banActivo}','${tipoDealer.totalDealers}','${tipoDealer.descripcionEn}','${tipoDealer.descripcionFr}')"><i class="fa fa-cog"></i></a>&nbsp;
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaTipoDealer('${tipoDealer.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstTipoDealer)}">
											<a href="#" title="Abajo" onclick="orderAbajoTipoDealer('${tipoDealer.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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

<div class="modal fade" id="modalNewTipoDealer" tabindex="-1" role="dialog"
	aria-labelledby="modalNewTipoDealer" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Tipo de Dealer</h3>
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
	                    		<input type="hidden" id="iptIdTipoDealer">
	                    	<div class="col-md-6">
									<div class="form-group">
										<label>Empresa</label>
										<select class="form-control" id="selecEmpresaTipoDealer" onchange="empresaTipoDealerSelected();">
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
			                            <label for="iptClaveTipoDealer">Clave</label>
			                            <input type="text" class="form-control" id="iptClaveTipoDealer" placeholder="Clave del Dealer" disabled="disabled" onchange="validaTipoDealerDuplicado();">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptDescripcionTipoDealer">Descripci&oacute;n</label>
			                            <input type="text" class="form-control" id="iptDescripcionTipoDealer" placeholder="Descripci&oacute;n (Español)">
			                            <input type="text" class="form-control" id="iptDescripcionTipoDealerEn" placeholder="Descripci&oacute;n (Inglés)">
			                            <input type="text" class="form-control" id="iptDescripcionTipoDealerFr" placeholder="Descripci&oacute;n (Frances)">
			                        </div>
	                    		</div>
	                    			<div class="col-md-6">
			                         <div class="checkbox">
			                            <label>
			                                <input id="iptCheckTipoDealerActivo" type="checkbox"> Activo
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
					onclick="saveTipoDealer();" id="btnSaveTipoDealer">Aceptar</button>
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
					data-dismiss="modal" onclick="activaCkeckTipoD();">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalTipoDealerDuplicado" tabindex="-1" role="dialog"
	aria-labelledby="modalTipoDealerDuplicado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Tipo de dealer duplicado</h3>
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
	                    	<h1>Existe un tipo de dealer registrado con la misma empresa y clave</h1>
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
