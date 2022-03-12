
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
		<h1>Detalle de evento</h1>

	</section>

	<!-- Main content -->
	<section class="content">

		<div class="box box-primary">
			<div class="box-header">
				<h4>Datos Generales</h4>
			</div>
			<!-- /.box-header -->
			<!-- form start -->
			<form role="form">
				<div class="box-body">
					<input type="hidden" id="iptIdEvento"
						value="${evento.id}">
					<input type="hidden" id="iptIdCurso"
						value="${evento.idCurso}">
					<input type="hidden" id="iptAgendaIdEdit" value="${evento.id}">	
					<input type="hidden" id="iptEmpresaId" value="${evento.idEmpresa}">
					<div clas="row">
						<div class=cl-md-12>
							<h3 class="box-title">${evento.cursoVO.codigo} - ${evento.cursoVO.nombre}</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="iptAgendaFechaInicio">Fecha inicio</label>
								<input type="datetime-local" class="form-control"
									id="iptAgendaFechaInicio" placeholder="Periodo de prueba"
									value='<fmt:formatDate value="${evento.fechaInicio}" type="date" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${evento.fechaInicio}" type="date" pattern="HH:mm"/>'>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="iptAgendaFechaFin">Fecha fin</label>
								<input type="datetime-local" class="form-control"
									id="iptAgendaFechaFin" placeholder="Periodo de prueba"
									value='<fmt:formatDate value="${evento.fechaFin}" type="date" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${evento.fechaFin}" type="date" pattern="HH:mm"/>'>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Sede</label> 
								<select class="form-control" id="selectAgendaSede" >
									<option value="">Seleccione...</option>
									<c:forEach var="sede" items="${lstSedes}">
										<c:if test="${sede.id == evento.idSede}">
											<option value="${sede.id}" selected="selected">${sede.nombre}</option>
										</c:if>
										<c:if test="${sede.id != evento.idSede}">
											<option value="${sede.id}">${sede.nombre}</option>
										</c:if>
										
									</c:forEach>	
								</select>
							</div>
						</div>
						<div style="display:none;">
							 <div class="col-md-3">
								<div class="form-group">
									<label>Instructor</label> 
									<select class="form-control" id="selectAgendaInstructor" value="${evento.idInstructor}" >
										<option value="">Seleccione...</option>
										<c:forEach var="instructor" items="${lstInstructores}">
											<c:if test="${instructor.id == evento.idInstructor}">
												<option value="${instructor.id}" selected="selected"><c:out value="${instructor.funcionario.datosFuncionarioVO.nombres} ${instructor.funcionario.datosFuncionarioVO.apellidoUno} ${instructor.funcionario.datosFuncionarioVO.apellidoDos}"/> </option>
											</c:if>
											<c:if test="${instructor.id != evento.idInstructor}">
												<option value="${instructor.id}"><c:out value="${instructor.funcionario.datosFuncionarioVO.nombres} ${instructor.funcionario.datosFuncionarioVO.apellidoUno} ${instructor.funcionario.datosFuncionarioVO.apellidoDos}"/> </option>
											</c:if>
											
										</c:forEach>	
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							<div class="form-group">
								<label for="iptAgendaAsistenteMinimo">Número M&iacute;nimo de asistentes</label>
								<input type="number" class="form-control" id="iptAgendaAsistenteMinimo" value="${evento.asistentesMinimo}" 
								       min="0" max="1000" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" >
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label for="iptAgendaAsistenteMaximo">Número M&aacute;ximo de asistentes</label>
								<input type="number" class="form-control" id="iptAgendaAsistenteMaximo" value="${evento.asistentesMaximo}" 
								       min="0" max="1000" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" >
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label for="iptAgendaCostoCurso">Costo curso</label>
								<input type="number" class="form-control" id="iptAgendaCostoCurso" value="${evento.costoCurso}" 
								       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;" >
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label for="iptAgendaCostoCancelacion">Costo cancelación</label>
								<input type="number" class="form-control" id="iptAgendaCostoCancelacion" value="${evento.costoCancelacion}" 
								       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;">
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label for="iptAgendaCostoMaterial">Costo material</label>
								<input type="number" class="form-control" id="iptAgendaCostoMaterial" value="${evento.costoMaterial}" 
								       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;">
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label for="iptAgendaCostoNoShow">Costo No Show</label>
								<input type="number" class="form-control" id="iptAgendaCostoNoShow" value="${evento.costoNoShow}" 
								       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;">
							</div>
						</div>
					</div>
					<div class="row">
						<c:if test="${evento.idEstatus == 1 || evento.idEstatus == 3 }">
								<div class="col-md-2">
									<button type="button" class="btn btn-primary"
										onclick="updateAgendarCurso();" id="btnSaveFuncionario">Actualizar</button>
								</div>
								<div class="col-md-2">
									<button type="button" class="btn btn-primary"
										onclick="showCancelaCurso();" id="btnBajaFuncionario">Cancelar Curso</button>
								</div>
								<fmt:formatDate value="${evento.fechaInicio}" type="date" pattern="yyyy-MM-dd" var="inicioDateC"/>
								<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd" var="nowDateC"/>
								<c:if test="${nowDateC lt inicioDateC }">
									<button type="button" class="btn btn-primary"
										onclick="showCambiaCurso();" id="btnCambioCurso">Cambiar Curso</button>
								</c:if>
						</c:if>
						<c:if test="${evento.idEstatus == 2 || evento.idEstatus == 4 }">
								<div class="col-md-2">
									<button type="button" class="btn btn-primary"
										onclick="abrirCurso();" id="btnAbrirCurso">Re Abrir</button>
								</div>
						</c:if>
						<div class="col-md-2">
							<button type="button" class="btn btn-primary" onclick="verFormtoCalificacion();">Formato de calificaciones</button>
						</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-primary" onclick="exportLista('${evento.id}');">Exportar Lista</button>
						</div>
					</div>
					
				</div>
			</form>
		</div>
		<br>
		
		<div id="divLstInstrutores">
			<div class="box box-primary">
				<div class="box-header">
					<h4>Instructores</h4>
				</div>
				<div class="box-body">
					
					<div class="row">
						<div class="col-md-3">
							<button type="button" class="btn btn-primary" onclick="openInstructoresNO();">Agregar instructor</button>
						</div>
					</div>
					<div class="row">
						<div class="bomb-5">
							<div class="box-body table-responsive">
								<table id="tblInstructores"
									class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Nombre</th>
											<th>RFC</th>
											<th>Empresa</th>
											<th>Principal</th>
											<th>Acciones</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty lstInstructores}">
											<c:forEach var="instructor" items="${lstInstructores}">
												<tr>
													<td><c:out value="${instructor.funcionario.datosFuncionarioVO.nombres} ${instructor.funcionario.datosFuncionarioVO.apellidoUno} ${instructor.funcionario.datosFuncionarioVO.apellidoDos}"/></td>
													<td>${instructor.funcionario.rfc}</td>
													<td>${instructor.auxEmpresa}</td>
													<td>
														<c:if test="${instructor.eventoInstructorVO.banPrincipal == 1}">
															Principal
														</c:if>
														<c:if test="${instructor.eventoInstructorVO.banPrincipal == 0}">
															Adicional
														</c:if>
													</td>
													<td>
														<c:if test="${instructor.eventoInstructorVO.banPrincipal == 0}">
															<button type="button" class="btn btn-primary" onclick="cambiaPrincipal(${instructor.id});">Principal</button>
															<button type="button" class="btn btn-primary" onclick="quitarInstructor(${instructor.id});">Quitar</button>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				
				
				</div>
			</div>
		</div>
		
		<div id="divLstInstrutoresNO" style="display:none;">
			<div class="box box-primary">
				<div class="box-header">
					<h4>Agregar Instructores</h4>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-md-3">
							<button type="button" class="btn btn-primary" onclick="closeInstructoresNO();">Cerrar</button>
						</div>
					</div>
					<div class="row">
						<div class="bomb-5">
							<div class="box-body table-responsive">
								<table id="tblInstructoresNO"
									class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Nombre</th>
											<th>RFC</th>
											<th>Empresa</th>
											<th>Acciones</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty noInstructores}">
											<c:forEach var="instructor" items="${noInstructores}">
												<tr>
													<td><c:out value="${instructor.funcionario.datosFuncionarioVO.nombres} ${instructor.funcionario.datosFuncionarioVO.apellidoUno} ${instructor.funcionario.datosFuncionarioVO.apellidoDos}"/></td>
													<td>${instructor.funcionario.rfc}</td>
													<td>${instructor.auxEmpresa}</td>
													<td>
														<a href="#" title="Agregar" onclick="agregarInstructor('${instructor.id}');"><i class="fa fa-plus"></i></a>
													</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="box box-primary">
			<div class="box-header">
				<h4>Listas de inscripci&oacute;n</h4>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-12">
						<div class="nav-tabs-custom">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#tabInscritos" data-toggle="tab">Inscritos</a>
								</li>
								<li>
									<a href="#tabSolicitudes" data-toggle="tab">Solicitudes</a>
								</li>
								<li>
									<a href="#tabCancelados" data-toggle="tab">Cancelados</a>
								</li>
								<li>
									<a href="#tabInscribir" data-toggle="tab">Inscribir</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tabInscritos">
									<div class="row">
										<div class="bomb-5">
											<div class="box-body table-responsive">
												<table  class="table table-bordered table-striped" id="tblInscritos">
													<thead>
														<tr>
															<th>RFC</th>
															<th>Funcionario</th>
															<th>Puesto principal</th>
															<th>Distribuidor</th>
															<th>Autoriza</th>
															<th>Fecha de inscripci&oacute;n</th>
															<th>Estatus</th>
															<th>Calificaci&oacute;n</th>
															<th>Acciones</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${not empty evento.inscritos}">
															<c:forEach var="inscritos" items="${evento.inscritos}">
																<tr>
																	<td>${inscritos.funcionarioEstatus.rfc}</td> 
																	<td>${inscritos.funcionarioEstatus.datosFuncionarioVO.nombres} ${inscritos.funcionarioEstatus.datosFuncionarioVO.apellidoUno} ${inscritos.funcionarioEstatus.datosFuncionarioVO.apellidoDos}</td>
																	<td>${inscritos.funcionarioEstatus.auxPuestoPrincipal}</td>
																	<td>${inscritos.funcionarioEstatus.auxDealerPrincipal}</td>
																	<td>${inscritos.funcionarioBy.datosFuncionarioVO.nombres} ${inscritos.funcionarioBy.datosFuncionarioVO.apellidoUno} ${inscritos.funcionarioBy.datosFuncionarioVO.apellidoDos}</td>
																	<td>
																		<c:if test="${not empty inscritos.modificacion}">
																			<fmt:formatDate value="${inscritos.modificacion}" type="date" pattern="yyyy-MM-dd HH:mm"/>
																		</c:if>
																		<c:if test="${empty inscritos.modificacion}">
																			<fmt:formatDate value="${inscritos.creacion}" type="date" pattern="yyyy-MM-dd HH:mm"/>
																		</c:if>
																		
																	</td>
																	<td>
																		<c:if test="${inscritos.estatus == 2}">
																			Inscrito
																		</c:if>
																		<c:if test="${inscritos.estatus == 5}">
																			Aprobado
																		</c:if>
																		<c:if test="${inscritos.estatus == 6}">
																			No Aprobado
																		</c:if>
																		<c:if test="${inscritos.estatus == 7}">
																			NO SHOW
																		</c:if>
																		<c:if test="${inscritos.estatus == 8}">
																			NO EXAMEN
																		</c:if>
																	</td> 
																	<td>
																		<c:if test="${inscritos.estatus == 2}">
																			N/A
																		</c:if>
																		<c:if test="${inscritos.estatus == 5 || inscritos.estatus == 6}">
																			${inscritos.calificacion }
																		</c:if>
																	</td> 
																	<td><button type="button" class="btn" onclick="openCancela('${inscritos.id}','${evento.id}');">Cancelar</button></td> 
																</tr>
															</c:forEach>
														</c:if>
														
													</tbody>
												</table>
											</div>
			
										</div>
									</div>
								</div>
								<div class="tab-pane" id="tabSolicitudes">
									<div class="row">
										<div class="bomb-5">
											<div class="box-body table-responsive">
												<table  class="table table-bordered table-striped" id="tblSolicitudes">
													<thead>
														<tr>
															<th>RFC</th>
															<th>Funcionario</th>
															<th>Puesto principal</th>
															<th>Dealer</th>
															<th>Fecha Solicitud</th>
															<th>Acciones</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${not empty evento.solicitados}">
															<c:forEach var="solicitados" items="${evento.solicitados}">
																<tr>
																	<td>${solicitados.funcionarioEstatus.rfc}</td>
																	<td>${solicitados.funcionarioEstatus.datosFuncionarioVO.nombres} ${solicitados.funcionarioEstatus.datosFuncionarioVO.apellidoUno} ${solicitados.funcionarioEstatus.datosFuncionarioVO.apellidoDos}</td>
																	<td>${solicitados.funcionarioEstatus.auxPuestoPrincipal}</td>
																	<td>${solicitados.funcionarioEstatus.auxDealerPrincipal}</td> 
																	<td><fmt:formatDate value="${solicitados.creacion}" type="date" pattern="yyyy-MM-dd HH:mm"/></td> 
																	<td> <button type="button" class="btn" onclick="actualizaEstatusInscripcion('${solicitados.id}','2','${evento.id}');">Aceptar</button> <button type="button" class="btn" onclick="showRechazo('${solicitados.id}');">Rechazar</button></td> 
																</tr>															
															</c:forEach>
														</c:if>
														
													</tbody>
												</table>
											</div>
			
										</div>
									</div>
								</div>
								<div class="tab-pane" id="tabCancelados">
									<div class="row">
										<div class="bomb-5">
											<div class="box-body table-responsive">
												<table  class="table table-bordered table-striped" id="tblCancelados">
													<thead>
														<tr>
															<th>RFC</th>
															<th>Funcionario</th>
															<th>Puesto principal</th>
															<th>Dealer</th>
															<th>Funcionario Cancela</th>
															<th>Fecha Cancelaci&oacute;n</th>
															<th>Motivo cancelaci&oacute;n</th>
															<th>Tipo cancelaci&oacute;n</th>
															<th>Acciones</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${not empty evento.cancelados}">
															<c:forEach var="cancelados" items="${evento.cancelados}">
																<tr> 
																	<td>${cancelados.funcionarioEstatus.rfc}</td>
																	<td>${cancelados.funcionarioEstatus.datosFuncionarioVO.nombres} ${cancelados.funcionarioEstatus.datosFuncionarioVO.apellidoUno} ${cancelados.funcionarioEstatus.datosFuncionarioVO.apellidoDos}</td>
																	<td>${cancelados.funcionarioEstatus.auxPuestoPrincipal}</td>
																	<td>${cancelados.funcionarioEstatus.auxDealerPrincipal}</td>
																	<td>${cancelados.funcionarioBy.datosFuncionarioVO.nombres} ${cancelados.funcionarioBy.datosFuncionarioVO.apellidoUno} ${cancelados.funcionarioBy.datosFuncionarioVO.apellidoDos}</td>
																	<td><fmt:formatDate value="${cancelados.cancelacion}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
																	<td>${cancelados.auxMotivoCancelacion}</td> 
																	<td>
																		<c:if test="${cancelados.estatus == 4}">
																			Oportuna
																		</c:if>
																		<c:if test="${cancelados.estatus == 4}">
																			Curso cancelado
																		</c:if>
																		<c:if test="${cancelados.estatus == 10}">
																			Extemporanea
																		</c:if>
																		<c:if test="${cancelados.estatus == 11}">
																			Justificada
																		</c:if>
																	</td>
																	<td>
																		<a href="#" title="Re-inscribir" onclick="openConfirmaReinscripcion('${cancelados.funcionarioEstatus.rfc}','${cancelados.id}');"><i class="fa fa-undo"></i></a>
																		<a href="#" title="Modificarcancelaci&oacute;n" onclick="openCancela('${cancelados.id}','${evento.id}');"><i class="fa fa-gear"></i></a>
																		<c:if test="${cancelados.estatus == 11}">
																			<a href="#" title="Ver justificante" onclick="getJustificantes('${cancelados.id}','${cancelados.funcionarioEstatus.datosFuncionarioVO.nombres} ${cancelados.funcionarioEstatus.datosFuncionarioVO.apellidoUno} ${cancelados.funcionarioEstatus.datosFuncionarioVO.apellidoDos}');"><i class="fa fa-download"></i></a>
																		</c:if>
																	</td>
																</tr>
															</c:forEach>
														</c:if>
														
													</tbody>
												</table>
											</div>
			
										</div>
									</div>
								</div>
								<div class="tab-pane" id="tabInscribir">
									<div class="row">
										<div class="bomb-5">
											<div class="box-body table-responsive">
												<table  class="table table-bordered table-striped" id="tblInscribir">
													<thead>
														<tr>
															<th>RFC</th>
															<th>Nombre</th>
															<th>Puesto principal</th>
															<th>Distribuidor</th>
															<th>Seleccionar</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${not empty evento.funcionarios}">
															<c:forEach var="inscribir" items="${evento.funcionarios}">
																<c:if test="${inscribir.inscripcionesAbiertas == 0}">
																	<tr>
																</c:if>
																<c:if test="${inscribir.inscripcionesAbiertas > 0}">
																	<tr style="color:red">
																</c:if>
																	<td>${inscribir.rfc}</td>
																	<td>${inscribir.datosFuncionarioVO.nombres} ${inscribir.datosFuncionarioVO.apellidoUno} ${inscribir.datosFuncionarioVO.apellidoDos}</td>
																	<td>${inscribir.auxPuestoPrincipal}</td>
																	<td>${inscribir.auxDealerPrincipal}</td>
																	<td>
																			<input type="checkbox" name="checkAddF" value="${inscribir.idUsuario}" id="${inscribir.idUsuario}">
																	</td>
																</tr>
															</c:forEach>
														</c:if>
														
													</tbody>
												</table>
											</div>
			
										</div>
									</div>
									<div class="row">
										<button type="button" class="btn btn-primary" onclick="inscribirFuncionarios();">Inscribir</button>
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
		
		<div class="box box-primary">
			<div class="box-header">
				<h4>Actividades</h4>
			</div>
			<div class="box-body">
				<div id="listaPuestos">
					<div class="row">
						<div class="bomb-5">
							<div class="box-body table-responsive">
								<table id="permisosFuncionario"
									class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Actividad</th>
											<th>Tipo</th>
											<th>Fecha Inicio</th>
											<th>Fecha Fin</th>
											<th>LINK</th>
											<th>Acciones</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty lstActividades}">
											<c:forEach var="actividad" items="${lstActividades}">
												<tr>
													<td>${actividad.actividad.nombre}</td>
													<td>${actividad.actividad.tipoActividad.nombre}</td>
													<td>
														<input type="datetime-local" class="form-control" id="iptFchInicioES${actividad.id}" placeholder="Fecha Inicio"
															value='<fmt:formatDate value="${actividad.fechaInicio}" type="date" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${actividad.fechaInicio}" type="date" pattern="HH:mm"/>'>
													</td>
													<td>
														<input type="datetime-local" class="form-control" id="iptFchFinES${actividad.id}" placeholder="Periodo de prueba"
															value='<fmt:formatDate value="${actividad.fechaFin}" type="date" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${actividad.fechaFin}" type="date" pattern="HH:mm"/>'>
													</td>
													<td>
														<c:if test="${actividad.actividad.idTipoActividad == 6}">
															<input type="text" placeholder="link a conferencia" id="iptURLES${actividad.id}" value="${actividad.url}" class="form-control">
														</c:if>
														<c:if test="${actividad.actividad.idTipoActividad != 6}">
															N/A
														</c:if>
													</td>
													<td>
														<button type="button" class="btn btn-primary" onclick="updateEventoSesion(${actividad.id}, ${actividad.actividad.idTipoActividad})">Modificar</button>
													</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>


	</section>
	<!-- /.content -->
</aside>
<!-- /.right-side -->

<div class="modal fade" id="modalActividadActualizada" tabindex="-2"
	role="dialog" aria-labelledby="modalActividadActualizada" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Actividad actualizada</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalAdvertenciaCancelacion" tabindex="-1"
	role="dialog" aria-labelledby="modalAdvertenciaCancelacion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Cancelaci&oacute;n</h3>
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
						<input type="hidden" id="iptIdInscripcionCanc">
						<input type="hidden" id="iptAplicaCosto" value="false">
						<div class="row">
							<div class="col-md-12">
								<h4>Seleccione el motivo de cancelaci&oacute;n para poder continuar.</h4>
								
							</div>
						</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Tipo de cancelaci&oacute;n</label> 
										<select class="form-control" id="selectTipoCancelacion" onchange="changeTipoCancelacion();">
											<option value="4" selected="selected">En tiempo</option>
											<option value="10">Extemporanea</option>
											<option value="11">Justificada</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptPeriodoPrueba">Fecha de cancelaci&oacute;n</label>
										<input type="date" class="form-control" id="iptFechaCancela" placeholder="Fecha de cancelaci&oacute;n"  value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>'>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Motivo de cancelaci&oacute;n</label> 
										<select class="form-control" id="selectMotivoCancelacion" required="">
											<option value="">Seleccione...</option>
											<c:if test="${not empty lstMotivosCancelacion}">
											<c:forEach items="${lstMotivosCancelacion}" var="motivoCancelacion">
												<option value="${motivoCancelacion.id}">${motivoCancelacion.motivoCancelacion}</option>
											</c:forEach>
										</c:if>
										</select>
									</div>
								</div>
							</div>
							<div class="row" id="divDocumentoJustificado" style="display:none;">
								<div class="col-md-12">
									<div class="form-group">
	                                         <label for="justifFile">Documento Justificaci&oacute;n</label>
	                                         <input type="file" id="justifFile" accept="application/pdf" onchange="validaSize(this);">
	                                   </div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Observaciones: </label>
										<textarea class="form-control" id="iptObservacionesCancela" rows="3" name="iptObservacionesCancela"
										placeholder="Observaciones" maxlength="300"></textarea> 
									</div>
								</div>
							</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="cancelaInscripcion();">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal" >Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalMotivoObligatorio" tabindex="-1"
	role="dialog" aria-labelledby="modalMotivoObligatorio" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Advertencia</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<div id="divMsgCancelacion">
									<h4>Es necesario seleccionar un motivo de cancelaci&oacute;n para continuar</h4>
								</div>
								<div id="divMsgCancelacionJ" style="display:none;">
									<h4>Es necesario seleccionar un motivo de cancelaci&oacute;n y un documento para continuar con la cancelaci&oacute;n justificada</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" data-dismiss="modal" >Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalCancelacionEvento" tabindex="-1"
	role="dialog" aria-labelledby="modalCancelacionEvento" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Cancelaci&oacute;n de evento</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<h4>Seleccione el motivo de cancelaci&oacute;n del curso para poder continuar.</h4>
								
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>Motivo de cancelaci&oacute;n</label> 
									<select class="form-control" id="selectAgendaCancelacion" required="">
										<option value="">Seleccione...</option>
										<c:if test="${not empty lstMotivosCancelacionCurso}">
											<c:forEach items="${lstMotivosCancelacionCurso}" var="motivoCancelacion">
												<option value="${motivoCancelacion.id}">${motivoCancelacion.motivoCancelacion}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="cancelaEvento();">Cancelar curso</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modalTamanioExedido" tabindex="-1"
	role="dialog" aria-labelledby="modalTamanioExedido" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Alerta</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>El archvo seleccionado excede el tamaño permitido (200 kb)</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
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

<div class="modal fade" id="modalConfirmaReInscripcion" tabindex="-1"
	role="dialog" aria-labelledby="modalConfirmaReInscripcion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Confirmaci&oacute;n de re-inscripci&oacute;n</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header">
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<div class="row">
							<input type="hidden" id="idReinscripcion">
							<div class="col-md-12">
								<h4 id="h4Reinscribe"></h4>
								<h4 >Curso: ${evento.cursoVO.nombre}</h4>
								<h4 >Inicio: <fmt:formatDate value="${evento.fechaInicio}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></h4>
								<h4 >Fin: <fmt:formatDate value="${evento.fechaFin}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></h4>
							</div> 
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="reinscribeFuncionario();">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalAdvertenciaJustificante" tabindex="-1"
	role="dialog" aria-labelledby="modalAdvertenciaJustificante" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Cancelaci&oacute;n</h3>
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
						<input type="hidden" id="iptIdInscripcionJustif">
						<div class="row">
							<div class="col-md-12">
								<h4>Seleccione el nuevo justificante</h4>
								<h4>Nota: El documento actual sera reemplazado por el nuevo justificante</h4>
							</div>
						</div>
							<div class="row" id="divNuevoJustificante">
								<div class="col-md-12">
									<div class="form-group">
	                                         <label for="justifFile">Documento Justificaci&oacute;n</label>
	                                         <input type="file" id="justifFileNuevo" accept="application/pdf,image/*" onchange="validaSize(this);">
	                                   </div>
								</div>
							</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Decripci&oacute;n:</label>
									<input type="text" class="form-control" id="iptDescJustA" placeholder="Decripci&oacute;n"> 

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="actualizaJustificante()">Aceptar</button>
				<button type="button" class="btn" onclick="closeNuevoJustif();" >Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalRechazaInsc" tabindex="-1"
	role="dialog" aria-labelledby="modalRechazaInsc" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Rechazar Solicitud</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<div id="divMsgCancelacion">
									<h4>¿Desea continuar con el rechazo?</h4>
								</div>
							</div>
							
							
						</div>
						<div class="row">
							<input type="hidden" id="iptIdRechazo">
							<div class="col-md-12">
								<div class="form-group">
									<label>Observaciones</label>
									<textarea class="form-control" id="iptObservaciones" rows="3" name="iptObservaciones"
									placeholder="Observaciones" maxlength="300"></textarea> 
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="saveRechazo()">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal" >Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalJustificantes" tabindex="-1"
	role="dialog" aria-labelledby="modalJustificantes" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Justificantes de Inscripci&oacute;n</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<div id="divMsgCancelacion">
									<h4 id="h4JustifInfo"></h4>
								</div>
							</div>
						</div>
						
						<div id="divTableJustificantes">
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
											<tbody id="tBodyJustificantes">
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
				<button type="button" class="btn" onclick="openNewJustificante();" >Agregar justificante</button>
				<button type="button" class="btn"  data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalNuevoJustificante" tabindex="-1"
	role="dialog" aria-labelledby="modalNuevoJustificante" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nuevo Jusificante</h3>
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
						<input type="hidden" id="iptIdInscripcionJustifN">
						<div class="row">
							<div class="col-md-12">
								<h4>Seleccione el nuevo justificante</h4>
								<h4>Nota: Se agregará un nuevo documento</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Decripci&oacute;n:</label>
									<input type="text" class="form-control" id="iptDescJustN" placeholder="Decripci&oacute;n"> 

								</div>
							</div>
						</div>
							<div class="row" >
								<div class="col-md-12">
									<div class="form-group">
	                                         <label for="justifFile">Documento Justificaci&oacute;n</label>
	                                         <input type="file" id="iptFileJustifN" accept="application/pdf,image/*" onchange="validaSize(this);">
	                                   </div>
								</div>
							</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="nuevoJustificante()">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal" >Cerrar</button>
			</div>
		</div>
	</div>
</div>

<!-- Nuevos modales -->

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

<div class="modal fade" id="modalNuevoCurso" tabindex="-1"
	role="dialog" aria-labelledby="modalNuevoCurso" aria-hidden="true">
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
								<h4>Seleccione el nuevo curso</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
	                                   <label>Nuevo Curso</label>
	                                   <select class="form-control" id="selectNuevoCurso" >
											<option value="">Seleccione...</option>
											<c:forEach var="curso" items="${lstCursos}">
												<option value="${curso.id}">${curso.codigo} - ${curso.nombre}</option>
											</c:forEach>	
										</select>
                                   </div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="updateNewCurso()">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal" >Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalActualizacionCurso" tabindex="-1"
	role="dialog" aria-labelledby="modalActualizacionCurso" aria-hidden="true">
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
								<h4>Curso actualizado con &eacute;xito</h4>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
    $(function() {
    	$('#tblInscritos').dataTable({
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
    	$('#tblSolicitudes').dataTable({
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
    	$('#tblCancelados').dataTable({
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
    	$('#tblInscribir').dataTable({
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
    	
    	$('#tblInstructores').dataTable({
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
    	
    	$('#tblInstructoresNO').dataTable({
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



