<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="<c:url value='/resources/js/admin/monitoreo/monitoreoActividad.js' />" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>  
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Monitoreo de Actividad
        </h1>
    </section>

	<!-- Main content -->
    <section class="content">
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<c:if test="${not empty lstEmpresa}">
					<c:forEach items="${lstEmpresa}" var="empresa">
						<c:if test="${not empty currentEmpresa}">
							<c:if test="${empresa.id == currentEmpresa.id}">
								<li class="active">
									<a href="#" onclick="window.location = ctx + '/monitoreoActividadByEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
								</li>
							</c:if>
							<c:if test="${empresa.id != currentEmpresa.id}">
								<li>
									<a href="#" onclick="window.location = ctx + '/monitoreoActividadByEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
								</li>
							</c:if>
						</c:if>
						<c:if test="${empty currentEmpresa}">
							<li>
								<a href="#" onclick="window.location = ctx + '/monitoreoActividadByEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
							</li>
						</c:if>
						
					</c:forEach>
				</c:if>
			</ul>
		</div>
		<c:if test="${not empty currentEmpresa}">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<c:if test="${activos == 1}">
						<li class="active">
							<a href="#" onclick="window.location = ctx + '/monitoreoActividadByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Nuevos</a>
						</li>	
						<li>
							<a href="#" onclick="window.location = ctx + '/monitoreoActividadAllByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Todos</a>
						</li>	
					</c:if>		
					<c:if test="${activos == 0}">
						<li >
							<a href="#" onclick="window.location = ctx + '/monitoreoActividadByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Nuevos</a>
						</li>	
						<li class="active">
							<a href="#" onclick="window.location = ctx + '/monitoreoActividadAllByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Todos</a>
						</li>	
					</c:if>		
				</ul>
			</div>
		</c:if>

		<br>
		<div class="box mb-5">
		    <div class="box-header">
		    
		    </div><!-- /.box-header -->
		    <div class="box-body table-responsive">
		        <table id="example1" class="table table-bordered table-striped">
		            <thead>
		                <tr>
		                		<th style="width: 10%; text-align: center;">RFC</th>
		                    <th style="width: 15%; text-align: center;">Nombre</th>
		                    <th style="width: 15%;  text-align: center;">Puesto</th>
		                    <th style="width: 10%;">Codigo</th>
		                    <th style="width: 15%;  text-align: center;">Dealer</th>
		                    <th style="width: 10%; text-align: center;">Modulo</th>
		                    <th style="width: 10%; text-align: center;">Tiempo invertido</th>
		                    <th style="width: 10%; text-align: center;">Fecha entrada</th>
		                    <th style="width: 10%; text-align: center;"></th>
		                </tr>
		            </thead>
		            <tbody>

						<c:if test="${not empty lstMonitoreoAct}">
							<c:forEach items="${lstMonitoreoAct}" var="monitoreoAct" varStatus="loop">
				                <tr>
				                	<td style="text-align: center;">${monitoreoAct.funcionarioVO.rfc}</td>
				                	<td style="text-align: center;">${monitoreoAct.funcionarioVO.datosFuncionarioVO.nombres} ${monitoreoAct.funcionarioVO.datosFuncionarioVO.apellidoUno} ${monitoreoAct.funcionarioVO.datosFuncionarioVO.apellidoDos}</td>				                
				                	<td style="text-align: center;">${monitoreoAct.funcionarioVO.auxPuestoPrincipal}</td>
				                	<td style="text-align: center;">${monitoreoAct.funcionarioVO.dealerVO.clave}</td>
				                	<td style="text-align: center;">${monitoreoAct.funcionarioVO.dealerVO.nombre}</td>
				                	<td style="text-align: center;">${monitoreoAct.modulo}</td>
				                	<td style="text-align: center;">${monitoreoAct.tiempo}</td>	
				                	<td style="text-align: center;">
				                		<fmt:formatDate value="${monitoreoAct.fchIngreso}" type="date" pattern="yyyy-MM-dd HH:mm" />
				                	</td>			                	
				                	<td style="text-align: center;">
				                	<c:if test="${monitoreoAct.modulo == 'MiCarrera'}">
				                	<button type="button" class="btn"
											onclick="moduloUsuario(${monitoreoAct.id});">Ver</button>
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




