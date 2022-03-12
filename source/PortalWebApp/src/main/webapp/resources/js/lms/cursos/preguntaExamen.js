

newRespuestaExamen = function() {
	
	// Resetea validadores
	$('#formRespuesta').parsley().reset();
	
	// Muestra modal nueva pregunta		
	$('#iptIdRespuesta').val('');
	$('#iptRespuestaNombre').val('');
	$('selectRespuestaCorrecta').val('');
	$('#selectRespuestaEstatus').val('');
	
	$('#modalNewRespuesta').modal({backdrop: 'static', keyboard: false});
}





saveRespuestaExamen = function(obj, idCurso, idActividad, idPregunta, idRespuesta) {
	validacionData = true;
	var idExamenPregunta = $('#iptIdExamenPregunta').val();
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

		var ExamenRespuestaVO = new Object;
		var urltxt = ctx + '/lms/actividad/saveExamenRespuesta';
		
		ExamenRespuestaVO.id = $('#iptIdRespuesta').val();
		ExamenRespuestaVO.idExamenPregunta = Number(idExamenPregunta);
		ExamenRespuestaVO.nombre = $('#iptRespuestaNombre').val();
		ExamenRespuestaVO.correcta = Number($('#selectRespuestaCorrecta').val());
		ExamenRespuestaVO.banActivo = Number($('#selectRespuestaEstatus').val());

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(ExamenRespuestaVO),
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
					window.location = ctx + '/lms/preguntaExamen?idCurso='+idCurso+'&idActividad='+idActividad+'&idPregunta=' + idPregunta;
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



orderArribaRespuestaExamen = function(idCurso, idActividad, idPregunta, idRespuesta) {

	var urltxt = ctx + '/lms/actividad/changeOrdenArribaRespuestaExamen?idPregunta='+idPregunta+'&idRespuesta='+idRespuesta;
	
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
				window.location = ctx+'/lms/preguntaExamen?idCurso='+idCurso+'&idActividad='+idActividad+'&idPregunta='+idPregunta;
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


orderAbajoRespuestaExamen = function(idCurso, idActividad, idPregunta, idRespuesta) {

	var urltxt = ctx + '/lms/actividad/changeOrdenAbajoRespuestaExamen?idPregunta='+idPregunta+'&idRespuesta='+idRespuesta;
	
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
				window.location = ctx+'/lms/preguntaExamen?idCurso='+idCurso+'&idActividad='+idActividad+'&idPregunta='+idPregunta;
				
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



estatusRespuestaExamen = function(idCurso, idActividad, idPregunta, idRespuesta) {
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
	
	var urltxt = ctx + '/lms/actividad/changeEstatusRespuestaExamen?id='+idRespuesta;
	
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
				
				window.location = ctx+'/lms/preguntaExamen?idCurso='+idCurso+'&idActividad='+idActividad+'&idPregunta='+idPregunta;

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



editRespuestaExamen = function(idRespuesta) {
	
	// Resetea validadores
	$('#formRespuesta').parsley().reset();
	
	var urltxt = ctx + '/lms/actividad/consultaRespuestaExamen?id='+idRespuesta;

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
				
				var examenRespuestaVO = response[1];

				$('#iptIdRespuesta').val(examenRespuestaVO.id);
				$('#iptRespuestaNombre').val(examenRespuestaVO.nombre);
				$('#selectRespuestaCorrecta').val(examenRespuestaVO.correcta);
				$('#selectRespuestaEstatus').val(examenRespuestaVO.banActivo);
				
			} else {						
				displayErrorMessageByObjectId('',msg,'formRespuesta');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formRespuesta');
		}
	});
}

