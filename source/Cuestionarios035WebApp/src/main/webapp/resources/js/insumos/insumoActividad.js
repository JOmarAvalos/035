/**
 * 
 */

function getActividad(idActividad,planName,certificadoName,cursoName,idInscripcion,idPlan){
//	var urltxt = ctx + '/lms/carrera/plan?param='+idPlanCarrera;
	window.location = ctx + '/lms/carrera/actividad?param='+Number(idActividad)+'&param2='+planName+'&param3='+certificadoName+'&param4='+cursoName+'&param5='+Number(idInscripcion)+'&param6='+Number(idPlan);
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

startExamen = function(idActividad, idCiclo){
	
	var urltxt = ctx + '/lms/insumo/actividadRegistro?idActividad=' + idActividad + '&idCiclo=' + idCiclo;
	
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
				
				$('#idConsultaActividad').val(response[2]);
				$('#startExamen').hide();
				$('#pregunta1').show();
				
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
	
}

saveRespuesta = function(actual, siguiente, tipo, total, idPregunta, totalRespuestas){
	
	idConsultaActividad = $('#idConsultaActividad').val();
	
	respondido = true;
	mensaje = '';
	
	if(tipo == 1){
		if (!notNull($('#ta'+idPregunta))) {
			respondido = false;
			$('#pMsjAdvertenciaExamen').show();
			$('#pMsjAdvertenciaExamenDos').hide();
			mensaje = "Para poder continuar, debes capturar la respuesta";
		}
	}else if(tipo == 2 || tipo == 3){
		if($('input:radio[name=check'+idPregunta+']:checked').length == 0){
			respondido = false;
			$('#pMsjAdvertenciaExamen').hide();
			$('#pMsjAdvertenciaExamenDos').show();
			mensaje = "Para poder continuar, debes seleccionar una respuesta";
		}
	}
	
	if(respondido){
		
		var respuestaExamenVO = new Object;
		respuestaExamenVO.idActividadConsulta = idConsultaActividad;
		respuestaExamenVO.idPregunta = idPregunta;
		respuestaExamenVO.idTipo = tipo;
		if(tipo == 1){
			respuestaExamenVO.respuestaAbierta = $('#ta'+idPregunta).val();
		}else if(tipo == 2 || tipo == 3){
			respuestaExamenVO.idRespuesta = $('input:radio[name=check'+idPregunta+']:checked').val();
		}
		
		
		var urltxt = ctx + '/lms/insumo/saveRespuesta';
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(respuestaExamenVO),
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
					$('#pregunta'+actual).hide();
					if(actual == total){
						$('#endExamen').show();
					}else{
						$('#pregunta'+siguiente).show();
					}
				} else {
					displayErrorMessageByObjectId('', msg, 'infoForm');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
			}
		});
	}else{
		$('#modalAdvertenciaExamen').modal({backdrop: 'static', keyboard: false});
	}

}

terminaActividadExamen = function(){
	
	var urltxt = ctx + '/lms/insumo/solicita?idConsulta=' + $('#idConsultaActividad').val();
	
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
				window.location = ctx+'/lms/insumos';
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
	
}