<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script
	src="<c:url value='/resources/js/lms/reportes/reportesAdicLMS.js' />"
	type="text/javascript"></script>
	
<main class="l-main">
<nav aria-label="breadcrumb" role="navigation">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#"><spring:message code="lms.reporte.adic.admin" /></a></li>
		<li class="breadcrumb-item active"><spring:message code="lms.reporte.adic.title" /></li>
	</ol>
</nav>

	
		<div class="content-wrapper admin_wrap">
			<h1><spring:message code="lms.reporte.adic.title" /></h1>
			
			<h5 class="bold txt-graytrd">${ciclo.nombre}</h5>
		
			<!-- Filtros -->
			<div class="row justify-content-end">
				<div class="col-xl-4 col-lg-4 col-sm-9">
					<div class="search_bar">
						<input type="search" id="search_input_all"
							onkeyup="FilterkeyWord_all_table()" placeholder="<spring:message code="lms.reporte.adic.buscar" />">
						<span></span>
					</div>
				</div>
			</div>
			<hr class="my-4">
			<!-- tabla -->
			<div class="row ">
				<div class="col">
					<div class="table-responsive-sm">
						<table class="table table-striped table-class tables-report"
							id="table-cu">
							<thead>
								<tr>
									<th class="text-left"><spring:message code="lms.reporte.adic.table.nombre" /></th>
									<th class="text-left"><spring:message code="lms.reporte.adic.table.descripcion" /></th>
									<th class="text-left"><spring:message code="lms.reporte.adic.table.archivo" /></th>
									<th><spring:message code="lms.reporte.adic.table.acciones" /></th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty lstReportes}">
									<c:forEach items="${lstReportes}" var="reporte" varStatus="loop">
										<tr>
											<td>${reporte.auxNombreReporte}</td>
											<td class="text-left">${reporte.auxDescripcion}</td>
											<td class="text-left"><c:if
													test="${not empty reporte.auxNombreArchivo}">${reporte.auxNombreArchivo}</c:if> <c:if
													test="${empty reporte.auxNombreArchivo}"><spring:message code="lms.reporte.adic.table.na" /></c:if></td>
		
											<td class="text-center">
											<c:if test="${not empty reporte.archivo}">
												<a href="#" title="Descargar Reporte" onclick="descargarReporte(${reporte.id});"><i class="fas fa-download mr-3"></i></a>
											</c:if>
												 <a href="#" title="Subir Reporte"
												onclick="showUpload('${reporte.id}','${reporte.auxNombreReporte}')"> <i
													class="fas fa-upload"></i></a>
													</td>
										</tr>
									</c:forEach>
								</c:if>
		
							</tbody>
						</table>
					</div>
					<!--		Start Pagination -->
				</div>
			</div>
			<div class="row">
				<div class="col-4">
					<div class="num_rows">
						<div class="form-group">
							<select class="form-control" name="state" id="maxRows">
						    <option value="10"><spring:message code="lms.reporte.adic.num.rows.op10" /></option>
	                        <option value="15"><spring:message code="lms.reporte.adic.num.rows.op15" /></option>
	                        <option value="20"><spring:message code="lms.reporte.adic.num.rows.op20" /></option>
	                        <option value="50"><spring:message code="lms.reporte.adic.num.rows.op50" /></option>
	                        <option value="70"><spring:message code="lms.reporte.adic.num.rows.op70" /></option>
	                        <option value="100"><spring:message code="lms.reporte.adic.num.rows.op100" /></option>
	                        <option value="5000"><spring:message code="lms.reporte.adic.num.rows.optext" /></option>
							</select>
		
						</div>
					</div>
				</div>
				<div class="col-8">
					<div class='pagination-container'>
						<nav>
							<ul class="pagination">
								<!--	Here the JS Function Will Add the Rows -->
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-12">
					<div class="rows_count"><spring:message code="lms.reporte.adic.rows.count" /></div>
				</div>
			</div>
			<!-- End Tabla -->
		</div>

	
	<c:if test="${not empty ciclo}">
		<div class="content-wrapper perfil h-100">
	        <div class="row justify-content-center h-100">
	            <div class="col">
	                <div class="perfil-wrapp">
	                    <div class="info-perfil">
	                        <h1><spring:message code="lms.reporte.adic.msg1" /></h1>
	                        <h4><spring:message code="lms.reporte.adic.msg2" /></h4>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</c:if>

</main>

<!-- <div class="modal fade new-func" id="modalUploadDocumento" tabindex="-1"
	role="dialog" aria-labelledby="modalUploadDocumento" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg"
		role="document">
		<div class="modal-content bg-glass-sknd">

			<form role="form" id="formUploadDocumento"
				action="javascript:saveUploadDocumento(this);" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptDocumentoNuevo">
						<strong>SUBIR REPORTE </strong>
					</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="iptIdCiclo"
								name="iptIdCiclo" value=""> <input type="hidden"
								class="form-control" id="iptIdReporteAdic"
								name="iptIdReporteAdic" value="">
							<div class="row">

								<div class="col-md-6">
									<div class="form-group">
										<select class="form-control" id="selecTipoReporte" required="">
											<option value="">Tipo de reporte</option>
											<c:forEach var="tipoReporte" items="${lstTiposReportesAc}">
												<option value="${tipoReporte.id}"><c:out
														value="${tipoReporte.nombre}" />
												</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group">
										<input type="file" name="iptDocumentoFile"
											id="iptDocumentoFile"
											accept=".xlsx, .xls, .doc, .docx, .ppt, .pptx, .pdf"
											onchange="inUploadChange(this)" style="color: black;"
											required="">

									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div> -->

<div class="modal fade new-func" id="modalUploadDocumento" tabindex="-1"
	role="dialog" aria-labelledby="modalUploadDocumento" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg"
		role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="formUploadDocumento"
				action="javascript:saveUploadDocumento(this);" method="POST"
				class="" data-parsley-validate="">
				<div class="modal-header bg-glass-sknd">
					<h4 class="box-title regular uppercase" id="iptDocumentoNuevo">
						<strong id="strongNombreReporte"><spring:message code="lms.reporte.adic.table.nombre" /></strong>
					</h4>
					<hr>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" id="iptIdReporteAdic" name="iptIdReporteAdic" value=""> 
							<div class="row">


								<div class="col-md-12 mb-4">
									<div class="form-group">
										<input type="file" name="iptDocumentoFile"
											id="iptDocumentoFile"
											accept=".xlsx, .xls, .doc, .docx, .ppt, .pptx, .pdf"
											 style="color: black;"
											required="">

									</div>
								</div>

							</div>

						</div>
					</div>
					<!-- /.box -->
				</div>
				<div class="modal-footer flex-column">
					<button type="submit" class="md-btn md-btn-secondary
					 mb-2"><spring:message code="lms.reporte.adic.btn.aceptar" /></button>
					<button type="button" class="md-btn md-btn-close mt-3" data-dismiss="modal"><spring:message code="lms.reporte.adic.btn.cancelar" /></button>
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
				<h3 class="box-title"><spring:message code="lms.reporte.adic.reportes" /></h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<div class="box-body">
						<h4 id="modalTxtRespuesta" style=" color: black;"></h4>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal"><spring:message code="lms.reporte.adic.btn.aceptar" /></button>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
				$('#formUploadDocumento').parsley().on('field:validated', function() {
					var ok = $('.parsley-error').length === 0;
					$('.bs-callout-info').toggleClass('hidden', !ok);
					$('.bs-callout-warning').toggleClass('hidden', ok);
				}),
				$('#formUploadDocumento').parsley().options.requiredMessage = "Este campo es requerido",
				$('#formUploadDocumento').parsley({
					successClass : 'parsleyCorrect',
					errorClass : 'parsleyError'
				});
	});
</script>