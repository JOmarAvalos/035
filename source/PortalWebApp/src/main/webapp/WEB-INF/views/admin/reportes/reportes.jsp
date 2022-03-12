
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="<c:url value='/resources/css/AdminLTE.css' />"
	rel="stylesheet" type="text/css" />
<script
	src="<c:url value='/resources/js/admin/reportes.js' />"
	type="text/javascript"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Reportes</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="box mb-5">
			<div class="box-header"></div>
			<!-- /.box-header -->
			<div class="box-body table-responsive">

				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="width: 75%; text-align: center;">Nombre</th>
							<th style="width: 25%; text-align: center;">Acciones</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty lstReportes}">
							<c:forEach var="reporte" items="${lstReportes}">
								<tr>
									<td>${reporte.nombre}</td>
									<c:if test="${reporte.id == 1}">
										<td><button class="btn btn-primary" onclick="showFuncionariosTodos();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 2}">
										<td><button class="btn btn-primary" onclick="showFuncionariosPrincipales();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 3}">
										<td><button class="btn btn-primary" onclick="showIndicadores();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 4}">
										<td><button class="btn btn-primary" onclick="showCenso();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 5}">
										<td><button class="btn btn-primary" onclick="generaListaInscripcionEder();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 6}">
										<td><button class="btn btn-primary" onclick="showCobranza();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 7}">
										<td><button class="btn btn-primary" onclick="openAsesores();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 8}">
										<td><button class="btn btn-primary" onclick="openCerAS();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 9}">
										<td><button class="btn btn-primary" onclick="openCerASSPP();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 10}">
										<td><button class="btn btn-primary" onclick="openCerTec();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 11}">
										<td><button class="btn btn-primary" onclick="openCerTecSPP();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 12}">
										<td><button class="btn btn-primary" onclick="openCerTecKPI();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 13}">
										<td><button class="btn btn-primary" onclick="openCerTecKPISPP();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 14}">
										<td><button class="btn btn-primary" onclick="openCerTecMes();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 15}">
										<td><button class="btn btn-primary" onclick="openCerTecMesSPP();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 16}">
										<td><button class="btn btn-primary" onclick="openCuadernillos();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 17}">
										<td><button class="btn btn-primary" onclick="generaCensoGeneralEDER();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 18}">
										<td><button class="btn btn-primary" onclick="generaDealersEDER();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 19}">
										<td><button class="btn btn-primary" onclick="openNotasDojo();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 20}">
										<td><button class="btn btn-primary" onclick="openCobrosFYA();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 21}">
										<td><button class="btn btn-primary" onclick="openCalculoCancelacion();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 22}">
										<td><button class="btn btn-primary" onclick="openInscSintetico();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 23}">
										<td><button class="btn btn-primary" onclick="openInvitacionDistribuidor();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 24}">
										<td><button class="btn btn-primary" onclick="generaSkillAS();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 25}">
										<td><button class="btn btn-primary" onclick="generaSkillTec();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 26}">
										<td><button class="btn btn-primary" onclick="generaTecnicos();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 27}">
										<td><button class="btn btn-primary" onclick="openSkillDNAsesores();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 28}">
										<td><button class="btn btn-primary" onclick="openSkillDNTecnicos();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 29}">
										<td><button class="btn btn-primary" onclick="openCalifToyota();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 30}">
										<td><button class="btn btn-primary" onclick="openMatrizToyota();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 31}">
										<td><button class="btn btn-primary" onclick="openCalendarioCursos();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 32}">
										<td><button class="btn btn-primary" onclick="generaDSC();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 33}">
										<td><button class="btn btn-primary" onclick="generaRCE();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 34}">
										<td><button class="btn btn-primary" onclick="generaMezclaTrabajo();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 35}">
										<td><button class="btn btn-primary" onclick="generaDSC();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 36}">
										<td><button class="btn btn-primary" onclick="generaDSC();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 37}">
										<td><button class="btn btn-primary" onclick="openReporteNecDetalle();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 38}">
										<td><button class="btn btn-primary" onclick="generaDSC();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 39}">
										<td><button class="btn btn-primary" onclick="generaDSC();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 40}">
										<td><button class="btn btn-primary" onclick="generaDSC();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 41}">
										<td><button class="btn btn-primary" onclick="generaDSC();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 42}">
										<td><button class="btn btn-primary" onclick="generaDSC();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 43}">
										<td></td>
									</c:if>
									<c:if test="${reporte.id == 44}">
										<td><button class="btn btn-primary" onclick="openCalificacionCursoActividad();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 45}">
										<td><button class="btn btn-primary" onclick="openDetalleCalificaciones();" >Exportar</button></td>
									</c:if>
									<c:if test="${reporte.id == 46}">
										<td><button class="btn btn-primary" onclick="openDetalleCalificacionesHorizontal();" >Exportar</button></td>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</section>

	<!-- /.content -->
</aside>
<!-- /.right-side -->



<div class="modal fade" id="modalReporteFuncionariosTodos" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteFuncionariosTodos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Funcionarios todos</h3>
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
									<label>Empresa</label> 
									<select class="form-control" id="selectEmpresaFuncTodos">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstEmpresa}">
											<c:forEach var="empresa" items="${lstEmpresa}">
												<option value="${empresa.id}"><c:out
														value="${empresa.nombre}" />
												</option>
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
				<button type="button" class="btn" onclick="generaFuncionariosTodos();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteFuncionariosPrincipales" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteFuncionariosPrincipales" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Funcionarios principales</h3>
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
									<label>Empresa</label> 
									<select class="form-control" id="selectEmpresaFuncPrinc">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstEmpresa}">
											<c:forEach var="empresa" items="${lstEmpresa}">
												<option value="${empresa.id}"><c:out
														value="${empresa.nombre}" />
												</option>
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
				<button type="button" class="btn" onclick="generaFuncionariosPrinc();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteIndicadores" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteIndicadores" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Indicadores</h3>
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
									<label>Mes</label> 
									<select class="form-control" id="selectMesIndicadores">
										<option value="0">Seleccione...</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaIndicadores();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCenso" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCenso" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Censo</h3>
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
									<label>Empresa</label> 
									<select class="form-control" id="selectEmpresaCenso">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstEmpresa}">
											<c:forEach var="empresa" items="${lstEmpresa}">
												<option value="${empresa.id}"><c:out
														value="${empresa.nombre}" />
												</option>
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
				<button type="button" class="btn" onclick="generaCenso();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteListaInscripcion" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteListaInscripcion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Lista Inscripci&oacute;n</h3>
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
									<label>Empresa</label> 
									<select class="form-control" id="selectEmpresaListaInscripcion">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstEmpresa}">
											<c:forEach var="empresa" items="${lstEmpresa}">
												<option value="${empresa.id}"><c:out
														value="${empresa.nombre}" />
												</option>
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
				<button type="button" class="btn" onclick="generaListaInscripcion();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCobranza" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCobranza" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Cobranza</h3>
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
									<label>Empresa</label> 
									<select class="form-control" id="selectEmpresaCobranza">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstEmpresa}">
											<c:forEach var="empresa" items="${lstEmpresa}">
												<option value="${empresa.id}"><c:out
														value="${empresa.nombre}" />
												</option>
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
				<button type="button" class="btn" onclick="generaCobranza();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCerAs" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCerAs" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte de Certificaci&oacute;n de Asesores de Servicio</h3>
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
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptInicioCerAs">Fecha de inicio</label>
									<input type="date" class="form-control"
										id="iptInicioCerAs" placeholder="Fecha de Inicio" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptFinCerAs">Fecha de fin</label>
									<input type="date" class="form-control"
										id="iptFinCerAs" placeholder="Fecha de Fin" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCerAs();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCerAsSPP" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCerAsSPP" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte de Certificaci&oacute;n de Asesores de Servicio SPP</h3>
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
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptInicioCerAsSPP">Fecha de inicio</label>
									<input type="date" class="form-control"
										id="iptInicioCerAsSPP" placeholder="Fecha de Inicio" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptFinCerAsSPP">Fecha de fin</label>
									<input type="date" class="form-control"
										id="iptFinCerAsSPP" placeholder="Fecha de Fin" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCerAsSPP();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCerTec" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCerTec" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte Certificaci&oacute;n Tecnicos</h3>
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
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptInicioCerTec">Fecha de inicio</label>
									<input type="date" class="form-control"
										id="iptInicioCerTec" placeholder="Fecha de Inicio" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptFinCerTec">Fecha de fin</label>
									<input type="date" class="form-control"
										id="iptFinCerTec" placeholder="Fecha de Fin" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCerTec();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCerTecSPP" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCerTecSPP" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte Certificaci&oacute;n Tecnicos SPP</h3>
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
									<label>Periodo</label> 
									<select class="form-control" id="selectPeriodoCerTecSPP">
										<option value="07/2021">Julio 2021</option>
										<option value="06/2021" selected="selected">Junio 2021</option>
										<option value="05/2021">Mayo 2021</option>
										<option value="04/2021">Abril 2021</option>
										<option value="03/2021">Marzo 2021</option>
										<option value="02/2021">Febrero 2021</option>
										<option value="01/2021">Enero 2021</option>
										<option value="12/2020">Diciembre 2020</option>
										<option value="11/2020">Noviembre 2020</option>
										<option value="10/2020">Octubre 2020</option>
										<option value="09/2020">Septiembre 2020</option>
										<option value="08/2020">Agosto 2020</option>
										<option value="07/2020">Julio 2020</option>
										<option value="06/2020">Junio 2020</option>
										<option value="05/2020">Mayo 2020</option>
										<option value="04/2020">Abril 2020</option>
										<option value="03/2020">Marzo 2020</option>
										
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptInicioCerTecSPP">Fecha de inicio</label>
									<input type="date" class="form-control"
										id="iptInicioCerTecSPP" placeholder="Fecha de Inicio" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptFinCerTecSPP">Fecha de fin</label>
									<input type="date" class="form-control"
										id="iptFinCerTTecSPP" placeholder="Fecha de Fin" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCerTecSPP();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCerTecKPI" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCerTecKPI" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte Certificaci&oacute;n Tecnicos KPI</h3>
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
									<label>Periodo</label> 
									<select class="form-control" id="selectPeriodoCerTecKPI">
										<option value="07/2021">Julio 2021</option>
										<option value="06/2021" selected="selected">Junio 2021</option>
										<option value="05/2021">Mayo 2021</option>
										<option value="04/2021">Abril 2021</option>
										<option value="03/2021">Marzo 2021</option>
										<option value="02/2021">Febrero 2021</option>
										<option value="01/2021">Enero 2021</option>
										<option value="12/2020">Diciembre 2020</option>
										<option value="11/2020">Noviembre 2020</option>
										<option value="10/2020">Octubre 2020</option>
										<option value="09/2020">Septiembre 2020</option>
										<option value="08/2020">Agosto 2020</option>
										<option value="07/2020">Julio 2020</option>
										<option value="06/2020">Junio 2020</option>
										<option value="05/2020">Mayo 2020</option>
										<option value="04/2020">Abril 2020</option>
										<option value="03/2020">Marzo 2020</option>
										
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCerTecKPI();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCerTecKPISPP" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCerTecKPISPP" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte Certificaci&oacute;n Tecnicos KPI SPP</h3>
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
									<label>Periodo</label> 
									<select class="form-control" id="selectPeriodoCerTecKPISPP">
										<option value="07/2021">Julio 2021</option>
										<option value="06/2021" selected="selected">Junio 2021</option>
										<option value="05/2021">Mayo 2021</option>
										<option value="04/2021">Abril 2021</option>
										<option value="03/2021">Marzo 2021</option>
										<option value="02/2021">Febrero 2021</option>
										<option value="01/2021">Enero 2021</option>
										<option value="12/2020">Diciembre 2020</option>
										<option value="11/2020">Noviembre 2020</option>
										<option value="10/2020">Octubre 2020</option>
										<option value="09/2020">Septiembre 2020</option>
										<option value="08/2020">Agosto 2020</option>
										<option value="07/2020">Julio 2020</option>
										<option value="06/2020">Junio 2020</option>
										<option value="05/2020">Mayo 2020</option>
										<option value="04/2020">Abril 2020</option>
										<option value="03/2020">Marzo 2020</option>
										
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCerTecKPISPP();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCerTecMes" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCerTecMes" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte Certificaci&oacute;n Tecnicos Mes</h3>
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
									<label>Periodo</label> 
									<select class="form-control" id="selectPeriodoCerTecMes">
										<option value="07/2021">Julio 2021</option>
										<option value="06/2021" selected="selected">Junio 2021</option>
										<option value="05/2021">Mayo 2021</option>
										<option value="04/2021">Abril 2021</option>
										<option value="03/2021">Marzo 2021</option>
										<option value="02/2021">Febrero 2021</option>
										<option value="01/2021">Enero 2021</option>
										<option value="12/2020">Diciembre 2020</option>
										<option value="11/2020">Noviembre 2020</option>
										<option value="10/2020">Octubre 2020</option>
										<option value="09/2020">Septiembre 2020</option>
										<option value="08/2020">Agosto 2020</option>
										<option value="07/2020">Julio 2020</option>
										<option value="06/2020">Junio 2020</option>
										<option value="05/2020">Mayo 2020</option>
										<option value="04/2020">Abril 2020</option>
										<option value="03/2020">Marzo 2020</option>
										
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCerTecMes();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCerTecMesSPP" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCerTecMesSPP" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte Certificaci&oacute;n Tecnicos Mes SPP</h3>
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
									<label>Periodo</label> 
									<select class="form-control" id="selectPeriodoCerTecMesSPP">
										<option value="07/2021">Julio 2021</option>
										<option value="06/2021" selected="selected">Junio 2021</option>
										<option value="05/2021">Mayo 2021</option>
										<option value="04/2021">Abril 2021</option>
										<option value="03/2021">Marzo 2021</option>
										<option value="02/2021">Febrero 2021</option>
										<option value="01/2021">Enero 2021</option>
										<option value="12/2020">Diciembre 2020</option>
										<option value="11/2020">Noviembre 2020</option>
										<option value="10/2020">Octubre 2020</option>
										<option value="09/2020">Septiembre 2020</option>
										<option value="08/2020">Agosto 2020</option>
										<option value="07/2020">Julio 2020</option>
										<option value="06/2020">Junio 2020</option>
										<option value="05/2020">Mayo 2020</option>
										<option value="04/2020">Abril 2020</option>
										<option value="03/2020">Marzo 2020</option>
										
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCerTecMesSPP();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCuadernillos" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCuadernillos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte de cuadernillos entregados</h3>
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
									<label>Periodo</label> 
									<select class="form-control" id="selectPeriodoCuadernillos">
										<option value="07/2021">Julio 2021</option>
										<option value="06/2021" selected="selected">Junio 2021</option>
										<option value="05/2021">Mayo 2021</option>
										<option value="04/2021">Abril 2021</option>
										<option value="03/2021">Marzo 2021</option>
										<option value="02/2021">Febrero 2021</option>
										<option value="01/2021">Enero 2021</option>
										<option value="12/2020">Diciembre 2020</option>
										<option value="11/2020">Noviembre 2020</option>
										<option value="10/2020">Octubre 2020</option>
										<option value="09/2020">Septiembre 2020</option>
										<option value="08/2020">Agosto 2020</option>
										<option value="07/2020">Julio 2020</option>
										<option value="06/2020">Junio 2020</option>
										<option value="05/2020">Mayo 2020</option>
										<option value="04/2020">Abril 2020</option>
										<option value="03/2020">Marzo 2020</option>
										
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCuadernillos();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteNotasDojo" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteNotasDojo" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Notas Dojo</h3>
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
									<label>Periodo</label> 
									<select class="form-control" id="selectPeriodoNotasDojo">
										<option value="07/2021">Julio 2021</option>
										<option value="06/2021" selected="selected">Junio 2021</option>
										<option value="05/2021">Mayo 2021</option>
										<option value="04/2021">Abril 2021</option>
										<option value="03/2021">Marzo 2021</option>
										<option value="02/2021">Febrero 2021</option>
										<option value="01/2021">Enero 2021</option>
										<option value="12/2020">Diciembre 2020</option>
										<option value="11/2020">Noviembre 2020</option>
										<option value="10/2020">Octubre 2020</option>
										<option value="09/2020">Septiembre 2020</option>
										<option value="08/2020">Agosto 2020</option>
										<option value="07/2020">Julio 2020</option>
										<option value="06/2020">Junio 2020</option>
										<option value="05/2020">Mayo 2020</option>
										<option value="04/2020">Abril 2020</option>
										<option value="03/2020">Marzo 2020</option>
										
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaNotasDojo();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCobrosFYA" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCobrosFYA" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte de cobros para finanzas y auditores</h3>
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
									<label>Periodo</label> 
									<select class="form-control" id="selectPeriodoFYA">
										<option value="07/2021">Julio 2021</option>
										<option value="06/2021" selected="selected">Junio 2021</option>
										<option value="05/2021">Mayo 2021</option>
										<option value="04/2021">Abril 2021</option>
										<option value="03/2021">Marzo 2021</option>
										<option value="02/2021">Febrero 2021</option>
										<option value="01/2021">Enero 2021</option>
										<option value="12/2020">Diciembre 2020</option>
										<option value="11/2020">Noviembre 2020</option>
										<option value="10/2020">Octubre 2020</option>
										<option value="09/2020">Septiembre 2020</option>
										<option value="08/2020">Agosto 2020</option>
										<option value="07/2020">Julio 2020</option>
										<option value="06/2020">Junio 2020</option>
										<option value="05/2020">Mayo 2020</option>
										<option value="04/2020">Abril 2020</option>
										<option value="03/2020">Marzo 2020</option>
										
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaNotasDojo();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteCalculoCancelacion" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteCalculoCancelacion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte de calculo de cancelaci&oacute;n</h3>
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
									<label>Periodo</label> 
									<select class="form-control" id="selectPeriodoCalculoCancelacion">
										<option value="07/2021">Julio 2021</option>
										<option value="06/2021" selected="selected">Junio 2021</option>
										<option value="05/2021">Mayo 2021</option>
										<option value="04/2021">Abril 2021</option>
										<option value="03/2021">Marzo 2021</option>
										<option value="02/2021">Febrero 2021</option>
										<option value="01/2021">Enero 2021</option>
										<option value="12/2020">Diciembre 2020</option>
										<option value="11/2020">Noviembre 2020</option>
										<option value="10/2020">Octubre 2020</option>
										<option value="09/2020">Septiembre 2020</option>
										<option value="08/2020">Agosto 2020</option>
										<option value="07/2020">Julio 2020</option>
										<option value="06/2020">Junio 2020</option>
										<option value="05/2020">Mayo 2020</option>
										<option value="04/2020">Abril 2020</option>
										<option value="03/2020">Marzo 2020</option>
										
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCalculoCancelacion();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalInscNoSCancNoES" tabindex="-1" role="dialog"
	aria-labelledby="modalInscNoSCancNoES" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte de calculo de cancelaci&oacute;n</h3>
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
									<label>Periodo</label> 
									<select class="form-control" id="selectPeriodoInscNosCancNoES">
										<option value="07/2021">Julio 2021</option>
										<option value="06/2021" selected="selected">Junio 2021</option>
										<option value="05/2021">Mayo 2021</option>
										<option value="04/2021">Abril 2021</option>
										<option value="03/2021">Marzo 2021</option>
										<option value="02/2021">Febrero 2021</option>
										<option value="01/2021">Enero 2021</option>
										<option value="12/2020">Diciembre 2020</option>
										<option value="11/2020">Noviembre 2020</option>
										<option value="10/2020">Octubre 2020</option>
										<option value="09/2020">Septiembre 2020</option>
										<option value="08/2020">Agosto 2020</option>
										<option value="07/2020">Julio 2020</option>
										<option value="06/2020">Junio 2020</option>
										<option value="05/2020">Mayo 2020</option>
										<option value="04/2020">Abril 2020</option>
										<option value="03/2020">Marzo 2020</option>
										
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaInscripcionesSintetico();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalInvitacionDistribuidor" tabindex="-1" role="dialog"
	aria-labelledby="modalInscNoSCancNoES" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Invitaci&oacte;n por distribuidor</h3>
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
									<label>Empresa</label> 
									<select class="form-control" id="selectEmpresaInvitacionDist" onchange="getGrupoDealerEmpresaInv()">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstEmpresa}">
											<c:forEach items="${lstEmpresa}" var="empresa">
												<option value="${empresa.id}">${empresa.nombre}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Grupo de dealer</label> 
									<select class="form-control" id="selectGrupoDInvitacionDist" onchange="getDealerInvitPorDealer()">
										<option value="0">Seleccione...</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Dealer</label> 
									<select class="form-control" id="selectDealerInvitacionDist">
										<option value="0">Seleccione...</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptInicioInvitDist">Fecha de inicio</label>
									<input type="date" class="form-control"
										id="iptInicioInvitDist" placeholder="Fecha de Inicio" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptFinInvitDist">Fecha de fin</label>
									<input type="date" class="form-control"
										id="iptFinInvitDist" placeholder="Fecha de Fin" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaInvitacionDistribuidor();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalSkillDNAsesores" tabindex="-1" role="dialog"
	aria-labelledby="modalSkillDNAsesores" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte Skill DN Asesores</h3>
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
									<select class="form-control" id="selectGrupoDSkillDNAsesores" onchange="getDealerSkillDNAsesores()">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstGrupos}">
											<c:forEach items="${lstGrupos}" var="grupo">
												<option value="${grupo.id}">${grupo.agrupacion}</option>
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
									<select class="form-control" id="selectDealerSkillDNAsesores">
										<option value="0">Seleccione...</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaSkillDNAsesores();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalSkillDNTecnicos" tabindex="-1" role="dialog"
	aria-labelledby="modalSkillDNTecnicos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte Skill DN Tecnicos</h3>
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
									<select class="form-control" id="selectGrupoDSkillDNTecnicos" onchange="getDealerSkillDNTecnicos()">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstGrupos}">
											<c:forEach items="${lstGrupos}" var="grupo">
												<option value="${grupo.id}">${grupo.agrupacion}</option>
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
									<select class="form-control" id="selectDealerSkillDNTecnicos">
										<option value="0">Seleccione...</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaSkillDNTecnicos();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalCalifToyota" tabindex="-1" role="dialog"
	aria-labelledby="modalCalifToyota" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte Calificaci&oacute;n Toyota</h3>
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
									<select class="form-control" id="selectGrupoDCalifToyota" onchange="getDealerCalifToyota()">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstGrupos}">
											<c:forEach items="${lstGrupos}" var="grupo">
												<option value="${grupo.id}">${grupo.agrupacion}</option>
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
									<select class="form-control" id="selectDealerCalifToyota">
										<option value="0">Seleccione...</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCalifToyota();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalMatrizToyota" tabindex="-1" role="dialog"
	aria-labelledby="modalMatrizToyota" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte Matriz Toyota</h3>
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
									<select class="form-control" id="selectGrupoDMatrizToyota" onchange="getDealerMatrizToyota()">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstGrupos}">
											<c:forEach items="${lstGrupos}" var="grupo">
												<option value="${grupo.id}">${grupo.agrupacion}</option>
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
									<select class="form-control" id="selectDealerMatrizToyota">
										<option value="0">Seleccione...</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaMatrizToyota();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>


<div class="modal fade" id="modalCalendarioCursos" tabindex="-1" role="dialog"
	aria-labelledby="modalCalendarioCursos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Reporte Matriz Toyota</h3>
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
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptInicioCalendarioCursos">Fecha de inicio</label>
									<input type="date" class="form-control"
										id="iptInicioCalendarioCursos" placeholder="Fecha de Inicio" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptFinCalendarioCursos">Fecha de fin</label>
									<input type="date" class="form-control"
										id="iptFinCalendarioCursos" placeholder="Fecha de Fin" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaCalendarioCursos();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalCalificacionCursoActividad" tabindex="-1" role="dialog"
	aria-labelledby="modalCalificacionCursoActividad" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">REPORTE DE CALIFICACIONES POR CURSO Y ACTIVIDAD</h3>
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
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptInicioCalificacionCursoActividad">Fecha de inicio</label>
									<input type="date" class="form-control"
										id="iptInicioCalificacionCursoActividad" placeholder="Fecha de Inicio" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptFinCalificacionCursoActividad">Fecha de fin</label>
									<input type="date" class="form-control"
										id="iptFinCalificacionCursoActividad" placeholder="Fecha de Fin" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Empresa</label> 
									<select class="form-control" id="selectEmpresaCalificacionCursoActividad">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstEmpresa}">
											<c:forEach var="empresa" items="${lstEmpresa}">
												<option value="${empresa.id}"><c:out
														value="${empresa.nombre}" />
												</option>
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
				<button type="button" class="btn" onclick="generaCalificacionCursoActividad();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalDetalleCalificaciones" tabindex="-1" role="dialog"
	aria-labelledby="modalDetalleCalificaciones" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">DETALLE DE CALIFICACIONES, RESPUESTAS CONTESTADAS DE UN ALUMNO A DETALLE</h3>
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
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptInicioDetalleCalificaciones">Fecha de inicio</label>
									<input type="date" class="form-control"
										id="iptInicioDetalleCalificaciones" placeholder="Fecha de Inicio" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptFinDetalleCalificaciones">Fecha de fin</label>
									<input type="date" class="form-control"
										id="iptFinDetalleCalificaciones" placeholder="Fecha de Fin" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Empresa</label> 
									<select class="form-control" id="selectEmpresaDetalleCalificaciones">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstEmpresa}">
											<c:forEach var="empresa" items="${lstEmpresa}">
												<option value="${empresa.id}"><c:out
														value="${empresa.nombre}" />
												</option>
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
				<button type="button" class="btn" onclick="generaDetalleCalificaciones();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalReporteNecDetalle" tabindex="-1" role="dialog"
	aria-labelledby="modalReporteNecDetalle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Necesidades de cursos detalle</h3>
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
							<div class="col-md-6">
								<div class="form-group">
									<label>Tipo Curso</label> 
									<select class="form-control" id="selectTipoCursoNecDetalle" onchange="getCursosNecDetalle()">
										<option value="1">Online</option>
										<option value="2">Presencial</option>
										<option value="3">WBT eLearning</option>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Curso</label> 
									<select class="form-control" id="selectCursoNecDetalle">
										<option value="0">Seleccione...</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaNecCursoDetalle();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="modalDetalleCalificacionesHorizontal" tabindex="-1" role="dialog"
	aria-labelledby="modalDetalleCalificacionesHorizontal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">DETALLE DE CALIFICACIONES V2</h3>
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
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptInicioDetalleCalificacionesHorizontal">Fecha de inicio</label>
									<input type="date" class="form-control"
										id="iptInicioDetalleCalificacionesHorizontal" placeholder="Fecha de Inicio" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="iptFinDetalleCalificacionesHorizontal">Fecha de fin</label>
									<input type="date" class="form-control"
										id="iptFinDetalleCalificacionesHorizontal" placeholder="Fecha de Fin" type="date" pattern="yyyy-MM-dd"
										value='<fmt:formatDate value="${defaultDate}" type="date" pattern="yyyy-MM-dd"/>'
										/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Empresa</label> 
									<select class="form-control" id="selectEmpresaDetalleCalificacionesHorizontal" onchange="validateEmpresaDetalle();">
										<option value="0">Seleccione...</option>
										<c:if test="${not empty lstEmpresa}">
											<c:forEach var="empresa" items="${lstEmpresa}">
												<option value="${empresa.id}"><c:out value="${empresa.nombre}" />
												</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>Encuesta</label> 
									<select class="form-control" id="selectEmpresaDetalleEncuesta">
										<option value="0">Seleccione...</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="generaDetalleCalificacionesV2();">Generar</button>
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
    $(function() {
    	$('#example1').dataTable({
            "bPaginate": false,
            "bLengthChange": false,
            "bFilter": true,
            "bSort": false,
            "bInfo": false,
            "bAutoWidth": true,
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
            }
        });
    });
</script>

