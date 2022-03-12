

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.teknei.com/jsp/tags"%>


<jsp:useBean id="now" class="java.util.Date" />


<script src="<c:url value='/resources/js/admin/funcionarios.js' />"
	type="text/javascript"></script>


<sec:hasAccess module="ADMIN_USER" var="admin_user" />

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Detalle de funcionario</h1>
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

		<!-- Tarjeta de datos -->
		<div class="row col-md-12">
			<div class="col-md-12 box box-solid callout callout-info">
				<div id="accordionDatos" role="tablist" class="contact-accordion">
					<div class="ca-wrapp">
						<div class="card-header" role="tab" id="headingOne">
							<div data-toggle="collapse"
								data-target="#collapseDatos" aria-expanded="true"
								aria-controls="collapseDatos" class="clearfix">
									<div class="pull-right box-tools">
										<div class="up-accordion">
											<button class="btn btn-default btn-sm"
												data-widget="collapse" data-toggle="tooltip" title=""
												data-original-title="Collapse">
												<i class="fa fa-caret-down"></i>
											</button>
										</div>
									</div>
								<h4>
									<b>Datos Personales </b>
								</h4>
							</div>
						</div>
						<br>
						<div id="collapseDatos" class=""
							role="tabpanel" aria-labelledby="headingOne"
							data-parent="#accordionDatos">
							
							<form role="form">
									<input type="hidden" id="iptIdFuncionario"
										value="${infoFuncionario.id}">
									<input type="hidden" id="iptIdUsuario"
										value="${infoFuncionario.idUsuario}">
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptEmpresa">Empresa</label>
												<input type="text" class="form-control" id="iptEmpresa"
													placeholder="Empresa" value="${infoFuncionario.auxEmpresaStr}"
													readonly="readonly">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptRfcFuncionario">RFC</label>
												<input type="text" class="form-control" id="iptRfcFuncionario"
													placeholder="RFC" onchange="validaRFC();"
													value="${infoFuncionario.rfc}" readonly="readonly">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptPeriodoPrueba">Periodo de prueba</label>
												<input type="date" class="form-control"
													id="iptPeriodoPrueba" placeholder="Periodo de prueba"
													value='<fmt:formatDate value="${infoFuncionario.periodoPrueba}" type="date" pattern="yyyy-MM-dd"/>' onchange="showActualizaPeriodo();">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptWorkidFuncionario">Work ID</label>
												<input type="text" onkeypress="return isNumberKey(event)"
													class="form-control" id="iptWorkidFuncionario"
													placeholder="Work Id" value="${infoFuncionario.workId}"
													maxlength="10" onchange="showActualizaWorkId();">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptNombresFuncionario">Nombre</label>
												<input type="text" class="form-control"
													id="iptNombresFuncionario" placeholder="Nombre"
													value="${infoFuncionario.datosFuncionarioVO.nombres}"
													maxlength="50">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptApellidoPaternoFuncionario">Apellido
													Paterno</label>
												<input type="text" class="form-control"
													id="iptApellidoPaternoFuncionario"
													placeholder="Apellido Paterno"
													value="${infoFuncionario.datosFuncionarioVO.apellidoUno}"
													maxlength="50">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptApellidoMaternoFuncionario">Apellido
													Materno</label>
												<input type="text" class="form-control"
													id="iptApellidoMaternoFuncionario"
													placeholder="Apellido Materno"
													value="${infoFuncionario.datosFuncionarioVO.apellidoDos}"
													maxlength="50">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptNacimientoFuncionario">Fecha de
													nacimiento</label>
												<input type="date" class="form-control"
													id="iptNacimientoFuncionario" placeholder="Fecha de Nacimiento"
													value='<fmt:formatDate value="${infoFuncionario.datosFuncionarioVO.fechaNacimiento}" type="date" pattern="yyyy-MM-dd"/>'>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptCurpFuncionario">CURP</label>
												<input type="text" class="form-control" id="iptCurpFuncionario"
													placeholder="CURP"
													value="${infoFuncionario.datosFuncionarioVO.curp}"
													maxlength="18">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptNssFuncionario">NSS</label>
												<input type="text" onkeypress="return isNumberKey(event)"
													class="form-control" id="iptNssFuncionario" placeholder="NSS"
													maxlength="11"
													value="${infoFuncionario.datosFuncionarioVO.nss}">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptEmail1Funcionario">Email</label>
												<input type="text" class="form-control"
													id="iptEmail1Funcionario" placeholder="Email"
													value="${infoFuncionario.datosFuncionarioVO.email}"
													maxlength="50">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptEmail2Funcionario">Email Adicional</label>
												<input type="text" class="form-control"
													id="iptEmail2Funcionario" placeholder="Email Adicional"
													value="${infoFuncionario.datosFuncionarioVO.emailAdicional}"
													maxlength="50">
											</div>
										</div>
									</div>
									
									<div class="row">
										
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptNoClinicaFuncionario">No Cl&iacute;nica</label>
												<input type="text" onkeypress="return isNumberKey(event)"
													class="form-control" id="iptNoClinicaFuncionario"
													placeholder="No Clinica"
													value="${infoFuncionario.datosFuncionarioVO.noClinica}"
													maxlength="8">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptClinicaFuncionario">Cl&iacute;nica</label>
												<input type="text" class="form-control"
													id="iptClinicaFuncionario" placeholder="Clinica"
													value="${infoFuncionario.datosFuncionarioVO.clinica}"
													maxlength="50">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptTelefonoFuncionario">Tel&eacute;fono:</label>
												<input type="text" onkeypress="return isNumberKey(event)"
													class="form-control" id="iptTelefonoFuncionario"
													placeholder="Telefono"
													value="${infoFuncionario.datosFuncionarioVO.telefono}"
													maxlength="10">
											</div>
										</div>
										<div class="col-md-1">
											<div class="form-group">
												<label for="iptExtensionFuncionario">Extensi&oacute;n:</label>
												<input type="text" onkeypress="return isNumberKey(event)"
													class="form-control" id="iptExtensionFuncionario"
													placeholder="Extensión"
													value="${infoFuncionario.datosFuncionarioVO.extencion}"
													maxlength="5">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<label for="iptMovilFuncionario">M&oacute;vil:</label>
												<input type="text" onkeypress="return isNumberKey(event)"
													class="form-control" id="iptMovilFuncionario"
													placeholder="Movil"
													value="${infoFuncionario.datosFuncionarioVO.movil}"
													maxlength="10">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptUsuarioCorp">Usuario corporativo:</label>
												<input type="text" class="form-control" value="${infoFuncionario.usuarioCorp}" id="iptUsuarioCorp">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptSexoFuncionario">Sexo: </label>
												<br>
												<c:if
													test="${fn:contains(infoFuncionario.datosFuncionarioVO.sexo, 'M')}">
													<input type="radio" name="hm" id="iptSexoFuncionarioM"
														value="M" checked="checked"> Mujer 
															<input type="radio" name="hm" id="iptSexoFuncionarioH"
														value="H"> Hombre
														</c:if>
												<c:if
													test="${fn:contains(infoFuncionario.datosFuncionarioVO.sexo, 'H')}">
													<input type="radio" name="hm" id="iptSexoFuncionarioM"
														value="M"> Mujer 
															<input type="radio" name="hm" id="iptSexoFuncionarioH"
														value="H" checked="checked"> Hombre
														</c:if>
											</div>
										</div>
										<div class="col-md-3">
											<div class="checkbox">
												<label>
													<input id="iptCheckFuncionarioActivo" type="checkbox"
														disabled="disabled">
													Activo
												</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="iptActivos">Inscripciones actuales:</label>
												<input type="text" class="form-control" value="${infoFuncionario.inscripcionesAbiertas}" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="row">
										<c:if test="${infoFuncionario.banActivo == 1}">
											<c:if test="${infoFuncionario.idEstatusFuncionario == 2 || infoFuncionario.idEstatusFuncionario == 6  || infoFuncionario.idEstatusFuncionario == 12 || infoFuncionario.idEstatusFuncionario == 13}">
												<div class="col-md-2">
													<button type="button" class="btn btn-primary"
														onclick="updateFuncionario();" id="btnSaveFuncionario">Actualizar</button>
												</div>
												<div class="col-md-2">
													<button type="button" class="btn btn-primary"
														onclick="showBajaFuncionario();" id="btnBajaFuncionario">Baja</button>
												</div>
												
												<div class="col-md-2" id="btnPeriodoPrueba" style="display:none;">
													<button type="button" class="btn btn-primary"
														onclick="updatePeriodoPrueba();" >Actualizar Periodo</button>
												</div>
												
												<div class="col-md-2" id="btnWorkId" style="display:none;">
													<button type="button" class="btn btn-primary"
														onclick="updateWorkId();" >Actualizar Work Id</button>
												</div>
												<div class="col-md-2" id="btnCambiiaPwd">
													<button type="button" class="btn btn-primary"
														onclick="showCambiaContrasenia();" >Cambiar contrase&ntilde;a</button>
												</div>
												<div class="col-md-2" id="btnCambiiaPwd">
													<button type="button" class="btn btn-primary"
														onclick="showCambiaRFC();" >Cambiar RFC</button>
												</div>
												
											</c:if>
											<c:if
												test="${infoFuncionario.idEstatusFuncionario == 1 || infoFuncionario.idEstatusFuncionario == 9}">
												<div class="col-md-2">
													<button type="button" class="btn btn-primary"
														onclick="funcionarioRevisado(${infoFuncionario.id});">Validar alta</button>
												</div>
												<div class="col-md-2">
													<button type="button" class="btn btn-primary"
														onclick="showFuncionarioRechazado();">Rechazar alta</button>
												</div>
											</c:if>
											<c:if test="${infoFuncionario.idEstatusFuncionario == 7 }">
												<button type="button" class="btn btn-primary" onclick="verHistoricoDatos();" id="btnVerHistorico">Ver Modificaciones</button>
												<button type="button" class="btn btn-primary" onclick="funcionarioModificadoAceptado(${infoFuncionario.id});" >Validar Modificaciones</button>
											</c:if>
											<c:if test="${infoFuncionario.idEstatusFuncionario == 5}">
												<div class="col-md-2">
													<button type="button" class="btn btn-primary" onclick="autorizaReingreso('${infoFuncionario.auxIngresoVO.id}', '${infoFuncionario.id}');">Autoriza reingreso</button>
												</div>
												<div class="col-md-2">
													<button type="button" class="btn btn-primary"
														onclick="rechazaReingreso('${infoFuncionario.auxIngresoVO.id}', '${infoFuncionario.id}');"
														id="btnBajaFuncionario">Rechaza reingreso</button>
												</div>
												<c:if
													test="${infoFuncionario.auxIngresoVO.requiereDocumento == 1}">
													<div class="col-md-2">
														<button type="button" class="btn btn-primary"
															onclick="verDocumentoFuncionario('CartaLiberacion','${infoFuncionario.auxIngresoVO.id}');"
															id="btnBajaFuncionario">Ver liberaci&oacute;n</button>
													</div>
													<div class="col-md-2">
														<button type="button" class="btn btn-primary"
															onclick="verDocumentoFuncionario('ValidacionGerente','${infoFuncionario.auxIngresoVO.id}');"
															id="btnBajaFuncionario">Ver autorizaci&oacute;n</button>
													</div>
												</c:if>
											</c:if>
										</c:if>
										<c:if test="${infoFuncionario.banActivo == 0}">
											<c:if test="${infoFuncionario.idEstatusFuncionario != 3  && infoFuncionario.idEstatusFuncionario != 11}">
												<div class="col-md-6">
													<button type="button" class="btn btn-primary"
														onclick="reingresoFuncionario();" id="btnReingresoFuncionario">Reingreso</button>
												</div>
											</c:if>
											<c:if test="${infoFuncionario.idEstatusFuncionario == 3 }">
												<div class="col-md-2">
													<button type="button" class="btn btn-primary"
														onclick="funcionarioBajaAceptado(${infoFuncionario.id});">Validar baja</button>
												</div>
												<div class="col-md-2">
													<button type="button" class="btn btn-primary"
														onclick="showFuncionarioBajaRechazado();">Rechazar baja</button>
												</div>
											</c:if>
										</c:if>
									</div>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>	
		
		<!-- Tarjeta de datos End-->
		
		
		<!-- Tarjeta  Hist-->
		<div id="divHistDatos" style="display:none;">
			<div class="row col-md-12" >
				<div class="col-md-12 box box-solid callout callout-info">
					<div id="accordionHistPersonal" role="tablist" class="contact-accordion">
						<div class="ca-wrapp">
							<div class="card-header" role="tab" id="headingOne">
								<div data-toggle="collapse"
									data-target="#collapseHistPersonal" aria-expanded="true"
									aria-controls="collapseOne" class="clearfix">
										<div class="pull-right box-tools">
											<div class="up-accordion">
												<button class="btn btn-default btn-sm"
													data-widget="collapse" data-toggle="tooltip" title=""
													data-original-title="Collapse">
													<i class="fa fa-caret-down"></i>
												</button>
											</div>
										</div>
									<h4>
										<b>Historial Datos Personales</b>
									</h4>
								</div>
							</div>
							<br>
							<div id="collapseHistPersonal" class="collapse "
								role="tabpanel" aria-labelledby="headingOne"
								data-parent="#accordionHistPersonal">
								
								<form role="form">
									<div class="box-body">
										<div class="row">
											<div class="bomb-5">
												<div class="table-responsive">
													<table id="histdtspersonales"
														class="table table-bordered table-striped">
														<thead>
															<tr>
																<th>Nombres</th>
																<th>A. Paterno</th>
																<th>A. Materno</th>
																<th>Nacimiento</th>
																<th>CURP</th>
																<th>Email</th>
																<th>Email Adicional</th>
																<th>NSS</th>
																<th>Tel&eacute;fono</th>
																<th>Extenci&oacute;n</th>
																<th>M&oacute;vil</th>
																<th>No. Cl&iacute;nica</th>
																<th>Cl&iacute;nica</th>
																<th>Sexo</th>
																<th></th>
															</tr>
														</thead>
														<tbody>
															<c:if test="${not empty infoFuncionario.auxHistoricoDatos}">
																<c:forEach items="${infoFuncionario.auxHistoricoDatos}" var="hist">
																	<tr>
																		<th>${hist.nombres}</th>
																		<th>${hist.apellidoUno}</th>
																		<th>${hist.apellidoDos}</th>
																		<th>${hist.auxfechaNacimientoStr}</th>
																		<th>${hist.curp}</th>
																		<th>${hist.email}</th>
																		<th>${hist.emailAdicional}</th>
																		<th>${hist.nss}</th>
																		<th>${hist.telefono}</th>
																		<th>${hist.extencion}</th>
																		<th>${hist.movil}</th>
																		<th>${hist.noClinica}</th>
																		<th>${hist.clinica}</th>
																		<th>${hist.sexo}</th>
																		<th><button type="button" class="btn btn-primary" onclick="showFuncionarioModificadoRechazado('${hist.id}');" >Volver a estos datos</button>
																	</th>
																</c:forEach>
															</c:if>
					
														</tbody>
													</table>
												</div>
					
											</div>
										</div>
									</div>
								</form>
								
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
		<!-- Tarjeta  Hist end-->
		
		<!-- Tarjeta  Documentos-->
		<div class="row col-md-12">
			<div class="col-md-12 box box-solid callout callout-info">
				<div id="accordionDocumentos" role="tablist" class="contact-accordion">
					<div class="ca-wrapp">
						<div class="card-header" role="tab" id="headingOne">
							<div data-toggle="collapse"
								data-target="#collapseDocumentos" aria-expanded="true"
								aria-controls="collapseOne" class="clearfix">
									<div class="pull-right box-tools">
										<div class="up-accordion">
											<button class="btn btn-default btn-sm"
												data-widget="collapse" data-toggle="tooltip" title=""
												data-original-title="Collapse">
												<i class="fa fa-caret-down"></i>
											</button>
										</div>
									</div>
								<h4>
									<b>Documentos de identidad</b>
								</h4>
							</div>
						</div>
						<br>
						<div id="collapseDocumentos" class="collapse "
							role="tabpanel" aria-labelledby="headingOne"
							data-parent="#accordionDoumentos">
								<c:if test="${not empty infoFuncionario.llaveImagenRfc}">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="divImgFotoRFC">Documento RFC</label>
												<div id="divImgFotoRFC" class="cssImgHolder">
													<c:url value="/funcionario/downloadImagePass"
														var="rfcURL">
														<c:param name="param1" value="${infoFuncionario.id}" />
														<c:param name="param2" value="2" />
													</c:url>
													<img width="400" height="400" src="${rfcURL}" height=""
														onclick="$('#modalKycRFCUp').modal({backdrop : true});">
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty infoFuncionario.llaveImagenCurp}">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="divImgFotoCurp">Documento CURP</label>
												<div id="divImgFotoCurp" class="cssImgHolder">
													<c:url value="/funcionario/downloadImagePass"
														var="curpURL">
														<c:param name="param1" value="${infoFuncionario.id}" />
														<c:param name="param2" value="3" />
													</c:url>
													<img width="400" height="400" src="${curpURL}" height=""
														onclick="$('#modalKycCurpUp').modal({backdrop : true});">
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty infoFuncionario.llaveImagenExtranjero}">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="divImgFotoExt">Documento extranjero</label>
												<div id="divImgFotoExt" class="cssImgHolder">
													<c:url value="/funcionario/downloadImagePass"
														var="extranjeroURL">
														<c:param name="param1" value="${infoFuncionario.id}" />
														<c:param name="param2" value="1" />
													</c:url>
													<img width="400" height="400" src="${extranjeroURL}" height=""
														onclick="$('#modalKycExtranjeroUp').modal({backdrop : true});">
												</div>
											</div>
										</div>
									</div>
								</c:if>
								
								<div class="row">
									<c:if test="${infoFuncionario.banExtranjero == 1 }">
										<div class="col-md-3">
											<button class="btn btn-primary" onclick="showUpdateDocumentoImg();">Actualizar documento extranjero</button>
										</div>
									</c:if>
									<c:if test="${infoFuncionario.banExtranjero == 0 }">
										<div class="col-md-3">
											<button class="btn btn-primary" onclick="showUpdateRfcImg();">Actualizar documento RFC</button>
										</div>
										<div class="col-md-3">
											<button class="btn btn-primary" onclick="showUpdateCURPImg();">Actualizar documento CURP</button>
										</div>
									</c:if>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
		<!-- Tarjeta  Documentos end-->
		
		
		<!-- Tarjeta  Puestos-->
		<div class="row col-md-12">
			<div class="col-md-12 box box-solid callout callout-info">
				<div id="accordionPuestos" role="tablist" class="contact-accordion">
					<div class="ca-wrapp">
						<div class="card-header" role="tab" id="headingOne">
							<div data-toggle="collapse"
								data-target="#collapsePuestos" aria-expanded="true"
								aria-controls="collapseOne" class="clearfix">
									<div class="pull-right box-tools">
										<div class="up-accordion">
											<button class="btn btn-default btn-sm"
												data-widget="collapse" data-toggle="tooltip" title=""
												data-original-title="Collapse">
												<i class="fa fa-caret-down"></i>
											</button>
										</div>
									</div>
								<h4>
									<b>Puestos</b>
								</h4>
							</div>
						</div>
						<br>
						<div id="collapsePuestos" class="collapse "
							role="tabpanel" aria-labelledby="headingOne"
							data-parent="#accordionPuestos">
								<div id="listaPuestos">
									<div class="row">
										<c:if test="${infoFuncionario.banActivo == 1}">
											<div class="col-md-6">
												<button class="btn btn-primary" onclick="nuevoPuesto();">Nuevo
													Puesto</button>
											</div>
										</c:if>
										<div class="col-md-6">
											<button class="btn btn-primary" onclick="showHistorico();">Historico</button>
										</div>
									</div>
									<div class="row">
										<div class="bomb-5">
											<div class="table-responsive">
												<table id="puestoFuncionario"
													class="table table-bordered table-striped">
													<thead>
														<tr>
															<th>Puesto</th>
															<th>Dealer</th>
															<th>Activo</th>
															<th>Principal</th>
															<th>Ingreso</th>
															<th>Aplica periodo prueba</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${not empty infoFuncionario.lstPuestosVO}">
															<c:forEach items="${infoFuncionario.lstPuestosVO}"
																var="puesto">
																<c:if test="${puesto.banActivo == 1}">
																	<tr>
																		<td>${puesto.auxPuesto.nombre}</td>
																		<td>${puesto.auxDealer.nombre}</td>
																		<td>
																			<i class="fa fa-check"></i>
																		</td>
																		<td>
																			<c:if test="${puesto.banPrincipal == 1}">
																				<i class="fa fa-check"></i>
																			</c:if>
																		</td>
																		<td>
																			<fmt:formatDate value="${puesto.ingreso}" type="date"
																				pattern="yyyy-MM-dd" />
																		</td>
																		<td>
																			<c:if test="${puesto.aplicaPeriodo == 1}">
																				<i class="fa fa-check"></i>
																			</c:if>
																			<c:if test="${puesto.aplicaPeriodo == 0}">
																				<i class="fa fa-ban"></i>
																			</c:if>
																		</td>
																		<td>
																			<c:if test="${puesto.estatus == 1}">
																				<button type="button" class="btn"
																					onclick="showDisabledPuesto('${puesto.id}','${puesto.auxPuesto.nombre}','${puesto.auxDealer.nombre}');">Baja</button>
																				<c:if test="${puesto.banPrincipal == 0}">
																					<button type="button" class="btn"
																						onclick="asignaPrincipal('${puesto.id}','${puesto.idFuncionario}');">Principal</button>
																				</c:if>
																				<c:if test="${puesto.aplicaPeriodo == 0}">
																					<button type="button" class="btn"
																						onclick="aplicaPeriodo('${puesto.id}','1');">Aplica periodo</button>
																				</c:if>
																				<c:if test="${puesto.aplicaPeriodo == 1}">
																					<button type="button" class="btn"
																						onclick="aplicaPeriodo('${puesto.id}','0');">No aplica periodo</button>
																				</c:if>
																			</c:if>
																			<c:if test="${puesto.estatus == 3}">
																				<button type="button" class="btn" onclick="validarAltaPuesto('${puesto.id}','${puesto.idFuncionario}');">Validar</button>
																				<button type="button" class="btn" onclick="showRechazarAltaPuesto('${puesto.id}');">Rechazar</button>
																			</c:if>
																			<c:if test="${puesto.estatus == 6}">
																				<button type="button" class="btn" onclick="validarCambioPuesto('${puesto.id}','${puesto.idFuncionario}');">Validar Principal</button>
																				<button type="button" class="btn" onclick="showRechazarCambioPuesto('${puesto.id}');">Rechazar principal</button>
																			</c:if>
																		</td>
																	</tr>
																</c:if>
															</c:forEach>
														</c:if>
				
													</tbody>
												</table>
											</div>
				
										</div>
									</div>
								</div>
								<div id="listaPuestosHist" style="display: none;">
									<div>
										<button class="btn btn-primary" onclick="cerrarHistorico();">Cerrar</button>
									</div>
									<div class="row">
										<div class="bomb-5">
											<div class="table-responsive">
												<table id="puestoFuncionarioHist"
													class="table table-bordered table-striped">
													<thead>
														<tr>
															<th>Puesto</th>
															<th>Dealer</th>
															<th>Activo</th>
															<th>Principal</th>
															<th>Ingreso</th>
															<th>Egreso</th>
															<th>Acci&oacute;n</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${not empty infoFuncionario.lstPuestosVO}">
															<c:forEach items="${infoFuncionario.lstPuestosVO}"
																var="puesto">
																<c:if test="${puesto.banActivo == 0}">
																	<tr>
																		<td>${puesto.auxPuesto.nombre}</td>
																		<td>${puesto.auxDealer.nombre}</td>
																		<td>
																			<i class="fa fa-ban"></i>
																		</td>
																		<td>
																			<c:if test="${puesto.banPrincipal == 1}">
																				<i class="fa fa-check"></i>
																			</c:if>
																		</td>
																		<td>
																			<fmt:formatDate value="${puesto.ingreso}" type="date"
																				pattern="dd-MM-yyyy" />
																		</td>
																		<td>
																			<fmt:formatDate value="${puesto.egreso}" type="date"
																				pattern="dd-MM-yyyy" />
																		</td>
																		<td>
																			<c:if test="${puesto.estatus == 4}">
																				<button type="button" class="btn" onclick="validarBajaPuesto('${puesto.id}','${puesto.idFuncionario}');">Validar</button>
																				<button type="button" class="btn" onclick="showRechazarBajaPuesto('${puesto.id}');">Rechazar</button>
																			</c:if> 
																		</td>
																	</tr>
																</c:if>
															</c:forEach>
														</c:if>
				
													</tbody>
												</table>
											</div>
				
										</div>
									</div>
								</div>
				
								<div id="divNuevoPuesto" style="display: none;">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Grupo Dealer</label>
												<select class="form-control" id="selecGrupoDealer"
													onchange="getDealerAdicional()">
													<option value="0">Seleccione...</option>
													<c:if
														test="${not empty infoFuncionario.usuarioVO.empresaVO.grupoDealerVO}">
														<c:forEach
															items="${infoFuncionario.usuarioVO.empresaVO.grupoDealerVO}"
															var="grupoDealer">
															<option value="${grupoDealer.id}">${grupoDealer.agrupacion}</option>
														</c:forEach>
													</c:if>
				
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Dealer</label>
												<select class="form-control" id="selecDealer"
													onchange="onChangeDealerAdiconal();">
													<option value="0">Seleccione...</option>
				
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Grupo Puesto</label>
												<select class="form-control" id="selecGrupoPuesto"
													onchange="getPuestosAdicional();" disabled="disabled">
													<option value="0">Seleccione...</option>
													<c:if
														test="${not empty infoFuncionario.usuarioVO.empresaVO.grupoPuestoVO}">
														<c:forEach
															items="${infoFuncionario.usuarioVO.empresaVO.grupoPuestoVO}"
															var="grupoPuesto">
															<option value="${grupoPuesto.id}">${grupoPuesto.descripcion}</option>
														</c:forEach>
													</c:if>
				
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Puestos</label>
												<select class="form-control" id="selecPuesto">
													<option value="0">Seleccione...</option>
				
												</select>
											</div>
										</div>
									</div>
				
				
				
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="iptIngresoPuesto">Fecha de ingreso</label>
												<input type="date" class="form-control" id="iptIngresoPuesto"
													placeholder="Fecha de ingreso" 
													value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>'
													onkeydown="return false">
											</div>
										</div>
										<div class="col-md-6">
											<div class="checkbox">
												<label>
													<input id="iptCheckPuestoPrincipal" type="checkbox">
													Principal
												</label>
											</div>
										</div>
									</div>
				
									<div class="row">
										<div class="col-md-6">
											<button type="button" class="btn btn-primary"
												onclick="asignarPuesto(${infoFuncionario.id});">Asignar
												puesto</button>
										</div>
										<div class="col-md-6">
											<button type="button" class="btn btn-primary"
												onclick="cancelaNuevoPuesto();">Cancelar</button>
										</div>
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
		<!-- Tarjeta  Puestos end-->
		
		<!-- Tarjeta  Permisos-->
		<c:if test="${admin_user}">
			<div class="row col-md-12">
			  <div class="col-md-12 box box-solid callout callout-info">
			    <div id="accordionPermisos" role="tablist" class="contact-accordion">
			      <div class="ca-wrapp">
			        <div class="card-header" role="tab" id="headingOne">
			          <div data-toggle="collapse"
			            data-target="#collapsePermisos" aria-expanded="true"
			            aria-controls="collapseOne" class="clearfix">
			              <div class="pull-right box-tools">
			                <div class="up-accordion">
			                  <button class="btn btn-default btn-sm"
			                    data-widget="collapse" data-toggle="tooltip" title=""
			                    data-original-title="Collapse">
			                    <i class="fa fa-caret-down"></i>
			                  </button>
			                </div>
			              </div>
			            <h4>
			              <b>Permisos</b>
			            </h4>
			          </div>
			        </div>
			        <br>
			        <div id="collapsePermisos" class="collapse "
			          role="tabpanel" aria-labelledby="headingOne"
			          data-parent="#accordionPermisos">
			          	<div id="listaPermisos">
							<div class="row">
								<div class="bomb-5">
									<div class="table-responsive">
										<table id="permisosFuncionario"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>Modulo</th>
													<th>Activo</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Alumno</td>
													<td>
														<input type="checkbox" id="chckAlumno">
													</td>
												</tr>
												<tr>
													<td>Funcionarios</td>
													<td>
														<input type="checkbox" id="chckFuncionarios">
													</td>
												</tr>
												<tr>
													<td>Reportes</td>
													<td>
														<input type="checkbox" id="chckReportes">
													</td>
												</tr>
												<tr>
													<td>Inscripciones</td>
													<td>
														<input type="checkbox" id="chckInscripcion">
													</td>
												</tr>
												<tr>
													<td>Insumos</td>
													<td>
														<input type="checkbox" id="chckInsumos">
													</td>
												</tr>
												<tr>
													<td>Reportes Adicionales</td>
													<td>
														<input type="checkbox" id="chckAdicionales">
													</td>
												</tr>
												<c:if test="${infoFuncionario.idEmpresa == 1}">
													<tr>
														<td>Administraci&oacute;n de Catalogos</td>
														<td>
															<input type="checkbox" id="chckCatalogos">
														</td>
													</tr>
													<tr>
														<td>Administraci&oacute;n de Permisos</td>
														<td>
															<input type="checkbox" id="chckPermisos">
														</td>
													</tr>
													<tr>
														<td>Administraci&oacute;n de cursos</td>
														<td>
															<input type="checkbox" id="chckCursos">
														</td>
													</tr>
	
												</c:if>
											</tbody>
										</table>
									</div>
	
								</div>
							</div>
						</div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>	
		</c:if>
		<!-- Tarjeta  Permisos end-->
		
		
		<!-- Tarjeta  Empresas -->
		<c:if test="${infoFuncionario.idEmpresa == 1}">
			<div class="row col-md-12">
			  <div class="col-md-12 box box-solid callout callout-info">
			    <div id="accordionEmpresas" role="tablist" class="contact-accordion">
			      <div class="ca-wrapp">
			        <div class="card-header" role="tab" id="headingOne">
			          <div data-toggle="collapse"
			            data-target="#collapseEmpresas" aria-expanded="true"
			            aria-controls="collapseOne" class="clearfix">
			              <div class="pull-right box-tools">
			                <div class="up-accordion">
			                  <button class="btn btn-default btn-sm"
			                    data-widget="collapse" data-toggle="tooltip" title=""
			                    data-original-title="Collapse">
			                    <i class="fa fa-caret-down"></i>
			                  </button>
			                </div>
			              </div>
			            <h4>
			              <b>Administraci&oacute;n por Empresas</b>
			            </h4>
			          </div>
			        </div>
			        <br>
			        <div id="collapseEmpresas" class="collapse "
			          role="tabpanel" aria-labelledby="headingOne"
			          data-parent="#accordionEmpresas">
			            <div id="listaEmpresas">
							<div class="row">
								<div class="bomb-5">
									<div class="table-responsive">
										<table id="empresasFuncionario"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>Empresa</th>
													<th>Activo</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${not empty infoFuncionario.empresas}">
													<c:set var="countEmpresa" value="0" scope="page" />
													<c:forEach items="${infoFuncionario.empresas}"
														var="empresaUsuario">
														<c:set var="countEmpresa" value="${countEmpresa + 1}"
															scope="page" />
														<tr>
															<td>${empresaUsuario.auxEmpresa}</td>
															<td>
																<input type="checkbox"
																	id="chckEmpresaUsuario${countEmpresa}">
															</td>
															<c:if test="${empresaUsuario.banActivo == 1 }">
																<script type="text/javascript">
																			$('#chckEmpresaUsuario${countEmpresa}').prop('checked', true);
																			$('#chckEmpresaUsuario${countEmpresa}').iCheck({
																		        checkboxClass: 'icheckbox_minimal checked'
																			});
																		</script>
															</c:if>
														</tr>
														<script type="text/javascript">
																    
																</script>
														<script type="text/javascript">
																</script>
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
			    </div>
			  </div>
			</div>	
		</c:if>
		<!-- Tarjeta  Empresas end-->
				
		<!-- Tarjeta  Reportes-->
		<c:if test="${infoFuncionario.auxPermisoReportes}">
			<div class="row col-md-12">
			  <div class="col-md-12 box box-solid callout callout-info">
			    <div id="accordionReportes" role="tablist" class="contact-accordion">
			      <div class="ca-wrapp">
			        <div class="card-header" role="tab" id="headingOne">
			          <div data-toggle="collapse"
			            data-target="#collapseReportes" aria-expanded="true"
			            aria-controls="collapseOne" class="clearfix">
			              <div class="pull-right box-tools">
			                <div class="up-accordion">
			                  <button class="btn btn-default btn-sm"
			                    data-widget="collapse" data-toggle="tooltip" title=""
			                    data-original-title="Collapse">
			                    <i class="fa fa-caret-down"></i>
			                  </button>
			                </div>
			              </div>
			            <h4>
			              <b>Reportes</b>
			            </h4>
			          </div>
			        </div>
			        <br>
			        <div id="collapseReportes" class="collapse "
			          role="tabpanel" aria-labelledby="headingOne"
			          data-parent="#accordionReportes">
			            <div id="listaReportes">
							<div class="row">
								<div class="bomb-5">
									<div class="table-responsive">
										<table id="empresasFuncionario"
											class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>Repote</th>
													<th>Activo</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${not empty infoFuncionario.reportes}">
													<c:set var="countReporte" value="0" scope="page" />
													<c:forEach items="${infoFuncionario.reportes}" var="reporte">
														<c:set var="countReporte" value="${countReporte + 1}"
															scope="page" />
														<tr>
															<td>${reporte.nombre}</td>
															<td>
																<input type="checkbox"
																	id="chckUsuarioReporte${countReporte}">
															</td>
															<c:if test="${reporte.permiso.banActivo == 1 }">
																<script type="text/javascript">
																			$('#chckUsuarioReporte${countReporte}').prop('checked', true);
																			$('#chckUsuarioReporte${countReporte}').iCheck({
																		        checkboxClass: 'icheckbox_minimal checked'
																			});
																		</script>
															</c:if>
														</tr>
														<script type="text/javascript">
																    
																</script>
														<script type="text/javascript">
																</script>
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
			    </div>
			  </div>
			</div>	
		</c:if>
		<!-- Tarjeta  Reportes end-->
		
		<!-- Tarjeta  Empresas instructor-->
		<c:if test="${not empty infoFuncionario.instructor}">
			<c:if test="${infoFuncionario.instructor.banActivo == 1}">
				<div class="row col-md-12">
				  <div class="col-md-12 box box-solid callout callout-info">
				    <div id="accordionEmpresasInst" role="tablist" class="contact-accordion">
				      <div class="ca-wrapp">
				        <div class="card-header" role="tab" id="headingOne">
				          <div data-toggle="collapse"
				            data-target="#collapseEmpresasInst" aria-expanded="true"
				            aria-controls="collapseOne" class="clearfix">
				              <div class="pull-right box-tools">
				                <div class="up-accordion">
				                  <button class="btn btn-default btn-sm"
				                    data-widget="collapse" data-toggle="tooltip" title=""
				                    data-original-title="Collapse">
				                    <i class="fa fa-caret-down"></i>
				                  </button>
				                </div>
				              </div>
				            <h4>
				              <b>Empresas por instructor</b>
				            </h4>
				          </div>
				        </div>
				        <br>
				        <div id="collapseEmpresasInst" class="collapse "
				          role="tabpanel" aria-labelledby="headingOne"
				          data-parent="#accordionEmpresasInst">
				            <div id="listaInst">
								<div class="row">
									<div class="bomb-5">
										<div class="table-responsive">
											<table id="empresasFuncionario"
												class="table table-bordered table-striped">
												<thead>
													<tr>
														<th>Empresa</th>
														<th>Activo</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${not empty infoFuncionario.empesasInstructor}">
														<c:set var="countInst" value="0" scope="page" />
														<c:forEach items="${infoFuncionario.empesasInstructor}"
															var="empesaInstructor">
															<c:set var="countInst" value="${countInst + 1}"
																scope="page" />
															<tr>
																<td>${empesaInstructor.auxEmpresa}</td>
																<td>
																	<input type="checkbox"
																		id="chckEmpresaInstuctor${countInst}">
																</td>
																<c:if test="${empesaInstructor.banActivo == 1 }">
																	<script type="text/javascript">
																				$('#chckEmpresaInstuctor${countInst}').prop('checked', true);
																				$('#chckEmpresaInstuctor${countInst}').iCheck({
																			        checkboxClass: 'icheckbox_minimal checked'
																				});
																			</script>
																</c:if>
															</tr>
															<script type="text/javascript">
																	    
																	</script>
															<script type="text/javascript">
																	</script>
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
				    </div>
				  </div>
				</div>	
			</c:if>
		</c:if>
		<!-- Tarjeta  Empresas instructor end-->
		
		<!-- Tarjeta Cursos-->
		<div class="row col-md-12">
		  <div class="col-md-12 box box-solid callout callout-info">
		    <div id="accordionCursos" role="tablist" class="contact-accordion">
		      <div class="ca-wrapp">
		        <div class="card-header" role="tab" id="headingOne">
		          <div data-toggle="collapse"
		            data-target="#collapseCursos" aria-expanded="true"
		            aria-controls="collapseOne" class="clearfix">
		              <div class="pull-right box-tools">
		                <div class="up-accordion">
		                  <button class="btn btn-default btn-sm"
		                    data-widget="collapse" data-toggle="tooltip" title=""
		                    data-original-title="Collapse">
		                    <i class="fa fa-caret-down"></i>
		                  </button>
		                </div>
		              </div>
		            <h4>
		              <b>Cursos</b>
		            </h4>
		          </div>
		        </div>
		        <br>
		        <div id="collapseCursos" class="collapse "
		          role="tabpanel" aria-labelledby="headingOne"
		          data-parent="#accordionCursos">
		            <div class="row">
						<div class="col-md-12">
							<div class="nav-tabs-custom">
								<ul class="nav nav-tabs">
									<li class="active">
										<a href="#tabCalificaciones" data-toggle="tab">Calificaciones</a>
									</li>
									<li>
										<a href="#tabInscripciones" data-toggle="tab">Inscripciones</a>
									</li>
									<li>
										<a href="#tabCancelaciones" data-toggle="tab">Cancelaciones</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tabCalificaciones">
										<div class="row">
											<div class="bomb-5">
												<div class="table-responsive">
													<table id="cursosFuncionario"
														class="table table-bordered table-striped">
														<thead>
															<tr>
																<th>Curso</th>
																<th>Calificacion</th>
																<th>Fecha curso</th>
																<th>Instructor</th>
															</tr>
														</thead>
														<tbody>
															<c:if test="${not empty infoFuncionario.calificaciones}">
															  <c:forEach items="${infoFuncionario.calificaciones}" var="calificacion">
															    <tr>
															      <td>${calificacion.codigo} - ${calificacion.curso}</td>
															      <td>${calificacion.calificacion}</td>
															      <td><fmt:formatDate value="${calificacion.inicio}" type="date" pattern="yyyy-MM-dd"/> - <fmt:formatDate value="${calificacion.fin}" type="date" pattern="yyyy-MM-dd"/></td>
															      <td>${calificacion.instructor}</td>
															    </tr>	
															  </c:forEach>
															</c:if>	
														</tbody>
													</table>
												</div>
					
											</div>
										</div>
									</div>
									<div class="tab-pane" id="tabInscripciones">
										<div class="row">
											<div class="bomb-5">
												<div class="table-responsive">
													<table id="inscripcionesFuncionario"
														class="table table-bordered table-striped">
														<thead>
															<tr>
																<th>Curso</th>
																<th>Fecha curso</th>
																<th>Instructor</th>
																<th>Acciones</th>
															</tr>
														</thead>
														<tbody>
															<c:if test="${not empty infoFuncionario.inscripciones}">
															  <c:forEach items="${infoFuncionario.inscripciones}" var="inscripcion">
															    <tr>
															      <td>${inscripcion.curso}</td>
															      <td><fmt:formatDate value="${inscripcion.inicio}" type="date" pattern="yyyy-MM-dd"/> - <fmt:formatDate value="${inscripcion.fin}" type="date" pattern="yyyy-MM-dd"/></td>
															      <td>${inscripcion.instructor}</td>
															      <td><button type="button" class="btn" onclick="openCancela('${inscripcion.idInscripcion}');">Cancelar</button></td>
															    </tr>	
															  </c:forEach>
															</c:if>	
														</tbody>
													</table>
												</div>
					
											</div>
										</div>
									</div>
									<div class="tab-pane" id="tabCancelaciones">
										<div class="row">
											<div class="bomb-5">
												<div class="table-responsive">
													<table id="cancelacionesFuncionario"
														class="table table-bordered table-striped">
														<thead>
															<tr>
																<th>Curso</th>
																<th>Fecha curso</th>
																<th>Instructor</th>
																<th>Motivo cancelaci&oacute;n</th>
																<th>Fecha cancelaci&oacute;n</th>
																<th>Usuario cancela</th>
																<th>Acciones</th>
															</tr>
														</thead>
														<tbody>
															<c:if test="${not empty infoFuncionario.cancelaciones}">
															  <c:forEach items="${infoFuncionario.cancelaciones}" var="cancelacion">
															    <tr>
															      <td>${cancelacion.curso}</td>
															      <td><fmt:formatDate value="${cancelacion.inicio}" type="date" pattern="yyyy-MM-dd"/> - <fmt:formatDate value="${cancelacion.fin}" type="date" pattern="yyyy-MM-dd"/></td>
															      <td>${cancelacion.instructor}</td>
															      <td>${cancelacion.motivoCancelacion}</td>
															      <td><fmt:formatDate value="${cancelacion.fchCancelacion}" type="date" pattern="yyyy-MM-dd"/></td>
															      <td>${cancelacion.usuarioCancela}</td>
															      <td>
															      	<a href="#" title="Re-inscribir" onclick="openConfirmaReinscripcion('${cancelacion.idInscripcion}','${cancelacion.curso}', '<fmt:formatDate value="${cancelacion.inicio}" type="date" pattern="yyyy-MM-dd HH:mm"/>', '<fmt:formatDate value="${cancelacion.fin}" type="date" pattern="yyyy-MM-dd HH:mm"/>');"><i class="fa fa-undo"></i></a>
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
								<!-- /.tab-content -->
							</div>
							<!-- nav-tabs-custom -->
						</div>
					</div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>	
		<!-- Tarjeta  Empresas instructor end-->
				
				
				
				

	</section>
	<!-- /.content -->
</aside>
<!-- /.right-side -->


<div class="modal fade" id="modalFuncionarioCreado" tabindex="-1"
	role="dialog" aria-labelledby="modalFuncionarioCreado"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Funcionario creado con &eacute;xito</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					onclick="showAsignaPuesgos();">Asignar puestos</button>
				<button type="button" class="btn btn-primary"
					onclick="window.location = ctx + '/funcionarios';">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalPuestoAsignado" tabindex="-1"
	role="dialog" aria-labelledby="modalPuestoAsignado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Se asigno el puesto al funcionario</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					onclick="window.location = ctx + '/funcionario?idFuncionario=${infoFuncionario.id}';">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalPermisos" tabindex="-1" role="dialog"
	aria-labelledby="modalPermisos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Permisos actualizados</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalReportes" tabindex="-1" role="dialog"
	aria-labelledby="modalPermisos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Permisos actualizados</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalFuncionarioActualizado" tabindex="-1"
	role="dialog" aria-labelledby="modalFuncionarioActualizado"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Se actualizaron los datos</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalPuestoInactivo" tabindex="-2"
	role="dialog" aria-labelledby="modalPuestoInactivo" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h1>Se desactivo el puesto</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					onclick="window.location = ctx + '/funcionario?idFuncionario=${infoFuncionario.id}';">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalBajaPuesto" tabindex="-1" role="dialog"
	aria-labelledby="modalBajaPuesto" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Baja de Puesto</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<input type="hidden" id="iptIdFuncionarioPuestoD">
				<div class="row">
					<div class="col-md-12">
						<h1>Se dara de baja al el puesto:</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h4>Puesto:</h4>
					</div>
					<div class="col-md-6">
						<h4 id="h4PuestoDesc"></h4>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h4>Dealer:</h4>
					</div>
					<div class="col-md-6">
						<h4 id="h4DealerDesc"></h4>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="iptEgresoPuesto">Fecha de egreso</label>
							<input type="date" class="form-control" id="iptEgresoPuesto"
								placeholder="Fecha de egreso" 
								value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>'
								onkeydown="return false">
						</div>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					onclick="disabledPuesto();">Aceptar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalBajaFuncionario" tabindex="-1"
	role="dialog" aria-labelledby="modalBajaPuesto" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Baja de Funcionario</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Se dara de baja al el funcionario:</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h3>RFC:</h3>
					</div>
					<div class="col-md-6">
						<h4>${infoFuncionario.rfc}</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h3>Nombre:</h3>
					</div>
					<div class="col-md-6">
						<h4>${infoFuncionario.datosFuncionarioVO.nombres}
							${infoFuncionario.datosFuncionarioVO.apellidoUno}
							${infoFuncionario.datosFuncionarioVO.apellidoDos}</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h3>Egreso:</h3>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="date" class="form-control" id="iptEgresoFuncionario"
								placeholder="Fecha de egreso" 
								value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>'
								onkeydown="return false">
						</div>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					onclick="bajaFuncionario();">Aceptar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalFuncionarioInactivo" tabindex="-1"
	role="dialog" aria-labelledby="modalFuncionarioInactivo"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Se dio de baja al usuario.</h1>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					onclick="window.location = ctx + '/funcionario?idFuncionario=${infoFuncionario.id}';">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalReingreso" tabindex="-1" role="dialog"
	aria-labelledby="modalReingreso" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg"
		role="document">
		<div class="modal-content bg-glass-sknd">
			<form role="form" id="formReingresoDocumento"
				action="javascript:solicitaReingreso();" method="POST" class=""
				data-parsley-validate="">
				<input type="hidden" id="iptIdFuncionarioReingreso" name="iptIdFuncionarioReingreso" value="${infoFuncionario.id}">
				<input type="hidden" id="iptEmpresaActual" value="${infoFuncionario.idEmpresa}">
					

				<div class="modal-header">
					<h4 class="modal-title uppercase bold">Datos para reingreso</h4>
				</div>
				<div class="modal-body">

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Empresa</label> 
								<select class="form-control" id="selectEmpresaFuncionarioReingreso" name="selectEmpresaFuncionarioReingreso" onchange="getSelectsNewEmpresa();">
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

						<div class="col-md-6">
							<div class="form-group">
								<label>Grupo Dealer</label>
								<select class="form-control" id="selecGrupoDealerReingreso"
									name="selecGrupoDealerReingreso"
									onchange="getDealerReingreso()">
									<option value="0">Seleccione...</option>
									<c:if
										test="${not empty infoFuncionario.usuarioVO.empresaVO.grupoDealerVO}">
										<c:forEach
											items="${infoFuncionario.usuarioVO.empresaVO.grupoDealerVO}"
											var="grupoDealer">
											<option value="${grupoDealer.id}">${grupoDealer.agrupacion}</option>
										</c:forEach>
									</c:if>

								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Dealer</label>
								<select class="form-control" id="selecDealerReingreso"
									name="selecDealerReingreso">
									<option value="0">Seleccione...</option>
									<c:if test="${not empty dealers}">
										<c:forEach items="${dealers}" var="dealer">
											<option value="${dealer.id}">${dealer.nombre}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Grupo Puesto</label>
								<select class="form-control" id="selecGrupoPuestoReingreso"
									onchange="getPuestosReingreso()">
									<option value="0">Seleccione...</option>
									<c:if
										test="${not empty infoFuncionario.usuarioVO.empresaVO.grupoPuestoVO}">
										<c:forEach
											items="${infoFuncionario.usuarioVO.empresaVO.grupoPuestoVO}"
											var="grupoPuesto">
											<option value="${grupoPuesto.id}">${grupoPuesto.descripcion}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Puesto</label>
								<select class="form-control" id="selecPuestoReingreso"
									name="selecPuestoReingreso">
									<option value="0">Seleccione...</option>

								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="iptIngresoPuesto">Fecha de ingreso</label>
								<input type="date" class="form-control" id="iptReingresoPuesto"
									name="iptReingresoPuesto" placeholder="Fecha de ingreso"
									value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>'
									onkeydown="return false">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="row text-center">
						<div class="col-md-6">
							<button type="submit" class="btn btn-primary">Solicitar</button>
						</div>
						<div class="col-md-6">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Cerrar</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="modalKycRFCUp" tabindex="-1"
	role="dialog" aria-labelledby="modalKycRFCUp" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div id="divImgFotoRFC" class="cssImgHolder">
			<c:url value="/funcionario/downloadImagePass"
				var="rfcURL">
				<c:param name="param1" value="${infoFuncionario.id}" />
				<c:param name="param2" value="2" />
			</c:url>
			<img width="" height="" src="${rfcURL}" height="">
		</div>
	</div>
</div>

<div class="modal fade" id="modalKycCurpUp" tabindex="-1"
	role="dialog" aria-labelledby="modalKycCurpUp" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div id="divImgFotoRFC" class="cssImgHolder">
			<c:url value="/funcionario/downloadImagePass"
				var="curpURL">
				<c:param name="param1" value="${infoFuncionario.id}" />
				<c:param name="param2" value="3" />
			</c:url>
			<img width="" height="" src="${curpURL}" height="">
		</div>
	</div>
</div>

<div class="modal fade" id="modalKycExtranjeroUp" tabindex="-1"
	role="dialog" aria-labelledby="modalKycExtranjeroUp" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div id="divImgFotoRFC" class="cssImgHolder">
			<c:url value="/funcionario/downloadImagePass"
				var="extranjeroURL">
				<c:param name="param1" value="${infoFuncionario.id}" />
				<c:param name="param2" value="1" />
			</c:url>
			<img width="" height="" src="${extranjeroURL}" height="">
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
				<h1>El archivo seleccionado excede el tamaño permitido (200 kb)</h1>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalConfirmaRechazoFuncionario" tabindex="-1"
	role="dialog" aria-labelledby="modalConfirmaRechazoFuncionario" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Rechazo de funcionario</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Escriba el motivo del rechazo para poder continuar</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<input type="text" id="motivoRechazoFuncionario" class="form-control" placeholder="Motivo de rechazo"  maxlength="200" onkeypress="return isValidChar(event);">
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="funcionarioRechazado();">Aceptar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalConfirmaRechazoBajaFuncionario" tabindex="-1"
	role="dialog" aria-labelledby="modalConfirmaRechazoBajaFuncionario" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Rechazo de baja de funcionario</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Escriba el motivo del rechazo para poder continuar</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<input type="text" id="motivoRechazoBajaFuncionario" class="form-control" placeholder="Motivo de rechazo"  maxlength="200" onkeypress="return isValidChar(event);">
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="funcionarioBajaRechazado();">Aceptar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalConfirmaRechazoPuesto" tabindex="-1"
	role="dialog" aria-labelledby="modalConfirmaRechazoPuesto" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Rechazo de puesto</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Escriba el motivo del rechazo para poder continuar</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<input type="hidden" id="iptIdFPRechazo">
						<input type="text" id="motivoRechazoPuesto" class="form-control" placeholder="Motivo de rechazo"  maxlength="200" onkeypress="return isValidChar(event);">
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="rechazarAltaPuesto();">Aceptar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalConfirmaRechazoCambioPuesto" tabindex="-1"
	role="dialog" aria-labelledby="modalConfirmaRechazoCambioPuesto" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Rechazo de cambio puesto</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Escriba el motivo del rechazo para poder continuar</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<input type="hidden" id="iptIdFPRechazoC">
						<input type="text" id="motivoRechazoCambioPuesto" class="form-control" placeholder="Motivo de rechazo"  maxlength="200" onkeypress="return isValidChar(event);">
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="rechazarCambioPuesto();">Aceptar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalConfirmaRechazoBajaPuesto" tabindex="-1"
	role="dialog" aria-labelledby="modalConfirmaRechazoBajaPuesto" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Rechazo de baja de puesto</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Escriba el motivo del rechazo para poder continuar</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<input type="hidden" id="iptIdFPBajaRechazo">
						<input type="text" id="motivoRechazoBajaPuesto" class="form-control" placeholder="Motivo de rechazo"  maxlength="200" onkeypress="return isValidChar(event);">
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="rechazarBajaPuesto();">Aceptar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalConfirmaRechazoModificacion" tabindex="-1"
	role="dialog" aria-labelledby="modalConfirmaRechazoModificacion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Rechazo</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Escriba el motivo del rechazo para poder continuar</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<input type="hidden" id="iptIdHistDts">
						<input type="text" id="motivoRechazoModificacion" class="form-control" placeholder="Motivo de rechazo"  maxlength="200" onkeypress="return isValidChar(event);">
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="funcionarioModificadoRechazado();">Aceptar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalNuevaContrasenia" tabindex="-1"
	role="dialog" aria-labelledby="modalNuevaContrasenia" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Nueva Contrase&ntilde;a</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Escriba la nueva contrase&ntilde;a para el funcionario</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label for="password">Contrase&ntilde;a</label>
							<input type="password" id="iptNewPwd" class="form-control" placeholder="Contrase&ntilde;a">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label for="password">Confirmaci&oacute de contrase&ntilde;a</label>
							<input type="password" id="iptConfirmNewPwd" class="form-control" placeholder="Confirmaci&oacute;n de ontrase&ntilde;a">
						</div>
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="validaNuevaContrasenia();">Aceptar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalConfirmaNuevaContrasenia" tabindex="-1"
	role="dialog" aria-labelledby="modalConfirmaNuevaContrasenia" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Confirmaci&oacute;n de Nueva Contrase&ntilde;a</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Se modificara la contrase&ntilde;a del funcionario</h1>
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="nuevaContrasenia();">Aceptar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalErrorNuevaContrasenia" tabindex="-1"
	role="dialog" aria-labelledby="modalErrorNuevaContrasenia" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Error</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1 id="h1ErrorDatosObligatoriosPwd" style="display:none;">La contrase&ntilde;a y la confirmaci&oacute;n de contrase&ntilde;a son obligatorios</h1>
						<h1 id="h1ErrorCoincidenciaPwd" style="display:none;">La contrase&ntilde;a y la confirmaci&oacute;n de contrase&ntilde;a no coinciden</h1>
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalExitoNuevaContrasenia" tabindex="-1"
	role="dialog" aria-labelledby="modalExitoNuevaContrasenia" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Contrase&ntilde;a actualizada</h1>
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalActualizaRFC" tabindex="-1"
	role="dialog" aria-labelledby="modalActualizaRFC" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Modificaci&oacute;n de RFC</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Ingresa el nuevo RFC</h1>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<label for="iptRfcFuncionario">RFC</label>
						<input type="text" class="form-control" id="iptNuevoRfcFuncionario"
							placeholder="RFC">
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="validarNuevoRFC('${infoFuncionario.rfc}');">Validar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalCoincidencias" tabindex="-1"
	role="dialog" aria-labelledby="modalcoincidencias" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Mensaje</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div id="divMensajesC"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="actualizaRFC();">Continuar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalRFCNuevo" tabindex="-1"
	role="dialog" aria-labelledby="modalRFCNuevo" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Confirmaci&oacute;n de cambio de RFC</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div id="divMensajesC">
					<h1>Se modificara el RFC del funcionario</h1>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="actualizaRFC();">Continuar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalExitoRFC" tabindex="-1"
	role="dialog" aria-labelledby="modalExitoRFC" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Se actualizo el RFC</h1>
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="window.location = ctx + '/funcionario?idFuncionario=${infoFuncionario.id}';">Aceptar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="usuarioInactivoRFC" tabindex="-1"
	role="dialog" aria-labelledby="usuarioInactivoRFC" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Alerta</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>El RFC ya existe registrado con estatus inactivo para continuar se debe realizar el reingreso del funcionario al que se migraran los datos</h1>
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="usuarioDiferenteEmpresaRFC" tabindex="-1"
	role="dialog" aria-labelledby="usuarioDiferenteEmpresaRFC" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Alerta</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1 id="hiTextOtraEmpresa"></h1>
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="usuarioDiferenteEmpresaRFC" tabindex="-1"
	role="dialog" aria-labelledby="usuarioDiferenteEmpresaRFC" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Alerta</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1 id="hiTextOtraEmpresa"></h1>
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalRFCMerge" tabindex="-1"
	role="dialog" aria-labelledby="modalRFCMerge" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Confirmaci&oacute;n de cambio de RFC</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div id="divMensajesMerge">
					<h1>¿Desea migrar los datos del usuario?</h1>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="mergeRFC();">Continuar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalUpdateDoc" tabindex="-1"
	role="dialog" aria-labelledby="modalUpdateDoc" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Actualizaci&oacute;n de documento</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div id="divMensajesMerge">
					<h1 id="divTipoDoc"></h1>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="mergeRFC();">Continuar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalUpdateDocRFC" tabindex="-1"
	role="dialog" aria-labelledby="modalUpdateDocRFC" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Actualizaci&oacute;n de documento RFC</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row" id="rowDocumentoRFC" >
					<div class="col-md-12">
						<div class="form-group">
							<label for="rfcFile">Documento RFC</label>
							<input type="file" id="rfcFile" accept="application/pdf,image/jpeg,image/x-png" onchange="validaSize(this);">
                        </div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="updateDocumentoRFC();">Continuar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalUpdateDocCURP" tabindex="-1"
	role="dialog" aria-labelledby="modalUpdateDocCURP" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Actualizaci&oacute;n de documento CURP</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row" id="rowDocumentoRFC" >
					<div class="col-md-12">
						<div class="form-group">
							<label for="rfcFile">Documento CURP</label>
							<input type="file" id="curpFile" accept="application/pdf,image/jpeg,image/x-png" onchange="validaSize(this);">
                        </div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="updateDocumentoCURP();">Continuar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalUpdateDocEXT" tabindex="-1"
	role="dialog" aria-labelledby="modalUpdateDocEXT" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Actualizaci&oacute;n de documento Extranjero</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" >&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row" id="rowDocumentoRFC" >
					<div class="col-md-12">
						<div class="form-group">
							<label for="rfcFile">Documento Extranjero</label>
							<input type="file" id="rfcFile" accept="application/pdf,image/jpeg,image/x-png" onchange="validaSize(this);">
                        </div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="updateDocumentoEXT();">Continuar</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modalDocumentoActualizado" tabindex="-1"
	role="dialog" aria-labelledby="modalDocumentoActualizado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">&Eacute;xito</h3>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="row">
					<div class="col-md-12">
						<h1>Se actualizo el documento</h1>
					</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="window.location = ctx + '/funcionario?idFuncionario=${infoFuncionario.id}';">Aceptar</button>
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
								<h4 id="h4CursoR"></h4>
								<h4 id="h4InicioR"></h4>
								<h4 id="h4FinR"></h4>
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
<!-- page script -->
<script type="text/javascript">
    $(function() {
        $('#puestoFuncionario').dataTable({
        	"pageLength": 30 ,
            "bPaginate": false,
            "bLengthChange": false,
            "bFilter": false,
            "bSort": true,
            "bInfo": false,
            "bAutoWidth": true
        });
        $('#cursosFuncionario').dataTable({
        	"pageLength": 30 ,
            "bPaginate": true,
            "bLengthChange": false,
            "bFilter": true,
            "bSort": true,
            "bInfo": false,
            "bAutoWidth": true
        });
        $('#inscripcionesFuncionario').dataTable({
        	"pageLength": 30 ,
            "bPaginate": true,
            "bLengthChange": false,
            "bFilter": true,
            "bSort": true,
            "bInfo": false,
            "bAutoWidth": true
        });
        
        
        
        <c:if test="${infoFuncionario.banActivo == 0}">
	        $('input[type=checkbox]').attr('disabled','true');
        </c:if>
        
        <c:if test="${infoFuncionario.banActivo == 1}">
	    	$('#iptCheckFuncionarioActivo').prop('checked', true);
			$('#iptCheckFuncionarioActivo').iCheck({
		        checkboxClass: 'icheckbox_minimal checked'
			});
   		</c:if>	
        
        
        <c:if test="${infoFuncionario.auxPermisoCursos}">
        	$('#chckAlumno').prop('checked', true);
			$('#chckAlumno').iCheck({
		        checkboxClass: 'icheckbox_minimal checked'
			});
        </c:if>
        <c:if test="${infoFuncionario.auxPermisoCatalogos}">
	    	$('#chckCatalogos').prop('checked', true);
			$('#chckCatalogos').iCheck({
		        checkboxClass: 'icheckbox_minimal checked'
			});
	    </c:if>
        <c:if test="${infoFuncionario.auxPermisoUsuarios}">
	    	$('#chckPermisos').prop('checked', true);
			$('#chckPermisos').iCheck({
		        checkboxClass: 'icheckbox_minimal checked'
			});
	    </c:if>
        <c:if test="${infoFuncionario.auxPermisoLms}">
	    	$('#chckCursos').prop('checked', true);
			$('#chckCursos').iCheck({
		        checkboxClass: 'icheckbox_minimal checked'
			});
	    </c:if>
        <c:if test="${infoFuncionario.auxPermisoCalendario}">
	    	$('#chckInscripcion').prop('checked', true);
			$('#chckInscripcion').iCheck({
		        checkboxClass: 'icheckbox_minimal checked'
			});
	    </c:if>
        <c:if test="${infoFuncionario.auxPermisoFuncionarios}">
	    	$('#chckFuncionarios').prop('checked', true);
			$('#chckFuncionarios').iCheck({
		        checkboxClass: 'icheckbox_minimal checked'
			});
	    </c:if>
        <c:if test="${infoFuncionario.auxPermisoReportes}">
	    	$('#chckReportes').prop('checked', true);
			$('#chckReportes').iCheck({
		        checkboxClass: 'icheckbox_minimal checked'
			});
	    </c:if>
        <c:if test="${infoFuncionario.auxPermisoInsumos}">
	    	$('#chckInsumos').prop('checked', true);
			$('#chckInsumos').iCheck({
		        checkboxClass: 'icheckbox_minimal checked'
			});
	    </c:if>
	    
	    <c:if test="${infoFuncionario.auxPermisoAdicionales}">
	    	$('#chckAdicionales').prop('checked', true);
			$('#chckAdicionales').iCheck({
		        checkboxClass: 'icheckbox_minimal checked'
			});
	    </c:if>
	    
	    $('#chckAlumno').on('ifChecked', function(event){
	    	asignaPermiso('1',1)
    	});
	    $('#chckAlumno').on('ifUnchecked', function(event){
	    	asignaPermiso('1',0)
    	});
	    
	    $('#chckFuncionarios').on('ifChecked', function(event){
	    	asignaPermiso('6',1)
    	});
	    $('#chckFuncionarios').on('ifUnchecked', function(event){
	    	asignaPermiso('6',0)
    	});
	    
	    $('#chckReportes').on('ifChecked', function(event){
	    	asignaPermiso('7',1)
    	});
	    $('#chckReportes').on('ifUnchecked', function(event){
	    	asignaPermiso('7',0)
    	});
	    $('#chckInsumos').on('ifChecked', function(event){
	    	asignaPermiso('9',1)
    	});
	    $('#chckInsumos').on('ifUnchecked', function(event){
	    	asignaPermiso('9',0)
    	});
	    $('#chckAdicionales').on('ifChecked', function(event){
	    	asignaPermiso('8',1)
    	});
	    $('#chckAdicionales').on('ifUnchecked', function(event){
	    	asignaPermiso('8',0)
    	});
	    
	    
	    $('#chckInscripcion').on('ifChecked', function(event){
	    	asignaPermiso('5',1)
    	});
	    $('#chckInscripcion').on('ifUnchecked', function(event){
	    	asignaPermiso('5',0)
    	});
	    
	    $('#chckCatalogos').on('ifChecked', function(event){
	    	asignaPermiso('2',1)
    	});
	    $('#chckCatalogos').on('ifUnchecked', function(event){
	    	asignaPermiso('2',0)
    	});
	    
	    $('#chckPermisos').on('ifChecked', function(event){
	    	asignaPermiso('3',1)
    	});
	    $('#chckPermisos').on('ifUnchecked', function(event){
	    	asignaPermiso('3',0)
    	});
	    
	    $('#chckCursos').on('ifChecked', function(event){
	    	asignaPermiso('4',1)
    	});
	    $('#chckCursos').on('ifUnchecked', function(event){
	    	asignaPermiso('4',0)
    	});
	    
	    <c:if test="${not empty infoFuncionario.empresas}">
			<c:set var="countEmpresa2" value="0" scope="page" />
			<c:forEach items="${infoFuncionario.empresas}" var="empresaUsuario">
				<c:set var="countEmpresa2" value="${countEmpresa2 + 1}" scope="page"/>
				$('#chckEmpresaUsuario${countEmpresa2}').on('ifUnchecked', function(event){
			    	asignaPermisoEmpresa('${empresaUsuario.id}','0');
		    	});
				$('#chckEmpresaUsuario${countEmpresa2}').on('ifChecked', function(event){
			    	asignaPermisoEmpresa('${empresaUsuario.id}','1');
		    	});
			</c:forEach>
		</c:if>
		
		<c:if test="${not empty infoFuncionario.empesasInstructor}">
			<c:set var="countInst2" value="0" scope="page" />
			<c:forEach items="${infoFuncionario.empesasInstructor}" var="empesasInstructor">
				<c:set var="countInst2" value="${countInst2 + 1}" scope="page"/>
				$('#chckEmpresaInstuctor${countInst2}').on('ifUnchecked', function(event){
			    	asignaPermisoEmpresaInst('${empesasInstructor.id}','0');
		    	});
				$('#chckEmpresaInstuctor${countInst2}').on('ifChecked', function(event){
					asignaPermisoEmpresaInst('${empesasInstructor.id}','1');
		    	});
			</c:forEach>
		</c:if>
		
			
		<c:if test="${not empty infoFuncionario.reportes}">
			<c:set var="countReporte" value="0" scope="page" />
			<c:forEach items="${infoFuncionario.reportes}" var="usuarioReporte">
				<c:set var="countReporte" value="${countReporte + 1}" scope="page"/>
				$('#chckUsuarioReporte${countReporte}').on('ifUnchecked', function(event){
					asignaReporte('${usuarioReporte.id}','0');
		    	});
				$('#chckUsuarioReporte${countReporte}').on('ifChecked', function(event){
					asignaReporte('${usuarioReporte.id}','1');
		    	});
			</c:forEach>
		</c:if>
    });
    
    
</script>



