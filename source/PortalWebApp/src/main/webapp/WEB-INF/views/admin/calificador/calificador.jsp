<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javascript" src="<c:url value='/resources/js/admin/calificador/calificador.js' />" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>  


<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Calificador</h1>
	</section>

	<!-- Main content -->
	<section class="content">
	
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
			
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="width: 20%;">Empresa</th>
							<th style="width: 50%;">Curso</th>
							<th style="width: 10%; text-align: center;">Inicio</th>
							<th style="width: 10%; text-align: center;">Fin</th>
							<th style="width: 10%; text-align: center;">Acciones</th>
						</tr>
					</thead>
					<tbody>
					
						<c:if test="${not empty lstEventosAnteriores}">
							<c:forEach items="${lstEventosAnteriores}" var="eventosAnteriores" varStatus="loop">
								<tr>
									<td>${eventosAnteriores.empresaVO.nombre}</td>
									<td>${eventosAnteriores.cursoVO.codigo} ${eventosAnteriores.cursoVO.nombre}</td>
									<td>
										<fmt:formatDate value="${eventosAnteriores.fechaInicio}" type="date" pattern="yyyy-MM-dd HH:mm" />
									</td>
									<td>
										<fmt:formatDate value="${eventosAnteriores.fechaFin}" type="date" pattern="yyyy-MM-dd HH:mm" />
									</td>
									<td style="text-align: center;">
										<button type="button" class="btn btn-primary" onclick="showInscripcion(${eventosAnteriores.id})">Calificar</button>
									</td>
									
								</tr>
							</c:forEach>
						</c:if>
					
					</tbody>
				</table>

			</div>
		</div>

	</section>
	<!-- /.content -->
</aside>
<!-- /.right-side -->
	
	
<!-- page script -->
<script type="text/javascript">
    $(function() {
        $('#example1').dataTable({
        	"pageLength": 30 ,
            "bPaginate": true,
            "bLengthChange": true,
            "bFilter": true,
            "bSort": true,
            "bInfo": true,
            "bAutoWidth": true,   
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
            }
        });
    });
</script>






