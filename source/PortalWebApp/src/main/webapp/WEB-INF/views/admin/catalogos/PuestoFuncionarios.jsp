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
	       ${puesto.nombre }
	    </h1>
	    
	</section>     
	<section class="content">
		<div class="box mb-5">
		    <div class="box-header">
		    
		    </div><!-- /.box-header -->
		    <div class="box-body table-responsive">
		        <table id="example1" class="table table-bordered table-striped">
		            <thead>
		                <tr>
		                            <th>RFC</th>
									<th>Funcionario</th>
									<th>Dealer</th>
		                </tr>
		            </thead>
		            <tbody>

	            		<c:if test="${not empty puesto.lstFuncionariosVO}">
							<c:forEach items="${puesto.lstFuncionariosVO}" var="funcionario" varStatus="loop">
				                <tr>	                           
										<td>${funcionario.rfc}</td>
										<td>${funcionario.datosFuncionarioVO.nombres} ${funcionario.datosFuncionarioVO.apellidoUno} ${funcionario.datosFuncionarioVO.apellidoDos}</td>
										<td>${funcionario.dealerVO.nombre}</td>
				                </tr>
				          	</c:forEach>
						</c:if>

		            </tbody>
		        </table>
		    </div><!-- /.box-body -->
		</div><!-- /.box -->

	</section><!-- /.content -->
</aside><!-- /.right-side -->  


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
