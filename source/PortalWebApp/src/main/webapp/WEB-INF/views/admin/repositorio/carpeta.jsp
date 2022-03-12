
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="<c:url value='/resources/js/admin/administradorRepositorio.js' />"
	type="text/javascript"></script>

<!-- Bootstrap CSS -->
<!--  <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>  -->
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
		<h1>${empresa.nombre} > ${carpetasArchivos.nombre}</h1>
				<ol class="breadcrumb">
			<li>
				<a href="#" onclick="window.history.back();" class="active">
					<i class="fa fa-arrow-circle-o-left"></i>
					Atras
				</a>
			</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newSubCarpeta();">Nueva
					Carpeta</button>
			<button class="btn btn-primary" onclick="saveFile(${carpetasArchivos.id});">Subir Archivo</button>
		</div>
		<div class="box box-primary">
			<div class="box-header">
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-12">
						<div class="nav-tabs-custom">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#tabCarpetasDoc" data-toggle="tab">Carpetas/Documentos</a>
								</li>
								<li>
									<a href="#tabFuncionarios" data-toggle="tab">Funcionarios con permisos</a>
								</li>
								<li>
									<a href="#tabFuncionariosNO" data-toggle="tab">Agregar permisos</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tabCarpetasDoc">
									<input type="hidden" id="iptIdCarpetaRaiz" name="iptIdCarpetaRaiz" value="${carpetasArchivos.id}">
									<c:if test="${not empty carpetasArchivos.carpetaRepositorioVOLst}">
										<c:forEach items="${carpetasArchivos.carpetaRepositorioVOLst}"
											var="carpeta" varStatus="loop">
											<div id="${carpeta.nombre}${carpeta.id}">
												<div class="card">
													<div class="card-header" id="headingOne">
														<div class="row">
															<div class="col-md-8">
																<div class="form-group">
																	<h5 class="mb-0">${carpeta.nombre}</h5>
																</div>
															</div>
															<div class="col-md-4">
																<div class="form-group">
																	<c:if test="${carpeta.tipo == 1}">
																		<button onclick="subCarpetas(${carpeta.id});"
																			class="btn btn-link" data-toggle="collapse"
																			data-target="#collapse${carpeta.id}"
																			aria-expanded="true"
																			aria-controls="collapse${carpeta.id}">
																			  <i class="glyphicon glyphicon-chevron-down"
																				></i>
			
																		</button>
																			&nbsp;
			
																			<a href="#" title="Agregar carpeta"
																			onclick="agregarSubCarpeta(${carpeta.id});"><i
																			class="glyphicon glyphicon-folder-open"></i></a>
																			&nbsp;
																		<a href="#" title="Subir Archivo"
																			onclick="saveFile(${carpeta.id});"><i
																			class="fa fa-fw fa-file-text-o"></i></a>
																			&nbsp;
																		<a href="#" title="Descargar Zip"
																			onclick="descargarZip(${carpeta.id});"><i
																			class="glyphicon glyphicon-save"></i></a>
																			&nbsp;
																	</c:if>
			
																	<c:if test="${carpeta.tipo == 2}">
																		<a href="#" title="Descargar Archivo"
																			onclick="descargarFile(${carpeta.id});" style="padding: 6px 12px;"><i
																			class="glyphicon glyphicon-save"></i></a>
																	</c:if>
			
																	<c:if test="${carpeta.visible == 1}">
																		<a href="#" title="Visible"
																			onclick="visible(${carpeta.id});"><i
																			class="fa fa-eye"></i></a>
																			&nbsp;
																	</c:if>
			
																	<c:if test="${carpeta.visible == 0}">
																		<a href="#" title="Visible"
																			onclick="visible(${carpeta.id});"><i
																			class="fa fa-eye-slash"></i></a>
																			&nbsp;
																	</c:if>
			
																</div>
															</div>
			
														</div>
			
			
													</div>
			
													<div id="collapse${carpeta.id}" class="collapse"
														aria-labelledby="headingOne"
														data-parent="#collapse${carpeta.id}"></div>
												</div>
											</div>
			
										</c:forEach>
									</c:if>
			
									<c:if test="${ empty carpetasArchivos.carpetaRepositorioVOLst}">
										<p>No hay carpetas</p>
									</c:if>
								</div>
								<div class="tab-pane" id="tabFuncionarios">
									<div id="divFuncionarios">
										<table id="example1" class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>RFC</th>
													<th>Funcionario</th>
													<th style="width: 5%; text-align: center;">Agregar</th>
													<th style="width: 5%; text-align: center;">Quitar</th>
												</tr>
											</thead>
											<tbody>

												<c:if test="${not empty lstPermisos}">
													<c:forEach items="${lstPermisos}" var="permiso" varStatus="loop">
														<tr>
															<td>${permiso.funcionarioVO.rfc}</td>
															<td>${permiso.funcionarioVO.datosFuncionarioVO.nombres}
																${permiso.funcionarioVO.datosFuncionarioVO.apellidoUno}
																${permiso.funcionarioVO.datosFuncionarioVO.apellidoDos}</td>
															<td style="text-align: center;">
																<c:if test="${permiso.banActivo == 1}">

																	<button type="button" onclick="agregarPermiso(${permiso.id})" class="btn btn-default btn-sm" disabled>
																		<span class="glyphicon glyphicon-ok"></span>
																	</button>
																</c:if> 
																<c:if test="${permiso.banActivo == 0}">
																	<button type="button" onclick="agregarPermiso(${permiso.id})" class="btn btn-default btn-sm">
																		<span class=""
																			style="width: 1em; position: relative; top: 1px; display: inline-block; font-family: 'Glyphicons Halflings'; -webkit-font-smoothing: antialiased; font-style: normal; font-weight: normal; line-height: 1;"></span>
																	</button>
																</c:if>
															</td>
															<td style="text-align: center;">
																<c:if test="${permiso.banActivo == 0}">
																	<button type="button" onclick="quitarPermiso(${permiso.id})" class="btn btn-default btn-sm" disabled>
																		<span class="glyphicon glyphicon-ok"></span>
																	</button>
																</c:if> 
																<c:if test="${permiso.banActivo == 1}">
																	<button type="button" onclick="quitarPermiso(${permiso.id})" class="btn btn-default btn-sm">
																		<span class=""
																			style="width: 1em; position: relative; top: 1px; display: inline-block; font-family: 'Glyphicons Halflings'; -webkit-font-smoothing: antialiased; font-style: normal; font-weight: normal; line-height: 1;"></span>
																	</button>
																</c:if>
															</td>
														</tr>
													</c:forEach>
												</c:if>

											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane" id="tabFuncionariosNO">
									<div class="row">
										<button type="button" class="btn" onclick="showBuscaFuncionarios();">Buscar funcionarios</button>
									</div>
									<div class="row">
										<div class="bomb-5">
											<div class="box-body table-responsive">
												<form role="form" id="formAgregarPermisos"
													action="javascript:agregarConfirmacion(this);" method="POST"
													class="" data-parsley-validate="">
													
													<input type="hidden" id="iptCarpetaId" value="">
													<table  class="table table-bordered table-striped" id="tablaFuncionario">
														<thead>
															<tr>
																<th>RFC</th>
																<th>Funcionario</th>
																<th>Agregar</th>
															</tr>
														</thead>
														<tbody id="tbodyGerente">
															<c:if test="${not empty lstFuncionarios}">
																<c:forEach var="funcionario" items="${lstFuncionarios}">
																	<tr> 
																		<td>${funcionario.rfc}</td>
																		<td>${funcionario.datosFuncionarioVO.nombres} ${funcionario.datosFuncionarioVO.apellidoUno} ${funcionario.datosFuncionarioVO.apellidoDos}</td>
																		<td></td>
																	</tr>
																</c:forEach>
															</c:if>
															
														</tbody>
													</table>
													<button type="submit" class="btn">Agregar permisos</button>
													<!-- <button type="button" class="btn" onclick="closeAgregarFuncionario();">Cancelar</button> -->
												</form>
											</div>
			
										</div>
									</div>
								</div>
								
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
<div class="modal fade" id="modalUploadDocumento" tabindex="-1"
	role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalUploadDocumento" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formUploadDocumento"
				action="javascript:saveUploadDocumento(this);" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptDocumentoNuevo">Subir nuevo
						documento</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCarpeta"
								name="iptIdCarpeta" value=""> <input type="hidden"
								class="form-control" id="iptIdCarpetaRaizDocumento"
								name="iptIdCarpetaRaizDocumento" value="">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptDocumentoNombre">Documento</label> <input
											type="text" class="form-control" id="iptDocumentoNombre"
											name="iptDocumentoNombre" placeholder="Nombre de documento"
											maxlength="200" required="" disabled>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptDocumentoIcono">Archivo</label>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<img id="iptDocumentoIconoImg"
											src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
											alt="documento image" style="width: 90px;" />
									</div>
								</div>
								<div class="col-md-10">
									<div class="form-group">
										<br> <br> <input type="file" name="iptDocumentoFile"
											id="iptDocumentoFile"
											accept=".xlsx, .xls, .doc, .docx, .ppt, .pptx, .pdf"
											onchange="inUploadChange(this)" required="">
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Visible</label> <select class="form-control"
											id="selectDocumentoVisible" name="selectDocumentoVisible"
											required="">
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
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="modal fade" id="modalVisible" tabindex="-1" role="dialog"
	aria-labelledby="modalVisible" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formEstatusCertificadoCurso"
				action="javascript:visibleCarpetaConfirmacion(this);" method="POST"
				class="" data-parsley-validate="">

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
							<h4>¿Esta seguro que desea cambiar la visibilidad?</h4>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="iptCarpetaRaizId" value=""> <input
						type="hidden" id="iptVisibleCarperaId" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>

			</form>
		</div>
	</div>
</div>



<div class="modal fade" id="modalNewSubCarpeta" tabindex="-1" role="dialog"
	aria-labelledby="modalNewSubCarpeta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formSubCarpeta"
				action="javascript:saveSubCarpeta(this);" method="POST" class=""
				data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptCarpetaTitulo">Nueva Carpeta</h3>
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
										<label for="iptNombreSubCarpeta">Nombre de la carpeta</label> <input
											type="text" class="form-control" id="iptNombreSubCarpeta"
											placeholder="Nombre de la carpeta" maxlength="300"
											required="" onkeypress="return isValidChar(event)">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Empresa</label> <select class="form-control"
											id="selecSubCarpetaEmpresa" 
											required="">
											
												<option value="${empresa.id}"><c:out
														value="${empresa.nombre}" />
												</option>
											
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Carpeta Padre</label> 
										 <select class="form-control"
											id="selecSubCarpetaPadre"
											required="">
											<option value="">Seleccione...</option>
											<c:forEach var="padre" items="${lstCarpetasPadres}">
												<option value="${padre.id}"><c:out
														value="${padre.nombre}" />
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Visible</label> <select class="form-control"
											id="selectSubCarpetaVisible" name="selectCarpetaVisible"
											required="">
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
                <input type="hidden" id="iptCarpetaRaizId" value="">
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
<div class="modal fade" id="modalBuscaFuncionarios" tabindex="-1" role="dialog"
	aria-labelledby="modalBuscaFuncionarios" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Buscar funcionarios</h3>
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
									<label>Grupo de dealer</label> 
									<select class="form-control" id="selectGrupoD" onchange="getDealer()">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty grupoDealer}">
											<c:forEach items="${grupoDealer}" var="grupoD">
												<option value="${grupoD.id}">${grupoD.agrupacion}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Dealer</label> 
									<select class="form-control" id="selectDealer">
										<option value="0">Seleccione...</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
				<button type="button" class="btn" onclick="buscaFuncionarios('${carpetasArchivos.id}')">Buscar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalSinDatos" tabindex="-1" role="dialog"
	aria-labelledby="modalSinDatos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Error</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<div class="box-body">
						<h4>No se encontraron funcionarios</h4>
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
