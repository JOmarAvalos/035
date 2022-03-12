<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="<c:url value='/resources/js/lms/cursos/actividad.js' />" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Preguntas</h1>
		<ol class="breadcrumb">
            <li><a href="#" onclick="getCursos();"><i class="fa fa-bar-chart-o"></i>Cursos</a></li>
            <li><a href="#" onclick="getCurso(${curso.id});" class="">${curso.nombre}</a></li>
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
										<a href="#" title="Editar" onclick="editPregunta(${pregunta.id}, ${actividad.idTipoActividad}, ${pregunta.idTipoPregunta});"><i class="fa fa-gear"></i></a> 
										&nbsp; 
										<c:if test="${pregunta.banActivo == 1}">
											<a href="#" title="Estatus" onclick="estatusPregunta(${curso.id}, ${actividad.id}, ${pregunta.id});"><i class="fa fa-eye"></i></a>
										</c:if>
										<c:if test="${pregunta.banActivo == 0}">
											<a href="#" title="Estatus" onclick="estatusPregunta(${curso.id}, ${actividad.id}, ${pregunta.id});"><i class="fa fa-eye-slash"></i></a>
										</c:if>
										&nbsp;
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaPregunta(${curso.id}, ${actividad.id}, ${pregunta.id});"><i class="fa fa-arrow-circle-up"></i></a> &nbsp; 
										</c:if>
				                    		<c:if test="${loop.count != fn:length(lstPreguntas)}">
											<a href="#" title="Abajo" onclick="orderAbajoPregunta(${curso.id}, ${actividad.id}, ${pregunta.id});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>

					</tbody>
				</table>
				
				<br>
				
				<!-- Disponible solo para tipos de actividad examenes -->
				<c:if test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 || 
							  actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12 || actividad.idTipoActividad == 13 }">
					<!-- form start -->
					<form role="form" id="formCargaMasiva" action="javascript:saveCargaPreguntasMasivas(this, '${curso.id}', '${actividad.id}');" method="POST" class="" data-parsley-validate="">
						<div class="row">
							<div class="col-md-12" style="text-align: center;">
								<div class="form-group">
									<label for="iptCargaMasivaIcono">Carga masiva</label> 
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12" style="text-align: center;">
								<div class="form-group">
									<img id="iptCargaMasivaIconoImg" name="iptCargaMasivaIconoImg"
										 src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
										 alt="documento image" style="width: 90px;" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12" style="text-align: center;">
								<div class="form-group" style="text-align: center;">
									<input type="file" id="iptCargaMasivaFile" name="iptCargaMasivaFile"
										   accept=".csv" onchange="inUploadChange(this)" style="display: inline;" required="">
									<p class="help-block">&nbsp;&nbsp;&nbsp;Tipo de archivo aceptado: CSV (Separados por PIPE´s)</p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12" style="text-align: center;">
								<button type="submit" class="btn btn-primary">Cargar preguntas</button>
								<input type="hidden" class="form-control" id="iptIdActividadCargaMasiva" name="iptIdActividadCargaMasiva" value="${actividad.id}">
							</div>
						</div>
					</form>
				</c:if>


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
						<div class="row">
							<div class="col-md-12">
								<button type="button" onclick="newMultipleMultiple();"
									class="btn btn-primary btn-block">Opción multiple (Resp. multiple)</button>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<button type="button" onclick="newRelacionColumnas();"
									class="btn btn-primary btn-block">Relación de columnas</button>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<button type="button" onclick="newRellenarBlancos();"
									class="btn btn-primary btn-block">Rellenar blancos</button>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<button type="button" onclick="newCombinacionExacta();"
									class="btn btn-primary btn-block">Combinación exacta</button>
							</div>
						</div>
						<br>
						<!--  
						<div class="row">
							<div class="col-md-12">
								<button type="button" onclick="newGradoCerteza();"
									class="btn btn-primary btn-block">Grado de certeza</button>
							</div>
						</div>
						<br>
						-->
						<div class="row">
							<div class="col-md-12">
								<button type="button" onclick="newImagenUnica();"
									class="btn btn-primary btn-block">Imagen única</button>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<button type="button" onclick="newArrastrable();"
									class="btn btn-primary btn-block">Arrastrable</button>
							</div>
						</div>
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
			<form role="form" id="formPreguntaAbierta" action="javascript:savePreguntaAbierta(this, '${curso.id}', '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
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
											   placeholder="Nombre de pregunta (Español)" maxlength="500" required="">
										<input type="text" class="form-control" id="iptPreguntaAbiertaNombreEn" name="iptPreguntaAbiertaNombreEn"
											   placeholder="Nombre de pregunta (Inglés)" maxlength="500">
										<input type="text" class="form-control" id="iptPreguntaAbiertaNombreFr" name="iptPreguntaAbiertaNombreFr"
											   placeholder="Nombre de pregunta (Frances)" maxlength="500">
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

							<!-- La imagen no aparece en el caso de la actividad sea encuesta --> 
							<c:if test="${actividad.idTipoActividad != 5}">
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
							</c:if>
							<c:if test="${actividad.idTipoActividad == 5}">
								<!-- Solo es referencia -->
								<div class="row" style="display:none">
									<input type="file" id="iptPreguntaAbiertaFileReferencia" name="iptPreguntaAbiertaFileReferencia">
								</div>
							</c:if>

							<div class="row">
							
								<!-- Solo aparece para actividad examen -->
								<c:if test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 ||
								              actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12}">
									<div class="col-md-6">
										<div class="form-group">
											<label>Ponderaci&oacute;n</label> 
											<input type="number" class="form-control" id="iptPreguntaAbiertaPonderacion" name="iptPreguntaAbiertaPonderacion" value="0"
												   min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
											       onKeyDown="" required="">
										</div>
									</div>
								</c:if>
								
								<div class="col-md-6">
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
			<form role="form" id="formPreguntaVerdaderoFalso" action="javascript:savePreguntaVerdaderoFalso(this, '${curso.id}', '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
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
											   placeholder="Nombre de pregunta (Español)" maxlength="500" required="">
										<input type="text" class="form-control" id="iptPreguntaVerdaderoFalsoNombreEn" name="iptPreguntaVerdaderoFalsoNombreEn"
											   placeholder="Nombre de pregunta (Inglés)" maxlength="500">
										<input type="text" class="form-control" id="iptPreguntaVerdaderoFalsoNombreFr" name="iptPreguntaVerdaderoFalsoNombreFr"
											   placeholder="Nombre de pregunta (Frances)" maxlength="500">
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

							<!-- La imagen no aparece en el caso de la actividad sea encuesta --> 
							<c:if test="${actividad.idTipoActividad != 5}">
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
							</c:if>
							
							<c:if test="${actividad.idTipoActividad == 5}">
								<!-- Solo es referencia -->
								<div class="row" style="display:none">
									<input type="file" id="iptPreguntaVerdaderoFalsoFileReferencia" name="iptPreguntaVerdaderoFalsoFileReferencia">
								</div>
							</c:if>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptRespuestaVerdaderoFalsoNombre">Respuestas</label> 
										
										<div class="input-group">
                                             <span class="input-group-addon">
                                                 <input type="radio" name="iptRespuestaVerdaderoFalso" id="iptRespuestaVerdadero" value="V">
                                             </span>
                                             <input type="text" class="form-control" id="iptRespuestaV" name="iptRespuestaV" maxlength="100" value="Verdadero" disabled>
                                             <input type="text" class="form-control" id="iptRespuestaVEn" name="iptRespuestaVEn" maxlength="100" value="True" disabled>
                                             <input type="text" class="form-control" id="iptRespuestaVFr" name="iptRespuestaV" maxlength="100" value="Veritable" disabled>
										</div>

										<div class="input-group">
                                             <span class="input-group-addon">
                                                 <input type="radio" name="iptRespuestaVerdaderoFalso" id="iptRespuestaFalso" value="F">
                                             </span>
                                             <input type="text" class="form-control" id="iptRespuestaF" name="iptRespuestaF" maxlength="100" value="Falso" disabled>
                                             <input type="text" class="form-control" id="iptRespuestaFEn" name="iptRespuestaFEn" maxlength="100" value="False" disabled>
                                             <input type="text" class="form-control" id="iptRespuestaFFr" name="iptRespuestaFFr" maxlength="100" value="Faux" disabled>
                                         </div><!-- /input-group -->
                                         
									</div>
								</div>
							</div>

							<div class="row">
							
								<!-- Solo aparece para actividad examen -->
								<c:if test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 ||
								              actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12}">
								              
									<div class="col-md-6">
										<div class="form-group">
											<label>Ponderaci&oacute;n</label> 
											<input type="number" class="form-control" id="iptPreguntaVerdaderoFalsoPonderacion" name="iptPreguntaVerdaderoFalsoPonderacion" value="0"
												   min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
											       onKeyDown="" required="">
										</div>
									</div>
								</c:if>

								<div class="col-md-6">
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
			<form role="form" id="formPreguntaMultipleUnica" action="javascript:savePreguntaMultipleUnica(this, '${curso.id}', '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
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
											   placeholder="Nombre de pregunta (Español)" maxlength="500" required="">
										<input type="text" class="form-control" id="iptPreguntaMultipleUnicaNombreEn" name="iptPreguntaMultipleUnicaNombreEn"
											   placeholder="Nombre de pregunta (Inglés)" maxlength="500">
										<input type="text" class="form-control" id="iptPreguntaMultipleUnicaNombreFr" name="iptPreguntaMultipleUnicaNombreFr"
											   placeholder="Nombre de pregunta (Frances)" maxlength="500">
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

							<!-- La imagen no aparece en el caso de la actividad sea encuesta --> 
							<c:if test="${actividad.idTipoActividad != 5}">
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
							</c:if>
							<c:if test="${actividad.idTipoActividad == 5}">
								<!-- Solo es referencia -->
								<div class="row" style="display:none">
									<input type="file" id="iptPreguntaMultipleUnicaFileReferencia" name="iptPreguntaMultipleUnicaFileReferencia">
								</div>
							</c:if>

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
								<!-- Solo aparece para actividad examen -->
								<c:if test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 ||
								              actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12}">
									<div class="col-md-6">
										<div class="form-group">
											<label>Ponderaci&oacute;n</label> 
											<input type="number" class="form-control" id="iptPreguntaMultipleUnicaPonderacion" name="iptPreguntaMultipleUnicaPonderacion" value="0"
												   min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
											       onKeyDown="" required="">
										</div>
									</div>
								</c:if>
							
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


<!-- Modal Pregunta Multiple Multiple -->
<div class="modal fade" id="modalNewMultipleMultiple" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewMultipleMultiple" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPreguntaMultipleMultiple" action="javascript:savePreguntaMultipleMultiple(this, '${curso.id}', '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleMultipleMultipleNueva" class="box-title">Nueva pregunta Opción Multiple (Resp. multiple)</h3>
					<h3 id="hTitleMultipleMultipleEditar" class="box-title">Editar pregunta Opción Multiple (Resp. multiple)</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividadMultipleMultiple" name="iptIdActividadMultipleMultiple" value="${actividad.id}">
							<input type="hidden" class="form-control" id="iptIdPreguntaMultipleMultiple" name="iptIdPreguntaMultipleMultiple">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaMultipleMultipleNombre">Pregunta</label> 
										<input type="text" class="form-control" id="iptPreguntaMultipleMultipleNombre" name="iptPreguntaMultipleMultipleNombre"
											   placeholder="Nombre de pregunta (Español)" maxlength="500" required="">
										<input type="text" class="form-control" id="iptPreguntaMultipleMultipleNombreEn" name="iptPreguntaMultipleMultipleNombreEn"
											   placeholder="Nombre de pregunta (Inglés)" maxlength="500">
										<input type="text" class="form-control" id="iptPreguntaMultipleMultipleNombreFr" name="iptPreguntaMultipleMultipleNombreFr"
											   placeholder="Nombre de pregunta (Frances)" maxlength="500">
									</div>
								</div>
							</div>
							
							<div id="preguntaMultipleMultipleRowDownload" class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaMultipleMultipleIcono">Archivo actual</label> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<p id="iptPreguntaMultipleMultipleActualFile" class="help-block"> </p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<button onclick="downloadFile( $('#iptIdPreguntaMultipleMultiple').val() ); return false;" >Descargar</button>
									</div>
								</div>
							</div>

							<!-- La imagen no aparece en el caso de la actividad sea encuesta --> 
							<c:if test="${actividad.idTipoActividad != 5}">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="iptPreguntaMultipleMultipleIcono">Imagen</label> 
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<img id="iptPreguntaMultipleMultipleIconoImg" name="iptPreguntaMultipleMultipleIconoImg"
												 src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
												 alt="documento image" style="width: 90px;" />
										</div>
									</div>
									<div class="col-md-10">
										<div class="form-group">
											<br> <br> 
											<input type="file" id="iptPreguntaMultipleMultipleFile" name="iptPreguntaMultipleMultipleFile"
												   accept=".jpg, .png" onchange="inUploadChange(this)">
											<p class="help-block">&nbsp;&nbsp;&nbsp;Tipos de archivos aceptados: IMÁGENES (JPG y PNG)</p>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${actividad.idTipoActividad == 5}">
								<!-- Solo es referencia -->
								<div class="row" style="display:none">
									<input type="file" id="iptPreguntaMultipleMultipleFileReferencia" name="iptPreguntaMultipleMultipleFileReferencia">
								</div>
							</c:if>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptRespuestaMultipleMultiple">Respuestas</label> 
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<select class="form-control" id="selectPreguntaMultipleMultipleGenerar" name="selectPreguntaMultipleMultipleGenerar" required="">
											<option value="">Seleccione...</option>
											
											<c:forEach var="k" begin="2" end="20">  
												<option value="${k}"><c:out value="${k}"/></option> 
											</c:forEach> 
											
										</select>
									</div>
								</div>
								<div class="col-md-9">
									<div class="form-group">
										<button type="button" id="btnRespuestaMultipleMultipleG" onclick="btnRespuestaMultipleMultipleGenerar();" class="btn">Generar</button> 
									</div>
								</div>	
								<div id="respuestasMultiple" class="col-md-12"></div>
							</div>

							<div class="row">
								<!-- Solo aparece para actividad examen -->

								<c:if test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 ||
								              actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12}">
								              
									<div class="col-md-6">
										<div class="form-group">
											<label>Ponderaci&oacute;n</label> 
											<input type="number" class="form-control" id="iptPreguntaMultipleMultiplePonderacion" name="iptPreguntaMultipleMultiplePonderacion" value="0"
												   min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
											       onKeyDown="" required="">
										</div>
									</div>
								</c:if>
							
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectPreguntaMultipleMultipleEstatus" name="selectPreguntaMultipleMultipleEstatus" required="">
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
					<button type="button" class="btn" id="btnCancelMultipleMultiple">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- Modal Pregunta Relacion Columnas -->
<div class="modal fade" id="modalNewRelacionColumnas" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewRelacionColumnas" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			
			<!-- form start -->
			<form role="form" id="formPreguntaRelacionColumnas" action="javascript:savePreguntaRelacionColumnas(this, '${curso.id}', '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleRelacionColumnasNueva" class="box-title">Nueva pregunta Relación de Columnas</h3>
					<h3 id="hTitleRelacionColumnasEditar" class="box-title">Editar pregunta Relación de Columnas</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividadRelacionColumnas" name="iptIdActividadRelacionColumnas" value="${actividad.id}">
							<input type="hidden" class="form-control" id="iptIdPreguntaRelacionColumnas" name="iptIdPreguntaRelacionColumnas">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaNombre">Pregunta</label> 
										<input type="text" class="form-control" id="iptPreguntaRelacionColumnasNombre" name="iptPreguntaRelacionColumnasNombre"
											   placeholder="Nombre de pregunta (Español)" maxlength="500" required="">
										<input type="text" class="form-control" id="iptPreguntaRelacionColumnasNombreEn" name="iptPreguntaRelacionColumnasNombreEn"
											   placeholder="Nombre de pregunta (Inglés)" maxlength="500">
										<input type="text" class="form-control" id="iptPreguntaRelacionColumnasNombreFr" name="iptPreguntaRelacionColumnasNombreFr"
											   placeholder="Nombre de pregunta (Frances)" maxlength="500">
									</div>
								</div>
							</div>
							
							<div id="preguntaRelacionColumnasRowDownload" class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaRelacionColumnasIcono">Archivo actual</label> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<p id="iptPreguntaRelacionColumnasActualFile" class="help-block"> </p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<button onclick="downloadFile( $('#iptIdPreguntaRelacionColumnas').val() ); return false;" >Descargar</button>
									</div>
								</div>
							</div>

							<!-- La imagen no aparece en el caso de la actividad sea encuesta --> 
							<c:if test="${actividad.idTipoActividad != 5}">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="iptPreguntaRelacionColumnasIcono">Imagen</label> 
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<img id="iptPreguntaRelacionColumnasIconoImg" name="iptPreguntaRelacionColumnasIconoImg"
												 src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
												 alt="documento image" style="width: 90px;" />
										</div>
									</div>
									<div class="col-md-10">
										<div class="form-group">
											<br> <br> 
											<input type="file" id="iptPreguntaRelacionColumnasFile" name="iptPreguntaRelacionColumnasFile"
												   accept=".jpg, .png" onchange="inUploadChange(this)">
											<p class="help-block">&nbsp;&nbsp;&nbsp;Tipos de archivos aceptados: IMÁGENES (JPG y PNG)</p>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${actividad.idTipoActividad == 5}">
								<!-- Solo es referencia -->
								<div class="row" style="display:none">
									<input type="file" id="iptPreguntaRelacionColumnasFileReferencia" name="iptPreguntaRelacionColumnasFileReferencia">
								</div>
							</c:if>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptRespuestaRelacionColumnas">Respuestas</label> 
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<select class="form-control" id="selectPreguntaRelacionColumnasGenerar" name="selectPreguntaRelacionColumnasGenerar" required="">
											<option value="">Seleccione...</option>
											
											<c:forEach var="k" begin="2" end="20">  
												<option value="${k}"><c:out value="${k}"/></option> 
											</c:forEach> 
											
										</select>
									</div>
								</div>
								<div class="col-md-9">
									<div class="form-group">
										<button type="button" id="btnRespuestaRelacionColumnasG" onclick="btnRespuestaRelacionColumnasGenerar();" class="btn">Generar</button> 
									</div>
								</div>	
								<div id="respuestasRelacionColumnas" class="col-md-12"></div>
							</div>

							<div class="row">
								<!-- Solo aparece para actividad examen -->
								<c:if test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 ||
								              actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12}">
									<div class="col-md-6">
										<div class="form-group">
											<label>Ponderaci&oacute;n</label> 
											<input type="number" class="form-control" id="iptPreguntaRelacionColumnasPonderacion" name="iptPreguntaRelacionColumnasPonderacion" value="0"
												   min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100"  
											       onKeyDown="" required="">
										</div>
									</div>
								</c:if>
								
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectPreguntaRelacionColumnasEstatus" name="selectPreguntaRelacionColumnasEstatus" required="">
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
					<button type="button" class="btn" id="btnCancelRelacionColumnas">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- Modal Pregunta Rellenar Blancos -->
<div class="modal fade" id="modalNewRellenarBlancos" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewRellenarBlancos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			
			<!-- form start -->
			<form role="form" id="formPreguntaRellenarBlancos" action="javascript:savePreguntaRellenarBlancos(this, '${curso.id}', '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleRellenarBlancosNueva" class="box-title">Nueva pregunta Rellenar Blancos</h3>
					<h3 id="hTitleRellenarBlancosEditar" class="box-title">Editar pregunta Rellenar Blancos</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividadRellenarBlancos" name="iptIdActividadRellenarBlancos" value="${actividad.id}">
							<input type="hidden" class="form-control" id="iptIdPreguntaRellenarBlancos" name="iptIdPreguntaRellenarBlancos">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaRellenarBlancosNombre">Pregunta con espacios</label> 
										<input type="text" class="form-control" id="iptPreguntaRellenarBlancosNombre" name="iptPreguntaRellenarBlancosNombre"
											   placeholder="Nombre de pregunta (Español)" maxlength="500" required="">
										<input type="text" class="form-control" id="iptPreguntaRellenarBlancosNombreEn" name="iptPreguntaRellenarBlancosNombreEn"
											   placeholder="Nombre de pregunta (Inglés)" maxlength="500">
										<input type="text" class="form-control" id="iptPreguntaRellenarBlancosNombreFr" name="iptPreguntaRellenarBlancosNombreFr"
											   placeholder="Nombre de pregunta (Frances)" maxlength="500">
										Identificador de palabra: [{X}]
									</div>
								</div>
							</div>
							
							<div id="preguntaRellenarBlancosRowDownload" class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaRellenarBlancosIcono">Archivo actual</label> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<p id="iptPreguntaRellenarBlancosActualFile" class="help-block"> </p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<button onclick="downloadFile( $('#iptIdPreguntaRellenarBlancos').val() ); return false;" >Descargar</button>
									</div>
								</div>
							</div>

							<!-- La imagen no aparece en el caso de la actividad sea encuesta --> 
							<c:if test="${actividad.idTipoActividad != 5}">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="iptPreguntaRellenarBlancosIcono">Imagen</label> 
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<img id="iptPreguntaRellenarBlancosIconoImg" name="iptPreguntaRellenarBlancosIconoImg"
												 src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
												 alt="documento image" style="width: 90px;" />
										</div>
									</div>
									<div class="col-md-10">
										<div class="form-group">
											<br> <br> 
											<input type="file" id="iptPreguntaRellenarBlancosFile" name="iptPreguntaRellenarBlancosFile"
												   accept=".jpg, .png" onchange="inUploadChange(this)">
											<p class="help-block">&nbsp;&nbsp;&nbsp;Tipos de archivos aceptados: IMÁGENES (JPG y PNG)</p>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${actividad.idTipoActividad == 5}">
								<!-- Solo es referencia -->
								<div class="row" style="display:none">
									<input type="file" id="iptPreguntaRellenarBlancosFileReferencia" name="iptPreguntaRellenarBlancosFileReferencia">
								</div>
							</c:if>
							
							<div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="iptRespuestaRellenarBlancosNombre">Palabras</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <select class="form-control" id="selectPreguntaRellenarBlancosGenerar" name="selectPreguntaRellenarBlancosGenerar" required="">
											<option value="">Seleccione...</option>

											<c:forEach var="k" begin="2" end="20">  
												<option value="${k}"><c:out value="${k}"/></option> 
											</c:forEach> 

										</select>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <button type="button" id="btnRespuestaRellenarBlancosG" onclick="btnRespuestaRellenarBlancosGenerar();" class="btn">Generar</button>
                                    </div>
                                </div>
                                <div id="respuestasRellenarBlancos" class="col-md-12"></div>
                            </div>


							<div class="row">
								<!-- Solo aparece para actividad examen -->
								<c:if test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 ||
								              actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12}">
									<div class="col-md-6">
										<div class="form-group">
											<label>Ponderaci&oacute;n</label> 
											<input type="number" class="form-control" id="iptPreguntaRellenarBlancosPonderacion" name="iptPreguntaRellenarBlancosPonderacion" value="0"
												   min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
											       onKeyDown="" required="">
										</div>
									</div>
								</c:if>
							
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectPreguntaRellenarBlancosEstatus" name="selectPreguntaRellenarBlancosEstatus" required="">
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
					<button type="button" class="btn" id="btnCancelRellenarBlancos">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- Modal Pregunta Combinacion Exacta -->
<div class="modal fade" id="modalNewCombinacionExacta" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewCombinacionExacta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPreguntaCombinacionExacta" action="javascript:savePreguntaCombinacionExacta(this, '${curso.id}', '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleCombinacionExactaNueva" class="box-title">Nueva pregunta Combinación Exacta</h3>
					<h3 id="hTitleCombinacionExactaEditar" class="box-title">Editar pregunta Combinación Exacta</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividadCombinacionExacta" name="iptIdActividadCombinacionExacta" value="${actividad.id}">
							<input type="hidden" class="form-control" id="iptIdPreguntaCombinacionExacta" name="iptIdPreguntaCombinacionExacta">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaNombre">Pregunta</label> 
										<input type="text" class="form-control" id="iptPreguntaCombinacionExactaNombre" name="iptPreguntaCombinacionExactaNombre"
											   placeholder="Nombre de pregunta (Español)" maxlength="500" required="">
										<input type="text" class="form-control" id="iptPreguntaCombinacionExactaNombreEn" name="iptPreguntaCombinacionExactaNombreEn"
											   placeholder="Nombre de pregunta (Inglés)" maxlength="500">
										<input type="text" class="form-control" id="iptPreguntaCombinacionExactaNombreFr" name="iptPreguntaCombinacionExactaNombreFr"
											   placeholder="Nombre de pregunta (Frances)" maxlength="500">
									</div>
								</div>
							</div>
							
							<div id="preguntaCombinacionExactaRowDownload" class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaCombinacionExactaIcono">Archivo actual</label> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<p id="iptPreguntaCombinacionExactaActualFile" class="help-block"> </p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<button onclick="downloadFile( $('#iptIdPreguntaCombinacionExacta').val() ); return false;" >Descargar</button>
									</div>
								</div>
							</div>

							<!-- La imagen no aparece en el caso de la actividad sea encuesta --> 
							<c:if test="${actividad.idTipoActividad != 5}">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="iptPreguntaCombinacionExactaIcono">Imagen</label> 
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<img id="iptPreguntaCombinacionExactaIconoImg" name="iptPreguntaCombinacionExactaIconoImg"
												 src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
												 alt="documento image" style="width: 90px;" />
										</div>
									</div>
									<div class="col-md-10">
										<div class="form-group">
											<br> <br> 
											<input type="file" id="iptPreguntaCombinacionExactaFile" name="iptPreguntaCombinacionExactaFile"
												   accept=".jpg, .png" onchange="inUploadChange(this)">
											<p class="help-block">&nbsp;&nbsp;&nbsp;Tipos de archivos aceptados: IMÁGENES (JPG y PNG)</p>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${actividad.idTipoActividad == 5}">
								<!-- Solo es referencia -->
								<div class="row" style="display:none">
									<input type="file" id="iptPreguntaCombinacionExactaFileReferencia" name="iptPreguntaCombinacionExactaFileReferencia">
								</div>
							</c:if>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptRespuestaCombinacionExacta">Respuestas</label> 
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<select class="form-control" id="selectPreguntaCombinacionExactaGenerar" name="selectPreguntaCombinacionExactaGenerar" required="">
											<option value="">Seleccione...</option>
											
											<c:forEach var="k" begin="2" end="20">  
												<option value="${k}"><c:out value="${k}"/></option> 
											</c:forEach>

										</select>
									</div>
								</div>
								<div class="col-md-9">
									<div class="form-group">
										<button type="button" id="btnRespuestaCombinacionExactaG" onclick="btnRespuestaCombinacionExactaGenerar();" class="btn">Generar</button> 
									</div>
								</div>	
								<div id="respuestasCombinacionExacta" class="col-md-12"></div>
							</div>

							<div class="row">
								<!-- Solo aparece para actividad examen -->
								<c:if test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 ||
								              actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12}">
									<div class="col-md-6">
										<div class="form-group">
											<label>Ponderaci&oacute;n</label> 
											<input type="number" class="form-control" id="iptPreguntaCombinacionExactaPonderacion" name="iptPreguntaCombinacionExactaPonderacion" value="0"
												   min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
											       onKeyDown="" required="">
										</div>
									</div>
								</c:if>
							
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectPreguntaCombinacionExactaEstatus" name="selectPreguntaCombinacionExactaEstatus" required="">
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
					<button type="button" class="btn" id="btnCancelCombinacionExacta">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- Modal Pregunta Grado Certeza -->
<div class="modal fade" id="modalNewGradoCerteza" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewGradoCerteza" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPreguntaGradoCerteza" action="javascript:savePreguntaGradoCerteza(this,'${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleGradoCertezaNueva" class="box-title">Nueva pregunta Grado de Certeza</h3>
					<h3 id="hTitleGradoCertezaEditar" class="box-title">Editar pregunta Grado de Certeza</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				
				
				
				
				<div class="modal-footer">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" id="btnCancelGradoCerteza">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- Modal Pregunta Imagen Unica -->
<div class="modal fade" id="modalNewImagenUnica" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewImagenUnica" aria-hidden="true"> 
	<div class="modal-dialog" role="document"> 
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPreguntaImagenUnica" action="javascript:savePreguntaImagenUnica(this, '${curso.id}', '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleImagenUnicaNueva" class="box-title">Nueva pregunta Imagen única</h3>
					<h3 id="hTitleImagenUnicaEditar" class="box-title">Editar pregunta Imagen única</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				
				
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividadImagenUnica" name="iptIdActividadImagenUnica" value="${actividad.id}">
							<input type="hidden" class="form-control" id="iptIdPreguntaImagenUnica" name="iptIdPreguntaImagenUnica">
							
							<c:forEach var="k" begin="1" end="20">  
								<input type="hidden" class="form-control" id="iptIdRespuestaImagenUnica${k}" name="iptIdRespuestaImagenUnica${k}">
							</c:forEach>
							
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaImagenUnicaNombre">Pregunta</label> 
										<input type="text" class="form-control" id="iptPreguntaImagenUnicaNombre" name="iptPreguntaImagenUnicaNombre"
											   placeholder="Nombre de pregunta (Español)" maxlength="500" required="">
										<input type="text" class="form-control" id="iptPreguntaImagenUnicaNombreEn" name="iptPreguntaImagenUnicaNombreEn"
											   placeholder="Nombre de pregunta (Inglés)" maxlength="500">
										<input type="text" class="form-control" id="iptPreguntaImagenUnicaNombreFr" name="iptPreguntaImagenUnicaNombreFr"
											   placeholder="Nombre de pregunta (Frances)" maxlength="500">
									</div>
								</div>
							</div>
							

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptRespuestaImagenUnica">Respuestas</label> 
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<select class="form-control" id="selectPreguntaImagenUnicaGenerar" name="selectPreguntaImagenUnicaGenerar" required="">
											<option value="">Seleccione...</option>
											
											<c:forEach var="k" begin="2" end="20">  
												<option value="${k}"><c:out value="${k}"/></option> 
											</c:forEach>

										</select>
									</div>
								</div>
								<div class="col-md-9">
									<div class="form-group">
										<button type="button" id="btnRespuestaImagenUnicaG" onclick="btnRespuestaImagenUnicaGenerar();" class="btn">Generar</button> 
									</div>
								</div>	
								<div id="respuestasImagenUnica" class="col-md-12"></div>
							</div>
							

							<div class="row">
								<!-- Solo aparece para actividad examen -->
								<c:if test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 ||
								              actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12}">
									<div class="col-md-6">
										<div class="form-group">
											<label>Ponderaci&oacute;n</label> 
											<input type="number" class="form-control" id="iptPreguntaImagenUnicaPonderacion" name="iptPreguntaImagenUnicaPonderacion" value="0"
												   min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
											       onKeyDown="" required="">
										</div>
									</div>
								</c:if>
							
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectPreguntaImagenUnicaEstatus" name="selectPreguntaImagenUnicaEstatus" required="">
											<option value="">Seleccione...</option>
											<option value="1">Activo</option>
											<option value="0">Inactivo</option>
										</select>
									</div>
								</div>
							</div>

						</div> 
					</div> 
				</div> 
				
				<div class="modal-footer">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" id="btnCancelImagenUnica">Cancelar</button> 
				</div> 
			</form> 
		</div> 
	</div> 
</div> 



<!-- Modal Pregunta Arrastrable -->
<div class="modal fade" id="modalNewArrastrable" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewArrastrable" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPreguntaArrastrable" action="javascript:savePreguntaArrastrable(this, '${curso.id}', '${actividad.id}');" method="POST" class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleArrastrableNueva" class="box-title">Nueva pregunta Arrastrable</h3>
					<h3 id="hTitleArrastrableEditar" class="box-title">Editar pregunta Arrastrable</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdActividadArrastrable" name="iptIdActividadArrastrable" value="${actividad.id}">
							<input type="hidden" class="form-control" id="iptIdPreguntaArrastrable" name="iptIdPreguntaArrastrable">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptPreguntaArrastrableNombre">Pregunta / Instrucción</label> 
										<input type="text" class="form-control" id="iptPreguntaArrastrableNombre" name="iptPreguntaArrastrableNombre"
											   placeholder="Nombre de pregunta (Español)" maxlength="500" required="">
										<input type="text" class="form-control" id="iptPreguntaArrastrableNombreEn" name="iptPreguntaArrastrableNombreEn"
											   placeholder="Nombre de pregunta (Inglés)" maxlength="500">
										<input type="text" class="form-control" id="iptPreguntaArrastrableNombreFr" name="iptPreguntaArrastrableNombreFr"
											   placeholder="Nombre de pregunta (Frances)" maxlength="500">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptRespuestaArrastrableNombre">Palabras ordenadas</label> 
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<select class="form-control" id="selectPreguntaArrastrableGenerar" name="selectPreguntaArrastrableGenerar" required="">
											<option value="">Seleccione...</option>
											
											<c:forEach var="k" begin="2" end="20">  
												<option value="${k}"><c:out value="${k}"/></option> 
											</c:forEach>

										</select>
									</div>
								</div>
								<div class="col-md-9">
									<div class="form-group">
										<button type="button" id="btnRespuestaArrastrableG" onclick="btnRespuestaArrastrableGenerar();" class="btn">Generar</button> 
									</div>
								</div>	
								<div id="respuestasArrastrable" class="col-md-12"></div>
							</div>

							<div class="row">
								<!-- Solo aparece para actividad examen -->
								<c:if test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 ||
								              actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12}">
									<div class="col-md-6">
										<div class="form-group">
											<label>Ponderaci&oacute;n</label> 
											<input type="number" class="form-control" id="iptPreguntaArrastrablePonderacion" name="iptPreguntaArrastrablePonderacion" value="0"
												   min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
											       onKeyDown="" required="">
										</div>
									</div>
								</c:if>
							
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" id="selectPreguntaArrastrableEstatus" name="selectPreguntaArrastrableEstatus" required="">
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
					<button type="button" class="btn" id="btnCancelArrastrable">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>







<!-- Modal Pregunta Nueva Anterior -->
<div class="modal fade" id="modalNewPreguntaAnterior" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewPreguntaAnterior" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formPregunta" action="javascript:savePregunta(this,'${curso.id}','${actividad.id}');" method="POST" class="" data-parsley-validate=""> 
				
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
											   placeholder="Nombre de pregunta" maxlength="100" required="">
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
							<c:if test="${actividad.idTipoActividad != 5}">
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
							</c:if>
							<c:if test="${actividad.idTipoActividad == 5}">
								<!-- Solo es referencia -->
								<div class="row" style="display:none">
									<input type="file" id="iptPreguntaFileReferencia" name="iptPreguntaFileReferencia">
								</div>
							</c:if>

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
							
							<!-- Solo aparece para actividad examen -->
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
							</c:if>
							
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


<!-- Modal Pregunta Estatus -->
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
					<input type="hidden" id="iptEstatusCursoId" value="">
					<input type="hidden" id="iptEstatusActividadId" value="">
					<input type="hidden" id="iptEstatusPreguntaId" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
				
			</form>
		</div>
	</div>
</div>


<!-- Modal Pregunta Estatus -->
<div class="modal fade" id="modalGenerarRespuesta" tabindex="-1" role="dialog"
	aria-labelledby="modalGenerarRespuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			
		 	<!-- form start -->
	        <form role="form" id="formGenerarRespuesta" action="" method="POST" class="" data-parsley-validate="" >
				
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Generar respuestas</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
		                <div class="box-header"></div>
	                    <div class="box-body">
	                    		<h4>Por favor selecciona la cantidad de respuestas</h4>
	                    </div>
	                </div>
	            </div>
				<div class="modal-footer">
					<button type="button" class="btn" data-dismiss="modal">Aceptar</button>
				</div>
				
			</form>
		</div>
	</div>
</div>


<!-- Datatable components -->
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


<!-- Form validates -->
<script type="text/javascript">
	$(function () {
  		$('#formPregunta').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPregunta').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPregunta').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' })
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
	
	$(function () {
  		$('#formPreguntaMultipleMultiple').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPreguntaMultipleMultiple').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPreguntaMultipleMultiple').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' })
  	});
	
	$(function () {
  		$('#formPreguntaRelacionColumnas').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPreguntaRelacionColumnas').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPreguntaRelacionColumnas').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' })
  	});
	
	$(function () {
  		$('#formPreguntaRellenarBlancos').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPreguntaRellenarBlancos').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPreguntaRellenarBlancos').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' })
  	});
	
	$(function () {
  		$('#formPreguntaCombinacionExacta').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPreguntaCombinacionExacta').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPreguntaCombinacionExacta').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' })
  	});
	
	$(function () {
  		$('#formPreguntaGradoCerteza').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPreguntaGradoCerteza').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPreguntaGradoCerteza').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' })
  	});
	
	$(function () {
  		$('#formPreguntaImagenUnica').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPreguntaImagenUnica').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPreguntaImagenUnica').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' })
  	});
	
	$(function () {
  		$('#formPreguntaArrastrable').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formPreguntaArrastrable').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formPreguntaArrastrable').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' })
  	}); 
	
</script>


