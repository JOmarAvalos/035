<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

	<script src="<c:url value='/resources/js/admin/grupos.js' />" type="text/javascript"></script> 
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>

<aside class="right-side">
	<section class="content-header">
	    <h1>
	       Grupos de contacto
	    </h1>
	</section>   
	  
	 <section class="content">
    	<div>
			<button class="btn btn-primary" onclick="newGrupo();">Nuevo Grupo</button>  
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatGruposContacto();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
		<br>
		<div class="box mb-5">
		    <div class="box-header">
		    
		    </div><!-- /.box-header -->
		    <div class="box-body table-responsive">
		        <table id="tableGrupos" class="table table-bordered table-striped">
		            <thead>
		                <tr>
		                    <th>Empresa</th>
		                    <th>Nombre</th>
		                    <th>Integrantes</th>
		                    <th>Acciones</th>
		                </tr>
		            </thead>
		            <tbody>

	            		<c:if test="${not empty lstGrupos}">
							<c:forEach items="${lstGrupos}" var="grupo" varStatus="loop">
				                <tr>
				                    <td>
				                    <c:if test="${not empty lstEmpresas}">
										<c:forEach items="${lstEmpresas}" var="empresa">								
											<c:if test="${empresa.id == grupo.idEmpresa}">
												<c:out value = "${empresa.nombre}"/>
											</c:if>
			                            </c:forEach>
				                    </c:if>
									</td>				                    
				                    <td>${grupo.nombre}</td>
				                    <td>${grupo.integrantes}</td>
				                    <td>
				                    	<a href="#" title="Funcionarios" onclick="verGrupo('${grupo.id}');"><i class="fa fa-users"></i></a>&nbsp;
				                    	
				                    	<a href="#" title="Ver" onclick="editar('${grupo.id}', '${grupo.idEmpresa}', '${grupo.nombre}', '${grupo.descripcion}', '${grupo.banActivo}');"><i class="fa fa-cog"></i></a>&nbsp;
										
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaGrupo('${grupo.id}');"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
										</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstGrupos)}">
											<a href="#" title="Abajo" onclick="orderAbajoGrupo('${grupo.id}');"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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
<div class="modal fade" id="modalNewGrupo" tabindex="-1" role="dialog"
	aria-labelledby="modalNewGrupo" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nuevo Grupo</h3>
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
	                    	<input type="hidden" id="iptIdGrupoPuesto">
	                    		<div class="col-md-6">
									<div class="form-group">
										<label>Empresa</label>
										<select class="form-control" id="selectEmpresaGrupo">
										    <option value="0">Seleccione...</option>
								        	<c:if test="${not empty lstEmpresas}">
												<c:forEach items="${lstEmpresas}" var="empresa">
													<option value="${empresa.id}">${empresa.nombre}</option>
												</c:forEach>
											</c:if>
										    
										</select>
									</div>	 
		                   		</div>
		                   		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptClaveGrupoPuesto">Nombre</label>
			                            <input type="text" class="form-control" id="iptNombreGrupo" placeholder="Nombre">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptDescripcionGrupoPuesto">Descripci&oacute;n</label>
			                            <input type="text" class="form-control" id="iptDescripcionGrupo" placeholder="Descripcion">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
									<div class="checkbox">
										<label> <input id="iptCheckPuestoActivo"
											type="checkbox" checked="checked"> Activo
										</label>
									</div>
								</div>
	                    	</div>
	                    </div>
	                </form>
	            </div><!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="saveGrupo();">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal">Cancelar</button>

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
    $(function() {
        $('#tableGrupos').dataTable({
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
