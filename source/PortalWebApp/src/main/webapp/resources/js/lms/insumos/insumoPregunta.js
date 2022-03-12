

newRespuesta = function() {
	
	// Resetea validadores
	$('#formRespuesta').parsley().reset();
	
	// Muestra modal nueva pregunta		
	$('#iptIdRespuesta').val('');
	$('#iptRespuestaNombre').val('');
	$('selectRespuestaCorrecta').val('');
	$('#selectRespuestaEstatus').val('');
	
	$('#modalNewRespuesta').modal({backdrop: 'static', keyboard: false});
}


saveRespuesta = function(obj, idActividad, idPregunta, idRespuesta) {
	validacionData = true;
	var idEncuestaPregunta = $('#iptIdPregunta').val();
	if (!notNull($("#iptRespuestaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectRespuestaEstatus"))) {
		validacionData = false;
	}

	
	if (validacionData) {

		var ActividadRespuestaVO = new Object;
		var urltxt = ctx + '/insumos/actividad/saveRespuesta';
		
		ActividadRespuestaVO.id = $('#iptIdRespuesta').val();
		ActividadRespuestaVO.idActividadPregunta = Number(idPregunta);
		ActividadRespuestaVO.nombre = $('#iptRespuestaNombre').val();
		ActividadRespuestaVO.nombre2 = $('#iptRespuestaNombre2').val();
		ActividadRespuestaVO.correcta = 1;
		ActividadRespuestaVO.ponderacion = $('#iptRespuestaPonderacion').val();
		ActividadRespuestaVO.banActivo = Number($('#selectRespuestaEstatus').val());

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(ActividadRespuestaVO),
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
					window.location = ctx + '/insumos/pregunta?idActividad='+idActividad+'&idPregunta=' + idPregunta;
					displaySuccesMessageByObjectId('',msg,'formRespuesta');
				} else {
					displayErrorMessageByObjectId('',msg,'formRespuesta');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formRespuesta');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formRespuesta');
	}
	
}



orderArribaRespuesta = function( idActividad, idPregunta, idRespuesta) {

	var urltxt = ctx + '/insumos/actividad/changeOrdenArribaRespuesta?idPregunta='+idPregunta+'&idRespuesta='+idRespuesta;
	
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
				window.location = ctx + '/insumos/pregunta?idActividad='+idActividad+'&idPregunta='+idPregunta;
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


orderAbajoRespuesta = function( idActividad, idPregunta, idRespuesta) {

	var urltxt = ctx + '/insumos/actividad/changeOrdenAbajoRespuesta?idPregunta='+idPregunta+'&idRespuesta='+idRespuesta;
	
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
				window.location = ctx + '/insumos/pregunta?idActividad='+idActividad+'&idPregunta='+idPregunta;
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



estatusRespuesta = function(idActividad, idPregunta, idRespuesta) {
	$("#iptEstatusActividadId").val(idActividad);
	$("#iptEstatusPreguntaId").val(idPregunta);
	$("#iptEstatusRespuestaId").val(idRespuesta);
	$('#modalEstatusRespuesta').modal({backdrop: 'static', keyboard: false});
}


estatusRespuestaConfirmacion = function() {
	
	var idActividad = $('#iptEstatusActividadId').val();
	var idPregunta = $('#iptEstatusPreguntaId').val();
	var idRespuesta = $('#iptEstatusRespuestaId').val();
	
	var urltxt = ctx + '/insumos/actividad/changeEstatusRespuesta?id='+idRespuesta;
	
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
				
				window.location = ctx + '/insumos/pregunta?idActividad='+idActividad+'&idPregunta='+idPregunta;
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



editRespuesta = function(idRespuesta) {
	
	// Resetea validadores
	$('#formRespuesta').parsley().reset();
	
	var urltxt = ctx + '/insumos/actividad/consultaRespuesta?id='+idRespuesta;

	$('#modalNewRespuesta').modal({backdrop: 'static', keyboard: false});
	$('#iptIdRespuesta').val(idRespuesta);
	
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
				
				var actividadRespuestaVO = response[1];

				$('#iptIdRespuesta').val(actividadRespuestaVO.id);
				$('#iptRespuestaNombre').val(actividadRespuestaVO.nombre);
				$('#iptRespuestaNombre2').val(actividadRespuestaVO.nombre2);
				$('#selectRespuestaCorrecta').val(actividadRespuestaVO.correcta);
				$('#iptRespuestaPonderacion').val(actividadRespuestaVO.ponderacion);
				$('#selectRespuestaEstatus').val(actividadRespuestaVO.banActivo);
				
			} else {						
				displayErrorMessageByObjectId('',msg,'formRespuesta');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formRespuesta');
		}
	});
}

