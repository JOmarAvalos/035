
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
	       Categoria Cursos
	    </h1>
	    
	</section>     
	<!-- Main content -->
    <section class="content">
	    	<div>
			<button class="btn btn-primary" onclick="newCategoriaCurso();">Nueva Categoria Curso</button>  
		</div>
		<br>
		<div class="box mb-5">
		    <div class="box-header">
		    
		    </div><!-- /.box-header -->
		    <div class="box-body table-responsive">
		        <table id="example1" class="table table-bordered table-striped">
		            <thead>
		                <tr>		               
					                <th>Categoria</th>
					                <th>Descripcion</th>
					                <th>Codigo</th>
					                <th>Orden</th>
					                <th>Activo</th>
					                <th>Creacion</th>
					                <th></th>
					            </tr>
		            </thead>
		            <tbody>

	            		<c:if test="${not empty lstCategoriaCurso}">
							<c:forEach items="${lstCategoriaCurso}" var="categoriaCurso">
				               <tr>														   
											<td>${categoriaCurso.categoria}</td>
											<td>${categoriaCurso.descripcion}</td>
											<td>${categoriaCurso.codigo}</td>
											<td>${categoriaCurso.orden}</td>
											<td>${categoriaCurso.banActivo}</td>								
											<td><fmt:formatDate value="${categoriaCurso.creacion}" type="date" pattern="yyyy-MM-dd"/></td>
											<td></td>
										</tr>
				          	</c:forEach>
						</c:if>

		            </tbody>
		        </table>
		    </div><!-- /.box-body -->
		</div><!-- /.box -->

	</section><!-- /.content -->
</aside><!-- /.right-side -->    

<div class="modal fade" id="modalNewCategoriaCurso" tabindex="-1" role="dialog"
	aria-labelledby="modalNewCategoriaCurso" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nueva Categoria de Curso</h3>
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
			                            <label for="iptCategoriaCategoriaCurso">Categoria</label>
			                            <input type="text" class="form-control" id="iptCategoriaCategoriaCurso" placeholder="Categoria del Curso">
			                        </div>
	                    		</div>	
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptDescripcionCategoriaCurso">Descripcion</label>
			                            <input type="text" class="form-control" id="iptDescripcionCategoriaCurso" placeholder="Descripcion">
			                        </div>
	                    		</div>
	                    			
	                    	</div>
	                    	
	                    	<div class="row">

	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptCodigoCategoriaCurso">Codigo</label>
			                            <input type="text" class="form-control" id="iptCodigoCategoriaCurso" placeholder="Codigo">
			                        </div>
	                    		</div>
	                    		<div class="col-md-6">
			                        <div class="form-group">
			                            <label for="iptOrdenCategoriaCurso">Orden</label>
			                            <input type="text" class="form-control" id="iptOrdenCategoriaCurso" placeholder="Orden">
			                        </div>
	                    		</div>	
	                    		
	                    	</div>
	                    	<div class="row">	         		
	                    		<div class="col-md-6">
			                         <div class="checkbox">
			                            <label>
			                                <input id="iptCheckCategoriaCursoActivo" type="checkbox"> Activo
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
					data-dismiss="modal" onclick="saveCategoriaCurso();">Aceptar</button>
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
                	"pageLength": 30 ,
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": true,
                    "bAutoWidth": false
                });
            });
        </script>
