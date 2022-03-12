<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="<c:url value='/resources/js/admin/dealer.js' />" type="text/javascript"></script> 

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            ${dealerDetail.nombre}
        </h1>
        <ol class="breadcrumb">
            <li><a href="#" onclick="window.history.back();" class="active"><i class="fa fa-arrow-circle-o-left"></i>Atras</a></li>
        </ol>
    </section>

	<!-- Main content -->
    <section class="content">
	    	<div>
		</div>
		<br>
		<div class="box mb-5">
		    <div class="box-header">
		    
		    </div><!-- /.box-header -->
		    <div class="box-body table-responsive">
		        <table id="tableFuncionariosD" class="table table-bordered table-striped">
		            <thead>
		                <tr>
		                    <th >RFC</th>
		                    <th >Nombre</th>
		                    <th >Apellido Paterno</th>
		                    <th >Apellido Materno</th>
		                    <th >Puesto</th>
		                    <th >Fecha de ingreso</th>
		                    <th> Activo</th>
		                    <th >Acciones</th>
		                </tr>
		            </thead>
		            <tbody>

		                 

	            		<c:if test="${not empty dealerDetail.funcionarios}">
							<c:forEach items="${dealerDetail.funcionarios}" var="funcionario">
				                <tr>			                  	   							
									<td>${funcionario.rfc}</td> 				                    				                    
									<td>${funcionario.datosFuncionarioVO.nombres}</td> 				                    				                    
									<td>${funcionario.datosFuncionarioVO.apellidoUno}</td> 				                    				                    
									<td>${funcionario.datosFuncionarioVO.apellidoDos}</td> 				                    				                    
									<td>${funcionario.auxPuesto}</td> 				                    				                    
									<td><fmt:formatDate value="${funcionario.auxIngreso}" type="date" pattern="dd-MM-yyyy"/></td> 
									<td> 
										<c:if test="${funcionario.banActivoPuesto == 1}">
											<i class="fa fa-check"></i>
										</c:if>
										<c:if test="${funcionario.banActivoPuesto == 0}">
											<i class="fa fa-ban"> </i>
										</c:if>
									</td>	
									<td>
										<a href="#" title="Ver" onclick="window.location = ctx + '/funcionario?idFuncionario=${funcionario.id}';"><i class="fa fa-cog"></i></a>&nbsp;
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


<!-- page script -->
<script type="text/javascript">
    $(function() {
        $('#tableFuncionariosD').dataTable({
        	"pageLength": 30 ,
            "bPaginate": true,
            "bLengthChange": true,
            "bFilter": true,
            "bSort": true,
            "bInfo": true,
            "bAutoWidth": true
        });
    });
</script>