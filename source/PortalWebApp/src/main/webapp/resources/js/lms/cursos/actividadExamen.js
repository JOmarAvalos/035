
newPreguntaExamen = function() {
	
	// Resetea validadores
	$('#formPreguntaExamen').parsley().reset();
	
	// Muestra modal nueva actividad		
	$('#iptIdPreguntaExamen').val('');
	$('#iptPreguntaExamenNombre').val('');
	$('#selectPreguntaExamenTipo').val('');
	$('#selectPreguntaExamenEstatus').val('');
	
	$('#modalNewPreguntaExamen').modal({backdrop: 'static', keyboard: false});
}

savePreguntaExamen = function(obj, idCurso, idActividad, idActividadExamen) {
	validacionData = true;
	var idActividadExamena = $('#iptIdActividadExamen').val();
	if (!notNull($("#iptPreguntaExamenNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaExamenTipo"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaExamenEstatus"))) {
		validacionData = false;
	}

	if (validacionData) {

		var ExamenPreguntaVO = new Object;
		var urltxt = ctx + '/lms/actividad/saveExamenPregunta';
		
		ExamenPreguntaVO.id = $('#iptIdPreguntaExamen').val();
		ExamenPreguntaVO.idActividadExamen = Number(idActividadExamen);
		ExamenPreguntaVO.nombre = $('#iptPreguntaExamenNombre').val();
		ExamenPreguntaVO.idExamenTipoPregunta = Number($('#selectPreguntaExamenTipo').val());
		ExamenPreguntaVO.banActivo = Number($('#selectPreguntaExamenEstatus').val());

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(ExamenPreguntaVO),
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
					window.location = ctx + '/lms/actividadExamen?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaExamen');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaExamen');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaExamen');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaExamen');
	}
	
}


orderArribaPreguntaExamen = function(idC, idA, idAE, idP) {

	var urltxt = ctx + '/lms/actividad/changeOrdenArribaPreguntaExamen?idAE='+idAE+'&idP='+idP;
	
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
				window.location = ctx+'/lms/actividadExamen?idCurso='+idC+'&idActividad='+idA;
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


orderAbajoPreguntaExamen = function(idC, idA, idAE, idP) {

	var urltxt = ctx + '/lms/actividad/changeOrdenAbajoPreguntaExamen?idAE='+idAE+'&idP='+idP;
	
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
				window.location = ctx+'/lms/actividadExamen?idCurso='+idC+'&idActividad='+idA;
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


estatusPreguntaExamen = function(idCurso, idActividad, idPregunta) {
	$("#iptEstatusCursoId").val(idCurso);
	$("#iptEstatusActividadExamenId").val(idActividad);
	$("#iptEstatusPreguntaExamenId").val(idPregunta);
	$('#modalEstatusPreguntaExamen').modal({backdrop: 'static', keyboard: false});
}


estatusPreguntaExamenConfirmacion = function() {
	
	var idCurso = $('#iptEstatusCursoId').val();
	var idActividad = $('#iptEstatusActividadExamenId').val();
	var idPregunta = $('#iptEstatusPreguntaExamenId').val();
	
	var urltxt = ctx + '/lms/actividad/changeEstatusPreguntaExamen?id='+idPregunta;
	
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
			
			$('#modalEstatusPreguntaExamen').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx+'/lms/actividadExamen?idCurso='+idCurso+'&idActividad='+idActividad;
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


editPreguntaExamen = function(idPregunta) {
	
	// Resetea validadores
	$('#formPreguntaExamen').parsley().reset();
	
	var urltxt = ctx + '/lms/actividad/consultaPreguntaExamen?id='+idPregunta;

	$('#modalNewPreguntaExamen').modal({backdrop: 'static', keyboard: false});
	$('#iptIdPreguntaExamen').val(idPregunta);
	
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
				
				var examenPreguntaVO = response[1];

				$('#iptIdPreguntaExamen').val(examenPreguntaVO.id);
				$('#iptPreguntaExamenNombre').val(examenPreguntaVO.nombre);
				$('#selectPreguntaExamenTipo').val(examenPreguntaVO.idExamenTipoPregunta);
				$('#selectPreguntaExamenEstatus').val(examenPreguntaVO.banActivo);
				
			} else {						
				displayErrorMessageByObjectId('',msg,'formPreguntaExamen');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formPreguntaExamen');
		}
	});
}


function getRespuestaExamen(idCurso, idActividad, idPregunta){
	window.location = ctx+'/lms/preguntaExamen?idCurso='+idCurso+'&idActividad='+idActividad+'&idPregunta='+idPregunta;
}

