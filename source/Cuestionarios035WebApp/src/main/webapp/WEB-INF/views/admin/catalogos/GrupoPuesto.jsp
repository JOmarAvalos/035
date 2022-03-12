
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		                <h3 class="box-title">GrupoPuesto</h3>                                    
		            </div><!-- /.box-header -->
					<div class="box-body table-responsive">
					    <table id="example1" class="table table-bordered table-striped">
					        <thead>
					            <tr>
					                <th>ID</th>
					                <th>Clave</th>
					                <th>Nombre</th>
					                <th>Descripcion</th>
					            </tr>
					        </thead>
					        <tbody>
					        	<c:if test="${not empty lstGrupoPuesto}">
									<c:forEach items="${lstGrupoPuesto}" var="grupoPuesto">
										<tr>				
										    <td>${grupoPueso.id}</td>
											<td>${grupoPueso.clave}</td>
											<td>${grupoPueso.descripcion}</td>
											<td><fmt:formatDate value="${grupoPueso.creacion}" type="date" pattern="yyyy-MM-dd"/></td>
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
	
	</section> 
	<section class="content" style="display:none">
		<div class="row">
			<div class="col-md-3"></div>
		    <div class="col-md-6">
				<div class="box box-primary">
	                <div class="box-header">
	                    <h3 class="box-title">Quick Example</h3>
	                </div><!-- /.box-header -->
	                <!-- form start -->
	                <form role="form">
	                    <div class="box-body">
	                        <div class="form-group">
	                            <label for="exampleInputEmail1">Email address</label>
	                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
	                        </div>
	                        <div class="form-group">
	                            <label for="exampleInputPassword1">Password</label>
	                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
	                        </div>
	                        <div class="form-group">
	                            <label for="exampleInputFile">File input</label>
	                            <input type="file" id="exampleInputFile">
	                            <p class="help-block">Example block-level help text here.</p>
	                        </div>
	                        <div class="checkbox">
	                            <label>
	                                <input type="checkbox"> Check me out
	                            </label>
	                        </div>
	                    </div><!-- /.box-body -->
	
	                    <div class="box-footer">
	                        <button type="submit" class="btn btn-primary">Submit</button>
	                    </div>
	                </form>
	            </div><!-- /.box -->
		    </div>
			<div class="col-md-3"></div>
	    </div>
    </section>  
                        
</aside>

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
