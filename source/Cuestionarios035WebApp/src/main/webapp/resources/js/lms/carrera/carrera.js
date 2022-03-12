/**
 * 
 */

function getPlan(idPlanCarrera){
//	var urltxt = ctx + '/lms/carrera/plan?param='+idPlanCarrera;
	var idMonitoreoActividad=$("#idMonitoreoActividad").val();
	window.location = ctx + '/lms/carrera/plan?param='+Number(idPlanCarrera)+'&idMonitoreo='+Number(idMonitoreoActividad);
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


function verCalendario(){
	window.location = ctx+'/lms/agenda';
}
descargaCertificado = function(idPlanUsuario){
		
	window.location = ctx + '/lms/carrera/envioPlanCarrera?idPlanUsuario=' + idPlanUsuario;
	
}