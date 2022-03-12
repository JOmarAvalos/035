
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.teknei.com/jsp/tags"%>


<jsp:useBean id="now" class="java.util.Date" />


<script src="<c:url value='/resources/js/admin/calendario.js' />"
	type="text/javascript"></script>

<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>


<sec:hasAccess module="ADMIN_USER" var="admin_user" />

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Lista de cursos ${empresa.nombre}</h1>

	</section>

	<!-- Main content -->
	<section class="content">

		
		
		<div class="box box-primary">
			<div class="box-header">
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-12">
						<div class="nav-tabs-custom">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#tabProx" data-toggle="tab">Proximos</a>
								</li>
								<li>
									<a href="#tabAnt" data-toggle="tab">Anteriores</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tabProx">
									<table id="tblProximos"
										class="table table-bordered table-striped">
										<thead>
											<tr>
												<th>Curso</th>
												<th>Fecha inicio</th>
												<th>Fecha fin</th>
												<th>Inscritos</th>
												<th>Solicitados</th>
												<th>Cancelados</th>
												<th>Instructor</th>
												<th>Sede</th>
												<th>Acciones</th>
											</tr>
										</thead>
										<tbody>
										
											<c:if test="${not empty lstEventosProximos}">
											</c:if>
											<c:forEach var="eventoProximo" items="${lstEventosProximos}">
												<tr>
													<td>${eventoProximo.cursoVO.nombre}</td>
													<td><fmt:formatDate value="${eventoProximo.fechaInicio}" pattern="yyyy-MM-dd HH:mm" /></td>
													<td><fmt:formatDate value="${eventoProximo.fechaFin}" pattern="yyyy-MM-dd HH:mm" /></td>
													<td>${eventoProximo.totalInscritos}</td>
													<td>${eventoProximo.totalSolicitados}</td>
													<td>${eventoProximo.totalCancelados}</td>
													<td>${eventoProximo.instructorVO.funcionario.datosFuncionarioVO.nombres} ${eventoProximo.instructorVO.funcionario.datosFuncionarioVO.apellidoUno} ${eventoProximo.instructorVO.funcionario.datosFuncionarioVO.apellidoDos}</td>
												    <td>${eventoProximo.sedeVO.nombre}</td>
												    <td><button type="button" class="btn" onclick="openAgendarCurso(${eventoProximo.id});">Ver</button></td>
												</tr>
											</c:forEach>	
										
										</tbody>
									</table>
								</div>
								<!-- /.tab-pane -->
								<div class="tab-pane" id="tabAnt">
									<div class=" table-responsive">
										<table id="tblAnteriores"
											class="table table-bordered table-striped">
											<thead>
												<tr>
												<th>Curso</th>
												<th>Fecha inicio</th>
												<th>Fecha fin</th>
												<th>Inscritos</th>
												<th>Solicitados</th>
												<th>Cancelados</th>
												<th>Instructor</th>
												<th>Sede</th>
												<th>Acciones</th>
												</tr>
											</thead>
											<tbody>
											
												<c:if test="${not empty lstEventosAnteriores}">
													<c:forEach var="eventoAnterior" items="${lstEventosAnteriores}">
														<tr>
															<td>${eventoAnterior.cursoVO.nombre}</td>
															<td><fmt:formatDate value="${eventoAnterior.fechaInicio}" pattern="yyyy-MM-dd HH:mm" /></td>
															<td><fmt:formatDate value="${eventoAnterior.fechaFin}" pattern="yyyy-MM-dd HH:mm" /></td>
															<td>${eventoAnterior.totalInscritos}</td>
															<td>${eventoAnterior.totalSolicitados}</td>
															<td>${eventoAnterior.totalCancelados}</td>
															<td>${eventoAnterior.instructorVO.funcionario.datosFuncionarioVO.nombres} ${eventoAnterior.instructorVO.funcionario.datosFuncionarioVO.apellidoUno} ${eventoAnterior.instructorVO.funcionario.datosFuncionarioVO.apellidoDos}</td>
														    <td>${eventoAnterior.sedeVO.nombre}</td>
														    <td><button type="button" class="btn" onclick="openAgendarCurso(${eventoAnterior.id});">Ver</button></td>
														</tr>
													</c:forEach>	
												</c:if>
												
											
											</tbody>
										</table>
									</div>
								</div>
								<!-- /.tab-pane -->
							</div>
							<!-- /.tab-content -->
						</div>
						<!-- nav-tabs-custom -->
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->
</aside>
<!-- /.right-side -->




<script type="text/javascript">
    $(function() {
    	$('#tblProximos').dataTable({
    		"pageLength": 25 ,
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
    	$('#tblAnteriores').dataTable({
    		"pageLength": 25 ,
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



