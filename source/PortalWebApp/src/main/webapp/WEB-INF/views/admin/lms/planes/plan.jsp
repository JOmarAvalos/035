<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript"
	src="<c:url value='/resources/js/lms/planes/plan.js' />"
	type="text/javascript"></script>
	    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>  

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Plan de carrera / Certificaciones</h1>
		<ol class="breadcrumb">
            <li><a href="#" onclick="getPlanesDeCarrera();"><i class="fa fa-bar-chart-o"></i>Planes de Carrera</a></li>
            <li><a href="#" class="active">${plan.nombre}</a></li>
        </ol>

	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="agregarCertificado(${plan.id});">Agregar certificación</button> 
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="width: 5%; text-align: center;">Orden</th>
							<th style="width: 75%;">Certificaciónes</th>
							<th style="width: 10%; text-align: center;">Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstCertPlan}">
							<c:forEach items="${lstCertPlan}" var="certPlan" varStatus="loop">
								 <tr>
				                	    <td style="text-align: center;">${certPlan.orden}</td>
				                  
				                    <td>${certPlan.certificado.nombre}</td>
									 <td style="text-align: center;">

				                    		<c:if test="${certPlan.banActivo == 1}">
											<a href="#" title="Estatus" onclick="estatusCertificadoPlan(${certPlan.id}, ${certPlan.idPlanCarrera});"><i class="fa fa-eye"></i></a>
										</c:if>
										<c:if test="${certPlan.banActivo == 0}">
											<a href="#" title="Estatus" onclick="estatusCertificadoPlan(${certPlan.id}, ${certPlan.idPlanCarrera});"><i class="fa fa-eye-slash"></i></a>
										</c:if>
				                    		&nbsp;	
				                    			<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaCertificadoPlan(${certPlan.id}, ${certPlan.idPlanCarrera});"><i class="fa fa-arrow-circle-up"></i></a> &nbsp; 
										</c:if>
				                    		<c:if test="${loop.count != fn:length(lstCertPlan)}">
											<a href="#" title="Abajo" onclick="orderAbajoCertificadoPlan(${certPlan.id}, ${certPlan.idPlanCarrera});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
										</c:if>
				                    	</td>
								</tr> 
							</c:forEach>
						</c:if>

					</tbody>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->

	</section>
	<!-- /.content -->
</aside>
<!-- /.right-side -->



<div class="modal fade" id="modalAgregarPlanCertificado" tabindex="-1" role="dialog"
	aria-labelledby="modalAgregarPlanCertificado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			
		 	<!-- form start -->
	        <form role="form" id="formAgregarPlan" action="javascript:agregarConfirmacion(this);" method="POST" class="" data-parsley-validate="" >
				
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Agregar Certificación</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<div id ="listCertificados" class="box-body">
					</div>
				</div>
	            </div>
				<div class="modal-footer">
					<input type="hidden" id="iptPlanCertificadoId" value="">
					<button type="submit" class="btn">Agregar certificación </button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
				
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalEstatusCertificadoPlan" tabindex="-1" role="dialog"
	aria-labelledby="modalEstatusCertificadoPlan" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
		
		 	<!-- form start -->
	        <form role="form" id="formEstatusCertificadoPlan" action="javascript:estatusPlanCertificadoConfirmacion(this);" method="POST" class="" data-parsley-validate="" >
			
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Plan de carrera / Certificación</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
		                <div class="box-header"></div>
	                    <div class="box-body">
	                    		<h4>¿Esta seguro que desea cambiar el estatus de la certificación ?</h4>
	                    </div>
	                </div>
	            </div>
				<div class="modal-footer">
				<input type="hidden" id="iptPlanId" value="">
					<input type="hidden" id="iptEstatusPlanCertificadoId" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			
			</form>
		</div>
	</div>
</div>
<div class="modal fade" id="modalRespuesta" tabindex="-1" role="dialog"
	aria-labelledby="modalRespuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
		
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Plan de carrera / Certificación</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
	                <div class="box-header"></div>
                    <div class="box-body">
                    		<h4 id="modalTxtRespuesta"></h4>
                    </div>
                </div>
            </div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Aceptar</button>
			</div>
			
		</div>
	</div>
</div>

<!-- page script -->
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




