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

/////////
/////////

newPregunta = function() {
	// Muestra modal nueva pregunta
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
}

/////////
/////////

newAbierta = function() {
	
	$('#formPreguntaAbierta').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleAbiertaNueva");
	removeElement("hTitleAbiertaEditar");
	
	// Muestra modal nueva pregunta abierta
	$('#modalNewPregunta').modal('hide');
	$('#modalNewAbierta').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelAbierta").off("click").click(function() {
		cancelAbierta();
	});
}
cancelAbierta = function() {
	// Desaparece modal nueva pregunta abierta
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewAbierta').modal('hide');
}
closeAbierta = function(){
	$('#modalNewAbierta').modal('hide');
}


newVerdaderoFalso = function() {
	
	$('#formPreguntaVerdaderoFalso').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleVerdaderoFalsoNueva");
	removeElement("hTitleVerdaderoFalsoEditar");
	
	// Muestra modal nueva pregunta Verdadero Falso
	$('#modalNewPregunta').modal('hide');
	$('#modalNewVerdaderoFalso').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelVerdaderoFalso").off("click").click(function() {
		cancelVerdaderoFalso();
	});
}
cancelVerdaderoFalso = function() {
	// Desaparece modal nueva pregunta Verdadero Falso
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewVerdaderoFalso').modal('hide');
}
closeVerdaderoFalso = function(){
	$('#modalNewVerdaderoFalso').modal('hide');
}


newMultipleUnica = function() {
	
	$('#formPreguntaMultipleUnica').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleMultipleUnicaNueva");
	removeElement("hTitleMultipleUnicaEditar");
	
	// Muestra modal nueva pregunta Multiple Unica
	$('#modalNewPregunta').modal('hide');
	$('#modalNewMultipleUnica').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelMultipleUnica").off("click").click(function() {
		cancelMultipleUnica();
	});
}
cancelMultipleUnica = function() {
	// Desaparece modal nueva pregunta Multiple Unica
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewMultipleUnica').modal('hide');
}
closeMultipleUnica = function(){
	$('#modalNewMultipleUnica').modal('hide');
}

btnRespuestaMultipleUnicaGenerar = function() {
	var opcionSel = $("#selectPreguntaMultipleUnicaGenerar").val();
	
	if(!(opcionSel == '')) {
		$("#respuestas").empty();
		
	    for (var i = 1; i <= opcionSel; i++) {
	      $('#respuestas')
	      	.append(`<div class="input-group">`+
	      				`<span class="input-group-addon">`+
	      					``+
	      				`</span>`+
	      				`<input type="text" class="form-control" id="iptRespuestaMU${i}" name="iptRespuestaMU${i}" maxlength="500" placeholder="Respuesta ${i}" required="">`+
	      			`</div>`);
	    }

	    $('#respuestas').append(`</br>`);
	} 
}

/////////
/////////

savePreguntaAbierta = function(obj, idActividad) {
	validacionData = true;
	
	if (!notNull($("#iptPreguntaAbiertaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaAbiertaEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {
		
		var urltxt = ctx + '/insumos/actividad/savePreguntaAbierta';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaAbierta")),
			enctype : 'multipart/form-data',
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
					window.location = ctx + '/insumos/actividad?idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaAbierta');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaAbierta');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaAbierta');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaAbierta');
	}
}

savePreguntaVerdaderoFalso = function(obj, idActividad) {
	validacionData = true;
	
	if (!notNull($("#iptPreguntaVerdaderoFalsoNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaVerdaderoFalsoEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {
		
		var urltxt = ctx + '/insumos/actividad/savePreguntaVerdaderoFalso';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaVerdaderoFalso")),
			enctype : 'multipart/form-data',
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
					window.location = ctx + '/insumos/actividad?idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaVerdaderoFalso');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaVerdaderoFalso');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaVerdaderoFalso');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaVerdaderoFalso');
	}
}

savePreguntaMultipleUnica = function(obj, idActividad) {
	validacionData = true;
	
	if (!notNull($("#iptPreguntaMultipleUnicaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaMultipleUnicaEstatus"))) {
		validacionData = false;
	}

	if (validacionData) {
		
		var urltxt = ctx + '/insumos/actividad/savePreguntaMultipleUnica';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaMultipleUnica")),
			enctype : 'multipart/form-data',
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
					window.location = ctx + '/insumos/actividad?idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaMultipleUnica');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaMultipleUnica');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaMultipleUnica');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaMultipleUnica');
	}
}

/////////
/////////

editPregunta = function(idPregunta, idTipoPregunta) {
	
	var urltxt = ctx + '/insumos/actividad/consultaPregunta?id='+idPregunta;
	
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
				var actividadPreguntaVO = response[1];
				var actividadRespuestaVO = response[2];

				switch (idTipoPregunta) {
					case 1:
						// PREGUNTA ABIERTA
						resetElement("hTitleAbiertaEditar");
						removeElement("hTitleAbiertaNueva");
						
						$('#formPreguntaAbierta').parsley().reset();
						cleanPregunta();
						$("#btnCancelAbierta").off("click").click(function() {
							closeAbierta();
				        });
						
						if(actividadPreguntaVO.imagen != null){
							resetElement("preguntaAbiertaRowDownload");
						}
						
						$('#iptIdPreguntaAbierta').val(actividadPreguntaVO.id);
						$('#iptPreguntaAbiertaNombre').val(actividadPreguntaVO.nombre);
						$('#selectPreguntaAbiertaEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewAbierta').modal({backdrop: 'static', keyboard: false});
						
						break;
						
					case 2:
						// PREGUNTA VERDADERO-FALSO
						resetElement("hTitleVerdaderoFalsoEditar");
						removeElement("hTitleVerdaderoFalsoNueva");
						
						$('#formPreguntaVerdaderoFalso').parsley().reset();
						cleanPregunta();
						$("#btnCancelVerdaderoFalso").off("click").click(function() {
							closeVerdaderoFalso();
				        });
						
						if(actividadPreguntaVO.imagen != null){
							resetElement("preguntaVerdaderoFalsoRowDownload");
						}
						
						$('#iptIdPreguntaVerdaderoFalso').val(actividadPreguntaVO.id);
						$('#iptPreguntaVerdaderoFalsoNombre').val(actividadPreguntaVO.nombre);
						$('#selectPreguntaVerdaderoFalsoEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewVerdaderoFalso').modal({backdrop: 'static', keyboard: false});
						
						break;
						
					case 3:
						// PREGUNTA OPCION MULTIPLE (UNICA)
						resetElement("hTitleMultipleUnicaEditar");
						removeElement("hTitleMultipleUnicaNueva");
						
						$('#formPreguntaMultipleUnica').parsley().reset();
						cleanPregunta();
						$("#btnCancelMultipleUnica").off("click").click(function() {
							closeMultipleUnica();
				        });
						
						if(actividadPreguntaVO.imagen != null){
							resetElement("preguntaMultipleUnicaRowDownload");
						}
						
						$("#btnRespuestaMultipleUnicaG").prop('disabled', true);
						$("#selectPreguntaMultipleUnicaGenerar").prop('disabled', true);
						var actividadRespuestaVOLen = actividadRespuestaVO.length;
						$('#selectPreguntaMultipleUnicaGenerar').val(actividadRespuestaVOLen);


						$("#respuestas").empty();
					    for (var i = 0; i < actividadRespuestaVOLen; i++) {
					      	$('#respuestas')
					      		.append(`<div class="input-group">`+
					      				`<span class="input-group-addon">`+
					      					``+
					      				`</span>`+
					      				`<input type="text" class="form-control" id="iptRespuestaMU${i+1}" name="iptRespuestaMU${i+1}" maxlength="500" placeholder="Respuesta ${i+1}" required="">`+
					      			`</div>`);
					      			
					      	if (actividadRespuestaVO[i] != null) {
					      		j = i + 1;
            					$('#iptRespuestaMU' + j).val(actividadRespuestaVO[i].nombre);
					      	}
					    }
					    $('#respuestas').append(`<div class="col-md-12"></br></div>`);
					    

						$('#iptIdPreguntaMultipleUnica').val(actividadPreguntaVO.id);
						$('#iptPreguntaMultipleUnicaNombre').val(actividadPreguntaVO.nombre);
						$('#selectPreguntaMultipleUnicaEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewMultipleUnica').modal({backdrop: 'static', keyboard: false});
						
						break;

					default:
						  alert('Error alert');
				}
			} else {	
				displayErrorMessageByObjectId('',msg,'formPregunta');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formPregunta');
		}
	});
	
}


function cleanPregunta(){
	
	$('#iptIdPreguntaAbierta').val('');
	$('#iptPreguntaAbiertaNombre').val('');
	$('#iptPreguntaAbiertaActualFile').text('');
	$('#iptPreguntaAbiertaFile').val('');
	$('#selectPreguntaAbiertaEstatus').val('');
	
	
	$('#iptIdPreguntaVerdaderoFalso').val('');
	$('#iptPreguntaVerdaderoFalsoNombre').val('');
	$('#iptPreguntaVerdaderoFalsoActualFile').text('');
	$('#iptPreguntaVerdaderoFalsoFile').val('');
	$('#selectPreguntaVerdaderoFalsoEstatus').val('');
	
	
	$('#iptIdPreguntaMultipleUnica').val('');
	$('#iptPreguntaMultipleUnicaNombre').val('');
	$('#iptPreguntaMultipleUnicaActualFile').text('');
	$('#iptPreguntaMultipleUnicaFile').val('');
	$('#selectPreguntaMultipleUnicaEstatus').val('');
	$('#iptRespuestaMU1').val('');
	$('#iptRespuestaMU2').val('');
	$('#iptRespuestaMU3').val('');
	$('#iptRespuestaMU4').val('');
	$('#iptRespuestaMU5').val('');
	$('#iptRespuestaMU6').val('');
	$('#iptRespuestaMU7').val('');
	$('#iptRespuestaMU8').val('');
	$('#btnRespuestaMultipleUnicaG').prop('disabled', false);
	$("#selectPreguntaMultipleUnicaGenerar").prop('disabled', false);
	$('#selectPreguntaMultipleUnicaGenerar').val('');
	$("#respuestas").empty();
	
	
}	

	
	
/////////
/////////
	
	


savePregunta = function(obj, idActividad) {
	validacionData = true;

	if (!notNull($("#iptPreguntaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaTipo"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaEstatus"))) {
		validacionData = false;
	}
	
	
	if (validacionData) {

		var urltxt = ctx + '/insumos/actividad/savePregunta';
		
		var ActividadPreguntaVO = new Object;
		ActividadPreguntaVO.id = $('#iptIdPregunta').val();
		ActividadPreguntaVO.idActividad = Number(idActividad);
		ActividadPreguntaVO.idTipoPregunta = Number($('#selectPreguntaTipo').val());
		ActividadPreguntaVO.nombre = $('#iptPreguntaNombre').val();
		ActividadPreguntaVO.ponderacion =  $('#iptPreguntaPonderacion').val();
		ActividadPreguntaVO.banActivo = Number($('#selectPreguntaEstatus').val());

		$.ajax({
			type : "POST",
			url : urltxt,
			//contentType : "application/json",
			contentType : false,
			processData : false,
			//data : JSON.stringify(ActividadPreguntaVO),
			data : new FormData(document.getElementById("formPregunta")),
			enctype : 'multipart/form-data',
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
					window.location = ctx + '/insumos/actividad?idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPregunta');
				} else {
					displayErrorMessageByObjectId('',msg,'formPregunta');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPregunta');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPregunta');
	}
	
}


orderArribaPregunta = function( idA, idP) {

	var urltxt = ctx + '/insumos/actividad/changeOrdenArribaPregunta?idA='+idA+'&idP='+idP;
	
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
				window.location = ctx+'/insumos/actividad?idActividad='+idA;
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


orderAbajoPregunta = function( idA, idP) {

	var urltxt = ctx + '/insumos/actividad/changeOrdenAbajoPregunta?idA='+idA+'&idP='+idP;
	
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
				window.location = ctx+'/insumos/actividad?idActividad='+idA;
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


estatusPregunta = function( idActividad, idPregunta) {
	$("#iptEstatusActividadId").val(idActividad);
	$("#iptEstatusPreguntaId").val(idPregunta);
	$('#modalEstatusPregunta').modal({backdrop: 'static', keyboard: false});
}


estatusPreguntaConfirmacion = function() {
	
	var idActividad = $('#iptEstatusActividadId').val();
	var idPregunta = $('#iptEstatusPreguntaId').val();
	
	var urltxt = ctx + '/insumos/actividad/changeEstatusPregunta?id='+idPregunta;
	
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
			
			$('#modalEstatusPregunta').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx+'/insumos/actividad?idActividad='+idActividad;
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


editPreguntaAnt = function(idPregunta) {
	
	// Resetea validadores
	$('#formPregunta').parsley().reset();
	
	var urltxt = ctx + '/insumos/actividad/consultaPregunta?id='+idPregunta;

	$('#selectPreguntaTipo').prop('disabled', 'disabled');
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#iptIdPregunta').val(idPregunta);
	
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
				
				var actividadPreguntaVO = response[1];
				
				resetElement("hTitlePreguntaEditar");
				removeElement("hTitlePreguntaNueva");
				//if(idTipoActividad != 5 && actividadPreguntaVO.imagen != null){
					resetElement("preguntaRowDownload");
				//}
				
				cleanPregunta();

				$('#iptIdPregunta').val(actividadPreguntaVO.id);
				$('#iptPreguntaNombre').val(actividadPreguntaVO.nombre);
				$('#iptPreguntaPonderacion').val(actividadPreguntaVO.ponderacion);
				$('#selectPreguntaTipo').val(actividadPreguntaVO.idTipoPregunta);
				$('#selectPreguntaEstatus').val(actividadPreguntaVO.banActivo);
				
			} else {						
				displayErrorMessageByObjectId('',msg,'formPregunta');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formPregunta');
		}
	});
}


function getRespuesta( idActividad, idPregunta){
	window.location = ctx+'/insumos/pregunta?idActividad='+idActividad+'&idPregunta='+idPregunta;
}

function downloadFile(idData) {
	window.open(ctx + '/insumos/actividad/downloadFile?fileId=' + idData);
}















