<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="now" class="java.util.Date" />

<script src="<c:url value='/resources/js/admin/calendario.js' />"
	type="text/javascript"></script>

<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>

<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Calendario de cursos
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="row">
			<div class="col-md-12">
				<button class="btn btn-primary" onclick="openCargaMasiva();"> Inscripci&oacute;n masiva</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
					
						<c:if test="${not empty dashboardLst}">
							<c:forEach items="${dashboardLst}" var="dashboard">
								<li>
									<a href="#tab${dashboard.empresa.id}" data-toggle="tab">${dashboard.empresa.nombre}</a>
								</li>
							</c:forEach>
						</c:if>
						
					</ul>
					<div class="tab-content">
						<c:if test="${not empty dashboardLst}">
							<c:forEach items="${dashboardLst}" var="dashboard">
								<div class="" id="tab${dashboard.empresa.id}">

									<div class="row">
										<div class="col-md-12" ">
											<h3 class="empresa-nombre">${dashboard.empresa.nombre}</h3>
										</div>
									</div>
		
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8">
											<div class="box" style="border:0px;">
												<div class="box-header" style="background:#ececec;">
													<div class="row">
														<div class="col-md-8" style="margin:10px 10px;">
															<button type="button" class="btn btn-primary" onclick="javascript:newAgendarCurso('${dashboard.empresa.id}');">Agendar curso</button>
														</div>
													</div>
												</div>
												<div class="box-body" style="background: #f7f7f7;">
													<!-- THE CALENDAR -->
													<div id="calendario${dashboard.empresa.id}"></div>
													<div class="notas-calendario">
														<p class="txt-gray">
															<i class="fa fa-circle"></i> Curso vacio
														</p>
														<p class="txt-blue">
															<i class="fa fa-circle"></i> Solicitudes pendientes
														</p>
														<p class="txt-green">
															<i class="fa fa-circle"></i> Funcionarios inscritos
														</p>
														<p class="txt-orange">
															<i class="fa fa-circle"></i> Cupo lleno
														</p>
														<p class="txt-red">
															<i class="fa fa-circle"></i> Cancelado
														</p>
														<p class="txt-amazul">
															<i class="fa fa-circle"></i>Impartido
														</p>
													</div>
												</div>
												<!-- /.box-body -->
											</div>
											<!-- /. box -->
										</div>
										<!-- /.col -->
										<div class="col-md-2"></div>
									</div>
									
									
									
									
									
									<!-- /.row -->
									<div class="row">
										<div class="col-md-12">
											<h1>Cursos</h1>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="nav-tabs-custom">
												<ul class="nav nav-tabs">
													<li class="active">
														<a href="#tabProx${dashboard.empresa.id}" data-toggle="tab">Proximos</a>
													</li>
													<li>
														<a href="#tabAnt${dashboard.empresa.id}" data-toggle="tab">Anteriores</a>
													</li>
													<li>
														<a href="#" onclick="openListcursos('${dashboard.empresa.id}')">Ver todos</a>
													</li>
													<li>
														<a href="#" onclick="openExportarCursos('${dashboard.empresa.id}')">Exportar</a>
													</li>
												</ul>
												<div class="tab-content">
													<div class="tab-pane active" id="tabProx${dashboard.empresa.id}">
														<table id="example1"
															class="table table-bordered table-striped">
															<thead>
																<tr>
																	<th>Curso</th>
																	<th>Fecha</th>
																	<th>Inscritos</th>
																	<th>Solicitados</th>
																	<th>Cancelados</th>
																	<th>Instructor</th>
																	<th>Sede</th>
																</tr>
															</thead>
															<tbody>
															
																<c:if test="${not empty dashboard.eventosProximos}">
																</c:if>
																<c:forEach var="eventoProximo" items="${dashboard.eventosProximos}">
																	<tr>
																		<td>${eventoProximo.cursoVO.nombre}</td>
																		<td><fmt:formatDate value="${eventoProximo.fechaInicio}" pattern="yyyy-MM-dd HH:mm" />  -  <fmt:formatDate value="${eventoProximo.fechaFin}" pattern="yyyy-MM-dd HH:mm" /></td>
																		<td>${eventoProximo.totalInscritos}</td>
																		<td>${eventoProximo.totalSolicitados}</td>
																		<td>${eventoProximo.totalCancelados}</td>
																		<td>${eventoProximo.instructorVO.funcionario.datosFuncionarioVO.nombres} ${eventoProximo.instructorVO.funcionario.datosFuncionarioVO.apellidoUno} ${eventoProximo.instructorVO.funcionario.datosFuncionarioVO.apellidoDos}</td>
																	    <td>${eventoProximo.sedeVO.nombre}</td>
																	</tr>
																</c:forEach>	
															
															</tbody>
														</table>
													</div>
													<!-- /.tab-pane -->
													<div class="tab-pane" id="tabAnt${dashboard.empresa.id}">
														<div class=" table-responsive">
															<table id="example1"
																class="table table-bordered table-striped">
																<thead>
																	<tr>
																	<th>Curso</th>
																	<th>Fecha</th>
																	<th>Inscritos</th>
																	<th>Solicitados</th>
																	<th>Cancelados</th>
																	<th>Instructor</th>
																	<th>Sede</th>
																	</tr>
																</thead>
																<tbody>
																
																	<c:if test="${not empty dashboard.eventosAnteriores}">
																		<c:forEach var="eventoAnterior" items="${dashboard.eventosAnteriores}">
																			<tr>
																				<td>${eventoAnterior.cursoVO.nombre}</td>
																				<td><fmt:formatDate value="${eventoAnterior.fechaInicio}" pattern="yyyy-MM-dd HH:mm" />  -  <fmt:formatDate value="${eventoAnterior.fechaFin}" pattern="yyyy-MM-dd HH:mm" /></td>
																				<td>${eventoAnterior.totalInscritos}</td>
																				<td>${eventoAnterior.totalSolicitados}</td>
																				<td>${eventoAnterior.totalCancelados}</td>
																				<td>${eventoAnterior.instructorVO.funcionario.datosFuncionarioVO.nombres} ${eventoAnterior.instructorVO.funcionario.datosFuncionarioVO.apellidoUno} ${eventoAnterior.instructorVO.funcionario.datosFuncionarioVO.apellidoDos}</td>
																			    <td>${eventoAnterior.sedeVO.nombre}</td>
																			</tr>
																		</c:forEach>	
																	</c:if>
																	
																
																</tbody>
															</table>
														</div>
													</div>
													<!-- /.tab-pane -->
												</div>
												<!-- /.tab-content -->
											</div>
											<!-- nav-tabs-custom -->
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
						
					</div>
					<!-- /.tab-content -->
				</div>
				<!-- nav-tabs-custom -->
			</div>
		</div>
		<div class="calendarElse" id="rowToyota"></div>
		<div class="calendarElse" id="rowMitsu"></div>


	</section>
	<!-- /.content -->
</aside>
<!-- /.right-side -->


<div class="modal fade" id="modalNewAgenda" tabindex="-1" role="dialog" aria-labelledby="modalNewAgenda" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
		
			<!-- form start -->
	        <form role="form" id="formAgendarCurso" >
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptAgendarCursoTitulo">Agendar Curso</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<!-- /.box-header -->

						<div class="box-body">
							<div class="row">
								<div class="col-md-12"><h4 id="nombreCursoSeleccionado"></h4></div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaFechaInicio">Fecha de inicio</label>
										<input type="datetime-local" class="form-control" id="iptAgendaFechaInicio" name="iptAgendaFechaInicio" onchange="setMinDateFin();" onkeydown="return false">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaFechaFin">Fecha de t&eacute;rmino</label>
										<input type="datetime-local" class="form-control" id="iptAgendaFechaFin" name="iptAgendaFechaFin" disabled="disabled" onkeydown="return false">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaAsistenteMinimo">Número M&iacute;nimo de asistentes</label>
										<input type="number" class="form-control" id="iptAgendaAsistenteMinimo" value="0" 
										       min="0" max="1000" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" >
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaAsistenteMaximo">Número M&aacute;ximo de asistentes</label>
										<input type="number" class="form-control" id="iptAgendaAsistenteMaximo" value="0" 
										       min="0" max="1000" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" >
									</div>
								</div>
							</div>
							
							<div class="row">
								<input type="hidden" id="selectAgendaCurso">
								<div class="col-md-6">
									<div class="form-group">
										<label>Sede</label> 
										<select class="form-control" id="selectAgendaSede" >
											<option value="">Seleccione...</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Instructor</label> 
										<select class="form-control" id="selectAgendaInstructor" >
											<option value="">Seleccione...</option>
											<c:forEach var="instructor" items="${lstInstructores}">
												<option value="${instructor.id}"><c:out value="${instructor.funcionario.datosFuncionarioVO.nombres} ${instructor.funcionario.datosFuncionarioVO.apellidoUno} ${instructor.funcionario.datosFuncionarioVO.apellidoDos}"/> </option>
											</c:forEach>	
										</select>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaCostoCurso">Costo curso</label>
										<input type="number" class="form-control" id="iptAgendaCostoCurso" value="0" 
										       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;" >
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaCostoCancelacion">Costo cancelación</label>
										<input type="number" class="form-control" id="iptAgendaCostoCancelacion" value="0" 
										       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaCostoMaterial">Costo material</label>
										<input type="number" class="form-control" id="iptAgendaCostoMaterial" value="0" 
										       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaCostoNoShow">Costo No Show</label>
										<input type="number" class="form-control" id="iptAgendaCostoNoShow" value="0" 
										       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;">
									</div>
								</div>
							</div>

							
							<div id="divTableCursosAgenda"> 
								<table id="tblCursosAgenda"
									class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Curso</th>
											<th>Acciones</th>
										</tr>
									</thead>
									<tbody id="tbodyCursosAgenda">
										<!-- Aqui se insertan los cursos disponibles -->
									</tbody>
								</table>
							</div>
						</div>

					</div>
					<!-- /.box -->
				</div>
				<div class="modal-footer .mdl-footr-lt">
					<input type="hidden" id="iptEmpresaId" value="">
					<input type="hidden" id="iptAgendaId" value="">
					<button type="button" class="btn" onclick="saveAgendarCurso();" style="display:none;" id="btnGuardaAgenda">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>
			
		</div>
	</div>
</div>


<div class="modal fade" id="modalViewAgenda" tabindex="-1" role="dialog" aria-labelledby="modalViewAgenda" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content bg-glass-sknd">
		
			<!-- form start -->
			<form role="form" id="formAgendarCursoEdit">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptAViewCursoTitulo"></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<!-- /.box-header -->

						<div class="box-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaFechaInicioEdit">Fecha de inicio</label>
										<input type="datetime-local" class="form-control" id="iptAgendaFechaInicioEdit" name="iptAgendaFechaInicioEdit" onchange="setMinDateFinEdit();" min="<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${now}" type="date" pattern="hh:mm"/>" onkeydown="return false">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaFechaFinEdit">Fecha de t&eacute;rmino</label>
										<input type="datetime-local" class="form-control" id="iptAgendaFechaFinEdit" name="iptAgendaFechaFinEdit" disabled="disabled" onkeydown="return false">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaAsistenteMinimoEdit">Número M&iacute;nimo de asistentes</label>
										<input type="number" class="form-control" id="iptAgendaAsistenteMinimoEdit" value="0" 
										       min="0" max="1000" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" >
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaAsistenteMaximoEdit">Número M&aacute;ximo de asistentes</label>
										<input type="number" class="form-control" id="iptAgendaAsistenteMaximoEdit" value="0" 
										       min="0" max="1000" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" >
									</div>
								</div>
							</div>
							
							<div class="row">
								<input type="hidden" id="selectAgendaCursoEdit">
								<div class="col-md-6">
									<div class="form-group">
										<label>Sede</label> 
										<select class="form-control" id="selectAgendaSedeEdit" >
											<option value="">Seleccione...</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Instructor</label> 
										<select class="form-control" id="selectAgendaInstructorEdit" >
											<option value="">Seleccione...</option>
											<c:forEach var="instructor" items="${lstInstructores}">
												<option value="${instructor.id}"><c:out value="${instructor.funcionario.datosFuncionarioVO.nombres} ${instructor.funcionario.datosFuncionarioVO.apellidoUno} ${instructor.funcionario.datosFuncionarioVO.apellidoDos}"/> </option>
											</c:forEach>	
										</select>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaCostoCurso">Costo curso</label>
										<input type="number" class="form-control" id="iptAgendaCostoCursoEdit" value="0" 
										       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;" >
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaCostoCancelacion">Costo cancelación</label>
										<input type="number" class="form-control" id="iptAgendaCostoCancelacionEdit" value="0" 
										       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaCostoMaterial">Costo material</label>
										<input type="number" class="form-control" id="iptAgendaCostoMaterialEdit" value="0" 
										       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptAgendaCostoNoShow">Costo No Show</label>
										<input type="number" class="form-control" id="iptAgendaCostoNoShowEdit" value="0" 
										       min="0" max="100000" onKeyDown="if(this.value.length==4 && event.keyCode!=8) return false;">
									</div>
								</div>
							</div>

							
							
						</div>

					</div>
					<!-- /.box -->
				</div>
				<div class="modal-footer mdl-footr-lt">
				
					<div id="divBotonesEdicionCalendario">
						<div class="row">
							<div class="col-xs-12 text-center">
								<input type="hidden" id="iptAgendaIdEdit" value="">
								<input type="hidden" id="iptEmpresaIdEdit" value="">
								<button type="button" class="btn btn-primary" onclick="verInscritos();">Inscritos</button>
								<button type="button" class="btn btn-primary" onclick="verSolicitados();">Solicitudes</button>
								<button type="button" class="btn btn-primary" onclick="verCancelados();">Cancelados</button>
								<button type="button" class="btn btn-primary" onclick="verInscribir();">Inscribir</button>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 text-center" style="margin-top:20px;">
								<button type="button" class="btn" onclick="updateAgendarCurso();">Guardar</button>
								<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
								<button type="button" class="btn" onclick="showCancelaCurso();">Cancelar Curso</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- Lista de inscritos, cancelados, solicitados -->
<div class="modal fade" id="modalDetalleInscritos" tabindex="-1"
	role="dialog" aria-labelledby="modalDetalleInscritos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title" id="titleInscritos" style="display:none;">Funcionarios Inscritos</h3>
				<h3 class="box-title" id="titleSolicitudes" style="display:none;">Solicitudes de inscripci&oacute;n</h3>
				<h3 class="box-title" id="titleCancelados" style="display:none;">Cancelaciones</h3>
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
						<div id="divTableInscritosCurso" style="display:none;"> 
								<div class="row">
									<div class="bomb-5">
										<div class="box-body table-responsive">
											<table id="tblInscritosCurso"
												class="table table-bordered table-striped">
												<thead>
													<tr>
														<th>Funcionario</th>
														<th>Autoriza</th>
														<th>Acciones</th>
													</tr>
												</thead>
												<tbody id="tbodyInscritosCurso">
													<!-- Aqui se insertan los Funcionarios Inscritos -->
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div id="divTableSolicitudesCurso" style="display:none;"> 
								<div class="row">
									<div class="bomb-5">
										<div class="box-body table-responsive">
											<table id="tblSolicitudesCurso"
												class="table table-bordered table-striped">
												<thead>
													<tr>
														<th>Funcionario</th>
														<th>Puesto</th>
														<th>Fecha Solicitud</th>
														<th>Acciones</th>
													</tr>
												</thead>
												<tbody id="tbodySolicitudesCurso">
													<!-- Aqui se insertan las Solicitudes -->
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div id="divTableCanceladosCurso" style="display:none;"> 
								<div class="row">
									<div class="bomb-5">
										<div class="box-body table-responsive">
											<table id="tblCanceladosCurso"
												class="table table-bordered table-striped">
												<thead>
													<tr>
														<th>Funcionario</th>
														<th>Funcionario Cancela</th>
														<th>Motivo cancelaci&oacute;n</th>
														<th>Tipo cancelaci&oacute;n</th>
													</tr>
												</thead>
												<tbody id="tbodyCanceladosCurso">
													<!-- Aqui se insertan los Funcionarios Cancelados -->
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
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<!-- Lista de funcionarios para inscripcion -->
<div class="modal fade" id="modalFuncionariosInscribir" tabindex="-1"
	role="dialog" aria-labelledby="modalFuncionariosInscribir" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title" id="titleInscritos" >Inscribir funcionarios</h3>
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
						<div id="divTableFuncionariosInscripcion" > 
							<div class="row">
								<div class="bomb-5">
									<div class="box-body table-responsive">
										<table id="tblInscribirCurso"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>RFC</th>
													<th>Nombre</th>
													<th>Puesto</th>
													<th>Seleccionar</th>
												</tr>
											</thead>
											<tbody id="tbodyFuncionariosInscripcion">
												<!-- Aqui se insertan los Funcionarios que se pueden inscribir -->
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
				<button type="button" class="btn" onclick="inscribirFuncionarios();">Inscribir</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
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
				<button type="button" class="btn" onclick="refreshEditAgenda();">Cerrar</button>
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
									<label>Motivo de cancelaci&oacute;n</label> 
									<select class="form-control" id="selectMotivoCancelacion" required="">
										<option value="">Seleccione...</option>
									</select>
								</div>
							</div>
							<div class="col-md-6" id="divCancelacionJustificada" style="display:none;">
								<div class="checkbox">
									<label> <input id="iptCheckJustificada" type="checkbox"> Justificada
									</label>
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

<div class="modal fade" id="modalDetalleToyota1" tabindex="-1"
	role="dialog" aria-labelledby="modalNewFuncionario" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Detalle Asesores</h3>
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
								<div class=" table-responsive">
									<table id="example1" class="table table-bordered table-striped">
										<thead>
											<tr>
												<th>Nivel</th>
												<th>Total</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Basico</td>
												<td>230</td>
												<td></td>
											</tr>
											<tr>
												<td>Avanzado</td>
												<td>330</td>
												<td></td>
											</tr>
											<tr>
												<td>Sin certificaci&oacute;n</td>
												<td>40</td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
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

<div class="modal fade" id="modalReporteCursos" tabindex="-1"
	role="dialog" aria-labelledby="modalReporteCursos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Exportar cursos</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<input type="hidden" id="iptIdEmpresaReporte">
				<h1>Seleccione los datos para exportar</h1>
				
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="iptInicioReporteCurso">Fecha de inicio</label>
							<input type="date" class="form-control"
								id="iptInicioDetalleCalificaciones" placeholder="Fecha de Inicio" type="date" pattern="yyyy-MM-dd"
								value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>'
								/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="iptFinReporteCurso">Fecha de fin</label>
							<input type="date" class="form-control"
								id="iptFinDetalleCalificaciones" placeholder="Fecha de Fin" type="date" pattern="yyyy-MM-dd"
								value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>'
								/>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>Proyecto</label> 
							<select class="form-control" id="selectProyectoReporteCurso">
								<option value="0">Todos...</option>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>Curso</label> 
							<select class="form-control" id="selectCursoReporteCurso">
								<option value="0">Todos...</option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>Instructor</label> 
							<select class="form-control" id="selectInstructorReporteCurso">
								<option value="0">Todos...</option>
								<c:forEach var="instructor" items="${lstInstructores}">
									<option value="${instructor.id}"><c:out value="${instructor.funcionario.datosFuncionarioVO.nombres} ${instructor.funcionario.datosFuncionarioVO.apellidoUno} ${instructor.funcionario.datosFuncionarioVO.apellidoDos}"/> </option>
								</c:forEach>	
							</select>
						</div>
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="exportaCursos();">Exportar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalInscripcionMasiva" tabindex="-1"
	role="dialog" aria-labelledby="modalInscripcionMasiva" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Carga Masia</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
<!-- form start -->
					<form role="form" id="formCargaMasiva" action="javascript:saveInscripcionMasiva();"
							enctype="multipart/form-data" method=POST class="" >
						<div class="row">
							<div class="col-md-12" style="text-align: center;">
								<div class="form-group">
									<label for="iptCargaMasivaIcono">Inscipci&oacute;n masiva</label> 
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
										   accept=".csv" onchange="inUploadChange(this)">
									<p class="help-block">&nbsp;&nbsp;&nbsp;Tipo de archivo aceptado: CSV (Separados por ",")</p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12" style="text-align: center;">
								<button type="submit" class="btn btn-primary">Inscribir</button>
							</div>
						</div>
					</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalInscripcionMasivaResp" tabindex="-1"
	role="dialog" aria-labelledby="modalInscripcionMasivaResp" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Resultado</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12" style="text-align: center;">
						<div class="form-group">
							<label for="iptCargaMasivaIcono">Errores al inscribir</label> 
						</div>
					</div>
				</div>
				<div class="row">
					<div class="bomb-5">
						<div class="box-body table-responsive">
							<table id="gerentesZona"
								class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Linea</th>
									</tr>
								</thead>
								<tbody id="tbodyErrores">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>



<link href="<c:url value='/resources/plugins/fullcalendar/packages/core/main.css' />" rel='stylesheet' />
<link href="<c:url value='/resources/plugins/fullcalendar/packages/daygrid/main.css' />" rel='stylesheet' />
<link href="<c:url value='/resources/plugins/fullcalendar/packages/timegrid/main.css' />" rel='stylesheet' />
<link href="<c:url value='/resources/plugins/fullcalendar/packages/list/main.css' />" rel='stylesheet' />


<script src="<c:url value='/resources/plugins/fullcalendar/vendor/rrule.js' />"></script>
<script src="<c:url value='/resources/plugins/fullcalendar/packages/core/main.js' />"></script>
<script src="<c:url value='/resources/plugins/fullcalendar/packages/interaction/main.js' />"></script>
<script src="<c:url value='/resources/plugins/fullcalendar/packages/daygrid/main.js' />"></script>
<script src="<c:url value='/resources/plugins/fullcalendar/packages/timegrid/main.js' />"></script>
<script src="<c:url value='/resources/plugins/fullcalendar/packages/list/main.js' />"></script>
<script src="<c:url value='/resources/plugins/fullcalendar/packages/rrule/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/core/locales-all.js' />"></script>




<script type="text/javascript">
	window.Parsley.addValidator('dateformat', {
	    validate: function(value, id) {
	        alert(value)
	    },
	    messages: {
	        en: 'Please provide date in format dd/mm/yyyy'
	    }
	}) 
</script>








<script type="text/javascript">

	document.addEventListener('DOMContentLoaded', function() {
		<c:if test="${not empty dashboardLst}">
			<c:forEach items="${dashboardLst}" var="dashboard">
				var calendarEl${dashboard.empresa.id} = document.getElementById('calendario${dashboard.empresa.id}');
	
			    var calendar${dashboard.empresa.id} = new FullCalendar.Calendar(calendarEl${dashboard.empresa.id}, {
			      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'rrule' ],
			      header: {
			        left: 'prev,next ',
			        center: 'title',
			        right: 'today'
			      },
			      locale: 'es',
			      editable: true,
			      events: [
			      	<c:if test="${not empty dashboard.eventos}">
						<c:forEach items="${dashboard.eventos}" var="calendario">
						{
			                title: '${calendario.cursoVO.codigo} - ${calendario.cursoVO.nombre}',
			                start: new Date('<fmt:formatDate value="${calendario.fechaInicio}" pattern="yyyy/MM/dd" />'),
			                backgroundColor: "${calendario.color}", //Info (aqua)
			                borderColor: "${calendario.color}", //Info (aqua)
			                id:${calendario.id}
			            },
						</c:forEach>
			       	</c:if>
			      ],
			      eventClick: function(arg) {
			    	  openAgendarCurso(arg.event.id);
			      }
			    });
	
			    calendar${dashboard.empresa.id}.render();
			    
			</c:forEach>
		</c:if>
		<c:if test="${not empty dashboardLst}">
			<c:forEach items="${dashboardLst}" var="dashboard">
				$('#tab${dashboard.empresa.id}').addClass('tab-pane');
			</c:forEach>
		</c:if>
	
	});

	
  

</script>


<script>

	$('#iptCheckJustificada').on('ifUnchecked', function(event){
		$('#divMsgCancelacionJ').hide();
		$('#divMsgCancelacion').show();
		$('#divDocumentoJustificado').hide();
	});
	
	$('#iptCheckJustificada').on('ifChecked', function(event){
		$('#divMsgCancelacion').hide();
		$('#divMsgCancelacionJ').show();
		$('#divDocumentoJustificado').show();
	});

</script>

<script type="text/javascript">
	generaRepositorio = function(){
		
		var urltxt = ctx + '/calendario/generaRepositorio';
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			beforeSend : function() {
				maskBody();
			},
			complete : function() {
				unmaskBody();
			},
			success : function(response) {
				
				var result = response[0];
				var msg = response[1];
				
				if (result) {
					alert('termino');
					
				} else {
					alert('error');
				}
			},
			error : function(msg) {
				alert('error');
			}
		});
	}
</script>

