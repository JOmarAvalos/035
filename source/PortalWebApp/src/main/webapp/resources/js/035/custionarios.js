/**
 * 
 */
 
 startCuestionario = function(){
	$('#startExamen').hide();
	$('#pregunta1').show();
}

saveRespuesta = function(actual, siguiente, tipo, total, idPregunta, totalRespuestas){
	
	$('#pMsjAdvertenciaExamen').html('');
	
	//Agregar validaciones de respuesta seleccionada 
	
	respondido = true;
	mensaje = '';
	
	if(tipo == 3){
	//abierta
		if (!notNull($('#ta'+idPregunta))) {
			respondido = false;
			mensaje = "Para poder continuar, debes capturar la respuesta";
		}
	}else if(tipo == 2 || tipo == 1){
	//verdadero-falso, multiple unica
		if($('input:radio[name=check'+idPregunta+']:checked').length == 0){
			respondido = false;
			mensaje = "Para poder continuar, debes seleccionar una respuesta";
		}
	}
	
	if(respondido){
		
		var respuestaExamenVO = new Object;
		respuestaExamenVO.idActividadConsulta = idConsultaActividad;
		respuestaExamenVO.idPregunta = idPregunta;
		respuestaExamenVO.idTipo = tipo;
		if(tipo == 3){
		//abierta
			respuestaExamenVO.respuestaAbierta = $('#ta'+idPregunta).val();
		}else if(tipo == 2 || tipo == 1 ){
		//verdadero-falso, multiple unica, imagen unica
			respuestaExamenVO.idRespuesta = $('input:radio[name=check'+idPregunta+']:checked').val();
		}
		
		
		$('#pregunta'+actual).hide();
		if(actual == total){
			$('#endExamen').show();
		}else{
			if(idPregunta == 5){
				var continuaNormal = false;
				if($('input:radio[name=check1]:checked').val() == 1 ){
					continuaNormal = true;
				}
				if($('input:radio[name=check2]:checked').val() == 3 ){
					continuaNormal = true;
				}
				if($('input:radio[name=check3]:checked').val() == 5 ){
					continuaNormal = true;
				}
				if($('input:radio[name=check4]:checked').val() == 7 ){
					continuaNormal = true;
				}
				if($('input:radio[name=check5]:checked').val() == 9 ){
					continuaNormal = true;
				}
				if(continuaNormal){
					$('#pregunta'+siguiente).show();
				}else{
					$('#pregunta21').show();
				}
			}else{
				$('#pregunta'+siguiente).show();
			}
		}
	}else{
		$('#pMsjAdvertenciaExamen').append(mensaje);
		$('#modalAdvertenciaExamen').modal({backdrop: 'static', keyboard: false});
	}

	
}