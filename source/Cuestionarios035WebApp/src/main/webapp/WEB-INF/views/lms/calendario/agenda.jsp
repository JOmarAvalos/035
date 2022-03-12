
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="now" class="java.util.Date" />

<script src="<c:url value='/resources/js/admin/calendario.js' />"
	type="text/javascript"></script>

<main class="l-main inscripciones">
<nav aria-label="breadcrumb" role="navigation">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#"><spring:message
					code="lms.agenda.title" /></a></li>
	</ol>
</nav>
<div class="content-wrapper admin_wrap">
	<div class="row">
		<div class="col-md-12">
			<input type="hidden" id="idMonitoreoActividad" value="${idMonitoreoActividad}">
			<div class="nav-tabs-custom">
				<div class="tab-content">
					<div class="row">
						<div class="col-md-2">
							<!-- Button to Open the Modal -->
			<!-- 				<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#modalCalendar">PopOver / Modal</button> -->
								<div class="notas-calendario">
									<p class="txt-blue">
										<i class="fas fa-circle"></i> <spring:message code="lms.agenda.calendario.curso.disponible" />
									</p>
									<p class="txt-green">
										<i class="fas fa-circle"></i> <spring:message code="lms.agenda.calendario.inscrito" />
									</p>
									<p class="txt-gray">
										<i class="fas fa-circle"></i> <spring:message code="lms.agenda.calendario.no.disponible" />
									</p>
									
									<p class="txt-red">
										<i class="fas fa-circle"></i> <spring:message code="lms.agenda.calendario.cancelado" />
									</p>
									<p class="txt-amazul">
										<i class="fa fa-circle"></i><spring:message code="lms.calendario.impartido" />
									</p>
									
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



<!-- MODAL CURSOS CALENDARIO -->
<!-- The Modal -->
<div class="modal fade edit-func" id="modalCalendar">
	<div class="modal-dialog modal-dialog-centered modal-calendar">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<div class="row">
					<div class="col">
						<h2 id="iptCursoTitulo"></h2>

					</div>

					<button type="button" class="close" data-dismiss="modal">
						<div class="leftright"></div>
						<div class="rightleft"></div>
						<label class="close-label"><spring:message code="lms.agenda.label.cerrar" /></label>
					</button>
				</div>
			</div>
			<!-- Modal body -->
			<div class="modal-body pb-0">
				<input type="hidden" id="verCursoId">
				<input type="hidden" id="verCursoNombre">
				<input type="hidden" id="verCursoCertificadoId">
				<input type="hidden" id="verCursoInscripcion">
				<input type="hidden" id="verCursoPlanId">
				<div class="row">
					<div class="col-sm-6">
						<div class="row">
							<div class="col-md-2">
								<div class="form-group">
									<p>
										<i class="fas fa-calendar-alt"></i>
									</p>
								</div>
							</div>
							<div class="col-md-10">
								<div class="form-group">
									<p id="iptfecha"></p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<div class="form-group">
									<p>
										<i class="fas fa-chalkboard-teacher"></i>
									</p>
								</div>
							</div>
							<div class="col-md-10">
								<div class="form-group">
									<p id="iptTipoCurso"></p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-6">
						<div class="row">
							<div class="col-md-2">
								<div class="form-group">
									<p>
										<i class="fas fa-clock"></i>
									</p>
								</div>
							</div>
							<div class="col-md-10">
								<div class="form-group">
									<p id="iptTiempo"></p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
								<div class="form-group">
									<p>
										<i class="fas fa-synagogue"></i>
									</p>
								</div>
							</div>
							<div class="col-md-10">
								<div class="form-group">
									<p id="iptNombreSede"></p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-12 text-center">
						<hr>
						<button id="btnMeInteresa" class="md-btn" onclick="saveEventoInscripcion();">
							<spring:message code="lms.agenda.btn.minteresa" /> <i class="fas fa-check-circle"></i>
						</button>
						
						<button id="btnEntrarCurso" class="md-btn" onclick="getCursoEvento()">
							<spring:message code="lms.carrera.plan.certificado.btn.ver" /> <i class="fas fa-check-circle"></i>
						</button>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer pt-0 mb-2">
				<input type="hidden" id="iptEventoCalendarioId" value="">
				<button type="button" class="md-btn md-btn-close my-0"
					data-dismiss="modal">
					<i class="fas fa-times"></i> <spring:message code="lms.agenda.btn.cancelar" />
				</button>
			</div>

		</div>
	</div>
</div>


<div class="modal fade" id="modalNewAgendaToyota" tabindex="-1"
	role="dialog" aria-labelledby="modalNewFuncionario" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"> <spring:message code="lms.agenda.new.curso.title" /></h3>
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
					<form role="form">
						<div class="box-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label><spring:message code="lms.agenda.label.curso" /></label> <select class="form-control"
											id="selectCursoToyota">
											<option value="0">Seleccione...</option>
											<option value="1">Atencion a clientes</option>
											<option value="2">Mantenimiento electrico</option>
											<option value="3">Autopartes</option>
											<option value="4">Ventas corp 101</option>
											<option value="5">Inicial Mitsubishi</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label><spring:message code="lms.agenda.label.instructor" /></label> <select class="form-control"
											id="selectCursoToyota">
											<option value="0">Seleccione...</option>
											<option value="1">Jane Doe</option>
											<option value="2">Jonh Doe</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label><spring:message code="lms.agenda.label.sede" /></label> <select class="form-control"
											id="selectSedeToyota">
											<option value="0">Seleccione...</option>
											<option value="1">DOJO</option>
											<option value="2">Sede nueva</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptNacimientoFuncionario"><spring:message code="lms.agenda.label.fecha" /></label>
										<input type="date" class="form-control"
											id="iptNacimientoFuncionario" placeholder="Fecha de inicio">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal"><spring:message code="lms.agenda.btn.aceptar" /></button>
				<button type="button" class="btn" data-dismiss="modal"><spring:message code="lms.agenda.btn.cancelar" /></button>
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
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Cerrar</button>
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

$(document).ready(function() {
    function changeNumber() {
    	var idMonitoreoActividad=$("#idMonitoreoActividad").val();
    	
    	var urltxt=ctx+"/lms/agenda/updateMonitoreoActividad?id="+idMonitoreoActividad; 
    	$.ajax({
    		type : "POST",
    		url : urltxt,
    		contentType : "application/json",
    		beforeSend : function() {
    		},
    		complete : function() {
    		},
    		success : function(response) {
    			
    			if (response[0]) {				
    			} else {
    				$('#modalTxtRespuesta').html('');
    				$('#modalTxtRespuesta').append('Error');
    				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
    			}
    		},
    		error : function(msg) {
    		}
    	});
    }
    setInterval(changeNumber, 30000);
});

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
       	$('#iptfecha').html('');
    	$('#iptTipoCurso').html('');
    	$('#iptTiempo').html('');    	
    	$('#iptNombreSede').html('');   	   
   	    $('#btnMeInteresa').prop("disabled", false);
	    getEventoCalendario(idEvento);
      }

    });

    getEventoCalendario = function(id) {

		var urltxt = ctx + '/lms/agenda/getEventoCalendario?id='+id;
		
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
					var object2 = response[2];
					var object3 = response[3];
					var object4 = response[4];
					var inscrito = response[5];
					var cursoId = response[6];
					var cursoNombre = response[7];
					var inscripcionId = response[8];
					var certificado = response[9];
					var plan = response[9];
					var tiempo =formatDateHora(new Date(object.fechaInicio))+'  -  '+formatDateHora(new Date(object.fechaFin));
					
					
					$("#iptEventoCalendarioId").val(object.id); 
					<c:if test="${not empty locale}">
					    <c:if test="${fn:contains(locale, 'es')}">
						    $('#iptCursoTitulo').append(object.cursoVO.nombre);
					    </c:if>
					    <c:if test="${fn:contains(locale, 'en')}">
						    $('#iptCursoTitulo').append(object.cursoVO.nombreEn);
					    </c:if>
					    <c:if test="${fn:contains(locale, 'fr')}">
						    $('#iptCursoTitulo').append(object.cursoVO.nombreFr);
					    </c:if>
					</c:if>
					<c:if test="${empty locale}">
					    $('#iptCursoTitulo').append(object.cursoVO.nombre);
					</c:if> 
									
			        $('#iptfecha').append(formatDate(new Date(object.fechaInicio)));
				    $('#iptTipoCurso').append(object.cursoVO.tipoCurso.nombre);
				    $('#iptTiempo').append(tiempo);  
				    $('#iptNombreSede').append(object.sedeVO.nombre);
				    
				    $('#verCursoId').val(cursoId);
				    $('#verCursoNombre').val(cursoNombre);
				    $('#verCursoCertificadoId').val(certificado);
				    $('#verCursoInscripcion').val(inscripcionId);
				    $('#verCursoPlanId').val(plan);
				    
				    if(object2===1){
				    	 $('#btnMeInteresa').hide();	
				    	 //$('#').append(object3);
				    }else{
				    	$('#btnMeInteresa').show();
				    }
				    
				    if(inscrito){
				    	$('#btnEntrarCurso').show();
				    }else{
				    	 $('#btnEntrarCurso').hide();
				    }
				    
				    
				    $('#modalCalendar').modal({backdrop: 'static', keyboard: false});
									
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
    calendar.render();
    
    
    
  });
  
  

</script>