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
            Grupos de Dealers
        </h1>
    </section>

	<!-- Main content -->
    <section class="content">
	    	<div>
			<button class="btn btn-primary" onclick="newGrupoDealer();">Nuevo Grupo</button>  
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatGrupoDealers();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
		<br>
		<div class="box mb-5">
		    <div class="box-header">
		    
		    </div><!-- /.box-header -->
		    <div class="box-body table-responsive">
		        <table id="tableAgrupacion" class="table table-bordered table-striped">
		            <thead>
		                <tr>
		                    <th >Empresa</th>
		                    <th >Grupo</th>
		                    <th>Dealers Activos</th>
		                    <th >Acciones</th>
		                </tr>
		            </thead>
		            <tbody>

		                 

	            		<c:if test="${not empty lstGpoDealers}">
							<c:forEach items="${lstGpoDealers}" var="gpoDealer" varStatus="loop">
				                <tr>			                  	   							
									<td>${gpoDealer.auxEmpresa}</td> 				                    				                    
									<td>${gpoDealer.agrupacion}</td> 				                    				                    
									<td>${gpoDealer.totalDealers}</td> 				                    				                    
				                    <td>
										<a href="#" title="Ver" onclick="editGrupoDealer('${gpoDealer.id}', '${gpoDealer.idEmpresa}', '${gpoDealer.agrupacion}', '${gpoDealer.banActivo}', '${gpoDealer.totalDealers}');"><i class="fa fa-cog"></i></a>&nbsp;
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaGrupoDealer('${gpoDealer.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstGpoDealers)}">
											<a href="#" title="Abajo" onclick="orderAbajoGrupoDealer('${gpoDealer.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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

<div class="modal fade" id="modalNewGpoDealer" tabindex="-1" role="dialog"
	aria-labelledby="modalNewGpoDealer" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nuevo Grupo Dealer</h3>
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
	                    		<input type="hidden" id="iptIdGrupoDealer">
	                    		<div class="col-md-6">
			                        <div class="form-group">
										<label>Empresa</label>
										<select class="form-control" id=selectEmpresaAgrupacion>
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
			                            <label for="iptClaveZona">Grupo</label>
			                            <input type="text" class="form-control" id="iptAgrupacion" placeholder="Grupo Dealer">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                         <div class="checkbox">
			                            <label>
			                                <input id="iptCheckGpoDlrActivo" type="checkbox"> Activo
			                            </label>
			                        </div>
	                    		</div>
	                    	</div>
	                    </div>
	                </form>
	            </div><!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="validaGrupoDealerDuplicado();">Aceptar</button>
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
					data-dismiss="modal" onclick="activaCkeck();">Aceptar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalGrupoDealerDuplicado" tabindex="-1" role="dialog"
	aria-labelledby="modalGrupoDealerDuplicado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Grupo duplicado</h3>
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
	                    	<h1>Existe un grupo de dealers registrado con la misma empresa y nombre</h1>
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
        $('#tableAgrupacion').dataTable({
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