/**
 * 
 */

function getActividad(idActividad, idCurso, idInscripcion, idPlan, idCertificado){
//	var urltxt = ctx + '/lms/carrera/plan?param='+idPlanCarrera;
	var idMonitoreoActividadCurso=$("#idMonitoreoActividadCurso").val();	
	window.location = ctx + '/lms/carrera/actividad?param='+Number(idActividad)+'&param4='+Number(idCurso)+'&param5='+Number(idInscripcion)+'&param6='+Number(idPlan)+'&param7='+Number(idMonitoreoActividadCurso)+'&param8='+Number(idCertificado);
//	$.ajax({
//	$.ajax({
//		type : "POST",
//		url : urltxt,
//		contentType : "application/json",
//		beforeSend : function() {
//			maskBody();
//		},
//		complete : function() {
//			unmaskBody();
//		},
//		success : function(response) {
//			var result = response[0];
//			var msg = response[1];
//			if (result) {
//				window.location = ctx + '/lms/carrera/plan?param=' + folderName;
//			} else {
////				displayErrorMessageByObjectId('', msg, 'infoForm');
//				alert(msg);
//			}
//		},
//		error : function(msg) {
////			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
//			alert('Error. Ocurrió un error en la consulta.');
//		}
//	});
}

terminaCurso = function(idInscripcion, idCurso, idPlan,idCertificado){
	
	
	var urltxt = ctx + '/lms/carrera/calificaCurso?idCurso=' + idCurso + '&idInscripcion=' + idInscripcion+ '&idCertificado=' + idCertificado+ '&idPlan=' + idPlan;
	
	//alert(urltxt);
	
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
	var idMonitoreoActividadPadre=$("#idMonitoreoActividadPadre").val();

	window.location = ctx + '/lms/carrera/plan?param='+Number(idPlan)+'&idMonitoreo='+Number(idMonitoreoActividadPadre);
	
}
getMiCarreraMonitoreo = function(){
	var idMonitoreoActividadPadre=$("#idMonitoreoActividadPadre").val();
	window.location = ctx+'/lms/carrera?idMonitoreo='+idMonitoreoActividadPadre;
}
getMiPlanMonitoreo = function(id){
	var idMonitoreoActividadPadre=$("#idMonitoreoActividadPadre").val();
	
		window.location = ctx+'/lms/carrera/plan?param='+id+'&idMonitoreo='+Number(idMonitoreoActividadPadre);
	

}

decargaCertificado = function(idInscripcion, idCurso){
	
	
	window.location = ctx + '/lms/carrera/downloadCertificadoCurso?idCurso=' + idCurso + '&idInscripcion=' + idInscripcion;
	

}

sendEstrellas = function(idInscripcion){
	if($('input:radio[name=estrellas]:checked').val() == undefined){
		$('#modalEstrellasOblig').modal({backdrop: 'static', keyboard: false});
	}else{
	
		estrellas = $('input:radio[name=estrellas]:checked').val();
		var urltxt = ctx + '/lms/carrera/calificaEstrellas?param=' + idInscripcion + '&param2=' + estrellas;
		
		//alert(urltxt);
		
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
					$('#modalEstrellas').modal('hide');
				} else {
					$('#modalEstrellas').modal('hide');
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalEstrellas').modal('hide');
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});	
	}
}
