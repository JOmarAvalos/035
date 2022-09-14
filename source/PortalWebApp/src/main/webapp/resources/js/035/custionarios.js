/**
 * 
 */
 
 startCuestionario = function(){
	
	nombreValido = true;
	
	if(!notNull($('#iptNombreR'))){
		nombreValido = false;
	}
	if(!notNull($('#iptAPaternoR'))){
		nombreValido = false;
	}
	if(!notNull($('#iptAMaternoR'))){
		nombreValido = false;
	}
	
	if(nombreValido){
		
		var actividadResueltaVO = new Object;
		actividadResueltaVO.idActividad = $('#idActividad').val();
		actividadResueltaVO.nombre = $('#iptNombreR').val();
		actividadResueltaVO.paterno = $('#iptAPaternoR').val();
		actividadResueltaVO.materno = $('#iptAMaternoR').val();
		 
		
		var urltxt = ctx + '/cuestionarios/saveActividad';
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(actividadResueltaVO),
			beforeSend : function() {
				maskBody();
			},
			complete : function() {
				unmaskBody();
			},
			success : function(response) {
				var result = response[0];
				var id = response[1];
				if (result) {
					$('#idActividadResuelta').val(id);
					$('#startExamen').hide();
					$('#pregunta1').show();
				} else {
					alert('error');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
			}
		});
		
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});

	}
	
}

showAnterior = function(actual){
	anterior = actual -1;
	$('#pregunta'+actual).hide();
	$('#pregunta'+anterior).show();
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
		
		var preguntaResueltaVO = new Object;
		preguntaResueltaVO.idActividadResuelta = $('#idActividadResuelta').val();
		preguntaResueltaVO.idPregunta = idPregunta;
		
		if(tipo == 3){
		//abierta
			preguntaResueltaVO.respuestaAbierta = $('#ta'+idPregunta).val();
		}else if(tipo == 2 || tipo == 1 ){
		//verdadero-falso, multiple unica, imagen unica
			preguntaResueltaVO.idRespuesta = $('input:radio[name=check'+idPregunta+']:checked').val();
		}
		
		var urltxt = ctx + '/cuestionarios/saveRepuesta';
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(preguntaResueltaVO),
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
						}else if (idPregunta == 72){
							if($('input:radio[name=check72]:checked').val() == 305 ){
								$('#pregunta'+siguiente).show();
							}else if(($('input:radio[name=check72]:checked').val() == 306 )){
								$('#pregunta50').show();
							}
						}else if (idPregunta == 76){
							if($('input:radio[name=check72]:checked').val() == 322 ){
								$('#pregunta'+siguiente).show();
							}else if(($('input:radio[name=check72]:checked').val() == 323 )){
								$('#endExamen').show();
							}
						}else if (idPregunta ==149){
							if($('input:radio[name=check149]:checked').val() == 691 ){
								$('#pregunta'+siguiente).show();
							}else if(($('input:radio[name=check149]:checked').val() == 692 )){
								$('#pregunta75').show();
							}
						}else if (idPregunta == 154){
							if($('input:radio[name=check154]:checked').val() == 713 ){
								$('#pregunta'+siguiente).show();
							}else if(($('input:radio[name=check154]:checked').val() == 714 )){
								$('#endExamen').show();
							}
						}else{
							$('#pregunta'+siguiente).show();
						}
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
		$('#modalAdvertenciaExamen').modal({backdrop: 'static', keyboard: false});
	}
}

openCuestionario = function(idCuestionario, idCentro){
	url = ctx+'/cuestionarios/cuestionario?param1='+idCuestionario+'&param2='+idCentro;
	
	url = url.replaceAll("+","%2B"); 
	
	window.location = url;
	
	//window.open(url, '_blank');
}

terminaCuestonario = function(){
	id = $('#idActividadResuelta').val();
	urltxt = ctx+'/cuestionarios/terminaCuestionario?param='+id;
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		async:false,
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				//es valido
				window.location = 'https://035.com.mx/';
			} else {
				// no es valido(repetido)
				alert('error');
			}
		},
		error : function(msg) {
			alert('error');
		}
	});
}