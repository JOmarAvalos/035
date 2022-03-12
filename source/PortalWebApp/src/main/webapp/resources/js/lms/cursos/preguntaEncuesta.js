

newRespuestaEncuesta = function() {
	
	// Resetea validadores
	$('#formRespuesta').parsley().reset();
	
	// Muestra modal nueva pregunta		
	$('#iptIdRespuesta').val('');
	$('#iptRespuestaNombre').val('');
	$('selectRespuestaCorrecta').val('');
	$('#selectRespuestaEstatus').val('');
	
	$('#modalNewRespuesta').modal({backdrop: 'static', keyboard: false});
}


saveRespuestaEncuesta = function(obj, idCurso, idActividad, idPregunta, idRespuesta) {
	validacionData = true;
	var idEncuestaPregunta = $('#iptIdEncuestaPregunta').val();
	if (!notNull($("#iptRespuestaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectRespuestaCorrecta"))) {
		validacionData = false;
	}
	if (!notNull($("#selectRespuestaEstatus"))) {
		validacionData = false;
	}

	
	if (validacionData) {

		var EncuestaRespuestaVO = new Object;
		var urltxt = ctx + '/lms/actividad/saveEncuestaRespuesta';
		
		EncuestaRespuestaVO.id = $('#iptIdRespuesta').val();
		EncuestaRespuestaVO.idEncuestaPregunta = Number(idEncuestaPregunta);
		EncuestaRespuestaVO.nombre = $('#iptRespuestaNombre').val();
		EncuestaRespuestaVO.correcta = Number($('#selectRespuestaCorrecta').val());
		EncuestaRespuestaVO.banActivo = Number($('#selectRespuestaEstatus').val());

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(EncuestaRespuestaVO),
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
					window.location = ctx + '/lms/preguntaEncuesta?idCurso='+idCurso+'&idActividad='+idActividad+'&idPregunta=' + idPregunta;
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



orderArribaRespuestaEncuesta = function(idCurso, idActividad, idPregunta, idRespuesta) {

	var urltxt = ctx + '/lms/actividad/changeOrdenArribaRespuestaEncuesta?idPregunta='+idPregunta+'&idRespuesta='+idRespuesta;
	
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
				window.location = ctx + '/lms/preguntaEncuesta?idCurso='+idCurso+'&idActividad='+idActividad+'&idPregunta=' + idPregunta;
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


orderAbajoRespuestaEncuesta = function(idCurso, idActividad, idPregunta, idRespuesta) {

	var urltxt = ctx + '/lms/actividad/changeOrdenAbajoRespuestaEncuesta?idPregunta='+idPregunta+'&idRespuesta='+idRespuesta;
	
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
				window.location = ctx + '/lms/preguntaEncuesta?idCurso='+idCurso+'&idActividad='+idActividad+'&idPregunta=' + idPregunta;
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



estatusRespuestaEncuesta = function(idCurso, idActividad, idPregunta, idRespuesta) {
	$("#iptEstatusCursoId").val(idCurso);
	$("#iptEstatusActividadId").val(idActividad);
	$("#iptEstatusPreguntaId").val(idPregunta);
	$("#iptEstatusRespuestaId").val(idRespuesta);
	$('#modalEstatusRespuesta').modal({backdrop: 'static', keyboard: false});
}


estatusRespuestaConfirmacion = function() {
	
	var idCurso = $('#iptEstatusCursoId').val();
	var idActividad = $('#iptEstatusActividadId').val();
	var idPregunta = $('#iptEstatusPreguntaId').val();
	var idRespuesta = $('#iptEstatusRespuestaId').val();
	
	var urltxt = ctx + '/lms/actividad/changeEstatusRespuestaEncuesta?id='+idRespuesta;
	
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
				
				window.location = ctx + '/lms/preguntaEncuesta?idCurso='+idCurso+'&idActividad='+idActividad+'&idPregunta='+idPregunta;
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



editRespuestaEncuesta = function(idRespuesta) {
	
	// Resetea validadores
	$('#formRespuesta').parsley().reset();
	
	var urltxt = ctx + '/lms/actividad/consultaRespuestaEncuesta?id='+idRespuesta;

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
				
				var encuestaRespuestaVO = response[1];

				$('#iptIdRespuesta').val(encuestaRespuestaVO.id);
				$('#iptRespuestaNombre').val(encuestaRespuestaVO.nombre);
				$('#selectRespuestaCorrecta').val(encuestaRespuestaVO.correcta);
				$('#selectRespuestaEstatus').val(encuestaRespuestaVO.banActivo);
				
			} else {						
				displayErrorMessageByObjectId('',msg,'formRespuesta');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formRespuesta');
		}
	});
}

