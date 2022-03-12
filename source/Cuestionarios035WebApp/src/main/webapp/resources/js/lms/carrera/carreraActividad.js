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

startExamen = function(idActividad, idInscripcion){
	
	var urltxt = ctx + '/lms/carrera/actividadRegistro?idActividad=' + idActividad + '&idInscripcion=' + idInscripcion;
	
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
				iniciar();
				
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
	
	$('#pMsjAdvertenciaExamen').html('');
	$('#pMsjAdvertenciaExamenEn').html('');
	$('#pMsjAdvertenciaExamenFr').html('');
	idConsultaActividad = $('#idConsultaActividad').val();
	intento = $('#iptIntentoExamen').val();
	
	//Agregar validaciones de respuesta seleccionada 
	
	respondido = true;
	mensaje = '';
	mensajeEn = '';
	mensajeFr = '';
	
	if(tipo == 1){
	//abierta
		if (!notNull($('#ta'+idPregunta))) {
			respondido = false;
			mensaje = "Para poder continuar, debes capturar la respuesta";
			mensajeEn = "To be able to continue, you must capture the answer";
			mensajeFr = "Afin de continuer, vous devez saisir la réponse";
		}
	}else if(tipo == 2 || tipo == 3){
	//verdadero-falso, multiple unica
		if($('input:radio[name=check'+idPregunta+']:checked').length == 0){
			respondido = false;
			mensaje = "Para poder continuar, debes seleccionar una respuesta";
			mensajeEn = "To continue, you must select an answer";
			mensajeFr = "Pour continuer, vous devez choisir une réponse";
		}
	}else if(tipo == 4){
	//multiple multiple
		seleccionadas = 0;
		$('input:checkbox[name=check'+idPregunta+']:checked').each(function(){
			seleccionadas = seleccionadas +1;
		});
		
		if(seleccionadas == 0){
			respondido = false;
			mensaje = "Para poder continuar, debes seleccionar al menos una respuesta";
			mensajeEn = "To continue, you must select at least one answer";
			mensajeFr = "Pour continuer, vous devez sélectionner au moins une réponse";
		}
	}else if(tipo == 5){
	//relacion
		for(var i = 0; i < totalRespuestas; i++){
			if (!notNull($('#iptRelacion'+idPregunta+i))) {
				respondido = false;
			}
		}
		if(!respondido){
			mensaje = "Para poder continuar, debes relacionar todas las columnas";
			mensajeEn = "To be able to continue, you must relate all the columns";
			mensajeFr = "Pour continuer, vous devez relier toutes les colonnes";
		}
	}else if(tipo == 10 || tipo == 6){
	//rellena blancos, arrastrable
		for(var i = 1; i <= totalRespuestas; i++){
			var elementTmp = document.getElementById("liR"+idPregunta+i);
	        var para = elementTmp.getElementsByTagName("span");
	        
	        spanRespTmp =  para[0];
	        
	        if(spanRespTmp == undefined){
	        	respondido = false;
	        }
			
		}
		if(!respondido){
			mensaje = "Para poder continuar, llenar todos los espacios";
			mensajeEn = "In order to continue, fill in all the spaces";
			mensajeFr = "Pour continuer, remplissez tous les espaces";
		}
	}
	
	if(respondido){
		
		var respuestaExamenVO = new Object;
		respuestaExamenVO.idActividadConsulta = idConsultaActividad;
		respuestaExamenVO.idPregunta = idPregunta;
		respuestaExamenVO.idTipo = tipo;
		respuestaExamenVO.intento = intento;
		if(tipo == 1){
		//abierta
			respuestaExamenVO.respuestaAbierta = $('#ta'+idPregunta).val();
		}else if(tipo == 2 || tipo == 3 || tipo == 9){
		//verdadero-falso, multiple unica, imagen unica
			respuestaExamenVO.idRespuesta = $('input:radio[name=check'+idPregunta+']:checked').val();
		}else if(tipo == 4 || tipo == 7){
		//multiple multiple, combinacion exacta
			
			var checkAdd = '';
			$('input:checkbox[name=check'+idPregunta+']:checked').each(function(){
				checkAdd +=$(this).val()+',';
			});
			var checkRemove = checkAdd.slice(0,-1);
			respuestaExamenVO.idRespuestaM = checkRemove;
		}else if(tipo == 5){
		//relacion
			respuestaCorrecta = true;
			var checkAdd = '';
			for(var i = 0; i < totalRespuestas; i++){
				respuestaIzquierda = $('#iptIzquierda'+idPregunta+i).val();
				relacionSeleccionada = $('#iptRelacion'+idPregunta+i).val();
				respuestaDerecha = $('#iptDerecha'+idPregunta+relacionSeleccionada).val();
				if(respuestaIzquierda != respuestaDerecha){
					respuestaCorrecta = false;
				}
				checkAdd +=respuestaIzquierda+"-"+respuestaDerecha+",";
				
			}
			var checkRemove = checkAdd.slice(0,-1);
			respuestaExamenVO.idRespuestaM = checkRemove;
		}else if(tipo == 10 || tipo == 6){
		//rellena blancos, arrastrable
			respuestaCorrecta = true;
			respuestaCorrecta = true;
			for(var i = 1; i <= totalRespuestas; i++){
			
				var elementTmp = document.getElementById("liR"+idPregunta+i);
		        var para = elementTmp.getElementsByTagName("span");
		        
		        spanRespTmp =  para[0];
		        
				var tmpSpanVal = spanRespTmp.getAttribute("data");
				
				if(i != tmpSpanVal){
					respuestaCorrecta = false;
				}
			}
			respuestaExamenVO.respuestaCorrecta = respuestaCorrecta;
		}
		
		
		var urltxt = ctx + '/lms/carrera/saveRespuesta';
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
		$('#pMsjAdvertenciaExamen').append(mensaje);
		$('#pMsjAdvertenciaExamenEn').append(mensajeEn);
		$('#pMsjAdvertenciaExamenFr').append(mensajeFr);
		$('#modalAdvertenciaExamen').modal({backdrop: 'static', keyboard: false});
	}

//	
//	$('#pregunta'+actual).hide();
//	if(actual == total){
//		$('#endExamen').show();
//	}else{
//		$('#pregunta'+siguiente).show();
//	}
	
}


saveRespuestaTMP = function(idPregunta){

	//alert(document.getElementById(idPregunta+"1").value());
	//alert(document.getElementById("span1962").getAttribute("data"));
	
}

terminaActividadExamen = function(idCurso, planName, certificadoName, cursoName, idInscripcion, idPlan, idActividad, idCertificado){
	
	calificacion = $('#iptCalificacionExamen').val();
	var urltxt = ctx + '/lms/carrera/actividadCompleta?idActividad=' + idActividad + '&idInscripcion=' + idInscripcion+'&calificacion='+calificacion;
	idMonitoreoActividad = $('#idMonitoreoActividadPadre').val();
	
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
				window.location = ctx+'/lms/carrera/curso?param='+idCurso+'&param2='+planName+'&param3='+idCertificado+'&param4='+idInscripcion+'&param5='+idPlan+'&param6='+idMonitoreoActividad+'&param7=0';
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
}

calificaExamen = function(){
	
	$('#spanCalifExamen').html('');
	idConsultaActividad = $('#idConsultaActividad').val();
	intentos = $('#iptIntentoExamen').val();
	intentosPermitidos = $('#iptIntentosExamen').val();
//	$('#btnTerminar').hide();
	$('#btnReinicia').hide();
	var urltxt = ctx + '/lms/carrera/calificaExamen?idActividad=' + idConsultaActividad+'&intentos='+intentos;
	
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
			if (result) {
				$('#endExamen').hide();
				calificacion = response[1];
				calificacionMinima = response[2];
				$('#spanCalifExamen').append(calificacion);
				$('#iptCalificacionExamen').val(calificacion);
				if(calificacion < calificacionMinima){
					if(intentos < intentosPermitidos){
						//muestra el boton de reintentar
						intentos = intentos +1;
						$('#iptIntentoExamen').val(intentos);
						$('#btnReinicia').show();
//					}else{
//						$('#btnTerminar').show();
					}
				}
				$('#divCalificacion').show();
			} else {
//				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
}

reiniciarExamen = function(){
	$('#divCalificacion').hide();
	$('#pregunta1').show();
}


startScorm = function(idActividad, idInscripcion, ruta) {
	
	var urltxt = ctx + '/lms/carrera/actividadRegistro?idActividad=' + idActividad + '&idInscripcion=' + idInscripcion;
	
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
				
				$('#startScorm').hide();
				$('#endScorm').show();
				
				window.open(ruta, 'scorm', 'menubar=no,location=no,resizable=yes,scrollbars=yes,status=yes');
				
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
}


endScorm = function(idActividad, idInscripcion, idCurso, planName, cursoName, idPlan, idCertificado) {
	
	idMonitoreoActividad = $('#idMonitoreoActividadPadre').val();
	var urltxt = ctx + '/lms/carrera/actividadCompleta?idActividad=' + idActividad + '&idInscripcion=' + idInscripcion;
	idMonitoreoActividad = $('#idMonitoreoActividadPadre').val();
	
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
				
				$('#endScorm').hide();
				$('#startScorm').show();
				
				window.location = ctx+'/lms/carrera/curso?param='+idCurso+'&param2='+planName+'&param3='+idCertificado+'&param4='+idInscripcion+'&param5='+idPlan+'&param6='+idMonitoreoActividad+'&param7=0';;
				
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
	
}


startConferencia = function(idActividad, idInscripcion, url) {
	
	var urltxt = ctx + '/lms/carrera/actividadRegistro?idActividad=' + idActividad + '&idInscripcion=' + idInscripcion;
	
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
				
				$('#startConferencia').hide();
				$('#endConferencia').show();
				window.open(url, '_blank');
				
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
	
}

endConferencia = function(idActividad, idInscripcion, idCurso, planName, cursoName, idPlan, idCertificado, ) {
	
	var urltxt = ctx + '/lms/carrera/actividadCompleta?idActividad=' + idActividad + '&idInscripcion=' + idInscripcion;
	idMonitoreoActividad = $('#idMonitoreoActividadPadre').val();
	
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
				
				$('#endConferencia').hide();
				$('#startConferencia').show();
				
				window.location = ctx+'/lms/carrera/curso?param='+idCurso+'&param2='+planName+'&param3='+idCertificado+'&param4='+idInscripcion+'&param5='+idPlan+'&param6='+idMonitoreoActividad+'&param7=0';;

			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
	
}

startDocumento = function (idActividad, idInscripcion) {
	
	var urltxt = ctx + '/lms/carrera/actividadRegistro?idActividad=' + idActividad + '&idInscripcion=' + idInscripcion;
	
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
				
				window.open(ctx + '/lms/carrera/actividad/downloadFile?param=' + idActividad);
				
				$('#btnDescargaDoc').hide();
				$('#btnEndActividadDoc').show();

				
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
}

endDocumento = function (idActividad, idInscripcion, idCurso, planName, cursoName, idPlan, idCertificado) {
	
	var urltxt = ctx + '/lms/carrera/actividadCompleta?idActividad=' + idActividad + '&idInscripcion=' + idInscripcion;
	idMonitoreoActividad = $('#idMonitoreoActividadPadre').val();
	
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
				window.location = ctx+'/lms/carrera/curso?param='+idCurso+'&param2='+planName+'&param3='+idCertificado+'&param4='+idInscripcion+'&param5='+idPlan+'&param6='+idMonitoreoActividad+'&param7=0';;
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
}

startVideo = function(idActividad, idInscripcion) {
	
	var urltxt = ctx + '/lms/carrera/actividadRegistro?idActividad=' + idActividad + '&idInscripcion=' + idInscripcion;
	
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
				
				$('#endVideo').show();
				$('#startVideo').hide();
				
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
			
}

endActividadVideo = function (idActividad, idInscripcion, idCurso, planName, cursoName, idPlan, idCertificado) {
	
	var urltxt = ctx + '/lms/carrera/actividadCompleta?idActividad=' + idActividad + '&idInscripcion=' + idInscripcion;
	idMonitoreoActividad = $('#idMonitoreoActividadPadre').val();
	
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
				window.location = ctx+'/lms/carrera/curso?param='+idCurso+'&param2='+planName+'&param3='+idCertificado+'&param4='+idInscripcion+'&param5='+idPlan+'&param6='+idMonitoreoActividad+'&param7=0';;
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
		}
	});
}


saveActividadTarea = function(obj, idActividad, idInscripcion, idCurso, planName, cursoName, idPlan, idCertificado) {
	validacionData = true;
	if (!notNull($("#iptActividadTareaFile"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/lms/carrera/saveActividadTarea?idActividad='+idActividad+'&idInscripcion='+idInscripcion;
		idMonitoreoActividad = $('#idMonitoreoActividadPadre').val();
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadTarea")),
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
					displaySuccesMessageByObjectId('',msg,'formActividadTarea');
					window.location = ctx+'/lms/carrera/curso?param='+idCurso+'&param2='+planName+'&param3='+idCertificado+'&param4='+idInscripcion+'&param5='+idPlan+'&param6='+idMonitoreoActividad+'&param7=0';;
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadTarea');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadTarea');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Selecciona un archivo','formActividadTarea');
	}
	
}


function downloadFile(idData) {
	window.open(ctx + '/lms/carrera/tarea/downloadFile?fileId=' + idData);
}

getMiCertificadoCursoMonitoreo = function(idCurso, planName, certificadoName, cursoName, idInscripcion, idPlan, idCertificado){

    var idMonitoreoActividadCursoPadre=$("#idMonitoreoActividadCursoPadre").val();
	window.location = ctx+'/lms/carrera/curso?param='+idCurso+'&param2='+planName+'&param3='+idCertificado+'&param4='+idInscripcion+'&param5='+idPlan+'&param6=0'+'&param7='+idMonitoreoActividadCursoPadre;
}

getMiCarreraMonitoreo = function(){
	var idMonitoreoActividadPadre=$("#idMonitoreoActividadPadre").val();
	window.location = ctx+'/lms/carrera?idMonitoreo='+idMonitoreoActividadPadre;
}
getMiPlanMonitoreo = function(id){
	var idMonitoreoActividadPadre=$("#idMonitoreoActividadPadre").val();
	
		window.location = ctx+'/lms/carrera/plan?param='+id+'&idMonitoreo='+Number(idMonitoreoActividadPadre);
	

}




