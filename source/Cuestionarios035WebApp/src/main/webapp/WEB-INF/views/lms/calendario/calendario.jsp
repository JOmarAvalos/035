<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script src="<c:url value='/resources/js/admin/calendario.js' />"
	type="text/javascript"></script>

<main class="l-main inscripciones">
<nav aria-label="breadcrumb" role="navigation">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#"><spring:message
					code="lms.calendario.inscripciones.title" /></a></li>
	</ol>
</nav>
<div class="content-wrapper admin_wrap">
	<div class="row">
		<div class="col-md-12">
			<div class="nav-tabs-custom">
				<div class="tab-content">
					<div class="row">
						<div class="col-md-2">
								<div class="notas-calendario">
									<p class="txt-gray">
										<i class="fas fa-circle"></i> <spring:message code="lms.calendario.curso.vacio" />
									</p>
									<p class="txt-blue">
										<i class="fas fa-circle"></i> <spring:message code="lms.calendario.solicitudes" />
									</p>
									<p class="txt-green">
				                        <c:if test="${not empty empresa}">
										    <c:if test="${!fn:contains(empresa, 'TOY')}">
												<i class="fas fa-circle"></i> <spring:message code="lms.calendario.funcionarios" />
										    </c:if>
										    <c:if test="${fn:contains(empresa, 'TOY')}">
												<i class="fas fa-circle"></i> <spring:message code="lms.calendario.funcionarios.toy" />
										    </c:if>
									    </c:if>
									</p>
									<p class="txt-orange">
										<i class="fas fa-circle"></i> <spring:message code="lms.calendario.cupo" />
									</p>
									<p class="txt-red">
										<i class="fas fa-circle"></i> <spring:message code="lms.calendario.cancelado" />
									</p>
									<p class="txt-amazul">
										<i class="fa fa-circle"></i><spring:message code="lms.calendario.impartido" />
									</p>
			                        <c:if test="${not empty empresa}">
									    <c:if test="${!fn:contains(empresa, 'TOY')}">
											<button type="button" class="md-btn md-btn-main my-0" onclick="openGeneraInvitacion();"><spring:message code="lms.calendario.btn.funcionarios" /></button>
									    </c:if>
									    <c:if test="${fn:contains(empresa, 'TOY')}">
											<button type="button" class="md-btn md-btn-main my-0" onclick="openGeneraInvitacion();"><spring:message code="lms.calendario.btn.funcionarios.toy" /></button>
									    </c:if>
								    </c:if>
									
								</div>
							</div>
						<div class="col-md-8">
							<div class="box box-primary">
								<div class="box-header"></div>
								<div class="box-body no-padding">
									<!-- THE CALENDAR -->
									<div id="calendario"></div>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /. box -->
						</div>
						<!-- /.col -->
						<div class="col-md-2"></div>

					</div>
					<!-- /.row -->
				</div>
				<!-- /.tab-content -->
			</div>
			<!-- nav-tabs-custom -->
		</div>
	</div>
</div>



<!-- MODAL INSCRIPCIONES -->

<div class="modal fade edit-func" id="modal-inscripciones">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<div class="row">
					<div class="col-sm-6">
						<h6><spring:message code="lms.calendario.inscripciones.modulo" /></h6>
						<h2 id="iptCursoTitulo"></h2>
						<p>
							<i class="fas fa-users mr-1"></i> <span id="iptNoInscritos"></span>
						</p>
					</div>
						<div class="col-sm-6 txt-small">
							<p>
								<span> 
									<i class="fas fa-calendar-alt"></i>
									<span id="iptfecha"></span>
								</span> 
								<span>
									<i class="fas fa-chalkboard-teacher"></i> 
									<span id="iptTipoCurso"></span>
								</span>								
							</p>
							<p>
								<span> 
									<i class="fas fa-clock"></i> 
									<span id="iptTiempo"></span>
								</span>
							</p>
							<p>
								<i class="fas fa-synagogue"></i> <span id="iptNombreSede"></span>
							</p>
						</div>
						<button type="button" class="close" data-dismiss="modal">
						<div class="leftright"></div>
						<div class="rightleft"></div>
						<label class="close-label"><spring:message code="lms.calendario.inscripciones.label.cerrar" /></label>
					</button>
				</div>
			</div>
			<!-- Modal body -->
			<div class="modal-body pb-0">
				<div class="row">
					<div class="col">
						<!-- TABS -->
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="inscribir-tab" data-toggle="tab" href="#inscribir-content"
								role="tab" aria-controls="inscribir-content"
								aria-selected="true"> <i class="fas fa-user-plus"></i> <span><spring:message code="lms.calendario.inscripciones.inscribir.title" /></span>
							</a></li>
							<li class="nav-item"><a class="nav-link" id="inscritos-tab"
								data-toggle="tab" href="#inscritos-content" role="tab"
								aria-controls="inscritos-content" aria-selected="false"> <i
									class="fas fa-users"></i> <span><spring:message code="lms.calendario.inscripciones.inscritos.title" /></span> <b id="iptNoTotalInscritos">(5)</b>
							</a></li>
							<li class="nav-item"><a class="nav-link"
								id="solicitudes-tab" data-toggle="tab"
								href="#solicitudes-content" role="tab"
								aria-controls="solicitudes-content" aria-selected="false"> <i
									class="fas fa-spinner"></i> <span><span><spring:message code="lms.calendario.inscripciones.solicitudes.title" /></span> <b id="iptNoTotalSolicitudes">(3)</b>
							</a></li>
						</ul>

						<!-- TABS CONTENT -->
						<div class="tab-content">

							<!-- ====TAB INSCRIBIR==== -->

							<div class="tab-pane fade show active" id="inscribir-content"
								role="tabpanel" aria-labelledby="inscribir-tab">
		                        <c:if test="${not empty empresa}">
								    <c:if test="${!fn:contains(empresa, 'TOY')}">
										<h3><spring:message code="lms.calendario.inscripciones.inscribir.subtitle" /></h3>
								    </c:if>
								    <c:if test="${fn:contains(empresa, 'TOY')}">
										<h3><spring:message code="lms.calendario.inscripciones.inscribir.subtitle.toy" /></h3>
								    </c:if>
							    </c:if>
								<!-- Filtros -->
								<div class="row justify-content-justify">
									<div class="col-6 ">
										<div class="search_bar text-left">
											<input type="search" id="search_input_all"
												onkeyup="FilterkeyWord_all_table()"
												placeholder="<spring:message code="lms.calendario.inscripciones.inscribir.label.buscar" />"><span></span>
										</div>
									</div>
									<div class="col-6" style="display: none;">
										<div class="form-Group">
											<div class="input-group">
												<select id="internal-select-picker"
													class="form-control selectpicker" data-live-search="true"
													title="Puesto">
													<option value=""><spring:message code="lms.calendario.inscripciones.inscribir.op.puesto1" /></option>
													<option value=""><spring:message code="lms.calendario.inscripciones.inscribir.op.puesto2" /></option>
													<option value=""><spring:message code="lms.calendario.inscripciones.inscribir.op.puesto3" /></option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<hr class="my-3">

								<div class=""></div>
								<!-- tabla -->
								<div class="row">
									<div class="col">
										<div id="listFuncionarios" class="tables-modal table-responsive-sm">
<!-- 											<table class="table table-striped table-sm table-borderless"
												id="table-cu">
												<thead>
													<tr>
														<th class="text-left">Nombre</th>
														<th class="text-center">Puesto</th>
														<th class="text-center">Acción</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>María Pérez Sosa</td>
														<td class="text-center">Puesto administración
															administrada</td>
														<td class="text-center">
															<button class="add-user"></button>
														</td>
													</tr>
													<tr>
														<td>Susana Distancia</td>
														<td class="text-center">Puesto dentro de la
															organización</td>
														<td class="text-center">
															<button href="#" class="add-user"></button>
														</td>
													</tr>
													<tr>
														<td>Susana Distancia</td>
														<td class="text-center">Puesto dentro de la
															organización</td>
														<td class="text-center">
															<button class="delete-user"></button>
														</td>
													</tr>
													<tr>
														<td>Susana Distancia</td>
														<td class="text-center">Puesto dentro de la
															organización</td>
														<td class="text-center">
															<button class="delete-user"></button>
														</td>
													</tr>
													<tr>
														<td>Susana Distancia</td>
														<td class="text-center">Puesto dentro de la
															organización</td>
														<td class="text-center">
															<button class="add-user"></button>
														</td>
													</tr>
													<tr>
														<td>Susana Distancia</td>
														<td class="text-center">Puesto dentro de la
															organización</td>
														<td class="text-center">
															<button class="delete-user"></button>
														</td>
													</tr>
													<tr>
														<td>Susana Distancia</td>
														<td class="text-center">Puesto dentro de la
															organización</td>
														<td class="text-center">
															<button class="delete-user"></button>
														</td>
													</tr>
													<tr>
														<td>Susana Distancia</td>
														<td class="text-center">Puesto dentro de la
															organización</td>
														<td class="text-center">
															<button class="delete-user"></button>
														</td>
													</tr>
													<tr>
														<td>Susana Distancia</td>
														<td class="text-center">Puesto dentro de la
															organización</td>
														<td class="text-center">
															<button class="delete-user"></button>
														</td>
													</tr>
													<tr>
														<td>Susana Distancia</td>
														<td class="text-center">Puesto dentro de la
															organización</td>
														<td class="text-center">
															<button class="delete-user"></button>
														</td>
													</tr>
													<tr>
														<td>Susana Distancia</td>
														<td class="text-center">Puesto dentro de la
															organización</td>
														<td class="text-center">
															<button class="delete-user"></button>
														</td>
													</tr>
													<tr>
														<td>Susana Distancia</td>
														<td class="text-center">Puesto dentro de la
															organización</td>
														<td class="text-center">
															<button class="delete-user"></button>
														</td>
													</tr>

												</tbody>
											</table> -->
										</div>
										<!--		Start Pagination -->
									</div>
								</div>
								<div class="row justify-content-center">
									<div class="col-6">
										<div class="num_rows">
											<div class="form-group">
												<select class="form-control" name="state" id="maxRows">
													<option value="10"><spring:message code="lms.calendario.inscripciones.inscribir.num.rows.op10" /></option>
													<option value="15"><spring:message code="lms.calendario.inscripciones.inscribir.num.rows.op15" /></option>
													<option value="20"><spring:message code="lms.calendario.inscripciones.inscribir.num.rows.op20" /></option>
													<option value="50"><spring:message code="lms.calendario.inscripciones.inscribir.num.rows.op50" /></option>
													<option value="70"><spring:message code="lms.calendario.inscripciones.inscribir.num.rows.op70" /></option>
													<option value="100"><spring:message code="lms.calendario.inscripciones.inscribir.num.rows.op100" /></option>
													<option value="5000"><spring:message code="lms.calendario.inscripciones.inscribir.num.rows.optext" /></option>
												</select>
											</div>
										</div>
									</div>
									<div class=" col-6">
										<div class='pagination-container'>
											<nav>
												<ul class="pagination">
													<!--	Here the JS Function Will Add the Rows -->
												</ul>
											</nav>
										</div>
									</div>

								</div>
								<!-- End Tabla -->
							</div>

							<!-- ====TAB INSCRITOS==== -->

							<div class="tab-pane fade" id="inscritos-content" role="tabpanel"
								aria-labelledby="inscritos-tab">
		                        <c:if test="${not empty empresa}">
								    <c:if test="${!fn:contains(empresa, 'TOY')}">
										<h3><spring:message code="lms.calendario.inscripciones.inscritos.subtitle" /></h3>
								    </c:if>
								    <c:if test="${fn:contains(empresa, 'TOY')}">
										<h3><spring:message code="lms.calendario.inscripciones.inscritos.subtitle.toy" /></h3>
								    </c:if>
							    </c:if>
								<!-- Filtros -->
								<hr class="my-3">
								<!-- tabla -->
								<div class="row">
									<div class="col">
										<div id="listInscripciones"
											class="tables-modal table-responsive-sm"></div>
										<!--		Start Pagination -->
									</div>
								</div>
								<!-- End Tabla -->
							</div>

							<!-- ====TAB SOLICITUDES==== -->

							<div class="tab-pane fade" id="solicitudes-content"
								role="tabpanel" aria-labelledby="solicitudes-tab">
								<h3><spring:message code="lms.calendario.inscripciones.solicitudes.subtitle" /></h3>
								<!-- Filtros -->
								<hr class="my-3">
								<!-- tabla -->
								<div class="row">
									<div class="col">
										<div id="listSolicitudes"
											class="tables-modal table-responsive-sm"></div>
										<!--		Start Pagination -->
									</div>
								</div>
								<!-- End Tabla -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer pt-0 mb-2">
				<input type="hidden" id="iptEventoCalendarioId" value="">
				<button type="button" class="md-btn md-btn-close my-0"
					data-dismiss="modal">
					<i class="fas fa-times"></i> <spring:message code="lms.calendario.inscripciones.btn.cancelar" />
				</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalDetalleToyota1" tabindex="-1"
	role="dialog" aria-labelledby="modalNewFuncionario" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"><spring:message code="lms.calendario.detalle" /></h3>
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
												<th><spring:message code="lms.calendario.detalle.table.nivel" /></th>
												<th><spring:message code="lms.calendario.detalle.table.total" /></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><spring:message code="lms.calendario.detalle.table.nivel.basico" /></td>
												<td><spring:message code="lms.calendario.detalle.table.total230" /></td>
												<td></td>
											</tr>
											<tr>
												<td><spring:message code="lms.calendario.detalle.table.nivel.avanzado" /></td>
												<td><spring:message code="lms.calendario.detalle.table.total330" /></td>
												<td></td>
											</tr>
											<tr>
												<td><spring:message code="lms.calendario.detalle.table.nivel.certi" /></td>
												<td><spring:message code="lms.calendario.detalle.table.total40" /></td>
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
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal"><spring:message code="lms.calendario.detalle.btn.cerrar" /></button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalRespuesta" tabindex="-1" role="dialog"
	aria-labelledby="modalRespuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"><spring:message code="lms.calendario.inscripcion" /></h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<div class="box-body">
						<h4 id="modalTxtRespuesta" style="color: black;"></h4>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal"><spring:message code="lms.calendario.inscripcion.btn.aceptar" /></button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalRespuestaCancelacion" tabindex="-1" role="dialog"
	aria-labelledby="modalRespuestaCancelacion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"><spring:message code="lms.calendario.cancelado.titulo" /></h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header">
						<h4 style="color: black;"><spring:message code="lms.calendario.cancelado.mensaje" /></h4>
					</div>
					<div class="box-body" style="color: grey;">
						<p style="color:black;" class="bold"><spring:message code="lms.calendario.cancelado.reinscribir" /></p>
						
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label><spring:message code="lms.calendario.cancelado.reinscribir.feha" /></label> 
									<select class="form-control" id="selectNuevaFecha">
										<option value=""><spring:message code="lms.calendario.cancelacion.select"/></option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="md-btn md-btn-main" data-dismiss="modal"><spring:message code="lms.calendario.cancelado.reinscribir.btn" /></button>
				<button type="button" class="md-btn md-btn-close" data-dismiss="modal"><spring:message code="lms.calendario.cancelacion.btn.cerrar" /></button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalAdvertenciaCancelacion" tabindex="-1"
	role="dialog" aria-labelledby="modalAdvertenciaCancelacion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"><spring:message code="lms.calendario.cancelacion" /></h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<input type="hidden" id="iptIdInscripcionCanc">
						<input type="hidden" id="ipAplicaCosto" value="false">
						<div class="row">
							<div class="col-md-12">
								<h4><spring:message code="lms.calendario.cancelacion.msg" /></h4>
								<h4><spring:message code="lms.calendario.cancelacion.msg.contacto" /></h4>
								
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<p style="color:red;" class="bold" id="pCostoCancelacion"><spring:message code="lms.calendario.cancelacion.msg2" /></p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label><spring:message code="lms.calendario.cancelacion.label.motivo" /></label> 
									<select class="form-control" id="selectMotivoCancelacion" required="">
										<option value=""><spring:message code="lms.calendario.cancelacion.select" /></option>
										<c:if test="${not empty lstMotivoCancelacion}">
											<c:forEach items="${lstMotivoCancelacion}" var="motivoCancelacion">
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
				<button type="button" class="md-btn md-btn-close my-0" onclick="cancelaInscripcion();"><spring:message code="lms.calendario.cancelacion.btn.cancelar" /></button>
				<button type="button" class="md-btn md-btn-close my-0" data-dismiss="modal" ><spring:message code="lms.calendario.cancelacion.btn.cerrar" /></button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalMotivoObligatorio" tabindex="-1"
	role="dialog" aria-labelledby="modalMotivoObligatorio" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"><spring:message code="lms.calendario.advertencia.motivo" /></h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<h4><spring:message code="lms.calendario.advertencia.motivo.msg" /></h4>
								
							</div>
						</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="md-btn md-btn-close my-0" data-dismiss="modal" ><spring:message code="lms.calendario.advertencia.btn.cerrar" /></button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalInvitacionDistribuidor" tabindex="-1"
	role="dialog" aria-labelledby="modalInvitacionDistribuidor" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"><spring:message code="lms.calendario.advertencia.inv" /></h3>
			</div>
			<div class="modal-body" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<h4><spring:message code="lms.calendario.advertencia.inv.msg" /></h4>
								
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptInicioInvitacionDist"><spring:message code="lms.calendario.advertencia.inv.fecha.inicio" /></label>
									<input type="date" class="form-control"
										id="iptInicioInvitacionDist" placeholder="Fecha de Inicio" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptFinInvitacionDist"><spring:message code="lms.calendario.advertencia.inv.fecha.fin" /></label>
									<input type="date" class="form-control"
										id="iptFinInvitacionDist" placeholder="Fecha de Fin" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label><spring:message code="lms.calendario.advertencia.inv.dealer" /></label> 
									<select class="form-control" id="selectDealerInv" >
										<option value=""><spring:message code="lms.calendario.advertencia.inv.select" /></option>
										<c:if test="${not empty lstDealer}">
											<c:forEach items="${lstDealer}" var="dealer">
												<option value="${dealer.id}">${dealer.nombre}</option>
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
				<button type="button" class="md-btn md-btn-main my-0" onclick="generaInvitacionDist();"><spring:message code="lms.calendario.advertencia.inv.btn.exportar" /></button>
				<button type="button" class="md-btn md-btn-close my-0" data-dismiss="modal" ><spring:message code="lms.calendario.advertencia.inv.btn.cerrar" /></button>
			</div>
		</div>
	</div>
</div>

<!-- MODAL ERROR DATOS OBLIGATORIOS-->
<div class="modal fade" id="modalDatosObligatorios" tabindex="-1"
	role="dialog" aria-labelledby="modalDatosObligatorios" aria-hidden="true" >
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd error-modal-content">
			<div class="modal-header">
				<h4 class="modal-title uppercase txt-red text-center">
				 	<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
				 	<br> <spring:message code="lms.calendario.error" />
				</h4>
			</div>
	        <div class="modal-body">
	            <div class="row">
	                <div class="col">
	                	<p class="bold"><spring:message code="lms.calendario.error.msg" /></p>
	                </div>
	            </div>
	            <hr>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.calendario.error.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>
</main>

<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/core/main.css' />"
	rel='stylesheet' />
<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/daygrid/main.css' />"
	rel='stylesheet' />
<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/timegrid/main.css' />"
	rel='stylesheet' />
<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/list/main.css' />"
	rel='stylesheet' />
<script
	src="<c:url value='/resources/plugins/fullcalendar/vendor/rrule.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/core/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/interaction/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/daygrid/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/timegrid/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/list/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/rrule/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/core/locales-all.js' />"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendario');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'rrule' ],
      header: {
        left: 'prev,next ',
        center: 'title',
        right: 'today'
      },
      <c:if test="${not empty locale}">
	      locale: '${locale}',
	  </c:if>
	  <c:if test="${empty locale}">
	      locale: 'es',
	  </c:if>
      editable: true,
      events: [
      	<c:if test="${not empty lstCalendario}">
			<c:forEach items="${lstCalendario}" var="calendario">
			{
				<c:if test="${not empty locale}">
				    <c:if test="${fn:contains(locale, 'es')}">
				        title: '${calendario.cursoVO.codigo} - ${calendario.cursoVO.nombre}',
				    </c:if>
				    <c:if test="${fn:contains(locale, 'en')}">
				    	title: '${calendario.cursoVO.codigo} - ${calendario.cursoVO.nombreEn}',
				    </c:if>
				    <c:if test="${fn:contains(locale, 'fr')}">
				    	title: '${calendario.cursoVO.codigo} - ${calendario.cursoVO.nombreFr}',
				    </c:if>
				</c:if>
				<c:if test="${empty locale}">
				    title: '${calendario.cursoVO.codigo} - ${calendario.cursoVO.nombre}',
				</c:if> 
                start: new Date(${calendario.auxFechaInicio}),
                end: new Date(${calendario.auxFechaFin}),
                backgroundColor: "${calendario.color}", //Info (aqua)
                borderColor: "${calendario.color}", //Info (aqua)
                id:${calendario.id}
            },
			</c:forEach>
       	</c:if>
      ],
      eventClick: function(arg) {
        //alert(arg.event.id);
        var idEvento=arg.event.id;
        $("#iptEventoCalendarioId").val('');
        $('#iptCursoTitulo').html('');
        $('#iptNoInscritos').html(''); 
        $('#iptNoTotalInscritos').html('');
        $('#iptNoTotalSolicitudes').html('');
        $('#iptfecha').html('');
      	$('#iptTipoCurso').html('');
      	$('#iptTiempo').html('');    	
      	$('#iptNombreSede').html(''); 
		$('#listFuncionarios').html('');
		$('#listFuncionarios').append('');
    	$('#listInscripciones').html('');
		$('#listInscripciones').append('');
		$('#listSolicitudes').html('');
		$('#pCostoCancelacion').html('');
		$('#listSolicitudes').append('');
		$('#pCostoCancelacion').hide();
        getEventoInscripciones(idEvento);
    	$('#modal-inscripciones').modal({backdrop: 'static', keyboard: false});
      }
    });

    getEventoInscripciones = function(id) {

		var urltxt = ctx + '/lms/inscripciones/getEventoInscripciones?id='+id;
		
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
				
				if (response[0]) {
					
					var object = response[1];
					var object2 =response[2];
					var object3 =response[3];
					var object4 =response[4];
					var object5 =response[5];
					var tiempo =formatDateHora(new Date(object.fechaInicio))+'  -  '+formatDateHora(new Date(object.fechaFin));
					var htmlAddCancelacion = '<spring:message code="lms.calendario.cancelacion.msg2" />';
					
					htmlAddCancelacion += object.costoCancelacion;
					htmlAddCancelacion += ' !';
					$("#iptEventoCalendarioId").val(object.id);    			    	
					<c:if test="${not empty locale}">
					    <c:if test="${fn:contains(locale, 'es')}">
						    $('#iptCursoTitulo').append(object.cursoVO.codigo + '-  ' +object.cursoVO.nombre);
					    </c:if>
					    <c:if test="${fn:contains(locale, 'en')}">
						    $('#iptCursoTitulo').append(object.cursoVO.codigo + '-  ' +object.cursoVO.nombreEn);
					    </c:if>
					    <c:if test="${fn:contains(locale, 'fr')}">
						    $('#iptCursoTitulo').append(object.cursoVO.codigo + '-  ' +object.cursoVO.nombreFr);
					    </c:if>
					</c:if>
					<c:if test="${empty locale}">
					    $('#iptCursoTitulo').append(object.cursoVO.codigo + '-  ' +object.cursoVO.nombre);
					</c:if> 
				    $('#pCostoCancelacion').append(htmlAddCancelacion);
				    $('#iptNoInscritos').append(object2+' a '+object.asistentesMaximo);
			        $('#iptfecha').append(formatDate(new Date(object.fechaInicio)));
				    $('#iptTipoCurso').append(object.cursoVO.tipoCurso.nombre);
				    $('#iptTiempo').append(tiempo); 
				    if(object.sedeVO != null){
					    $('#iptNombreSede').append(object.sedeVO.nombre);
				    }
			        $('#iptNoTotalInscritos').append('('+object2+')');
			        $('#iptNoTotalSolicitudes').append('('+object3+')');
			        
			        if(object.aplicaCostoCancelacion){
			        	$('#pCostoCancelacion').show();
			        	$('#ipAplicaCosto').val('true');
			        }else{
			        	$('#pCostoCancelacion').hide();
			        	$('#ipAplicaCosto').val('false');
			        }
			        
			        
			        if(object.asistentesMaximo == 0){
				        disponibilidad = 999;
			        }else{
				        disponibilidad = object.asistentesMaximo - object2;
			        }
				  
			        tablaSolicitudes(object.solicitados, disponibilidad,object5);
				    tablaInscripciones(object.inscritos,object5);
				  
				    tablaFuncionarios(object4,disponibilidad,object5);
									
				} else {
					$('#modalTxtRespuesta').html('');
					$('#modalTxtRespuesta').append('Error');
					$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				alert('Error alert');
			}
		});
	}
    
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [day, month,year].join('-');
    }
    function formatDateHora(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            hora = '' + d.getHours(),
            min = '' + d.getMinutes(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;
        if (hora.length < 2) hora = '0' + hora;
        if (min.length < 2) min = '0' + min;
        var fecha =[day, month,year].join('-')+' '+ [hora,min].join(':')+' hrs';
        return fecha;
    }
    
    tablaFuncionarios = function(funcionarios, disponibilidad, edita) {

		var html = '';
		var cabecera='';
		var cuerpo='';
		<c:if test="${not empty locale}">
		    <c:if test="${fn:contains(locale, 'es')}">
				cabecera='<table class="table table-sm table-border table-hover">'
					+'<thead><tr><th class="text-left">Rfc</th><th class="text-left">Nombre</th><th>Puesto</th><th>Acción</th></tr></thead>';	
		    </c:if>
		    <c:if test="${fn:contains(locale, 'en')}">
				cabecera='<table class="table table-sm table-border table-hover">'
					+'<thead><tr><th class="text-left">Rfc</th><th class="text-left">Name</th><th>Position</th><th>Action</th></tr></thead>';	
		    </c:if>
		    <c:if test="${fn:contains(locale, 'fr')}">
				cabecera='<table class="table table-sm table-border table-hover">'
					+'<thead><tr><th class="text-left">Rfc</th><th class="text-left">Prénom</th><th>Position</th><th>Action</th></tr></thead>';	
		    </c:if>
		</c:if>
		<c:if test="${empty locale}">
			cabecera='<table class="table table-sm table-border table-hover">'
				+'<thead><tr><th class="text-left">Rfc</th><th class="text-left">Nombre</th><th>Puesto</th><th>Acción</th></tr></thead>';	
		</c:if> 
		for (var i = 0; i < funcionarios.length; i++) {
			var idUsuarioFuncionario = funcionarios[i].idUsuario;	
			var nombre =funcionarios[i].datosFuncionarioVO.nombres + ' '+ funcionarios[i].datosFuncionarioVO.apellidoUno+' '+funcionarios[i].datosFuncionarioVO.apellidoDos ;
			var puesto=funcionarios[i].funcionarioPuestoVO.auxPuesto.nombre;
			var rfc=funcionarios[i].rfc;
			if(edita && disponibilidad > 0){
				cuerpo += '<tr><td class="text-left">' + rfc + '</td><td class="text-left">' + nombre + '</td><td>' + puesto + '</td><td><button class="add-user"onclick="saveInscripcion('+idUsuarioFuncionario+');"></button></td> <tr>';
			}else{
				cuerpo += '<tr><td class="text-left">' + rfc + '</td><td class="text-left">' + nombre + '</td><td>' + puesto + '</td><td></td> <tr>';
			}
		}
		html =cabecera+cuerpo+'</table>';
		$('#listFuncionarios').append(html);
    }
    
    tablaInscripciones = function(eventoInsc, edita) {

		var html = '';
		var cabecera='';
		var cuerpo='';
		<c:if test="${not empty locale}">
		    <c:if test="${fn:contains(locale, 'es')}">
				cabecera='<table class="table table-hover table-sm table-border">'
					+'<thead><tr><th class="text-left">Nombre</th><th>Puesto</th><th>Inscrito por</th><th>Intentos</th><th>Acción</th></tr></thead>';	
		    </c:if>
		    <c:if test="${fn:contains(locale, 'en')}">
				cabecera='<table class="table table-hover table-sm table-border">'
					+'<thead><tr><th class="text-left">Name</th><th>Position</th><th>Enrolled by</th><th>Attempts</th><th>Action</th></tr></thead>';	
		    </c:if>
		    <c:if test="${fn:contains(locale, 'fr')}">
				cabecera='<table class="table table-hover table-sm table-border">'
					+'<thead><tr><th class="text-left">Prénom</th><th>Poste</th><th>Inscrit par</th><th>Tentatives</th><th>Action</th></tr></thead>';	
		    </c:if>
		</c:if>
		<c:if test="${empty locale}">
			cabecera='<table class="table table-hover table-sm table-border">'
				+'<thead><tr><th class="text-left">Nombre</th><th>Puesto</th><th>Inscrito por</th><th>Intentos</th><th>Acción</th></tr></thead>';	
		</c:if> 
		for (var i = 0; i < eventoInsc.length; i++) {
			var idUsuario = eventoInsc[i].idUsuario;
			var id = eventoInsc[i].id;	
			var intentos = eventoInsc[i].intentos;		
			var nombre =eventoInsc[i].funcionarioEstatus.datosFuncionarioVO.nombres + ' '+ eventoInsc[i].funcionarioEstatus.datosFuncionarioVO.apellidoUno+' '+eventoInsc[i].funcionarioEstatus.datosFuncionarioVO.apellidoDos ;
			var puesto=eventoInsc[i].funcionarioEstatus.funcionarioPuestoVO.auxPuesto.nombre;
			var inscritoPor= eventoInsc[i].funcionarioBy.datosFuncionarioVO.nombres + ' '+ eventoInsc[i].funcionarioBy.datosFuncionarioVO.apellidoUno+' '+eventoInsc[i].funcionarioBy.datosFuncionarioVO.apellidoDos ;
			if(edita){
				cuerpo += '<tr><td class="text-left">' + nombre + '</td><td>' + puesto + '</td><td>'+inscritoPor+'</td><td>'+intentos+'</td><td><button class="delete-user"onclick="showCancelaInscripcion('+id+');"></button></td> <tr>';
			}else{
				cuerpo += '<tr><td class="text-left">' + nombre + '</td><td>' + puesto + '</td><td>'+inscritoPor+'</td><td>'+intentos+'</td><td></td> <tr>';
			}
												
		}
		html =cabecera+cuerpo+'</table>';
		$('#listInscripciones').append(html);
    }
    
    tablaSolicitudes = function(eventoInsc, disponibilidad, edita) {
    	
		var html = '';
		var cabecera='';
		var cuerpo='';
		<c:if test="${not empty locale}">
		    <c:if test="${fn:contains(locale, 'es')}">
				cabecera='<table class="table table-hover table-sm table-border">'
					+'<thead><tr><th class="text-left">Nombre</th><th>Puesto</th><th>Intentos</th><th>Acción</th></tr></thead>';	
		    </c:if>
		    <c:if test="${fn:contains(locale, 'en')}">
				cabecera='<table class="table table-hover table-sm table-border">'
					+'<thead><tr><th class="text-left">Name</th><th>Position</th><th>Attempts</th><th>Action</th></tr></thead>';	
		    </c:if>
		    <c:if test="${fn:contains(locale, 'fr')}">
				cabecera='<table class="table table-hover table-sm table-border">'
					+'<thead><tr><th class="text-left">Prénom</th><th>Poste</th><th>Tentatives</th><th>Action</th></tr></thead>';	
		    </c:if>
		</c:if>
		<c:if test="${empty locale}">
			cabecera='<table class="table table-hover table-sm table-border">'
				+'<thead><tr><th class="text-left">Nombre</th><th>Puesto</th><th>Intentos</th><th>Acción</th></tr></thead>';	
		</c:if> 
		for (var i = 0; i < eventoInsc.length; i++) {
			var idUsuario = eventoInsc[i].idUsuario;
			var id = eventoInsc[i].id;
			var intentos = eventoInsc[i].intentos;
			var nombre =eventoInsc[i].funcionarioEstatus.datosFuncionarioVO.nombres + ' '+ eventoInsc[i].funcionarioEstatus.datosFuncionarioVO.apellidoUno+' '+eventoInsc[i].funcionarioEstatus.datosFuncionarioVO.apellidoDos ;
			var puesto=eventoInsc[i].funcionarioEstatus.funcionarioPuestoVO.auxPuesto.nombre;
			var puedeInscribirse = eventoInsc[i].puedeInscribirse;
			if(disponibilidad > 0 && puedeInscribirse && edita){
				cuerpo += '<tr><td class="text-left">' + nombre + '</td><td>' + puesto + '</td><td>'+intentos+'</td><td><button class="add-user" onclick="agregarInscripcion('+id+');"></button><button class="delete-user" onclick="rechazarInscripcion('+id+');"></button></td> <tr>';
			}else{
				cuerpo += '<tr><td class="text-left">' + nombre + '</td><td>' + puesto + '</td><td>'+intentos+'</td><td></td> <tr>';
			}
		
		}
		html =cabecera+cuerpo+'</table>';
		$('#listSolicitudes').append(html);
    }
    calendar.render();
    
    
    var calendarEl2 = document.getElementById('calendario2');

    var calendar2 = new FullCalendar.Calendar(calendarEl2, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'rrule' ],
      header: {
        left: 'prev,next ',
        center: 'title',
        right: 'today'
      },
      editable: true,
      events: [
      	<c:if test="${not empty lstCalendario}">
			<c:forEach items="${lstCalendario}" var="calendario">
			{
                title: '${calendario.cursoVO.nombre}',
                start: new Date(${calendario.auxFechaInicio}),
                end: new Date(${calendario.auxFechaFin}),
                backgroundColor: "${calendario.color}", //Info (aqua)
                borderColor: "${calendario.color}", //Info (aqua)
                id:${calendario.id}
            },
			</c:forEach>
       	</c:if>
      ],
      eventClick: function(arg) {
        alert(arg.event.id);
      }
    });

    calendar2.render();
    
    $('#tabToyota').addClass('tab-pane active');
    $('#tabMitsu').addClass('tab-pane');
    
  });
  
  

</script>