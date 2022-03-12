<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript"
	src="<c:url value='/resources/js/lms/cursos/curso.js' />"
	type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>  
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Actividades</h1>
		<ol class="breadcrumb">
            <li><a href="#" onclick="getCursos();"><i class="fa fa-bar-chart-o"></i>Cursos</a></li>
            <li><a href="#" class="active">${curso.nombre}</a></li>
        </ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div>
			<button class="btn btn-primary" onclick="newActividad();">Crear nueva actividad</button>
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
							<th style="width: 10%; text-align: center;">Tipo</th>
							<th style="width: 75%;">Actividad</th>
							<th style="width: 10%; text-align: center;">Acciones</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty lstActividad}">
							<c:forEach items="${lstActividad}" var="actividad" varStatus="loop">
								<tr>
									<td style="text-align: center;">${actividad.orden}</td>
									<td style="text-align: center;">${actividad.tipoActividad.nombre}</td>
									<td>
										<c:choose>
										    <c:when test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 5 || 
										    				actividad.idTipoActividad == 12 || actividad.idTipoActividad == 9 }">
										        <!-- Examen final, Examen por día, Examen diagnostico (Online y WBT eLearning) y Encuesta -->
												<a style="cursor: pointer;" onclick="getActividadPreguntas(${curso.id}, ${actividad.id});">${actividad.nombre}</a>
										    </c:when>    
										    <c:otherwise>
										        ${actividad.nombre}
										    </c:otherwise>
										</c:choose>
									</td>
									<td style="text-align: center;">
										<a href="#" title="Editar" onclick="editActividad(${curso.id}, ${actividad.id}, ${actividad.idTipoActividad});"><i class="fa fa-gear"></i></a> 
										&nbsp; 
										<c:if test="${actividad.banActivo == 1}">
											<a href="#" title="Estatus" onclick="estatusActividad(${curso.id}, ${actividad.id});"><i class="fa fa-eye"></i></a>
										</c:if>
										<c:if test="${actividad.banActivo == 0}">
											<a href="#" title="Estatus" onclick="estatusActividad(${curso.id}, ${actividad.id});"><i class="fa fa-eye-slash"></i></a>
										</c:if>
										&nbsp;		
										<c:if test="${loop.count != 1}">
											<a href="#" title="Arriba" onclick="orderArribaActividad(${curso.id}, ${actividad.id});"><i class="fa fa-arrow-circle-up"></i></a> &nbsp; 
										</c:if>
				                    		<c:if test="${loop.count != fn:length(lstActividad)}">
											<a href="#" title="Abajo" onclick="orderAbajoActividad(${curso.id}, ${actividad.id});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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


<div class="modal fade" id="modalNewActividad" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewActividad" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title" id="iptCursoTitulo">Nueva actividad</h3> 
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

							<!-- idTipoCurso: 1=Online, 2=Presencial y 3= WBT eLearning -->
							<c:if test="${curso.idTipoCurso == 1 || curso.idTipoCurso == 2 || curso.idTipoCurso == 3}">
								<div class="col-md-6">
									<button type="button" onclick="newScorm(${curso.id});"
										class="btn btn-primary btn-block">SCORM</button>
								</div>
							</c:if>
					
							<c:if test="${curso.idTipoCurso == 1 || curso.idTipoCurso == 2 || curso.idTipoCurso == 3}">
								<div class="col-md-6">
									<button type="button" onclick="newVideo(${curso.id});"
										class="btn btn-primary btn-block">Video</button>
								</div>
							</c:if>
							
							<c:if test="${curso.idTipoCurso == 1 || curso.idTipoCurso == 2 || curso.idTipoCurso == 3}">
								<div class="col-md-6">
									<button type="button" onclick="newDocumento(${curso.id});"
										class="btn btn-primary btn-block">Documento</button>
								</div>
							</c:if>
							
							<c:if test="${curso.idTipoCurso == 1 || curso.idTipoCurso == 2 || curso.idTipoCurso == 3}">
								<div class="col-md-6">
									<button type="button" onclick="newEncuesta(${curso.id});"
										class="btn btn-primary btn-block">Encuesta de
										satisfacción</button>
								</div>
							</c:if>
	
							<c:if test="${curso.idTipoCurso == 1 ||curso.idTipoCurso == 3}">
								<div class="col-md-6">
									<button type="button" onclick="newConferencia(${curso.id});"
										class="btn btn-primary btn-block">Registro a conferencia</button>
								</div>
							</c:if>
							
							<c:if test="${curso.idTipoCurso == 1 || curso.idTipoCurso == 2 || curso.idTipoCurso == 3}">
								<div class="col-md-6">
									<button type="button" onclick="newTarea(${curso.id});"
										class="btn btn-primary btn-block">Tarea</button>
								</div>
							</c:if>
	
							<c:if test="${curso.idTipoCurso == 2}">
								<div class="col-md-6">
									<button type="button" onclick="newAsistencia(${curso.id});"
										class="btn btn-primary btn-block">Asistencia</button>
								</div>
							</c:if>
							
							<c:if test="${curso.idTipoCurso == 1 || curso.idTipoCurso == 2 || curso.idTipoCurso == 3}">
								<div class="col-md-6">
									<button type="button" onclick="newExamenDiagnostico(${curso.id});"
										class="btn btn-primary btn-block">Examen diagnostico</button>
								</div>
							</c:if>
	
							<c:if test="${curso.idTipoCurso == 2}">
								<div class="col-md-6">
									<button type="button" onclick="newExamenEcop(${curso.id});"
										class="btn btn-primary btn-block">Examen ECOP</button>
								</div>
							</c:if>
							
							<c:if test="${curso.idTipoCurso == 1 || curso.idTipoCurso == 2 || curso.idTipoCurso == 3}">
								<div class="col-md-6">
									<button type="button" onclick="newExamen(${curso.id});"
										class="btn btn-primary btn-block">Exámen final</button>
								</div>
							</c:if>
	
							<c:if test="${curso.idTipoCurso == 1 || curso.idTipoCurso == 2 || curso.idTipoCurso == 3}">
								<div class="col-md-6">
									<button type="button" onclick="newExamenFinalPresencial(${curso.id});"
										class="btn btn-primary btn-block">Examen final presencial</button>
								</div>
							</c:if>
							
							<c:if test="${curso.idTipoCurso == 1 || curso.idTipoCurso == 3}">
								<div class="col-md-6">
									<button type="button" onclick="newExamenDia(${curso.id});"
										class="btn btn-primary btn-block">Examen por día</button>
								</div>
							</c:if>
							
							<c:if test="${curso.idTipoCurso == 1 || curso.idTipoCurso == 3}">
								<div class="col-md-6">
									<button type="button" onclick="newTrabajoDia(${curso.id});"
										class="btn btn-primary btn-block">Trabajo por día</button>
								</div>
							</c:if>
						
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


<div class="modal fade" id="modalNewScorm" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="modalNewScorm" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadScorm" action="javascript:saveActividadScorm(this,'${curso.id}');" method="POST" class="" data-parsley-validate="">
				
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleScormNueva" class="box-title">Nueva actividad SCORM</h3>
					<h3 id="hTitleScormEditar" class="box-title">Editar actividad SCORM</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoScorm" name="iptIdCursoScorm" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadScorm" name="iptIdActividadScorm" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadScormNombre">SCORM</label> 
										<input
											type="text" class="form-control" id="iptActividadScormNombre" name="iptActividadScormNombre"
											placeholder="Nombre de SCORM (Español)" maxlength="100" required="">
										<input
											type="text" class="form-control" id="iptActividadScormNombreEn" name="iptActividadScormNombreEn"
											placeholder="Nombre de SCORM (Inglés)" maxlength="100">
										<input
											type="text" class="form-control" id="iptActividadScormNombreFr" name="iptActividadScormNombreFr"
											placeholder="Nombre de SCORM (Frances)" maxlength="100">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadScormDescripcion">Descripción</label>
										<textarea class="form-control"
											id="iptActividadScormDescripcion" rows="3" name="iptActividadScormDescripcion"
											placeholder="Descripción de SCORM (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control"
											id="iptActividadScormDescripcionEn" rows="3" name="iptActividadScormDescripcionEn"
											placeholder="Descripción de SCORM (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control"
											id="iptActividadScormDescripcionFr" rows="3" name="iptActividadScormDescripcionFr"
											placeholder="Descripción de SCORM (Frances)..." maxlength="300"></textarea>	
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadScormRequisitos">Requisitos</label>
										<div id="iptActividadScormRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>

							<div id="actividadScormRowDownload" class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadScormIcono">Archivo actual</label> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<p id="iptActividadScormActualFile" class="help-block"> </p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<button onclick="downloadFile( $('#iptIdActividadScorm').val() ); return false;" >Descargar</button>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label id="labelArchivoScorm" for="iptActividadScormIcono">Nuevo archivo</label>
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<img
											id="iptActividadScormIconoImg" name="iptActividadScormIconoImg"
											src="<c:url value='/resources/css/img/icono_zip_v2.png' />"
											alt="scorm image" style="width: 90px;" />
									</div>
								</div>
								<div class="col-md-10">
									<div class="form-group">
										<br> <input type="file"
											name="iptActividadScormFile" id="iptActividadScormFile" 
											accept=".zip" onchange="inUploadChange(this)"> 
										<p class="help-block">&nbsp;&nbsp;&nbsp;Tipo de archivos
											aceptado: SCORM (ZIP)</p>

									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<label for="iptActividadScormPromediaPorcentaje">Pondera</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadScormPromedia" name="iptActividadScormPromedia" class="iptActividadScormPromedia">
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadScormPromediaPorcentaje" name="iptActividadScormPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group"> 
										<label>Estatus</label> <select class="form-control"
											id="selectActividadScormEstatus" required="" name="selectActividadScormEstatus">
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
					<button type="button" class="btn" id="btnCancelScorm">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewVideo" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	aria-labelledby="modalNewVideo" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadVideo"
				action="javascript:saveActividadVideo(this,'${curso.id}');" method="POST" class=""
				data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 id="hTitleVideoNuevo" class="box-title">Nueva actividad video</h3>
					<h3 id="hTitleVideoEditar" class="box-title">Editar actividad video</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoVideo" name="iptIdCursoVideo" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadVideo" name="iptIdActividadVideo" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadVideoNombre">Video</label> 
										<input
											type="text" class="form-control" id="iptActividadVideoNombre" name="iptActividadVideoNombre"
											placeholder="Nombre de video (Español)" maxlength="100" required="">
										<input
											type="text" class="form-control" id="iptActividadVideoNombreEn" name="iptActividadVideoNombreEn"
											placeholder="Nombre de video (Inglés)" maxlength="100">
										<input
											type="text" class="form-control" id="iptActividadVideoNombreFr" name="iptActividadVideoNombreFr"
											placeholder="Nombre de video (Frances)" maxlength="100">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadVideoDescripcion">Descripción</label>
										<textarea class="form-control"
											id="iptActividadVideoDescripcion" rows="3" name="iptActividadVideoDescripcion"
											placeholder="Descripción de video (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control"
											id="iptActividadVideoDescripcionEn" rows="3" name="iptActividadVideoDescripcionEn"
											placeholder="Descripción de video (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control"
											id="iptActividadVideoDescripcionFr" rows="3" name="iptActividadVideoDescripcionFr"
											placeholder="Descripción de video (Frances)..." maxlength="300"></textarea> 
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadVideoRequisitos">Requisitos</label>
										<div id="iptActividadVideoRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>
							
							<div id="actividadVideoRowDownload" class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadVideoIcono">Archivo actual</label> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<p id="iptActividadVideoActualFile" class="help-block"> </p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<button onclick="downloadFile( $('#iptIdActividadVideo').val() ); return false;" >Descargar</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadVideoIcono">Archivo nuevo</label> 
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<img
											id="iptActividadVideoIconoImg"
											src="<c:url value='/resources/css/img/icono_video_v2.png' />"
											alt="video image" style="width: 90px;" />
									</div>
								</div>
								<div class="col-md-10">
									<div class="form-group">
										<br> <br> <input type="file"
											name="iptActividadVideoFile" id="iptActividadVideoFile"
											accept="video/*" onchange="inUploadChange(this)">
										<p class="help-block">&nbsp;&nbsp;&nbsp;Tipo de archivo
											aceptado: VIDEO (MP4)</p>

									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label for="iptActividadVideoPromediaPorcentaje">Pondera</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadVideoPromedia" name="iptActividadVideoPromedia" class="iptActividadVideoPromedia"> 
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadVideoPromediaPorcentaje" name="iptActividadVideoPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control"
											id="selectActividadVideoEstatus" name="selectActividadVideoEstatus" required="">
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
					<button type="button" class="btn" id="btnCancelVideo">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewDocumento" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewDocumento" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadDocumento"
				action="javascript:saveActividadDocumento(this,'${curso.id}');" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptDocumentoNuevo">Nueva actividad documento</h3>
					<h3 class="box-title" id="iptDocumentoEditar">Editar actividad documento</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoDocumento" name="iptIdCursoDocumento" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadDocumento" name="iptIdActividadDocumento" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadDocumentoNombre">Documento</label> 
										<input
											type="text" class="form-control"
											id="iptActividadDocumentoNombre" name="iptActividadDocumentoNombre"
											placeholder="Nombre de documento (Español)" maxlength="100" required="">
										<input
											type="text" class="form-control"
											id="iptActividadDocumentoNombreEn" name="iptActividadDocumentoNombreEn"
											placeholder="Nombre de documento (Inglés)" maxlength="100">
										<input
											type="text" class="form-control"
											id="iptActividadDocumentoNombreFr" name="iptActividadDocumentoNombreFr"
											placeholder="Nombre de documento (Frances)" maxlength="100">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadDocumentoDescripcion">Descripción</label>
										<textarea class="form-control"
											id="iptActividadDocumentoDescripcion" rows="3" name="iptActividadDocumentoDescripcion"
											placeholder="Descripción de documento (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control"
											id="iptActividadDocumentoDescripcionEn" rows="3" name="iptActividadDocumentoDescripcionEn"
											placeholder="Descripción de documento (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control"
											id="iptActividadDocumentoDescripcionFr" rows="3" name="iptActividadDocumentoDescripcionFr"
											placeholder="Descripción de documento (Frances)..." maxlength="300"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadDocumentoRequisitos">Requisitos</label>
										<div id="iptActividadDocumentoRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>
							
							<div id="actividadDocumentoRowDownload" class="row" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadVideoIcono">Archivo actual</label> 
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<p id="iptActividadDocumentoActualFile" class="help-block"> </p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group"> 
										<button onclick="downloadFile( $('#iptIdActividadDocumento').val() ); return false;" >Descargar</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadDocumentoIcono">Archivo</label> 
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<img
											id="iptActividadDocumentoIconoImg"
											src="<c:url value='/resources/css/img/icono_documento_v2.png' />"
											alt="documento image" style="width: 90px;" />
									</div>
								</div>
								<div class="col-md-10">
									<div class="form-group">
										<br> <br> <input type="file"
											name="iptActividadDocumentoFile"
											id="iptActividadDocumentoFile" accept=".xlsx, .xls, .doc, .docx, .ppt, .pptx, .pdf, .zip" 
											onchange="inUploadChange(this)">
										<p class="help-block">&nbsp;&nbsp;&nbsp;Tipos de archivos
											aceptados: DOCUMENTOS (PDF, DOC, DOCX, XLS y XLSX)</p>

									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label for="iptActividadDocumentoPromediaPorcentaje">Pondera</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadDocumentoPromedia" name="iptActividadDocumentoPromedia" class="iptActividadDocumentoPromedia"> 
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadDocumentoPromediaPorcentaje" name="iptActividadDocumentoPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control"
											id="selectActividadDocumentoEstatus" name="selectActividadDocumentoEstatus" required="">
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
					<button type="button" class="btn" id="btnCancelDocumento">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewExamen" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	aria-labelledby="modalNewExamen" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadExamen"
				action="javascript:saveActividadExamen(this,'${curso.id}');"
				method="POST" class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptCursoTitulo">Nueva actividad examen final</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoExamen" name="iptIdCursoExamen" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadExamen" name="iptIdActividadExamen" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenNombre">Examen final</label> 
										<input type="text"
											class="form-control" id="iptActividadExamenNombre" name="iptActividadExamenNombre" maxlength="100" 
											placeholder="Nombre del examen (Español)" required="">
										<input type="text"
											class="form-control" id="iptActividadExamenNombreEn" name="iptActividadExamenNombreEn" maxlength="100" 
											placeholder="Nombre del examen (Inglés)">
										<input type="text"
											class="form-control" id="iptActividadExamenNombreFr" name="iptActividadExamenNombreFr" maxlength="100" 
											placeholder="Nombre del examen (Frances)">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenDescripcion">Descripci&#243;n</label>
										<textarea class="form-control" id="iptActividadExamenDescripcion" name="iptActividadExamenDescripcion" rows="3"
											placeholder="Descripci&#243;n del examen (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control" id="iptActividadExamenDescripcionEn" name="iptActividadExamenDescripcionEn" rows="3"
											placeholder="Descripci&#243;n del examen (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control" id="iptActividadExamenDescripcionFr" name="iptActividadExamenDescripcionFr" rows="3"
											placeholder="Descripci&#243;n del examen (Frances)..." maxlength="300"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenRequisitos">Requisitos</label>
										<div id="iptActividadExamenRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptActividadExamenTiempoEstimado">Tiempo estimado (Minutos)</label> 
										<input type="number" class="form-control" id="iptActividadExamenTiempoEstimado" name="iptActividadExamenTiempoEstimado" value="0"
										       min="0" max="78120" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 78120" 
										       onKeyDown="if(this.value.length==5 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptActividadExamenNumeroOportunidades">Número de oportunidades</label> 
										<input type="number" class="form-control" id="iptActividadExamenNumeroOportunidades" name="iptActividadExamenNumeroOportunidades" value="0"
											   min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
										       onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="iptActividadExamenPreguntasMostrar">Preguntas a mostrar</label> 
										<input type="number" class="form-control" id="iptActividadExamenPreguntasMostrar" name="iptActividadExamenPreguntasMostrar" value="0"
										       min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
										       onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-4">
									<label for="iptActividadExamenCalificacion">Calificación min</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadExamenCalificacion" name="iptActividadExamenCalificacion" class="iptActividadExamenCalificacion"> 
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadExamenCalificacionPorcentaje" name="iptActividadExamenCalificacionPorcentaje" 
                                           value="0" min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-4">
									<label for="iptActividadExamenPromediaPorcentaje">Pondera</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadExamenPromedia" name="iptActividadExamenPromedia" class="iptActividadExamenPromedia">
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadExamenPromediaPorcentaje" name="iptActividadExamenPromediaPorcentaje" value="0"
								       min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								       onKeyDown="" required="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" required="" id="selectActividadExamenEstatus" name="selectActividadExamenEstatus">
											<option value="">Seleccione...</option>
											<option value="1">Activo</option>
											<option value="0">Inactivo</option>
										</select>
										
									</div>
								</div>
								<div class="col-md-4">
									<label for="iptActividadExamenPreguntas">&nbsp;</label>
									<div class="input-group">
										<span class="">
                                             <label>
                                                 <input type="checkbox" class="form-control" id="iptActividadExamenPreguntasAleatorias" name="iptActividadExamenPreguntasAleatorias" />&nbsp;&nbsp;Orden aleatorio
                                             </label>                                                
	                                     </span>
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>

						</div>
					</div>
					<!-- /.box -->
				</div>
				<div class="modal-footer">
					<button id="btnAcceptModalExamen" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalExamen" type="button" class="btn" >Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewEncuesta" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewEncuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadEncuesta"
				action="javascript:saveActividadEncuesta(this,'${curso.id}');" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptActividadEncuestaTitulo">Nueva actividad encuesta</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoEncuesta" name="iptIdCursoEncuesta" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadEncuesta" name="iptIdActividadEncuesta" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadEncuestaNombre">Encuesta</label> 
										<input
											type="text" class="form-control"
											id="iptActividadEncuestaNombre" name="iptActividadEncuestaNombre"
											placeholder="Nombre de encuesta (Español)" maxlength="100" required="">
										<input
											type="text" class="form-control"
											id="iptActividadEncuestaNombreEn" name="iptActividadEncuestaNombreEn"
											placeholder="Nombre de encuesta (Inglés)" maxlength="100">
										<input
											type="text" class="form-control"
											id="iptActividadEncuestaNombreFr" name="iptActividadEncuestaNombreFr"
											placeholder="Nombre de encuesta (Frances)" maxlength="100">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadEncuestaDescripcion">Descripción</label>
										<textarea class="form-control" 
											id="iptActividadEncuestaDescripcion" name="iptActividadEncuestaDescripcion" rows="3" 
											placeholder="Descripción de encuesta (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control" 
											id="iptActividadEncuestaDescripcionEn" name="iptActividadEncuestaDescripcionEn" rows="3" 
											placeholder="Descripción de encuesta (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control" 
											id="iptActividadEncuestaDescripcionFr" name="iptActividadEncuestaDescripcionFr" rows="3" 
											placeholder="Descripción de encuesta (Frances)..." maxlength="300"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadEncuestaRequisitos">Requisitos</label>
										<div id="iptActividadEncuestaRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<label for="iptActividadEncuestaPromediaPorcentaje">Pondera</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadEncuestaPromedia" name="iptActividadEncuestaPromedia" class="iptActividadEncuestaPromedia"> 
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadEncuestaPromediaPorcentaje" name="iptActividadEncuestaPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control" required
											id="selectActividadEncuestaEstatus" name="selectActividadEncuestaEstatus">
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
					<button id="btnAcceptModalEncuesta" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalEncuesta" type="button" class="btn">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewConferencia" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewConferencia" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadConferencia"
				action="javascript:saveActividadConferencia(this,'${curso.id}');" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptActividadConferenciaTitulo">Nueva actividad conferencia</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoConferencia" name="iptIdCursoConferencia" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadConferencia" name="iptIdActividadConferencia" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadConferenciaNombre">Conferencia</label> 
										<input
											type="text" class="form-control"
											id="iptActividadConferenciaNombre" name="iptActividadConferenciaNombre"
											placeholder="Nombre de conferencia (Español)" maxlength="500" required="">
										<input
											type="text" class="form-control"
											id="iptActividadConferenciaNombreEn" name="iptActividadConferenciaNombreEn"
											placeholder="Nombre de conferencia (Inglés)" maxlength="500">
										<input
											type="text" class="form-control"
											id="iptActividadConferenciaNombreFr" name="iptActividadConferenciaNombreFr"
											placeholder="Nombre de conferencia (Frances)" maxlength="500">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadConferenciaDescripcion">Descripción</label>
										<textarea class="form-control" 
											id="iptActividadConferenciaDescripcion" name="iptActividadConferenciaDescripcion" rows="3" 
											placeholder="Descripción de conferencia (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control" 
											id="iptActividadConferenciaDescripcionEn" name="iptActividadConferenciaDescripcionEn" rows="3" 
											placeholder="Descripción de conferencia (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control" 
											id="iptActividadConferenciaDescripcionFr" name="iptActividadConferenciaDescripcionFr" rows="3" 
											placeholder="Descripción de conferencia (Frances)..." maxlength="300"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadConferenciaRequisitos">Requisitos</label>
										<div id="iptActividadConferenciaRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<label for="iptActividadConferenciaPromediaPorcentaje">Pondera</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadConferenciaPromedia" name="iptActividadConferenciaPromedia" class="iptActividadConferenciaPromedia"> 
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadConferenciaPromediaPorcentaje" name="iptActividadConferenciaPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control" required
											id="selectActividadConferenciaEstatus" name="selectActividadConferenciaEstatus">
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
					<button id="btnAcceptModalConferencia" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalConferencia" type="button" class="btn">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewTarea" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewTarea" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadTarea"
				action="javascript:saveActividadTarea(this,'${curso.id}');" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptActividadTareaTitulo">Nueva actividad tarea</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoTarea" name="iptIdCursoTarea" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadTarea" name="iptIdActividadTarea" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadTareaNombre">Tarea</label> 
										<input
											type="text" class="form-control"
											id="iptActividadTareaNombre" name="iptActividadTareaNombre"
											placeholder="Nombre de tarea (Español)" maxlength="100" required="">
										<input
											type="text" class="form-control"
											id="iptActividadTareaNombreEn" name="iptActividadTareaNombreEn"
											placeholder="Nombre de tarea (Inglés)" maxlength="100">
										<input
											type="text" class="form-control"
											id="iptActividadTareaNombreFr" name="iptActividadTareaNombreFr"
											placeholder="Nombre de tarea (Frances)" maxlength="100">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadTareaDescripcion">Descripción</label>
										<textarea class="form-control" 
											id="iptActividadTareaDescripcion" name="iptActividadTareaDescripcion" rows="3" 
											placeholder="Descripción de tarea (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control" 
											id="iptActividadTareaDescripcionEn" name="iptActividadTareaDescripcionEn" rows="3" 
											placeholder="Descripción de tarea (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control" 
											id="iptActividadTareaDescripcionFr" name="iptActividadTareaDescripcionFr" rows="3" 
											placeholder="Descripción de tarea (Frances)..." maxlength="300"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadTareaRequisitos">Requisitos</label>
										<div id="iptActividadTareaRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptActividadTareaPromediaPorcentaje">Pondera</label>
                                         <input type="number" class="form-control" id="iptActividadTareaPromediaPorcentaje" name="iptActividadTareaPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">

									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> 
										<select class="form-control" required
											id="selectActividadTareaEstatus" name="selectActividadTareaEstatus">
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
					<button id="btnAcceptModalTarea" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalTarea" type="button" class="btn">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>



<div class="modal fade" id="modalNewAsistencia" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewAsistencia" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadAsistencia"
				action="javascript:saveActividadAsistencia(this,'${curso.id}');" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptActividadAsistenciaTitulo">Nueva actividad asistencia</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoAsistencia" name="iptIdCursoAsistencia" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadAsistencia" name="iptIdActividadAsistencia" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadAsistenciaNombre">Asistencia</label> 
										<input
											type="text" class="form-control"
											id="iptActividadAsistenciaNombre" name="iptActividadAsistenciaNombre"
											placeholder="Nombre de asistencia (Español)" maxlength="100" required="">
										<input
											type="text" class="form-control"
											id="iptActividadAsistenciaNombreEn" name="iptActividadAsistenciaNombreEn"
											placeholder="Nombre de asistencia (Inglés)" maxlength="100">
										<input
											type="text" class="form-control"
											id="iptActividadAsistenciaNombreFr" name="iptActividadAsistenciaNombreFr"
											placeholder="Nombre de asistencia (Frances)" maxlength="100">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadAsistenciaDescripcion">Descripción</label>
										<textarea class="form-control" 
											id="iptActividadAsistenciaDescripcion" name="iptActividadAsistenciaDescripcion" rows="3" 
											placeholder="Descripción de asistencia (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control" 
											id="iptActividadAsistenciaDescripcionEn" name="iptActividadAsistenciaDescripcionEn" rows="3" 
											placeholder="Descripción de asistencia (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control" 
											id="iptActividadAsistenciaDescripcionFr" name="iptActividadAsistenciaDescripcionFr" rows="3" 
											placeholder="Descripción de asistencia (Frances)..." maxlength="300"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadAsistenciaRequisitos">Requisitos</label>
										<div id="iptActividadAsistenciaRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<label for="iptActividadAsistenciaPromediaPorcentaje">Pondera</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadAsistenciaPromedia" name="iptActividadAsistenciaPromedia" class="iptActividadAsistenciaPromedia"> 
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadAsistenciaPromediaPorcentaje" name="iptActividadAsistenciaPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control" required
											id="selectActividadAsistenciaEstatus" name="selectActividadAsistenciaEstatus">
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
					<button id="btnAcceptModalAsistencia" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalAsistencia" type="button" class="btn">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewExamenDiagnostico" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewExamenDiagnostico" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadExamenDiagnostico"
				action="javascript:saveActividadExamenDiagnostico(this,'${curso.id}');" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptActividadExamenDiagnosticoTitulo">Nueva actividad examen diagnostico</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoExamenDiagnostico" name="iptIdCursoExamenDiagnostico" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadExamenDiagnostico" name="iptIdActividadExamenDiagnostico" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenDiagnosticoNombre">Examen diagnostico</label> 
										<input
											type="text" class="form-control"
											id="iptActividadExamenDiagnosticoNombre" name="iptActividadExamenDiagnosticoNombre"
											placeholder="Nombre de examen diagnostico (Español)" maxlength="100" required="">
										<input
											type="text" class="form-control"
											id="iptActividadExamenDiagnosticoNombreEn" name="iptActividadExamenDiagnosticoNombreEn"
											placeholder="Nombre de examen diagnostico (Inglés)" maxlength="100">
										<input
											type="text" class="form-control"
											id="iptActividadExamenDiagnosticoNombreFr" name="iptActividadExamenDiagnosticoNombreFr"
											placeholder="Nombre de examen diagnostico (Frances)" maxlength="100">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenDiagnosticoDescripcion">Descripción</label>
										<textarea class="form-control" 
											id="iptActividadExamenDiagnosticoDescripcion" name="iptActividadExamenDiagnosticoDescripcion" rows="3" 
											placeholder="Descripción de examen diagnostico (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control" 
											id="iptActividadExamenDiagnosticoDescripcionEn" name="iptActividadExamenDiagnosticoDescripcionEn" rows="3" 
											placeholder="Descripción de examen diagnostico (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control" 
											id="iptActividadExamenDiagnosticoDescripcionFr" name="iptActividadExamenDiagnosticoDescripcionFr" rows="3" 
											placeholder="Descripción de examen diagnostico (Frances)..." maxlength="300"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenDiagnosticoRequisitos">Requisitos</label>
										<div id="iptActividadExamenDiagnosticoRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptActividadExamenDiagnosticoTiempoEstimado">Tiempo estimado (Minutos)</label> 
										<input type="number" class="form-control" id="iptActividadExamenDiagnosticoTiempoEstimado" name="iptActividadExamenDiagnosticoTiempoEstimado" value="0"
										       min="0" max="78120" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 78120" 
										       onKeyDown="if(this.value.length==5 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptActividadExamenDiagnosticoNumeroOportunidades">Número de oportunidades</label> 
										<input type="number" class="form-control" id="iptActividadExamenDiagnosticoNumeroOportunidades" name="iptActividadExamenDiagnosticoNumeroOportunidades" value="0"
											   min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
										       onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptActividadExamenDiagnosticoPreguntasMostrar">Preguntas a mostrar</label> 
										<input type="number" class="form-control" id="iptActividadExamenDiagnosticoPreguntasMostrar" name="iptActividadExamenDiagnosticoPreguntasMostrar" value="0"
										       min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
										       onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-6"></div>
							</div>
							
							<div class="row">	
								<div class="col-md-4">
									<label for="iptActividadExamenDiagnosticoPromediaPorcentaje">Pondera</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadExamenDiagnosticoPromedia" name="iptActividadExamenDiagnosticoPromedia" class="iptActividadExamenDiagnosticoPromedia"> 
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadExamenDiagnosticoPromediaPorcentaje" name="iptActividadExamenDiagnosticoPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control" required
											id="selectActividadExamenDiagnosticoEstatus" name="selectActividadExamenDiagnosticoEstatus">
											<option value="">Seleccione...</option>
											<option value="1">Activo</option>
											<option value="0">Inactivo</option>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<label for="iptActividadExamenDiagnosticoPreguntas">&nbsp;</label>
									<div class="input-group">
										<span class="">
                                             <label>
                                                 <input type="checkbox" class="form-control" id="iptActividadExamenDiagnosticoPreguntasAleatorias" name="iptActividadExamenDiagnosticoPreguntasAleatorias" />&nbsp;&nbsp;Orden aleatorio
                                             </label>                                                
	                                     </span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- /.box -->
				</div>
				<div class="modal-footer">
					<button id="btnAcceptModalExamenDiagnostico" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalExamenDiagnostico" type="button" class="btn">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewExamenEcop" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewExamenEcop" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadExamenEcop"
				action="javascript:saveActividadExamenEcop(this,'${curso.id}');" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptActividadExamenEcopTitulo">Nueva actividad examen ECOP</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoExamenEcop" name="iptIdCursoExamenEcop" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadExamenEcop" name="iptIdActividadExamenEcop" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenEcopNombre">Examen ECOP</label> 
										<input
											type="text" class="form-control"
											id="iptActividadExamenEcopNombre" name="iptActividadExamenEcopNombre"
											placeholder="Nombre de examen ECOP (Español)" maxlength="100" required="">
										<input
											type="text" class="form-control"
											id="iptActividadExamenEcopNombreEn" name="iptActividadExamenEcopNombreEn"
											placeholder="Nombre de examen ECOP (Inglés)" maxlength="100">
										<input
											type="text" class="form-control"
											id="iptActividadExamenEcopNombreFr" name="iptActividadExamenEcopNombreFr"
											placeholder="Nombre de examen ECOP (Frances)" maxlength="100">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenEcopDescripcion">Descripción</label>
										<textarea class="form-control" 
											id="iptActividadExamenEcopDescripcion" name="iptActividadExamenEcopDescripcion" rows="3" 
											placeholder="Descripción de examen ECOP (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control" 
											id="iptActividadExamenEcopDescripcionEn" name="iptActividadExamenEcopDescripcionEn" rows="3" 
											placeholder="Descripción de examen ECOP (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control" 
											id="iptActividadExamenEcopDescripcionFr" name="iptActividadExamenEcopDescripcionFr" rows="3" 
											placeholder="Descripción de examen ECOP (Frances)..." maxlength="300"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenEcopRequisitos">Requisitos</label>
										<div id="iptActividadExamenEcopRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="iptActividadExamenEcopPromediaPorcentaje">Pondera</label>
                                         <input type="number" class="form-control" id="iptActividadExamenEcopPromediaPorcentaje" name="iptActividadExamenEcopPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">
									</div>
								</div>
								<div class="col-md-4">
									<label for="iptActividadExamenEcopCalificacion">Calificación min</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadExamenEcopCalificacion" name="iptActividadExamenEcopCalificacion" class="iptActividadExamenEcopCalificacion"> 
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadExamenEcopCalificacionPorcentaje" name="iptActividadExamenEcopCalificacionPorcentaje" 
                                           value="0" min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control" required
											id="selectActividadExamenEcopEstatus" name="selectActividadExamenEcopEstatus">
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
					<button id="btnAcceptModalExamenEcop" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalExamenEcop" type="button" class="btn">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewExamenFinalPresencial" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewExamenFinalPresencial" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadExamenFinalPresencial"
				action="javascript:saveActividadExamenFinalPresencial(this,'${curso.id}');" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptActividadExamenFinalPresencialTitulo">Nueva actividad examen final presencial</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoExamenFinalPresencial" name="iptIdCursoExamenFinalPresencial" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadExamenFinalPresencial" name="iptIdActividadExamenFinalPresencial" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenFinalPresencialNombre">Examen final presencial</label> 
										<input
											type="text" class="form-control"
											id="iptActividadExamenFinalPresencialNombre" name="iptActividadExamenFinalPresencialNombre"
											placeholder="Nombre de examen final presencial (Español)" maxlength="100" required="">
										<input
											type="text" class="form-control"
											id="iptActividadExamenFinalPresencialNombreEn" name="iptActividadExamenFinalPresencialNombreEn"
											placeholder="Nombre de examen final presencial (Inglés)" maxlength="100">
										<input
											type="text" class="form-control"
											id="iptActividadExamenFinalPresencialNombreFr" name="iptActividadExamenFinalPresencialNombreFr"
											placeholder="Nombre de examen final presencial (Frances)" maxlength="100">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenFinalPresencialDescripcion">Descripción</label>
										<textarea class="form-control" 
											id="iptActividadExamenFinalPresencialDescripcion" name="iptActividadExamenFinalPresencialDescripcion" rows="3" 
											placeholder="Descripción de examen final presencial (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control" 
											id="iptActividadExamenFinalPresencialDescripcionEn" name="iptActividadExamenFinalPresencialDescripcionEn" rows="3" 
											placeholder="Descripción de examen final presencial (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control" 
											id="iptActividadExamenFinalPresencialDescripcionFr" name="iptActividadExamenFinalPresencialDescripcionFr" rows="3" 
											placeholder="Descripción de examen final presencial (Frances)..." maxlength="300"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenFinalPresencialRequisitos">Requisitos</label>
										<div id="iptActividadExamenFinalPresencialRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptActividadExamenFinalPresencialNumeroOportunidades">Número de oportunidades</label> 
										<input type="number" class="form-control" id="iptActividadExamenFinalPresencialNumeroOportunidades" name="iptActividadExamenFinalPresencialNumeroOportunidades" value="0"
											   min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
										       onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptActividadExamenFinalPresencialPromediaPorcentaje">Pondera</label>
                                         <input type="number" class="form-control" id="iptActividadExamenFinalPresencialPromediaPorcentaje" name="iptActividadExamenFinalPresencialPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">

									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label for="iptActividadExamenFinalPresencialCalificacion">Calificación min</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadExamenFinalPresencialCalificacion" name="iptActividadExamenFinalPresencialCalificacion" class="iptActividadExamenFinalPresencialCalificacion"> 
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadExamenFinalPresencialCalificacionPorcentaje" name="iptActividadExamenFinalPresencialCalificacionPorcentaje" 
                                           value="0" min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control" required
											id="selectActividadExamenFinalPresencialEstatus" name="selectActividadExamenFinalPresencialEstatus">
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
					<button id="btnAcceptModalExamenFinalPresencial" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalExamenFinalPresencial" type="button" class="btn">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewExamenDia" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewExamenDia" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadExamenDia"
				action="javascript:saveActividadExamenDia(this,'${curso.id}');" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptActividadExamenDiaTitulo">Nueva actividad examen por día</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoExamenDia" name="iptIdCursoExamenDia" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadExamenDia" name="iptIdActividadExamenDia" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenDiaNombre">Examen por día</label> 
										<input
											type="text" class="form-control"
											id="iptActividadExamenDiaNombre" name="iptActividadExamenDiaNombre"
											placeholder="Nombre de examen por día (Español)" maxlength="100" required="">
										<input
											type="text" class="form-control"
											id="iptActividadExamenDiaNombreEn" name="iptActividadExamenDiaNombreEn"
											placeholder="Nombre de examen por día (Inglés)" maxlength="100">
										<input
											type="text" class="form-control"
											id="iptActividadExamenDiaNombreFr" name="iptActividadExamenDiaNombreFr"
											placeholder="Nombre de examen por día (Frances)" maxlength="100">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenDiaDescripcion">Descripción</label>
										<textarea class="form-control" 
											id="iptActividadExamenDiaDescripcion" name="iptActividadExamenDiaDescripcion" rows="3" 
											placeholder="Descripción de examen por dia (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control" 
											id="iptActividadExamenDiaDescripcionEn" name="iptActividadExamenDiaDescripcionEn" rows="3" 
											placeholder="Descripción de examen por dia (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control" 
											id="iptActividadExamenDiaDescripcionFr" name="iptActividadExamenDiaDescripcionFr" rows="3" 
											placeholder="Descripción de examen por dia (Frances)..." maxlength="300"></textarea>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadExamenDiaRequisitos">Requisitos</label>
										<div id="iptActividadExamenDiaRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptActividadExamenDiaTiempoEstimado">Tiempo estimado (Minutos)</label> 
										<input type="number" class="form-control" id="iptActividadExamenDiaTiempoEstimado" name="iptActividadExamenDiaTiempoEstimado" value="0"
										       min="0" max="78120" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 78120" 
										       onKeyDown="if(this.value.length==5 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptActividadExamenDiaNumeroOportunidades">Número de oportunidades</label> 
										<input type="number" class="form-control" id="iptActividadExamenDiaNumeroOportunidades" name="iptActividadExamenDiaNumeroOportunidades" value="0"
											   min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
										       onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="iptActividadExamenDiaPreguntasMostrar">Preguntas a mostrar</label> 
										<input type="number" class="form-control" id="iptActividadExamenDiaPreguntasMostrar" name="iptActividadExamenDiaPreguntasMostrar" value="0"
										       min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
										       onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-4">
									<label for="iptActividadExamenDiaCalificacion">Calificación min</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadExamenDiaCalificacion" name="iptActividadExamenDiaCalificacion" class="iptActividadExamenDiaCalificacion"> 
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadExamenDiaCalificacionPorcentaje" name="iptActividadExamenDiaCalificacionPorcentaje" 
                                           value="0" min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="iptActividadExamenDiaPromediaPorcentaje">Pondera</label>
                                         <input type="number" class="form-control" id="iptActividadExamenDiaPromediaPorcentaje" name="iptActividadExamenDiaPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">

									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control" required
											id="selectActividadExamenDiaEstatus" name="selectActividadExamenDiaEstatus">
											<option value="">Seleccione...</option>
											<option value="1">Activo</option>
											<option value="0">Inactivo</option>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<label for="iptActividadExamenDiaPreguntas">&nbsp;</label>
									<div class="input-group">
										<span class="">
                                             <label>
                                                 <input type="checkbox" class="form-control" id="iptActividadExamenDiaPreguntasAleatorias" name="iptActividadExamenDiaPreguntasAleatorias" />&nbsp;&nbsp;Orden aleatorio
                                             </label>                                                
	                                     </span>
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>

						</div>
					</div>
					<!-- /.box -->
				</div>
				<div class="modal-footer">
					<button id="btnAcceptModalExamenDia" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalExamenDia" type="button" class="btn">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewTrabajoDia" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static"
	role="dialog" aria-labelledby="modalNewTrabajoDia" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formActividadTrabajoDia"
				action="javascript:saveActividadTrabajoDia(this,'${curso.id}');" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptActividadTrabajoDiaTitulo">Nueva actividad trabajo por día</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCursoTrabajoDia" name="iptIdCursoTrabajoDia" value="${curso.id}">
							<input type="hidden" class="form-control" id="iptIdActividadTrabajoDia" name="iptIdActividadTrabajoDia" >
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadTrabajoDiaNombre">Trabajo por día</label> 
										<input
											type="text" class="form-control"
											id="iptActividadTrabajoDiaNombre" name="iptActividadTrabajoDiaNombre"
											placeholder="Nombre de trabajo por día (Español)" maxlength="100" required="">
										<input
											type="text" class="form-control"
											id="iptActividadTrabajoDiaNombreEn" name="iptActividadTrabajoDiaNombreEn"
											placeholder="Nombre de trabajo por día (Inglés)" maxlength="100">
										<input
											type="text" class="form-control"
											id="iptActividadTrabajoDiaNombreFr" name="iptActividadTrabajoDiaNombreFr"
											placeholder="Nombre de trabajo por día (Frances)" maxlength="100">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadTrabajoDiaDescripcion">Descripción</label>
										<textarea class="form-control"
											id="iptActividadTrabajoDiaDescripcion" name="iptActividadTrabajoDiaDescripcion" rows="3" 
											placeholder="Descripción de trabajo por dia (Español)..." maxlength="300" required=""></textarea>
										<textarea class="form-control"
											id="iptActividadTrabajoDiaDescripcionEn" name="iptActividadTrabajoDiaDescripcionEn" rows="3" 
											placeholder="Descripción de trabajo por dia (Inglés)..." maxlength="300"></textarea>
										<textarea class="form-control"
											id="iptActividadTrabajoDiaDescripcionFr" name="iptActividadTrabajoDiaDescripcionFr" rows="3" 
											placeholder="Descripción de trabajo por dia (Frances)..." maxlength="300"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptActividadTrabajoDiaRequisitos">Requisitos</label>
										<div id="iptActividadTrabajoDiaRequisitos" class="col-md-12"></div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="iptActividadTrabajoDiaPromediaPorcentaje">Pondera</label>
                                         <input type="number" class="form-control" id="iptActividadTrabajoDiaPromediaPorcentaje" name="iptActividadTrabajoDiaPromediaPorcentaje" 
                                           value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="" required="">

									</div>
								</div>
								<div class="col-md-4">
									<label for="iptActividadTrabajoDiaCalificacion">Calificación min</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         		<input type="checkbox" id="iptActividadTrabajoDiaCalificacion" name="iptActividadTrabajoDiaCalificacion" class="iptActividadTrabajoDiaCalificacion"> 
                                       	</span>
                                         <input type="number" class="form-control" id="iptActividadTrabajoDiaCalificacionPorcentaje" name="iptActividadTrabajoDiaCalificacionPorcentaje" 
                                           value="0" min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Estatus</label> <select class="form-control" required
											id="selectActividadTrabajoDiaEstatus" name="selectActividadTrabajoDiaEstatus">
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
					<button id="btnAcceptModalTrabajoDia" type="submit" class="btn">Aceptar</button>
					<button id="btnCancelModalTrabajoDia" type="button" class="btn">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>






<div class="modal fade" id="modalEstatusActividad" tabindex="-1" role="dialog"
	aria-labelledby="modalEstatusActividad" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			
		 	<!-- form start -->
	        <form role="form" id="formEstatusActividad" action="javascript:estatusActividadConfirmacion(this);" method="POST" class="" data-parsley-validate="" >
				
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Actividad</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
		                <div class="box-header"></div>
	                    <div class="box-body">
	                    		<h4>¿Esta seguro que desea cambiar el estatus de la actividad?</h4>
	                    </div>
	                </div>
	            </div>
				<div class="modal-footer">
					<input type="hidden" id="iptEstatusCursoId" value="">
					<input type="hidden" id="iptEstatusActividadId" value="">
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
  		$('#formActividadScorm').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadScorm').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadScorm').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});

	$(function () {
  		$('#formActividadVideo').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadVideo').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadVideo').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});

	$(function () {
  		$('#formActividadDocumento').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadDocumento').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadDocumento').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});

	$(function () {
  		$('#formActividadExamen').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadExamen').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadExamen').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});

	$(function () {
  		$('#formActividadEncuesta').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadEncuesta').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadEncuesta').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
	
	$(function () {
  		$('#formActividadConferencia').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadConferencia').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadConferencia').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
	
	$(function () {
  		$('#formActividadTarea').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadTarea').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadTarea').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
	
	$(function () {
  		$('#formActividadAsistencia').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadAsistencia').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadAsistencia').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
	
	$(function () {
  		$('#formActividadExamenDiagnostico').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadExamenDiagnostico').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadExamenDiagnostico').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
	
	$(function () {
  		$('#formActividadExamenEcop').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadExamenEcop').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadExamenEcop').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
	
	$(function () {
  		$('#formActividadExamenFinalPresencial').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadExamenFinalPresencial').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadExamenFinalPresencial').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
	
	$(function () {
  		$('#formActividadExamenDia').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formActividadExamenDia').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formActividadExamenDia').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
	
</script>


<script type="text/javascript">
    $(function() {
    	$('input[name="daterange"]').daterangepicker({
    	    "timePicker": true,    	
    	    "maxSpan": {
    	        "days": 60
    	    },
    	    "locale": {
    	        "format": "DD/MM/YYYY hh:mm A",
    	        "separator": " - ",
    	        "applyLabel": "Aplicar",
    	        "cancelLabel": "Cancelar",
    	        "fromLabel": "Desde",
    	        "toLabel": "Hasta",
    	        "customRangeLabel": "Custom",
    	        "weekLabel": "S",
    	        "daysOfWeek": [
    	            "Lu",
    	            "Ma",
    	            "Mi",
    	            "Ju",
    	            "Vi",
    	            "Sa",
    	            "Do"
    	        ],
    	        "monthNames": [
    	            "Enero",
    	            "Febrero",
    	            "Marzo",
    	            "Abril",
    	            "Mayo",
    	            "Junio",
    	            "Julio",
    	            "Agosto",
    	            "Septiembre",
    	            "Octubre",
    	            "Noviembre",
    	            "Diciembre"
    	        ]
    	        ,"firstDay": 1
    	    },
    	   "linkedCalendars": true,
    	    "showCustomRangeLabel": false,
    	    "startDate": moment().startOf('hour'),
    	    "endDate": moment().startOf('hour').add(2, 'hour')
    	}
    	, function(start, end, label) {        	
    	  console.log('New date range selected: ' + start.format('DD/MM/YYYY hh:mm A') + ' to ' + end.format('DD/MM/YYYY hh:mm A') + ' (predefined range: ' + label + ')');
    	}
    	);
    });
</script>











