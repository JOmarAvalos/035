
function getActividad(idActividad){
	window.location = ctx + '/lms/insumo/actividad?param='+Number(idActividad);
}

terminaCurso = function(idInscripcion, idCurso, idPlan){
	
	
	var urltxt = ctx + '/lms/carrera/calificaCurso?idCurso=' + idCurso + '&idInscripcion=' + idInscripcion;
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : null,
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
				window.location = ctx + '/lms/carrera/plan?param='+Number(idPlan);
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
}

salirCurso = function(idPlan){
	window.location = ctx + '/lms/carrera/plan?param='+Number(idPlan);
}