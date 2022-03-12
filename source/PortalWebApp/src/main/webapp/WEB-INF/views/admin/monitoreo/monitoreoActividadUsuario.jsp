
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="<c:url value='/resources/js/admin/monitoreo/monitoreoActividad.js' />"
	type="text/javascript"></script>
<style>
.card-header {
	padding: .75rem 1.25rem;
	margin-bottom: 0;
	background-color: rgba(0, 0, 0, .03);
	border-bottom: 1px solid rgba(0, 0, 0, .125);
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1.25rem;
}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

/* .btn
:not
(:disabled)
:not
(.disabled)
{
cursor
pointer;
} */
.btn-link {
	font-weight: 400;
	color: #007bff;
	background-color: transparent;
}

.mb-0, .my-0 {
	margin-bottom: 0 !important;
}
}
</style>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1></h1>
		<ol class="breadcrumb">
			<li><a href="#" onclick="window.history.back();" class="active">
					<i class="fa fa-arrow-circle-o-left"></i> Atras
			</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
				<div class="tab-content">


					<input type="hidden" id="iptIdCarpetaRaiz" name="iptIdCarpetaRaiz"
						value="${monitoreoAct.id}">
					<div id="${monitoreoAct.modulo}${monitoreoAct.id}">
						<div class="card">
							<div class="card-header" id="headingOne">
								<div class="row">
									<div class="col-md-1">
										<div class="form-group">
											<h5 class="mb-0">${monitoreoAct.funcionarioVO.rfc}</h5>
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<h5 class="mb-0">${monitoreoAct.funcionarioVO.datosFuncionarioVO.nombres}
												${monitoreoAct.funcionarioVO.datosFuncionarioVO.apellidoUno}
												${monitoreoAct.funcionarioVO.datosFuncionarioVO.apellidoDos}</h5>
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<h5 class="mb-0">${monitoreoAct.funcionarioVO.auxPuestoPrincipal}</h5>
										</div>
									</div>
									<div class="col-md-1">
										<div class="form-group">
											<h5 class="mb-0">${monitoreoAct.funcionarioVO.dealerVO.clave}</h5>
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<h5 class="mb-0">${monitoreoAct.funcionarioVO.dealerVO.nombre}</h5>
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<h5 class="mb-0">${monitoreoAct.modulo}</h5>
										</div>
									</div>
									<div class="col-md-1">
										<div class="form-group">
											<h5 class="mb-0">${monitoreoAct.tiempo}</h5>
										</div>
									</div>

									<div class="col-md-1">
										<div class="form-group">
											<button onclick="cursos(${monitoreoAct.id});"
												class="btn btn-link" data-toggle="collapse"
												data-target="#collapse${monitoreoAct.id}"
												aria-expanded="true"
												aria-controls="collapse${monitoreoAct.id}">
												<i class="glyphicon glyphicon-chevron-down"></i>
											</button>
										</div>
									</div>

								</div>
							</div>

							<div id="collapse${monitoreoAct.id}" class="collapse"
								aria-labelledby="headingOne"
								data-parent="#collapse${monitoreoAct.id}"></div>
						</div>
					</div>

				</div>

			</div>
		</div>

	</section>
</aside>
<div class="modal fade" id="modalRespuesta" tabindex="-1" role="dialog"
	aria-labelledby="modalRespuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Repositorio</h3>
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
<script type="text/javascript">
$(function () {
	  $('#myTab li:first-child a').tab('show')
	})
	
	$(function () {
  		$('#formUploadDocumento').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formUploadDocumento').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formUploadDocumento').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});	
</script>

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

<script type="text/javascript">
    $(function() {
        $('#tablaFuncionario').dataTable({
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
<script type="text/javascript">
	$(function() {
				$('#formSubCarpeta').parsley().on('field:validated', function() {
					var ok = $('.parsley-error').length === 0;
					$('.bs-callout-info').toggleClass('hidden', !ok);
					$('.bs-callout-warning').toggleClass('hidden', ok);
				}),
				$('#formSubCarpeta').parsley().options.requiredMessage = "Este campo es requerido",
				$('#formSubCarpeta').parsley({
					successClass : 'parsleyCorrect',
					errorClass : 'parsleyError'
				});
	});
</script>

<script>
    $(document).ready(function(){
        // Add minus icon for collapse element which is open by default
        $(".collapse.show").each(function(){
        	$(this).prev(".card-header").find(".glyphicon").addClass("glyphicon-chevron-up").removeClass("glyphicon-chevron-down");
        });
        
        // Toggle plus minus icon on show hide of collapse element
        $(".collapse").on('show.bs.collapse', function(){
        	$(this).prev(".card-header").find(".glyphicon").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
        }).on('hide.bs.collapse', function(){
        	$(this).prev(".card-header").find(".glyphicon").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
        });
    });
</script>
