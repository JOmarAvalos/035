<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="<c:url value='/resources/js/lms/insumos/insumoActividad.js' />" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Preguntas</h1>
		<ol class="breadcrumb">
            <li><a href="#" onclick="getInsumos();"><i class="fa fa-bar-chart-o"></i>Insumos</a></li>
<%--             <li><a href="#" onclick="getCurso(${curso.id});" class="">${curso.nombre}</a></li>--%>
            <li><a href="#" class="active">${actividad.nombre}</a></li>
        </ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newPregunta();">Crear nueva pregunta</button>
		</div>
		<br>
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">
				<input type="hidden" class="form-control" id="iptIdActividadEncuesta" name="iptIdActividadEncuesta" value="${actividad.actividadEncuestaVO.id}" >
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="width: 5%; text-align: center;">Orden</th>
							<th style="width: 15%;">Tipo</th>
							<th style="width: 70%;">Pregunta</th>
							<th style="width: 10%; text-align: center;">Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstPreguntas}">
							<c:forEach items="${lstPreguntas}" var="pregunta" varStatus="loop">
								<tr>
									<td style="text-align: center;">${pregunta.orden}</td>
									<td>
										${pregunta.tipoPreguntaVO.nombre}
									</td>
									<td>
										${pregunta.nombre}
									</td>
									<td style="text-align: center;">
										<a href="#" title="Editar" onclick="editPregunta( ${pregunta.id}, ${pregunta.idTipoPregunta});"><i class="fa fa-gear"></i></a> 
										&nbsp; 
										<c:if test="${pregunta.banActivo == 1}">
											<a href="#" title="Estatus" onclick="estatusPregunta( ${actividad.id}, ${pregunta.id});"><i class="fa fa-eye"></i></a>
										</c:if>
										<c:if test="${pregunta.banActivo == 0}">
											<a href="#" title="Estatus" onclick="estatusPregunta( ${actividad.id}, ${pregunta.id});"><i class="fa fa-eye-slash"></i></a>
										</c:if>
										&nbsp;
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaPregunta( ${actividad.id}, ${pregunta.id});"><i class="fa fa-arrow-circle-up"></i></a> &nbsp; 
										</c:if>
				                    		<c:if test="${loop.count != fn:length(lstPreguntas)}">
											<a href="#" title="Abajo" onclick="orderAbajoPregunta( ${actividad.id}, ${pregunta.id});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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




<!-- Modal Pregunta Nueva -->
<div class="modal fade" id="modalNewPregunta" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewPregunta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title" id="iptCursoTitulo">Nueva pregunta</h3>
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
								<button type="button" onclick="newAbierta();"
									class="btn btn-primary btn-block">Abierta</button>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<button type="button" onclick="newVerdaderoFalso();"
									class="btn btn-primary btn-block">Verdadero-Falso</button>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<button type="button" onclick="newMultipleUnica();"
									class="btn btn-primary btn-block">Opción multiple (Resp. única)</button>
							</div>
						</div>
                        <br>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>



<!-- Modal Pregunta Nueva Abierta -->
<div class="modal fade" id="modalNewAbierta" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewAbierta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPreguntaAbierta" action="javascript:savePreguntaAbierta(this, '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleAbiertaNueva" class="box-title">Nueva pregunta abierta</h3>
					<h3 id="hTitleAbiertaEditar" class="box-title">Editar pregunta abierta</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividadAbierta" name="iptIdActividadAbierta" value="${actividad.id}">
							<input type="hidden" class="form-control" id="iptIdPreguntaAbierta" name="iptIdPreguntaAbierta">
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaAbiertaNombre">Pregunta</label> 
										<input type="text" class="form-control" id="iptPreguntaAbiertaNombre" name="iptPreguntaAbiertaNombre"
											   placeholder="Nombre de pregunta" maxlength="500" required="">
									</div>
								</div>
							</div>

							<div id="preguntaAbiertaRowDownload" class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaAbiertaIcono">Archivo actual</label> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<p id="iptPreguntaAbiertaActualFile" class="help-block"> </p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<button onclick="downloadFile( $('#iptIdPreguntaAbierta').val() ); return false;" >Descargar</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaAbiertaIcono">Imagen</label> 
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2">
									<div class="form-group">
										<img id="iptPreguntaAbiertaIconoImg" name="iptPreguntaAbiertaIconoImg"
											 src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
											 alt="documento image" style="width: 90px;" />
									</div>
								</div>
								<div class="col-md-10">
									<div class="form-group">
										<br> <br> 
										<input type="file" id="iptPreguntaAbiertaFile" name="iptPreguntaAbiertaFile"
											   accept=".jpg, .png" onchange="inUploadChange(this)">
										<p class="help-block">&nbsp;&nbsp;&nbsp;Tipos de archivos aceptados: IMÁGENES (JPG y PNG)</p>
									</div>
								</div>
							</div>
							<!-- Solo es referencia -->
							<div class="row" style="display:none">
								<input type="file" id="iptPreguntaAbiertaFileReferencia" name="iptPreguntaAbiertaFileReferencia">
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectPreguntaAbiertaEstatus" name="selectPreguntaAbiertaEstatus" required="">
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
					<button type="button" class="btn" id="btnCancelAbierta">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- Modal Pregunta Verdadero Falso -->
<div class="modal fade" id="modalNewVerdaderoFalso" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewVerdaderoFalso" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPreguntaVerdaderoFalso" action="javascript:savePreguntaVerdaderoFalso(this, '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleVerdaderoFalsoNueva" class="box-title">Nueva pregunta Verdadero-Falso</h3>
					<h3 id="hTitleVerdaderoFalsoEditar" class="box-title">Editar pregunta Verdadero-Falso</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividadVerdaderoFalso" name="iptIdActividadVerdaderoFalso" value="${actividad.id}">
							<input type="hidden" class="form-control" id="iptIdPreguntaVerdaderoFalso" name="iptIdPreguntaVerdaderoFalso">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaVerdaderoFalsoNombre">Pregunta</label> 
										<input type="text" class="form-control" id="iptPreguntaVerdaderoFalsoNombre" name="iptPreguntaVerdaderoFalsoNombre"
											   placeholder="Nombre de pregunta" maxlength="500" required="">
									</div>
								</div>
							</div>
							
							<div id="preguntaVerdaderoFalsoRowDownload" class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaVerdaderoFalsoIcono">Archivo actual</label> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<p id="iptPreguntaVerdaderoFalsoActualFile" class="help-block"> </p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<button onclick="downloadFile( $('#iptIdPreguntaVerdaderoFalso').val() ); return false;" >Descargar</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaVerdaderoFalsoIcono">Imagen</label> 
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<img id="iptPreguntaVerdaderoFalsoIconoImg" name="iptPreguntaVerdaderoFalsoIconoImg"
											 src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
											 alt="documento image" style="width: 90px;" />
									</div>
								</div>
								<div class="col-md-10">
									<div class="form-group">
										<br> <br> 
										<input type="file" id="iptPreguntaVerdaderoFalsoFile" name="iptPreguntaVerdaderoFalsoFile"
											   accept=".jpg, .png" onchange="inUploadChange(this)">
										<p class="help-block">&nbsp;&nbsp;&nbsp;Tipos de archivos aceptados: IMÁGENES (JPG y PNG)</p>
									</div>
								</div>
							</div>
							<!-- Solo es referencia -->
							<div class="row" style="display:none">
								<input type="file" id="iptPreguntaVerdaderoFalsoFileReferencia" name="iptPreguntaVerdaderoFalsoFileReferencia">
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptRespuestaVerdaderoFalsoNombre">Respuestas</label> 
										
										<div class="input-group">
											<span class="input-group-addon"></span>
                                             <input type="text" class="form-control" id="iptRespuestaV" name="iptRespuestaV" maxlength="100" value="Verdadero" disabled>
										</div>

										<div class="input-group">
                                             <span class="input-group-addon"></span>
                                             <input type="text" class="form-control" id="iptRespuestaF" name="iptRespuestaF" maxlength="100" value="Falso" disabled>
                                         </div>
                                         
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectPreguntaVerdaderoFalsoEstatus" name="selectPreguntaVerdaderoFalsoEstatus" required="">
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
					<button type="button" class="btn" id="btnCancelVerdaderoFalso">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- Modal Pregunta Multiple Unica -->
<div class="modal fade" id="modalNewMultipleUnica" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewMultipleUnica" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPreguntaMultipleUnica" action="javascript:savePreguntaMultipleUnica(this, '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleMultipleUnicaNueva" class="box-title">Nueva pregunta Opción Multiple (Resp. única)</h3>
					<h3 id="hTitleMultipleUnicaEditar" class="box-title">Editar pregunta Opción Multiple (Resp. única)</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividadMultipleUnica" name="iptIdActividadMultipleUnica" value="${actividad.id}">
							<input type="hidden" class="form-control" id="iptIdPreguntaMultipleUnica" name="iptIdPreguntaMultipleUnica">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaMultipleUnicaNombre">Pregunta</label> 
										<input type="text" class="form-control" id="iptPreguntaMultipleUnicaNombre" name="iptPreguntaMultipleUnicaNombre"
											   placeholder="Nombre de pregunta" maxlength="500" required="">
									</div>
								</div>
							</div>
							
							<div id="preguntaMultipleUnicaRowDownload" class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaMultipleUnicaIcono">Archivo actual</label> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<p id="iptPreguntaMultipleUnicaActualFile" class="help-block"> </p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<button onclick="downloadFile( $('#iptIdPreguntaMultipleUnica').val() ); return false;" >Descargar</button>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaMultipleUnicaIcono">Imagen</label> 
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<img id="iptPreguntaMultipleUnicaIconoImg" name="iptPreguntaMultipleUnicaIconoImg"
											 src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
											 alt="documento image" style="width: 90px;" />
									</div>
								</div>
								<div class="col-md-10">
									<div class="form-group">
										<br> <br> 
										<input type="file" id="iptPreguntaMultipleUnicaFile" name="iptPreguntaMultipleUnicaFile"
											   accept=".jpg, .png" onchange="inUploadChange(this)">
										<p class="help-block">&nbsp;&nbsp;&nbsp;Tipos de archivos aceptados: IMÁGENES (JPG y PNG)</p>
									</div>
								</div>
							</div>

							<!-- Solo es referencia -->
							<div class="row" style="display:none">
								<input type="file" id="iptPreguntaMultipleUnicaFileReferencia" name="iptPreguntaMultipleUnicaFileReferencia">
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptRespuestaMultipleUnica">Respuestas</label> 
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<select class="form-control" id="selectPreguntaMultipleUnicaGenerar" name="selectPreguntaMultipleUnicaGenerar" required="">
											<option value="">Seleccione...</option>
											
											<c:forEach var="k" begin="2" end="20">  
												<option value="${k}"><c:out value="${k}"/></option> 
											</c:forEach>
											
										</select>
									</div>
								</div>
								<div class="col-md-9">
									<div class="form-group">
										<button type="button" id="btnRespuestaMultipleUnicaG" onclick="btnRespuestaMultipleUnicaGenerar();" class="btn">Generar</button> 
									</div>
								</div>	
								<div id="respuestas" class="col-md-12"></div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectPreguntaMultipleUnicaEstatus" name="selectPreguntaMultipleUnicaEstatus" required="">
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
					<button type="button" class="btn" id="btnCancelMultipleUnica">Cancelar</button> 
				</div>
			</form>
		</div>
	</div>
</div>













<div class="modal fade" id="modalNewPreguntaAnt" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewPreguntaAnt" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPreguntaAnt" action="javascript:savePregunta(this,'${actividad.id}');" method="POST" class="" data-parsley-validate=""> 
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitlePreguntaNueva" class="box-title">Nueva pregunta</h3>
					<h3 id="hTitlePreguntaEditar" class="box-title">Editar pregunta</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividad" name="iptIdActividad" value="${actividad.id}">
							<input type="hidden" class="form-control" id="iptIdPregunta" name="iptIdPregunta">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaNombre">Pregunta</label> 
										<input type="text" class="form-control" id="iptPreguntaNombre" name="iptPreguntaNombre"
											   placeholder="Nombre de pregunta" maxlength="300" required="">
									</div>
								</div>
							</div>
							
							
							<div id="preguntaRowDownload" class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaIcono">Archivo actual</label> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<p id="iptPreguntaActualFile" class="help-block"> </p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<button onclick="downloadFile( $('#iptIdPregunta').val() ); return false;" >Descargar</button>
									</div>
								</div>
							</div>


							<!-- La imagen no aparece en el caso de la actividad sea encuesta --> 
							<%-- <c:if test="${actividad.idTipoActividad != 5}"> --%>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="iptPreguntaIcono">Imagen</label> 
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<img id="iptPreguntaIconoImg" name="iptPreguntaIconoImg"
												 src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
												 alt="documento image" style="width: 90px;" />
										</div>
									</div>
									<div class="col-md-10">
										<div class="form-group">
											<br> <br> 
											<input type="file" id="iptPreguntaFile" name="iptPreguntaFile"
												   accept=".jpg, .png" onchange="inUploadChange(this)">
											<p class="help-block">&nbsp;&nbsp;&nbsp;Tipos de archivos aceptados: IMÁGENES (JPG y PNG)</p>
										</div>
									</div>
								</div>
							<%-- </c:if> --%>
							<%-- <c:if test="${actividad.idTipoActividad == 5}">
								<!-- Solo es referencia -->
								<div class="row" style="display:none">
									<input type="file" id="iptPreguntaFileReferencia" name="iptPreguntaFileReferencia">
								</div>
							</c:if> --%>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Tipo</label> 
										<select class="form-control" id="selectPreguntaTipo" name="selectPreguntaTipo" required="">
										    <option value="">Seleccione...</option>
										    <c:forEach var="preguntaTipos" items="${lstPreguntaTipo}">
												<option value="${preguntaTipos.id}"><c:out value="${preguntaTipos.nombre}"/> </option>
											</c:forEach>	
										</select>
									</div>
								</div>
							</div>
							
							<%-- <!-- Solo aparece para actividad examen -->
							<c:if test="${actividad.idTipoActividad == 4}">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>Ponderaci&oacute;n</label> 
											<input type="number" class="form-control" id="iptPreguntaPonderacion" name="iptPreguntaPonderacion" value="0"
												   min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
											       onKeyDown="" required="">
										</div>
									</div>
								</div>
							</c:if> --%>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectPreguntaEstatus" name="selectPreguntaEstatus" required="">
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
					<button id="btnAcceptModalPregunta" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalPregunta" type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalEstatusPregunta" tabindex="-1" role="dialog"
	aria-labelledby="modalEstatusPregunta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			
		 	<!-- form start -->
	        <form role="form" id="formEstatusPregunta" action="javascript:estatusPreguntaConfirmacion(this);" method="POST" class="" data-parsley-validate="" >
				
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Pregunta</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
		                <div class="box-header"></div>
	                    <div class="box-body">
	                    		<h4>¿Esta seguro que desea cambiar el estatus de la pregunta?</h4>
	                    </div>
	                </div>
	            </div>
				<div class="modal-footer">
					<!-- <input type="hidden" id="iptEstatusCursoId" value=""> -->
					<input type="hidden" id="iptEstatusActividadId" value="">
					<input type="hidden" id="iptEstatusPreguntaId" value="">
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
  		$('#formPregunta').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPregunta').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPregunta').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
	
	$(function () {
  		$('#formPreguntaAbierta').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPreguntaAbierta').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPreguntaAbierta').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' })
  	});
	
	$(function () {
  		$('#formPreguntaVerdaderoFalso').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPreguntaVerdaderoFalso').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPreguntaVerdaderoFalso').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' })
  	});
	
	$(function () {
  		$('#formPreguntaMultipleUnica').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPreguntaMultipleUnica').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPreguntaMultipleUnica').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' })
  	});
</script>


