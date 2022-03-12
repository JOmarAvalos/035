<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="<c:url value='/resources/js/lms/certificados/certificados.js' />" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>  
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Certificaciones
        </h1>
    </section>

	<!-- Main content -->
    <section class="content">
	    	<div>
			<button class="btn btn-primary" onclick="newCertificado();">Crear nueva certificación</button>  
		</div>
				<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatCertificados();"><i class="fa fa-file-excel-o"
				style="font-size: 24px; color: green"></i></a>
		</div>
		<br>
		<div class="box mb-5">
		    <div class="box-header">
		    
		    </div><!-- /.box-header -->
		    <div class="box-body table-responsive">
		        <table id="example1" class="table table-bordered table-striped">
		            <thead>
		                <tr>
		                		<th style="width: 5%; text-align: center;">Orden</th>
		                    <th style="width: 10%; text-align: center;">Código</th>
		                    <th style="width: 10%;  text-align: center;">Empresa</th>
		                    <th style="width: 55%;">Certificación</th>
		                    <th style="width: 10%;  text-align: center;">Proyecto</th>
		                    <th style="width: 10%; text-align: center;">Acciones</th>
		                </tr>
		            </thead>
		            <tbody>

						<c:if test="${not empty lstCertificados}">
							<c:forEach items="${lstCertificados}" var="certificado" varStatus="loop">
				                <tr>
				                	    <td style="text-align: center;">${certificado.orden}</td>
				                    <td style="text-align: center;">${certificado.codigo}</td>
				                    <td style="text-align: center;">${certificado.empresaVO.nombre}</td>
				                    <td><a style="cursor:pointer;" onclick="getCertificadoActividades(${certificado.id});">${certificado.nombre}</a></td>
				                    <td style="text-align: center;">${certificado.proyectoVO.nombre}</td>
				                    <td style="text-align: center;">
				                    		<a href="#" title="Editar" onclick="editCertificado(${certificado.id});"><i class="fa fa-gear"></i></a>
				                    		&nbsp;
				                    		<c:if test="${certificado.banActivo == 1}">
											<a href="#" title="Estatus" onclick="estatusCertificado(${certificado.id});"><i class="fa fa-eye"></i></a>
										</c:if>
										<c:if test="${certificado.banActivo == 0}">
											<a href="#" title="Estatus" onclick="estatusCertificado(${certificado.id});"><i class="fa fa-eye-slash"></i></a>
										</c:if>
				                    		&nbsp;
				                    		<c:if test="${loop.count != 1}">
				                    			<a href="#" title="Arriba" onclick="orderArribaCertificado(${certificado.id});"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
				                    		</c:if>
				                    		
				                    		<c:if test="${loop.count != fn:length(lstCertificados)}">
				                    			<a href="#" title="Abajo" onclick="orderAbajoCertificado(${certificado.id});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
				                    		</c:if>
				                    	</td>
				                </tr>
				          	</c:forEach>
						</c:if>
		               
		            </tbody>
		        </table>
		    </div><!-- /.box-body -->
		</div><!-- /.box -->

	</section><!-- /.content -->
</aside><!-- /.right-side -->        


<div class="modal fade" id="modalNewCertificado" tabindex="-1" role="dialog"
	aria-labelledby="modalNewCertificado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
		
			<!-- form start -->
	        <form role="form" id="formCertificado" action="javascript:saveCertificado(this);" method="POST" class="" data-parsley-validate="" >
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptCertificadoTitulo">Certificación</h3>
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
			                            <label for="iptCertificadoCodigo">Código</label>
			                            <input type="text" class="form-control" id="iptCertificadoCodigo" name="iptCertificadoCodigo" placeholder="Código de Certificación" maxlength="10" required="">
			                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">		
		                    		<div class="col-md-12">
			                        <div class="form-group">
			                            <label for="iptCertificadoNombre">Nombre</label>
			                            <input type="text" class="form-control" id="iptCertificadoNombre" name="iptCertificadoNombre" placeholder="Nombre de Certificación (Español)" maxlength="100" required="">
			                            <input type="text" class="form-control" id="iptCertificadoNombreEn" name="iptCertificadoNombreEn" placeholder="Nombre de Certificación (Inglés)" maxlength="100" required="">
			                            <input type="text" class="form-control" id="iptCertificadoNombreFr" name="iptCertificadoNombreFr" placeholder="Nombre de Certificación (Frances)" maxlength="100" required="">
			                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-12">
			                        <div class="form-group">
			                            <label for="iptCertificadoDescripcion">Descripción</label>
			                            <input type="text" class="form-control" id="iptCertificadoDescripcion" name="iptCertificadoDescripcion" placeholder="Descripción de Certificación (Español)" maxlength="300" required="">
			                            <input type="text" class="form-control" id="iptCertificadoDescripcionEn" name="iptCertificadoDescripcionEn" placeholder="Descripción de Certificación (Inglés)" maxlength="300" required="">
			                            <input type="text" class="form-control" id="iptCertificadoDescripcionFr" name="iptCertificadoDescripcionFr" placeholder="Descripción de Certificación (Frances)" maxlength="300" required="">
			                        </div>
		                    		</div>
		                    	</div>
							<div class="row">
		                    		<div class="col-md-12">
									<div class="form-group">
										<label>Empresa</label>
										<select class="form-control" id="selectCertificadoEmpresa" name="selectCertificadoEmpresa" onchange="getProyectosAndCursos();" required="">
										    <option value="">Seleccione...</option>
										    <c:forEach var="empresa" items="${lstEmpresa}">
												<option value="${empresa.id}"><c:out value="${empresa.nombre}"/> </option>
											</c:forEach>								
										</select>
									</div>	 
		                   		</div>
		                    	</div>
		                    	<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Proyecto</label> 
										<select class="form-control" id="selecCertificadoProyecto" name="selecCertificadoProyecto"  required="">
										</select>
									</div>
								</div>
							</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
			                        <div class="form-group">
										<label for="iptCertificadoVigencia">Vigencia (Meses)</label>
										<input type="number" class="form-control" id="iptCertificadoVigencia" name="iptCertificadoVigencia" value="0"
										       min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
										       onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
		                    		</div>
		                    		<div class="col-md-6">
			                        <div class="form-group">
										<label>Estatus</label>
										<select class="form-control" id="selectCertificadoEstatus" name="selectCertificadoEstatus"  required="">
										    <option value="">Seleccione...</option>
										    <option value="1">Activo</option>
										    <option value="0">Inactivo</option>
										</select>
									</div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>Plantillas</label> <select class="form-control" id="selectPlanPlantilla" name="selectPlanPlantilla">
											<option value="">Seleccione...</option>
											<c:forEach var="plantilla" items="${lstPlantillas}">
												<option value="${plantilla.id}"><c:out
														value="${plantilla.nombre}" />
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>

							<div class="row">
	                    		<div class="col-md-12">
	                    			<div class="form-group">
									<label>Curso revalidación (Presencial)</label> 
									<select class="form-control" id="selectCursoRevalidacionPresencial" name="selectCursoRevalidacionPresencial"></select>
								</div>
	                    		</div>
	                    	</div>
		                    	
	                    	<div class="row">
	                    		<div class="col-md-12">
	                    			<div class="form-group">
									<label>Curso revalidación (Online)</label> 
									<select class="form-control" id="selectCursoRevalidacionOnline" name="selectCursoRevalidacionOnline"></select>
								</div>
	                    		</div>
	                    	</div>

	                    	<div class="row">
								<div class="col-md-6" style="text-align: center;">
									<div class="form-group" style="text-align: left;">
										<label for="iptCertificadoImagenIcono">Imagen</label> 
									</div>
									<div class="form-group">
										<img id="iptCertificadoIconoImg" name="iptCertificadoIconoImg"
											 src="<c:url value='/resources/css/img/icono_imagen_v1.png' />"
											 alt="documento image" style="width: 90px;" />
									</div>
									<div class="form-group" style="text-align: center;">
										<input type="file" id="iptCertificadoImagenFile" name="iptCertificadoImagenFile" accept=".jpg" onchange="inUploadChange(this)" style="display: inline;">
										<p class="help-block">&nbsp;&nbsp;&nbsp;Tipo de archivo aceptado: JPG</p>
									</div>
								</div>
								<div class="col-md-6" style="text-align: center;">
									<div id="certificadoRowDownload" class="row" style="display:none">
										<div class="form-group">
											<label for="iptCertificadoIcono">Archivo actual</label> 
										</div>
										<div class="form-group"> 
											<p id="iptCertificadoActualFile" class="help-block"> </p>
										</div>
										<div class="form-group"> 
											<button onclick="downloadFile( $('#iptCertificadoId').val() ); return false;" >Descargar</button>
										</div>
									</div>
								</div>
							</div>

	                    </div>
		            </div><!-- /.box -->
				</div>
				<div class="modal-footer">
					<input type="hidden" id="iptCertificadoId" name="iptCertificadoId" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
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
				<h3 class="box-title">Certificación</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
	                <div class="box-header"></div>
                    <div class="box-body">
                    		<h4 id="modalTxtRespuesta"></h4>
                    </div>
                </div>
            </div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Aceptar</button>
			</div>
			
		</div>
	</div>
</div>
<div class="modal fade" id="modalEstatusCertificado" tabindex="-1" role="dialog"
	aria-labelledby="modalEstatusCertificado" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
		
		 	<!-- form start -->
	        <form role="form" id="formEstatusCurso" action="javascript:estatusCertificadoConfirmacion(this);" method="POST" class="" data-parsley-validate="" >
			
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Certificación</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
		                <div class="box-header"></div>
	                    <div class="box-body">
	                    		<h4>¿Esta seguro que desea cambiar el estatus de la certificación?</h4>
	                    </div>
	                </div>
	            </div>
				<div class="modal-footer">
					<input type="hidden" id="iptEstatusCertificadoId" value="">
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
  		$('#formCertificado').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formCertificado').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formCertificado').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
	});
</script>


