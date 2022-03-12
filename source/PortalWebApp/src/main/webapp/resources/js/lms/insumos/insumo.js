
newActividad = function() {
	// Resetea validadores
	$('#formActividadEncuesta').parsley().reset();
	
	cleanActividadEncuesta();
	// Muestra modal nueva actividad encuesta
	$('#modalNewEncuesta').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelModalEncuesta").off("click").click(function() {
		cancelEncuesta();
	});

}

function resetElement(id) {
	  document.getElementById(id).style.display = "block";
	  document.getElementById(id).style.visibility = "visible";
	}

function removeElement(id) {
	  document.getElementById(id).style.display = "none";
	}

function changeVisibility(id) {
	  document.getElementById(id).style.visibility = "hidden";
	}

function downloadFile(idData) {
	window.open(ctx + '/actividad/downloadFile?fileId=' + idData);
}


newEncuesta = function() {
	
	// Resetea validadores
	$('#formActividadExamen').parsley().reset();
	
	cleanActividadEncuesta();
	// Muestra modal nueva actividad encuesta
	$('#modalNewActividad').modal('hide');
	$('#modalNewEncuesta').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelModalEncuesta").off("click").click(function() {
		cancelEncuesta();
	});
}
cancelEncuesta = function() {
	// Desaparece modal nueva actividad encuesta
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewEncuesta').modal('hide');
}
closeEncuesta = function(){
	$('#modalNewEncuesta').modal('hide');
}



saveActividadEncuesta = function(obj) {
	validacionData = true;
	if (!notNull($("#iptActividadEncuestaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadEncuestaDescripcion"))) {
		validacionData = false;
	}
	if (!notNull($("#selectActividadEncuestaEstatus"))) {
		validacionData = false;
	}
//	if (!notNull($("#timeRage"))) {
//		validacionData = false;
//	}
	
	if (validacionData) {
	
//		var dataRageStr= $('#timeRage').val(); 		
//		var arrayDates = dataRageStr.split(" - ");
//		if(arrayDates.length == 2 ){
//			var dateIni = moment(arrayDates[0], "DD/MM/YYYY hh:mm A");
//			var dateFin = moment(arrayDates[1], "DD/MM/YYYY hh:mm A");
		
			var InsumoActividadVO = new Object;
			var urltxt = ctx + '/insumos/saveInsumo';
			
			InsumoActividadVO.id = $('#iptIdActividadEncuesta').val();
			InsumoActividadVO.nombre = $('#iptActividadEncuestaNombre').val();
			InsumoActividadVO.descripcion = $('#iptActividadEncuestaDescripcion').val();
			InsumoActividadVO.idEmpresa = $('#selectActividadEncuestaEmpresa').val();
//			InsumoActividadVO.inicio = dateIni;
//			InsumoActividadVO.fin = dateFin;
			
			InsumoActividadVO.banActivo = Number($('#selectActividadEncuestaEstatus').val());
			
			
			$.ajax({
				type : "POST",
				url : urltxt,
				contentType : "application/json",
				data : JSON.stringify(InsumoActividadVO),
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
						window.location = ctx + '/administradorInsumos';
						displaySuccesMessageByObjectId('',msg,'formActividadEncuesta');
					} else {
						displayErrorMessageByObjectId('',msg,'formActividadEncuesta');
					}
				},
				error : function(msg) {
					displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadEncuesta');
				}
			});
//		}
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadEncuesta');
	}
}


orderArribaActividad = function( idA) {

	var urltxt = ctx + '/lms/changeOrdenArribaActividad?idC='+idC+'&idA='+idA;
	
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
				window.location = ctx+'/administradorInsumos';
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


orderAbajoActividad = function( idA) {

	var urltxt = ctx + '/lms/changeOrdenAbajoActividad?idC='+idC+'&idA='+idA;
	
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
				window.location = ctx+'/administradorInsumos';
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


estatusActividad = function( idActividad) {
	//$("#iptEstatusCursoId").val(idCurso);
	$("#iptEstatusActividadId").val(idActividad);
	$('#modalEstatusActividad').modal({backdrop: 'static', keyboard: false});
}


estatusActividadConfirmacion = function() {
	
	//var idCurso = $('#iptEstatusCursoId').val();
	var idActividad = $('#iptEstatusActividadId').val();
	
	var urltxt = ctx + '/insumos/changeEstatusActividad?id='+idActividad;
	
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
			
			$('#modalEstatusActividad').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx+'/administradorInsumos';
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

editActividad = function(idActividad) {
	
	var urltxt = ctx + '/insumos/consultaActividad?id='+idActividad;
	
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
			if (result) {					
				var actividadVO = response[1];
				
				$('#formActividadEncuesta').parsley().reset();
				        cleanActividadEncuesta();
				        $("#btnCancelModalEncuesta").off("click").click(function() {
				        		closeEncuesta();
				        });
				        
//				        var iniD = actividadVO.inicio;
//				        var finD = actividadVO.fin;
//				        
//				        var iniMoment = moment(iniD).format('DD/MM/YYYY hh:mm A')
//				        var finMoment = moment(finD).format('DD/MM/YYYY hh:mm A')
//				        
//				        $('#timeRage').data('daterangepicker').setStartDate(iniMoment);
//						$('#timeRage').data('daterangepicker').setEndDate(finMoment);
						
						//$('#iptIdCursoEncuesta').val(actividadVO.idCurso);
						$('#iptIdActividadEncuesta').val(actividadVO.id);
						$('#iptActividadEncuestaNombre').val(actividadVO.nombre);
						$('#iptActividadEncuestaDescripcion').val(actividadVO.descripcion);
						$('#selectActividadEncuestaEstatus').val(actividadVO.banActivo);
						$('#selectActividadEncuestaEmpresa').val(actividadVO.idEmpresa);
						$('#modalNewEncuesta').modal({backdrop: 'static', keyboard: false});
			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadScorm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadScorm');
		}
	});	
}

function cleanActividadEncuesta(){
	//Clean data
	$('#iptIdActividadEncuesta').val('');
	$('#iptActividadEncuestaNombre').val('');
	$('#iptActividadEncuestaDescripcion').text('');
	$('#iptActividadEncuestaDescripcion').val('');
	$('#iptActividadEncuestaFechaInicial').val('');
	$('#iptActividadEncuestaFechaFinal').val('');
	$('#selectActividadEncuestaEstatus').val('');
	$("#timeRage").val('');
}


function downloadFileDocumento(){
	var idActividad = $('#iptIdActividadDocumento').val();
	var theUrl = ctx + '/actividad/download?param='+idActividad;
	window.location = theUrl;
}


function getActividadPreguntas( idActividad){
	window.location = ctx+'/insumos/actividad?idActividad='+idActividad;
}




//Ciclos de insumos

newCicloInsumo = function() {
	
	cleanModalCicloInsumo();
	eliminaMarcaRojo($("#iptNombreCicloInsumo"));
	eliminaMarcaRojo($("#selecCicloInsumoEmpresa"));
	eliminaMarcaRojo($("#iptFechaInicioCicloInsumo"));
	eliminaMarcaRojo($("#iptFechaFinCicloInsumo"));

	$('#modalNewCicloInsumo').modal({
		backdrop : 'static',
		keyboard : false
	});
}
function cleanModalCicloInsumo() {
	$("#iptNombreCicloInsumo").val('');
	$("#selecCicloInsumoEmpresa").val('');
	$("#iptFechaInicioCicloInsumo").val('');
	$("#iptFechaFinCicloInsumo").val('');
	$('#selecCicloInsumoEmpresa').prop("disabled", false);
	$('#iptFechaFinCicloInsumo').prop("disabled", true);
}

validacion = function() {
	var iniAnio = $('#iptFechaInicioCicloInsumo').val().substring(0,4);
	var iniMes  = $('#iptFechaInicioCicloInsumo').val().substring(5,7);
	var iniDia  = $('#iptFechaInicioCicloInsumo').val().substring(8,10);
	var iniHora = $('#iptFechaInicioCicloInsumo').val().substring(11,13);
	var iniMin  = $('#iptFechaInicioCicloInsumo').val().substring(14,16);
	
	var finAnio = $('#iptFechaFinCicloInsumo').val().substring(0,4);
	var finMes  = $('#iptFechaFinCicloInsumo').val().substring(5,7);
	var finDia  = $('#iptFechaFinCicloInsumo').val().substring(8,10);
	var finHora = $('#iptFechaFinCicloInsumo').val().substring(11,13);
	var finMin  = $('#iptFechaFinCicloInsumo').val().substring(14,16); 
	var cicloInsumo = new Object;
	var fchInicio = new Date(iniAnio, iniMes-1, iniDia, iniHora, iniMin, 0, 0);
	var fchCierre = new Date(finAnio, finMes-1, finDia, finHora, finMin, 0, 0);
	if(fchInicio!=null && fchCierre!=null){
		cicloInsumo.idEmpresa = $("#selecCicloInsumoEmpresa").val();
		cicloInsumo.fchInicio = fchInicio;
		cicloInsumo.fchCierre = fchCierre;
		var urltxt = ctx
		+ "/insumos/getValidacionCiclo";

     		var jqXHR = 	$.ajax({
	        async: false,
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(cicloInsumo),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {						
			},
			error : function(msg) {
				alert('Error');
			}
		});	

		var datos=jqXHR.responseJSON;
		result = datos[0];
		if (result) {
			$("#iptFechaInicioCicloInsumo").val('');
			$("#iptFechaFinCicloInsumo").val('');
			$('#iptFechaFinCicloInsumo').prop("disabled", true);
			$('#modalDatosFechaCiclo').modal({backdrop: 'static', keyboard: false});
		}
	
	}	
}

setMinDateFin = function(){
	
	var minFinDate = $('#iptFechaInicioCicloInsumo').val();
	var x = document.getElementById("iptFechaFinCicloInsumo");
	x.min = minFinDate;
	$('#iptFechaFinCicloInsumo').attr('disabled',false);
	$('#iptFechaFinCicloInsumo').val(minFinDate);
	
}

saveCicloInsumo = function() {
	var cicloInsumo = new Object;
	eventoValid = true;
	if (!notNull($("#iptNombreCicloInsumo"))) {
		eventoValid = false;
	}
	if (!notNull($("#selecCicloInsumoEmpresa"))) {
		eventoValid = false;
	}
	if (!notNull($("#iptFechaInicioCicloInsumo"))) {
		eventoValid = false;
	}
	if (!notNull($("#iptFechaFinCicloInsumo"))) {
		eventoValid = false;
	}
	if(eventoValid){
	cicloInsumo.nombre = $('#iptNombreCicloInsumo').val();
	cicloInsumo.idEmpresa = $('#selecCicloInsumoEmpresa').val();
	
	var iniAnio = $('#iptFechaInicioCicloInsumo').val().substring(0,4);
	var iniMes  = $('#iptFechaInicioCicloInsumo').val().substring(5,7);
	var iniDia  = $('#iptFechaInicioCicloInsumo').val().substring(8,10);
	var iniHora = $('#iptFechaInicioCicloInsumo').val().substring(11,13);
	var iniMin  = $('#iptFechaInicioCicloInsumo').val().substring(14,16);
	
	var finAnio = $('#iptFechaFinCicloInsumo').val().substring(0,4);
	var finMes  = $('#iptFechaFinCicloInsumo').val().substring(5,7);
	var finDia  = $('#iptFechaFinCicloInsumo').val().substring(8,10);
	var finHora = $('#iptFechaFinCicloInsumo').val().substring(11,13);
	var finMin  = $('#iptFechaFinCicloInsumo').val().substring(14,16);

	cicloInsumo.fchInicio = new Date(iniAnio, iniMes-1, iniDia, iniHora, iniMin, 0, 0);
	cicloInsumo.fchCierre = new Date(finAnio, finMes-1, finDia, finHora, finMin, 0, 0);


	// Guardar nuevo registro
	var urltxt = ctx + '/insumos/saveCicloInsumo';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(cicloInsumo),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {

			$('#modalNewCicloInsumo').modal('hide');

			if (response[0]) {
				window.location = ctx + '/insumos/ciclos';
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Guardado correctamente');
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append(response[1]);
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

editCicloInsumo = function() {
	var cicloInsumo = new Object;
	eventoValid = true;
	if (!notNull($("#iptNombreCicloInsumoEdit"))) {
		eventoValid = false;
	}
	if (!notNull($("#selecCicloInsumoEmpresaEdit"))) {
		eventoValid = false;
	}
	if (!notNull($("#iptFechaInicioCicloInsumoEdit"))) {
		eventoValid = false;
	}
	if (!notNull($("#iptFechaFinCicloInsumoEdit"))) {
		eventoValid = false;
	}
	if(eventoValid){
		cicloInsumo.id = $('#iptIdCicloEdit').val();
		cicloInsumo.nombre = $('#iptNombreCicloInsumoEdit').val();
		cicloInsumo.idEmpresa = $('#selecCicloInsumoEmpresaEdit').val();
		
		var iniAnio = $('#iptFechaInicioCicloInsumoEdit').val().substring(0,4);
		var iniMes  = $('#iptFechaInicioCicloInsumoEdit').val().substring(5,7);
		var iniDia  = $('#iptFechaInicioCicloInsumoEdit').val().substring(8,10);
		var iniHora = $('#iptFechaInicioCicloInsumoEdit').val().substring(11,13);
		var iniMin  = $('#iptFechaInicioCicloInsumoEdit').val().substring(14,16);
		
		var finAnio = $('#iptFechaFinCicloInsumoEdit').val().substring(0,4);
		var finMes  = $('#iptFechaFinCicloInsumoEdit').val().substring(5,7);
		var finDia  = $('#iptFechaFinCicloInsumoEdit').val().substring(8,10);
		var finHora = $('#iptFechaFinCicloInsumoEdit').val().substring(11,13);
		var finMin  = $('#iptFechaFinCicloInsumoEdit').val().substring(14,16);
	
		cicloInsumo.fchInicio = new Date(iniAnio, iniMes-1, iniDia, iniHora, iniMin, 0, 0);
		cicloInsumo.fchCierre = new Date(finAnio, finMes-1, finDia, finHora, finMin, 0, 0);
	
	
		// Guardar nuevo registro
		var urltxt = ctx + '/insumos/updateCiclo';
	
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(cicloInsumo),
			beforeSend : function() {
				maskBody();
			},
			complete : function() {
				unmaskBody();
			},
			success : function(response) {
	
				$('#modalEditCicloInsumo').modal('hide');
	
				if (response[0]) {
					window.location = ctx + '/insumos/ciclos';
					$('#modalTxtRespuesta').html('');
					$('#modalTxtRespuesta').append('Guardado correctamente');
					$('#modalRespuesta').modal({
						backdrop : 'static',
						keyboard : false
					});
				} else {
					$('#modalTxtRespuesta').html('');
					$('#modalTxtRespuesta').append(response[1]);
					$('#modalRespuesta').modal({
						backdrop : 'static',
						keyboard : false
					});
				}
			},
			error : function(msg) {
				alert('Error alert');
			}
		});
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

verDetalle = function (id){
	window.location = ctx+'/insumos/ciclo?id='+id;
}

verEditar = function(id, idEmpresa, nombre, inicio, cierre){
	$('#iptIdCicloEdit').val(id);
	$('#selecCicloInsumoEmpresaEdit').val(idEmpresa);
	$('#iptNombreCicloInsumoEdit').val(nombre);
	$('#iptFechaInicioCicloInsumoEdit').val(inicio);
	$('#iptFechaFinCicloInsumoEdit').val(cierre);
	
	$('#modalEditCicloInsumo').modal({ backdrop : 'static', keyboard : false });
	
}


showFechas = function(){
	
	idEmpresa = $('#selecCicloInsumoEmpresa').val();
	if($('#selecCicloInsumoEmpresa').val() > 0){
		$('#iptFechaInicioCicloInsumo').attr('disabled',false);
	}else{
		$('#iptFechaInicioCicloInsumo').attr('disabled',true);
		$('#iptFechaFinCicloInsumo').attr('disabled',true);
	}
	
}

function exportaCiclo(id) {
	window.open(ctx + '/insumos/descargarCiclo?id=' + id);
}


function exportaSolicitud(id) {
	window.open(ctx + '/insumos/descargarSolicitud?id=' + id);
}

actualizaConsulta = function(idConsulta, estatus, idCiclo){
	var urltxt = ctx + '/insumos/updateEstatusSolicitud?idConsulta='+idConsulta+'&idEstatus='+estatus;
	
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
				window.location = ctx+'/insumos/ciclo?id='+idCiclo;
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
}

