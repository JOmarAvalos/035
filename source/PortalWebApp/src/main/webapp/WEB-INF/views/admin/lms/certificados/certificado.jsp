<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript"
	src="<c:url value='/resources/js/lms/certificados/certificado.js' />"
	type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Certificación / Cursos</h1>
		<ol class="breadcrumb">
			<li><a href="#" onclick="getCertificados();"><i
					class="fa fa-bar-chart-o"></i>Certificaciones</a></li>
			<li><a href="#" class="active">${certificado.nombre}</a></li>
		</ol>

	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary"
				onclick="agregarCurso(${certificado.id});">Agregar curso</button>

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
							<th style="width: 75%;">C&oacute;digo</th>
							<th style="width: 75%;">Nombre</th>
							<th style="width: 10%; text-align: center;">Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstCertCurso}">
							<c:forEach items="${lstCertCurso}" var="certCurso"
								varStatus="loop">
								<tr>
									<td style="text-align: center;">${certCurso.orden}</td>
									<td>${certCurso.curso.codigo}</td>
									<td>${certCurso.curso.nombre}</td>
									<td style="text-align: center;">
										<a href="#" title="Editar" onclick="configuraCertificadoCurso(${certCurso.id});"><i class="fa fa-gear"></i></a>
										&nbsp;
										<a href="#" title="Inscripción" onclick="inscripcionCertificaCurso(${certCurso.id});"><i class="fa fa-sign-in" aria-hidden="true"></i></a> &nbsp; 
										<a href="#" title="Finalización" onclick="finalizacionCertificaCurso(${certCurso.id});"><i class="fa fa-sign-out" aria-hidden="true"></i></a> &nbsp;
										<!-- <a href="#" title="Revaldaci&oacute;n" onclick="revalidaciónCertificaCurso(${certCurso.id},'${certCurso.idCursoRevalidacion}');"><i class="fa fa-undo" aria-hidden="true"></i></a> &nbsp; --> 
										<c:if test="${certCurso.banActivo == 1}">
											<a href="#" title="Estatus" onclick="estatusCertificadoCurso(${certCurso.id}, ${certCurso.idCertificado});"><i class="fa fa-eye"></i></a>
										</c:if> 
										<c:if test="${certCurso.banActivo == 0}">
											<a href="#" title="Estatus" onclick="estatusCertificadoCurso(${certCurso.id}, ${certCurso.idCertificado});"><i class="fa fa-eye-slash"></i></a>
										</c:if> &nbsp; 
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaCertificadoCurso(${certCurso.id}, ${certCurso.idCertificado});"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
			                    		</c:if> 
			                    		<c:if test="${loop.count != fn:length(lstCertCurso)}">
											<a href="#" title="Abajo" onclick="orderAbajoCertificadoCurso(${certCurso.id}, ${certCurso.idCertificado});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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



<div class="modal fade" id="modalAgregarCurso" tabindex="-1"
	role="dialog" aria-labelledby="modalAgregarCurso" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formAgregarCurso"
				action="javascript:agregarConfirmacion(this);" method="POST"
				class="" data-parsley-validate="">

				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Agregar Curso a Certificación</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div id="listCursos" class="box-body">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="iptCertificadoId" value="">
					<button type="submit" class="btn">Agregar curso</button>
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
				<h3 class="box-title">Certificación / Curso</h3>
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


<div class="modal fade" id="modalEditarCertificadoCurso" tabindex="-1"
	role="dialog" aria-labelledby="modalEditarCertificadoCurso"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formCertificadoCurso"
				action="javascript:saveCertificadoCurso(this);" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptCertificadoTitulo">Actualizar
						Curso Certificado</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">

							<!-- 		                    	<div class="row">
		                    		<div class="col-md-12">
			                        <div class="form-group">
			                            <label for="iptCertificadoCursoCodigo">Código</label>
			                            <input type="text" class="form-control" id="iptCertificadoCodigo" placeholder="Código de Certificado" required="">
			                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">		
		                    		<div class="col-md-12">
			                        <div class="form-group">
			                            <label for="iptCertificadoCursNombre">Nombre</label>
			                            <input type="text" class="form-control" id="iptCertificadoNombre" placeholder="Nombre de Certificado" required="">
			                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-12">
			                        <div class="form-group">
			                            <label for="iptCertificadoCursDescripcion">Descripción</label>
			                            <input type="text" class="form-control" id="iptCertificadoDescripcion" placeholder="Descripción de Certificado">
			                        </div>
		                    		</div>
		                    	</div> -->
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control"
											id="selectCertificadoCursEstatus">
											<option value="">Seleccione...</option>
											<option value="1">Activo</option>
											<option value="0">Inactivo</option>
										</select>
									</div>
								</div>
							</div>


						</div>
					</div>
					<!-- /.box -->
				</div>
				<div class="modal-footer">
					<input type="hidden" id="iptCertificadoCursoId" value=""> <input
						type="hidden" id="iptCertificadoId" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>

		</div>
	</div>
</div>
<div class="modal fade" id="modalEstatusCertificadoCurso" tabindex="-1"
	role="dialog" aria-labelledby="modalEstatusCertificadoCurso"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formEstatusCertificadoCurso"
				action="javascript:estatusCertificadoCursoConfirmacion(this);"
				method="POST" class="" data-parsley-validate="">

				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Certificación / Curso</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<h4>¿Esta seguro que desea cambiar el estatus del
								curso?</h4>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="iptCertificadoId" value=""> <input
						type="hidden" id="iptEstatusCertificadoCursoId" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>

			</form>
		</div>
	</div>
</div>
<div class="modal fade" id="modalInscripcionCertificaCurso"
	tabindex="-1" role="dialog"
	aria-labelledby="modalInscripcionCertificaCurso" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formInscripcionCertificaCurso"
				action="javascript:saveInscripcionCertificaCurso(this);"
				method="POST" class="" data-parsley-validate="">

				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Especificaciones para Inscripción</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptNoCursosOnlineCertificadoCurso">Número de cursos mínimos (Online)</label> 
											<input type="number" class="form-control"
											id="iptNoCursosOnlineCertificadoCurso"
											placeholder="Número de cursos mínimos Online" min="0" max="15" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 15" onKeyDown="if(this.value.length==2 && event.keyCode!=8) return false;" required="" >
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptNoCursosPresencialesCertificadoCurso">Número de cursos mínimos (Presenciales)</label> 
											<input type="number"
											class="form-control"
											id="iptNoCursosPresencialesCertificadoCurso"
											placeholder="Número de cursos mínimos Presenciales"  min="0" max="15" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 15" onKeyDown="if(this.value.length==2 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Curso anterior terminado</label> <select class="form-control"
											id="selectCurso">
											<option value="">Seleccione...</option>
											<c:forEach var="curso" items="${lstCursos}">
												<option value="${curso.id}"><c:out
														value="${curso.nombre}" />
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="iptCertificadoId" value=""> <input
						type="hidden" id="iptInscrpcionCertificadoCursoId" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>

			</form>
		</div>
	</div>
</div>
<div class="modal fade" id="modalFinalizacionCertificaCurso"
	tabindex="-1" role="dialog"
	aria-labelledby="modalFinalizacionCertificaCurso" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formFinalizacionCertificaCurso"
				action="javascript:saveFinalizacionCertificaCurso(this);"
				method="POST" class="" data-parsley-validate="">

				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Especificaciones para Finalización</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptCalifAprovCertificadoCurso">Calificación Mínima Aprobatoria</label> 
											<input type="number" class="form-control"
											id="iptCalifAprovCertificadoCurso"
											placeholder="Calificación Mínima Aprobatoria"  min="0" max="100" step="1" maxlength="3" data-parsley-range-message="Este valor debe estar entre 0 y 100" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="iptCertificadoId" value=""> <input
						type="hidden" id="iptFinalizacionCertificadoCursoId" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>

			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="modalConfigCertificadoCursoTalla"
	tabindex="-1" role="dialog"
	aria-labelledby="modalConfigCertificadoCursoTalla" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form">

				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Configuración por talla</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<!-- Start -->
					
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<div>
								<div class="row">
									<div class="bomb-5">
										<div class="box-body table-responsive">
											<table id="tblCertificadoCursoTalla"
												class="table table-bordered table-striped">
												<thead>
													<tr>
														<th>Talla</th>
														<th>Funcionarios m&iacute;nimos </th>
														<th>Porcentaje de funcionarios m&iacute;nimos</th>
														<th>Acciones</th>
													</tr>
												</thead>
												<tbody id="tbodyCertificadoCursoTalla">
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- End -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
				</div>

			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="modalExitoCCT" tabindex="-1" role="dialog"
	aria-labelledby="modalExitoCCT" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd box box-danger">
			<div class="modal-header bg-glass-sknd ">
				<h3 class="box-title" id="iptCursoTitulo">&Eacute;xito</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h4>Datos actualizados.</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Aceptar</button>
			</div>	
		</div>
	</div>
</div>

<div class="modal fade" id="modalCursoRevalida"
	tabindex="-1" role="dialog"
	aria-labelledby="modalCursoRevalida" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formCertificaCursoRevaliida"
				action="javascript:saveCursoRevalida(this);"
				method="POST" class="" data-parsley-validate="">

				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Curso de revalidaci&oacute;n</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="selectCursoRevalidacion">Curso revalidaci&oacute;n</label> 
										<select class="form-control" id="selectCursoRevalidacion" name="selectCursoRevalidacion" required="">
											<option value="">Seleccione...</option>
											<c:if test="${not empty cursosRevalida}">
												<c:forEach items="${cursosRevalida}" var="curso">
													<option value="${curso.id}">${curso.nombre}</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="iptIdCertificadoCursoRev" value=""> 
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>

			</form>
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

<script type="text/javascript">
	$(function () {
  		$('#formInscripcionCertificaCurso').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formInscripcionCertificaCurso').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formInscripcionCertificaCurso').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
</script>

<script type="text/javascript">
	$(function () {
  		$('#formFinalizacionCertificaCurso').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formFinalizacionCertificaCurso').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formFinalizacionCertificaCurso').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
  		$('#first').attr('data-parsley-maxlength', 4);
	});
</script>

