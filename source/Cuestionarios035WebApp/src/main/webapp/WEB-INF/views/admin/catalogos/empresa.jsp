
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<script src="<c:url value='/resources/js/admin/catalogos.js' />" type="text/javascript"></script> 

<aside class="right-side">
	<section class="content-header">
	    <h1>
	        Data Tables
	        <small>advanced tables</small>
	    </h1>
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li><a href="#">Tables</a></li>
	        <li class="active">Data tables</li>
	    </ol>
	</section>     
	<section class="content">
		<div class="row">
		    <div class="col-xs-12">
		        <div class="box">
		            <div class="box-header">
		                <h3 class="box-title">Empresas</h3>                                    
		            </div><!-- /.box-header -->
					<div class="box-body table-responsive">
					    <table id="example1" class="table table-bordered table-striped">
					        <thead>
					            <tr>
					                <th>ID</th>
					                <th>Clave</th>
					                <th>Nombre</th>
					                <th>Creación</th>
					            </tr>
					        </thead>
					        <tbody>
					        	<c:if test="${not empty lstEmpresa}">
									<c:forEach items="${lstEmpresa}" var="empresa">
										<tr>				
										    <td>${empresa.id}</td>
											<td>${empresa.clave}</td>
											<td>${empresa.nombre}</td>
											<td><fmt:formatDate value="${empresa.creacion}" type="date" pattern="yyyy-MM-dd"/></td>
										</tr>			
									</c:forEach>
								</c:if>
					        </tbody>
					        <tfoot>
					            <tr>
					                <th>ID</th>
					                <th>Clave</th>
					                <th>Nombre</th>
					                <th>Creación</th>
					            </tr>
					        </tfoot>
					    </table>
					</div><!-- /.box-body -->
				</div><!-- /.box -->
	        </div>
	    </div>
	    <div class="row">
	    	<div class="col-md-9">
	    	</div>
	    	<div class="col-md-3">
	    		<button type="button" class="btn"
					data-dismiss="modal" onclick="newEmpresa();">Nueva Empresa</button>
	    	</div>
	    </div>
	
	</section> 
	<section class="content" >
		<div class="row">
			<div class="col-md-3"></div>
		    <div class="col-md-6">
				
		    </div>
			<div class="col-md-3"></div>
	    </div>
    </section>  
                        
</aside>

<div class="modal fade" id="modalNewEmpresa" tabindex="-1" role="dialog"
	aria-labelledby="modalNewEmpresa" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nueva Empresa</h3>
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
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptClaveEmpresa">Clave</label>
			                            <input type="text" class="form-control" id="iptClaveEmpresa" placeholder="Clave de Empresa">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptNombreEmpresa">Nombre</label>
			                            <input type="text" class="form-control" id="iptNombreEmpresa" placeholder="Nombre Empresa">
			                        </div>
	                    		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-6">
									<div class="form-group">
										<label>Select</label>
										<select class="form-control" id="selectEmpresaLider">
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
			                         <div class="checkbox">
			                            <label>
			                                <input id="iptCheckEmpresaActivo" type="checkbox"> Activo
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
					data-dismiss="modal" onclick="saveEmpresa();">Aceptar</button>
				<button type="button" class="btn"
					data-dismiss="modal">Cancelar</button>

			</div>
		</div>
	</div>
</div>

        <script type="text/javascript">
            $(function() {
                $("#example1").dataTable();
                $('#example2').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            });
        </script>
