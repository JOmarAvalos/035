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
	        Idioma        
	    </h1>
	</section>     
	<!-- Main content -->
    <section class="content">
	    	<div>
			<button class="btn btn-primary" onclick="newIdioma();">Nuevo Idioma</button>  
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatIdioma();"><i class="fa fa-file-excel-o"
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
		                   		    <th>Idioma</th>
					                <th>Codigo ISO</th>
		                    <th >Acciones</th>
		                </tr>
		            </thead>
		            <tbody>

	            		<c:if test="${not empty lstIdioma}">
							<c:forEach items="${lstIdioma}" var="idioma" varStatus="loop">
				                <tr>				
										    <td>${idioma.idioma}</td>
											<td>${idioma.codigoIso}</td>
											<td>
												
												<a href="#" title="Ver" onclick="editIdioma('${idioma.id}', '${idioma.codigoIso}', '${idioma.baActivo}', '${idioma.idioma}');"><i class="fa fa-cog"></i></a>&nbsp;
												
												<c:if test="${loop.count != 1}">
													<a href="#" title="Arriba" onclick="orderArribaIdioma('${idioma.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
												</c:if>
				                    		
			                    				<c:if test="${loop.count != fn:length(lstIdioma)}">
													<a href="#" title="Abajo" onclick="orderAbajoIdioma('${idioma.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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
<div class="modal fade" id="modalNewIdioma" tabindex="-1" role="dialog"
	aria-labelledby="modalNewIdioma" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nuevo Idioma</h3>
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
	                	<input type="hidden" id="iptIdIdioma">
	                    <div class="box-body">
	                    	<div class="row">
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptIdioma">Idioma</label>
			                            <input type="text" class="form-control" id="iptIdioma" placeholder="nombre del Idioma" maxlength="100">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptCodioIsoIdioma">Codigo ISO</label>
			                            <input type="text" class="form-control" id="iptCodioIsoIdioma" placeholder="Codigo ISO" maxlength="2">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
			                         <div class="checkbox">
			                            <label>
			                                <input id="iptCheckIdiomaActivo" type="checkbox"> Activo
			                            </label>
			                        </div>
	                    		</div>
	                    	</div>
	                    </div>
	                </form>
	            </div><!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="saveIdioma();">Aceptar</button>
				<button type="button" class="btn"
					data-dismiss="modal">Cancelar</button>

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
