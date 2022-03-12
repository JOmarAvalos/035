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
		<h2>Curso: ${evento.cursoVO.nombre} </h2> 
		<h1>Empresa: ${evento.empresaVO.nombre}</h1>
		<h1>Tipo curso:
			<c:if test="${evento.cursoVO.idTipoCurso == 1}">
				Online
			</c:if>
			<c:if test="${evento.cursoVO.idTipoCurso == 2}">
				Presencial
			</c:if>
			<c:if test="${evento.cursoVO.idTipoCurso == 3}">
				WBT eLearning
			</c:if>
			<c:if test="${evento.cursoVO.idTipoCurso == 4}">
				Revalidaci&oacute;n presencial
			</c:if>
			<c:if test="${evento.cursoVO.idTipoCurso == 5}">
				Revalidaci&oacute;n online
			</c:if>
		</h1>
		<c:if test="${ not empty evento.instructorVO}">
			<h1>Instructor: ${evento.instructorVO.funcionario.datosFuncionarioVO.nombres} ${evento.instructorVO.funcionario.datosFuncionarioVO.apellidoUno} ${evento.instructorVO.funcionario.datosFuncionarioVO.apellidoDos}</h1>
		</c:if>
		<c:if test="${empty evento.instructorVO}">
			<h1>Instructor: Sin Instructor</h1>
		</c:if>
		<h1>Inicio: <fmt:formatDate value="${evento.fechaInicio}" type="date" pattern="yyyy-MM-dd HH:mm" /></h1>
		<h1>Fin: <fmt:formatDate value="${evento.fechaFin}" type="date" pattern="yyyy-MM-dd HH:mm" /> </h1>
		<div class="row">
			<div class="col-md-3">
				<button type="button" class="btn btn-primary" onclick="verFormtoCalificacion();">Formato de calificaciones</button>
			</div>
			<c:if test="${pendCalif == 0}">
				<button type="button" class="btn btn-primary" onclick="terminaCurso(${evento.id});">Curso terminado</button>
			</c:if>
		</div>
	</section>

	<!-- Main content -->
	<section class="content">
	
		<c:if test="${not empty lstInscritos}">
			<c:forEach items="${lstInscritos}" var="inscrito" varStatus="loop">
				<div class="row col-md-12">
					<div class="col-md-12 box box-solid callout callout-info">
						<div id="accordion" role="tablist" class="contact-accordion">
							<div class="ca-wrapp">
								<div class="card-header" role="tab" id="headingOne">
									<div data-toggle="collapse"
										data-target="#collapse${loop.index}" aria-expanded="true"
										aria-controls="collapseOne" class="clearfix">
										<c:if test="${not empty inscrito.lstActividades}">
											<div class="pull-right box-tools">
												<div class="up-accordion">
													<button class="btn btn-default btn-sm"
														data-widget="collapse" data-toggle="tooltip" title=""
														data-original-title="Collapse">
														<i class="fa fa-caret-down"></i>
													</button>
												</div>
											</div>
										</c:if>
										<div class="pull-right box-tools">
											<h5 class="user-contact ">
												 
												<c:if test="${inscrito.estatus == 2}">
													Calificaci&oacute;n pendiente&nbsp;&nbsp;&nbsp;&nbsp;<br/> 
												</c:if>
												<c:if test="${inscrito.estatus == 5}">
													Aprobado&nbsp;&nbsp;&nbsp;&nbsp;<br/>
													Calificaci&oacute;n: ${inscrito.calificacion}&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
												<c:if test="${inscrito.estatus == 6}">
													No Aprobado&nbsp;&nbsp;&nbsp;&nbsp;<br/>
													Calificaci&oacute;n: ${inscrito.calificacion}&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
												<c:if test="${inscrito.estatus == 7}">
													No Show&nbsp;&nbsp;&nbsp;&nbsp;<br/>
												</c:if>
												<c:if test="${inscrito.estatus == 8}">
													No Examen&nbsp;&nbsp;&nbsp;&nbsp;<br/>
												</c:if>
												
											</h5>
										</div>
										<h4>
											<b>${inscrito.funcionarioEstatus.datosFuncionarioVO.nombres} ${inscrito.funcionarioEstatus.datosFuncionarioVO.apellidoUno} ${inscrito.funcionarioEstatus.datosFuncionarioVO.apellidoDos}</b>
										</h4>
									</div>
									<p class="first-comment-contact">${hiloContactoVO.mensaje}</p>
								</div>
								<br>
								<div id="collapse${loop.index}" class="collapse "
									role="tabpanel" aria-labelledby="headingOne"
									data-parent="#accordion">
									<table id="example${loop.index}" class="table table-bordered table-striped">
										<thead>
											<tr>
												<th style="width: 20%;">Actividad</th>
												<th style="width: 20%;">Tipo de Actividad</th>
												<th style="width: 20%;">Calificaci&oacute;n</th>
												<th style="width: 20%;">Documento</th>
												<th style="width: 20%; text-align: center;">Acciones</th>
											</tr>
										</thead>
										<tbody>
										
											<c:if test="${not empty inscrito.lstActividades}">
												<c:forEach items="${inscrito.lstActividades}" var="actividad" varStatus="loop">
													<tr>
														<td>${actividad.nombre}</td>
														<td>${actividad.tipoActividad.nombre}</td>
														<td>
															<c:if test="${actividad.idTipoActividad == 1 || actividad.idTipoActividad == 2 || actividad.idTipoActividad == 3 || actividad.idTipoActividad == 5 || actividad.idTipoActividad == 6 || actividad.idTipoActividad == 8}">
																Completada&nbsp;&nbsp; <input id="iptCheckActividad${actividad.consultaActividad.id}" type="checkbox">
															</c:if>
															<c:if test="${actividad.idTipoActividad == 4 || actividad.idTipoActividad == 7 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 || actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12 || actividad.idTipoActividad == 13}">
																<input type="number" min="0" max="100" id="iptCalificacion${actividad.consultaActividad.id}" class="form-control" value="${actividad.consultaActividad.calificacion}">
															</c:if>
														</td>
														<td>
															<c:if test="${actividad.idTipoActividad == 1 || actividad.idTipoActividad == 2 || actividad.idTipoActividad == 3 || actividad.idTipoActividad == 5 || actividad.idTipoActividad == 6 || actividad.idTipoActividad == 8 || actividad.idTipoActividad == 4 || actividad.idTipoActividad == 9 || actividad.idTipoActividad == 10 || actividad.idTipoActividad == 11 || actividad.idTipoActividad == 12 || actividad.idTipoActividad == 13}">
																N/A
															</c:if>
															<c:if test="${actividad.idTipoActividad == 7 && not empty actividad.consultaActividad.ruta }">
																<button type="button" class="btn btn-primary" onclick="downloadTarea(${actividad.consultaActividad.id}); return false;">Descargar</button>
															</c:if>
															<c:if test="${actividad.idTipoActividad == 7 &&  empty actividad.consultaActividad.ruta }">
																Pendiente
															</c:if>
														</td>
														<td style="text-align: center;">
															<button type="button" class="btn btn-primary" onclick="calificaManual('${actividad.consultaActividad.id}', '${actividad.idTipoActividad }')">Calificar actividad</button>
														</td>
														
													</tr>
												</c:forEach>
											</c:if>
										
										</tbody>
									</table>
									
									<div class="row">
										<div class="col-md-2">
											<button type="button" class="btn btn-primary" onclick="showCalificaCurso(${inscrito.id},'${inscrito.funcionarioEstatus.datosFuncionarioVO.nombres} ${inscrito.funcionarioEstatus.datosFuncionarioVO.apellidoUno} ${inscrito.funcionarioEstatus.datosFuncionarioVO.apellidoDos}');">Calificar curso</button>
										</div>
										<div class="col-md-2">
											<button type="button" class="btn btn-primary" onclick="showNoShow('${inscrito.id}','${inscrito.funcionarioEstatus.datosFuncionarioVO.nombres} ${inscrito.funcionarioEstatus.datosFuncionarioVO.apellidoUno} ${inscrito.funcionarioEstatus.datosFuncionarioVO.apellidoDos}');">No show</button>
										</div>
										<div class="col-md-2">
											<button type="button" class="btn btn-primary" onclick="showNoExamen('${inscrito.id}','${inscrito.funcionarioEstatus.datosFuncionarioVO.nombres} ${inscrito.funcionarioEstatus.datosFuncionarioVO.apellidoUno} ${inscrito.funcionarioEstatus.datosFuncionarioVO.apellidoDos}');">No examen</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>			
			</c:forEach>
			

		</c:if>
		

	</section>
	<!-- /.content -->
</aside>
<!-- /.right-side -->

<div class="modal fade" id="modalCalificacionActualizada" tabindex="-1"
	role="dialog" aria-labelledby="modalCalificacionActualizada" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Actividad calificada de forma correcta</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalCursoCalificado" tabindex="-1"
	role="dialog" aria-labelledby="modalCursoCalificado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Curso calificado de forma correcta</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="window.location = ctx + '/calificador/listaInscripcion?param=${evento.id}'">Aceptar</button>
			</div>
		</div>
	</div>
</div>
	
	
	
<div class="modal fade" id="modalVerificaNoShow" tabindex="-1"
	role="dialog" aria-labelledby="modalVerificaNoShow" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Confirmaci&oacute;n de No Show</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<input type="hidden" id="idEventoInscripcionNoShow">
				<div>
					<h1>¿Desea calificar al funcionario como no show?</h1>
					<h2 id="h2NameNoShow"></h2>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="noShow();">Confirmar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalVerificaNoExamen" tabindex="-1"
	role="dialog" aria-labelledby="modalVerificaNoExamen" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Confirmaci&oacute;n de No Examen</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<input type="hidden" id="idEventoInscripcionNoExamen">
				<div>
					<h1>¿Desea calificar al funcionario como no examen?</h1>
					<h2 id="h2NameNoExamen"></h2>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="noExamen();">Confirmar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalVerificaCalificaCurso" tabindex="-1"
	role="dialog" aria-labelledby="modalVerificaCalificaCurso" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Confirmaci&oacute;n de calificaci&oacute;n</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<input type="hidden" id="idEventoInscripcionCurso">
				<div>
					<h1>¿Desea calificar al funcionario?</h1>
					<h2 id="h2NameCurso"></h2>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="calificaCurso();">Calificar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>



<div class="modal fade" id="modalSubirFormato" tabindex="-1"
	role="dialog" aria-labelledby="modalSubirFormato" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Formato de calificaciones</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<input type="hidden" id="iptIdEvento" value="${evento.id}">
						<div class="row">
							<div class="col-md-12">
								<h4>Seleccione el documento</h4>
							</div>
						</div>
							<div class="row" >
								<div class="col-md-12">
									<div class="form-group">
	                                         <label for="formatoFile">Formato de calificaciones</label>
	                                         <input type="file" id="formatoFile" accept="application/pdf" onchange="validaSize(this);">
	                                   </div>
								</div>
							</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="subirFormato();">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal" >Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalActualizacionInscripcion" tabindex="-1"
	role="dialog" aria-labelledby="modalActualizacionInscripcion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<h4 id="h4Msj">Documento cargado</h4>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" data-dismiss="modal" onclick="location.reload();">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalFormatos" tabindex="-1"
	role="dialog" aria-labelledby="modalFormatos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Fomatos de calificacione</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<div id="divTableFormatos">
							<div class="row">
								<div class="bomb-5">
									<div class="box-body table-responsive">
										<table id="tblJustificantes"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>Descripci&oacute;n </th>
													<th>Tipo</th>
													<th>Acciones</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${not empty lstFormatos}">
													<c:forEach items="${lstFormatos}" var="formato" varStatus="loop">
														<tr>
															<td>${formato.descripcion}</td>
															<td>${formato.extencion}</td>
															<td>
																<a href="#" title="Descargar Formato" onclick="verFormato('${formato.id}');"><i class="fa fa-download"></i></a>&nbsp;
																<a href="#" title="Subir/actulizar formato" onclick="showNuevoFormato('${formato.id}','${formato.descripcion}');"><i class="fa fa-upload"></i></a>
															</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${empty lstFormatos}">
													<tr><td>Sin Documentos</td><td></td><td></td></tr>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="openNewFormato();" >Agregar Formato</button>
				<button type="button" class="btn"  data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalNuevoFormato" tabindex="-1"
	role="dialog" aria-labelledby="modalNuevoFormato" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nuevo Formato</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<input type="hidden" id="iptIdEventoFormN" value="${evento.id}">
						<div class="row">
							<div class="col-md-12">
								<h4>Seleccione el nuevo formato de calificaciones</h4>
								<h4>Nota: Se agregar&aacute; un nuevo documento</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Decripci&oacute;n:</label>
									<input type="text" class="form-control" id="iptIdDescripcionFormN" placeholder="Decripci&oacute;n"> 

								</div>
							</div>
						</div>
							<div class="row" >
								<div class="col-md-12">
									<div class="form-group">
	                                         <label for="iptFormatoCalificacionesFile">Formato de calificaciones</label>
	                                         <input type="file" id="iptFormatoCalificacionesFile" accept="application/pdf,image/*, .xls, .xlsx" onchange="validaSize(this);">
	                                   </div>
								</div>
							</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="nuevoFormato()">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal" >Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalActualizacionInscripcion" tabindex="-1"
	role="dialog" aria-labelledby="modalActualizacionInscripcion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<h4 id="h4Msj"></h4>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" data-dismiss="modal" onclick="location.reload();">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalAdvertenciaFormato" tabindex="-1"
	role="dialog" aria-labelledby="modalAdvertenciaFormato" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Actualizar formato</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<input type="hidden" id="iptIdFormatoA">
						<div class="row">
							<div class="col-md-12">
								<h4>Seleccione el nuevo formato de calificaciones</h4>
								<h4>Nota: El documento actual sera reemplazado por el nuevo formato de calificaciones</h4>
							</div>
						</div>
							<div class="row" id="divNuevoJustificante">
								<div class="col-md-12">
									<div class="form-group">
	                                         <label for="justifFile">Formato de calificaciones</label>
	                                         <input type="file" id="iptFileFormA" accept="application/pdf,image/*, .xls, .xlsx" onchange="validaSize(this);">
	                                   </div>
								</div>
							</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Decripci&oacute;n:</label>
									<input type="text" class="form-control" id="iptIdDescripcionFormA" placeholder="Decripci&oacute;n"> 

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="actualizaFormato()">Aceptar</button>
				<button type="button" class="btn" onclick="closeNuevoFormato();" >Cerrar</button>
			</div>
		</div>
	</div>
</div>

<!-- page script -->


<script type="text/javascript">
	<c:if test="${not empty lstInscritos}">
		$(function() {
			<c:forEach items="${lstInscritos}" var="inscrito" varStatus="loop">
				<c:if test="${not empty inscrito.lstActividades}">
					<c:forEach items="${inscrito.lstActividades}" var="actividad" varStatus="loop">
						<c:if test="${actividad.idTipoActividad == 1 || actividad.idTipoActividad == 2 || actividad.idTipoActividad == 3 || actividad.idTipoActividad == 5 || actividad.idTipoActividad == 6 || actividad.idTipoActividad == 8}">
							<c:if test="${actividad.consultaActividad.calificacion == 100}">
								$('#iptCheckActividad${actividad.consultaActividad.id}').prop('checked', true);
					  			$('#iptCheckActividad${actividad.consultaActividad.id}').iCheck({
					  		        checkboxClass: 'icheckbox_minimal checked'
					  			});
							</c:if>
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>
			
		});
	</c:if>

</script>

