<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="<c:url value='/resources/js/lms/cursos/cursos.js' />" type="text/javascript"></script> 
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>  
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Cursos</h1>
        <ol class="breadcrumb">
            <li><a href="#" onclick=""><i class="fa fa-bar-chart-o"></i>Cursos</a></li>
        </ol>
    </section>

	<!-- Main content -->
    <section class="content">
	    	<div>
			<button class="btn btn-primary" onclick="newCurso();">Crear nuevo curso</button>  
		</div>
		<br>
		<div>
			<a href="#" title="Descargar catálogo"
				onclick="descargarCatCursos();"><i class="fa fa-file-excel-o"
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
		                    <th style="width: 10%; text-align: center;">Empresa</th>
		                    <th style="width: 10%; text-align: center;">Tipo</th>
		                    <th style="width: 10%; text-align: center;">Código</th>
		                    <th style="width: 55%;">Curso</th>
		                    <th style="width: 10%; text-align: center;">Acciones</th>
		                </tr>
		            </thead>
		            <tbody>

		            		<c:if test="${not empty lstCursos}">
							<c:forEach items="${lstCursos}" var="curso" varStatus="loop">
				                <tr>
			                		<td style="text-align: center;">${curso.orden}</td>
			                		<td style="text-align: center;">${curso.empresa.nombre}</td>
			                		<td style="text-align: center;">${curso.tipoCurso.nombre}</td>
				                    <td style="text-align: center;">${curso.codigo}</td>
				                    <td><a style="cursor:pointer;" onclick="getCursoActividades(${curso.id});">${curso.nombre}</a></td>
				                    <td style="text-align: center;">
				                    	<a href="#" title="Editar" onclick="editCurso(${curso.id});"><i class="fa fa-gear"></i></a>
				                    	&nbsp;
				                    	<c:if test="${curso.banActivo == 1}">
											<a href="#" title="Estatus" onclick="estatusCurso(${curso.id});"><i class="fa fa-eye"></i></a>
										</c:if>
										<c:if test="${curso.banActivo == 0}">
											<a href="#" title="Estatus" onclick="estatusCurso(${curso.id});"><i class="fa fa-eye-slash"></i></a>
										</c:if>
				                    		&nbsp;

			                    		<c:if test="${loop.count != 1}">
			                    			<a href="#" title="Arriba" onclick="orderArribaCurso(${curso.id});"><i class="fa fa-arrow-circle-up"></i></a>&nbsp;
			                    		</c:if>
				                    		
			                    		<c:if test="${loop.count != fn:length(lstCursos)}">
			                    			<a href="#" title="Abajo" onclick="orderAbajoCurso(${curso.id});"><i class="fa fa-arrow-circle-down"></i></a>&nbsp;
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


<div class="modal fade" id="modalNewCurso" tabindex="-1" role="dialog"
	aria-labelledby="modalNewCurso" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
		
			<!-- form start -->
	        <form role="form" id="formCurso" action="javascript:saveCurso(this);" method="POST" class="" data-parsley-validate="" >
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title" id="iptCursoTitulo">Curso</h3>
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
			                            <label for="iptCursoClave">Código</label>
			                            <input type="text" class="form-control" id="iptCursoClave" name="iptCursoClave" placeholder="Código de Curso" maxlength="10" required="">
			                        </div>
		                    		</div>
		                    		<div class="col-md-6">
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-12">
				                        <div class="form-group">
				                            <label for="iptCursoNombre">Curso</label>
				                            <input type="text" class="form-control" id="iptCursoNombre" name="iptCursoNombre" placeholder="Nombre de Curso (Español)" maxlength="100" required="">
				                            <input type="text" class="form-control" id="iptCursoNombreEn" name="iptCursoNombreEn" placeholder="Nombre de Curso (Inglés)" maxlength="100" required="">
				                            <input type="text" class="form-control" id="iptCursoNombreFr" name="iptCursoNombreFr" placeholder="Nombre de Curso (Frances)" maxlength="100" required="">
				                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-12">
				                        <div class="form-group">
				                            <label for="iptCursoDescripcion">Descripción</label>
				                            <input type="text" class="form-control" id="iptCursoDescripcion" name="iptCursoDescripcion" placeholder="Descripción de Curso (Español)" maxlength="300" required="">
				                            <input type="text" class="form-control" id="iptCursoDescripcionEn" name="iptCursoDescripcionEn" placeholder="Descripción de Curso (Inglés)" maxlength="300" required="">
				                            <input type="text" class="form-control" id="iptCursoDescripcionFr" name="iptCursoDescripcionFr" placeholder="Descripción de Curso (Frances)" maxlength="300" required="">
				                        </div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
			                        <div class="form-group">
										<label>Idioma</label>
										<select class="form-control" id="selectCursoIdioma" name="selectCursoIdioma" required="">
										    <option value="">Seleccione...</option>
										    <c:forEach var="idiomas" items="${lstIdiomas}">
												<option value="${idiomas.id}"><c:out value="${idiomas.idioma}"/> </option>
											</c:forEach>	
										</select>
									</div>	
		                    		</div>
		                    		<div class="col-md-6">
			                        <div class="form-group">
										<label>Tipo</label>
										<select class="form-control" id="selectCursoTipo" name="selectCursoTipo" required="">
										    <option value="">Seleccione...</option>
										    <c:forEach var="tiposCurso" items="${lstTiposCurso}">
												<option value="${tiposCurso.id}"><c:out value="${tiposCurso.nombre}"/> </option>
											</c:forEach>	
										</select>
									</div>	
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
									<div class="form-group">
										<label>Empresa</label>
										<select class="form-control" id="selectCursoEmpresa" name="selectCursoEmpresa" required="">
										    <option value="">Seleccione...</option>
										    <c:forEach var="empresa" items="${lstEmpresa}">
												<option value="${empresa.id}"><c:out value="${empresa.nombre}"/> </option>
											</c:forEach>								
										</select>
									</div>	 
		                   		</div>
		                    		<div class="col-md-6">
			                        <div class="form-group">
										<label>Estatus</label>
										<select class="form-control" id="selectCursoEstatus" name="selectCursoEstatus" required="">
										    <option value="">Seleccione...</option>
										    <option value="1">Activo</option>
										    <option value="0">Inactivo</option>
										</select>
									</div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
									<div class="form-group">
										<label>Código planta</label>
										<input type="text" class="form-control" id="iptCursoCodigoPlanta" name="iptCursoCodigoPlanta" placeholder="Código de Planta" maxlength="10">
									</div>	 
		                   		</div>
		                    		<div class="col-md-6">
		                    			<label for="iptCursoCalificacion">Calificación min</label>
									<div class="input-group"> 	    
                                     	<span class="input-group-addon">
                                         	<input type="checkbox" id="iptCursoCalificacion" name="iptCursoCalificacion" class="iptCursoCalificacion"> 
                                       	</span>
                                        <input type="number" class="form-control" id="iptCursoCalificacionPorcentaje" name="iptCursoCalificacionPorcentaje" 
                                           		value="0" min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          		onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
									</div>
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
									<div class="form-group">
										<label>Duraci&oacute;n minutos</label>
                                        <input type="number" class="form-control" id="iptCursoHoras" name="iptCursoHoras" 
                                           		value="0" min="0" max="100000" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          		onKeyDown="if(this.value.length==5 && event.keyCode!=8) return false;">
									</div>	 
		                   		</div>
		                    		<div class="col-md-6">
		                    			<label>Duraci&oacute;n d&iacute;as</label>
                                        <input type="number" class="form-control" id="iptCursoDias" name="iptCursoDias" 
                                           		value="0" min="0" max="10000" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
								          		onKeyDown="if(this.value.length==5 && event.keyCode!=8) return false;">
		                    		</div>
		                    	</div>
		                    	<div class="row">
		                    		<div class="col-md-6">
										<div class="form-group">
											<label> Vigencia (Meses)</label>
	                                        <input type="number" class="form-control" id="iptVigencia" name="iptVigencia" value="0"
										       min="0" max="100" step="1" data-parsley-range-message="Este valor debe estar entre 0 y 100" 
										       onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" required="">
										</div>	 
			                   		</div>
		                    	</div>
		                    	<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>Plantillas</label> 
											<select class="form-control" id="selectPlanPlantilla" name="selectPlanPlantilla">
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
								
								<div id="divRevalida" style="display:none;">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>Curso Revalidaci&oacute;n</label> 
												<select class="form-control" id="selectCursoRevalida" name="selectCursoRevalida">
													<option value="">Seleccione...</option>
												</select>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6" style="text-align: center;">
										<div class="form-group" style="text-align: left;">
											<label for="iptCursoImagenIcono">Imagen</label> 
										</div>
										<div class="form-group">
											<img id="iptCursoIconoImg" name="iptCursoIconoImg"
												 src="<c:url value='/resources/css/img/icono_imagen_v1.png' />"
												 alt="documento image" style="width: 90px;" />
										</div>
										<div class="form-group" style="text-align: center;">
											<input type="file" id="iptCursoImagenFile" name="iptCursoImagenFile" accept=".jpg" onchange="inUploadChange(this)" style="display: inline;">
											<p class="help-block">&nbsp;&nbsp;&nbsp;Tipo de archivo aceptado: JPG</p>
										</div>
									</div>
									<div class="col-md-6" style="text-align: center;">
										<div id="cursoRowDownload" class="row" style="display:none">
											<div class="form-group">
												<label for="iptCursoIcono">Archivo actual</label> 
											</div>
											<div class="form-group"> 
												<p id="iptCursoActualFile" class="help-block"> </p>
											</div>
											<div class="form-group"> 
												<button onclick="downloadFile( $('#iptCursoId').val() ); return false;" >Descargar</button>
											</div>
										</div>
									</div>
								</div>

	                    </div>
		            </div><!-- /.box -->
				</div>
				<div class="modal-footer">
					<input type="hidden" id="iptCursoId" name="iptCursoId" value="">
					<button type="submit" class="btn">Aceptar</button>
					<button type="button" class="btn" data-dismiss="modal">Cancelar</button>
				</div>
			</form>
			
		</div>
	</div>
</div>


<div class="modal fade" id="modalEstatusCurso" tabindex="-1" role="dialog"
	aria-labelledby="modalEstatusCurso" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
		
		 	<!-- form start -->
	        <form role="form" id="formEstatusCurso" action="javascript:estatusCursoConfirmacion(this);" method="POST" class="" data-parsley-validate="" >
			
				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">Cambiar estatus a curso</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
		                <div class="box-header"></div>
	                    <div class="box-body">
	                    		<h4>¿Esta seguro que desea cambiar el estatus del curso?</h4>
	                    </div>
	                </div>
	            </div>
				<div class="modal-footer">
					<input type="hidden" id="iptEstatusCursoId" value="">
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
				<h3 class="box-title">Curso</h3>
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
  		$('#formCurso').parsley().on('field:validated', function() {
	    		var ok = $('.parsley-error').length === 0;
	    		$('.bs-callout-info').toggleClass('hidden', !ok);
	    		$('.bs-callout-warning').toggleClass('hidden', ok);
  		}),
  		$('#formCurso').parsley().options.requiredMessage = "Este campo es requerido",
  		$('#formCurso').parsley({ successClass: 'parsleyCorrect', errorClass: 'parsleyError' });
  		
	});
</script>



