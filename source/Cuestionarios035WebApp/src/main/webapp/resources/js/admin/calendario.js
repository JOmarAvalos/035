saveEventoInscripcion = function() {
	
	var eventoInscripcionVO = new Object;
	eventoInscripcionVO.estatus=1;	
	if ($.trim($("#iptEventoCalendarioId").val()) != ''){
		eventoInscripcionVO.idEvento = $('#iptEventoCalendarioId').val();
	}
 	
	var urltxt = ctx + '/lms/inscripciones/save';
	
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(eventoInscripcionVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			$('#modalCalendar').modal('hide');
			
			if (response[0]) {
				window.location = ctx + '/lms/agenda';
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Guardado correctamente');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
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
saveInscripcion = function(idUsuarioFuncionario) {
	
	var eventoInscripcionVO = new Object;		
		eventoInscripcionVO.estatus=2;
		eventoInscripcionVO.idUsuario=idUsuarioFuncionario;
		if ($.trim($("#iptEventoCalendarioId").val()) != ''){
			eventoInscripcionVO.idEvento = $('#iptEventoCalendarioId').val();
		}
	var urltxt = ctx + '/lms/inscripciones/save';	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(eventoInscripcionVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			$('#modal-inscripciones').modal('hide');
			
			if (response[0]) {
				window.location = ctx + '/lms/inscripciones';
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append(response[1]);
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append(response[1]);
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
}
agregarInscripcion = function(id) {
	
	var eventoInscripcionVO = new Object;		
		eventoInscripcionVO.id = id;
		eventoInscripcionVO.estatus=2;	
		if ($.trim($("#iptEventoCalendarioId").val()) != ''){
			eventoInscripcionVO.idEvento = $('#iptEventoCalendarioId').val();
		}
	var urltxt = ctx + '/lms/inscripciones/save';	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(eventoInscripcionVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			$('#modal-inscripciones').modal('hide');
			
			if (response[0]) {
				window.location = ctx + '/lms/inscripciones';
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append(response[1]);
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append(response[1]);
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
}
rechazarInscripcion = function(id) {
	
	var eventoInscripcionVO = new Object;		
		eventoInscripcionVO.id = id;
		eventoInscripcionVO.estatus=3;	
		if ($.trim($("#iptEventoCalendarioId").val()) != ''){
			eventoInscripcionVO.idEvento = $('#iptEventoCalendarioId').val();
		}
	var urltxt = ctx + '/lms/inscripciones/save';	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(eventoInscripcionVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			$('#modal-inscripciones').modal('hide');
			
			if (response[0]) {
				window.location = ctx + '/lms/inscripciones';
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Guardado correctamente');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
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

showCancelaInscripcion = function(id){
	$('#iptIdInscripcionCanc').val(id);
	$('#modalAdvertenciaCancelacion').modal({backdrop: 'static', keyboard: false});
}

cancelaInscripcion = function() {
	
	estatusValid = true;
	
	if ($('#selectMotivoCancelacion').val() > 0) {
		eliminaMarcaRojo($("#selectMotivoCancelacion"));
	}else{
		marcaRojo($("#selectMotivoCancelacion"));
		estatusValid = false;
	}
	
	if(estatusValid){
		var eventoInscripcionVO = new Object;		
		eventoInscripcionVO.id = $('#iptIdInscripcionCanc').val();
		if($('#ipAplicaCosto').val() == 'true'){
			eventoInscripcionVO.estatus=10;	
		}else{
			eventoInscripcionVO.estatus=4;	
		}
		if ($.trim($("#iptEventoCalendarioId").val()) != ''){
			eventoInscripcionVO.idEvento = $('#iptEventoCalendarioId').val();
		}
		eventoInscripcionVO.idMotivoCancelacion = $('#selectMotivoCancelacion').val();
		var urltxt = ctx + '/lms/inscripciones/save';	
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(eventoInscripcionVO),
			beforeSend : function() {
				maskBody();
			},
			complete : function() {
				unmaskBody();
			},
			success : function(response) {
				
				$('#modal-inscripciones').modal('hide');
				$('#modalAdvertenciaCancelacion').modal('hide');
				
				if (response[0]) {
					//window.location = ctx + '/lms/inscripciones';
					
					//$('#modalTxtRespuesta').html('');
					//$('#modalTxtRespuesta').append('Inscripci&oacute;n cancelada');
					$('#modalRespuestaCancelacion').modal({backdrop: 'static', keyboard: false});
				} else {
					$('#modalTxtRespuesta').html('');
					$('#modalTxtRespuesta').append('Error');
					$('#modalRespuestaCancelacion').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				alert('Error alert');
			}
		});
	}else{
		$('#modalMotivoObligatorio').modal({backdrop: 'static', keyboard: false});
	}

}


openGeneraInvitacion = function(){
	$('#modalInvitacionDistribuidor').modal({backdrop: 'static', keyboard: false});
}

generaInvitacionDist = function(){
	var iniAnio = $('#iptInicioInvitacionDist').val().substring(0,4);
	var iniMes  = $('#iptInicioInvitacionDist').val().substring(5,7);
	var iniDia  = $('#iptInicioInvitacionDist').val().substring(8,10);
	var finAnio = $('#iptFinInvitacionDist').val().substring(0,4);
	var finMes  = $('#iptFinInvitacionDist').val().substring(5,7);
	var finDia  = $('#iptFinInvitacionDist').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"
	
	
	reporteInvitacion = true;
	if($('#selectDealerInv').val() <= 0){
		marcaRojo($("#selectDealerInv"));
		reporteInvitacion = false;
	}else{
		eliminaMarcaRojo($("#selectDealerInv"));
	}
	
	if(reporteInvitacion){
		var urltxt = ctx+"/reportes/invDistribuidor?param3="+$('#selectDealerInv').val()+"&param="+fechaInicio+"&param2="+fechaFin; 
		window.open(urltxt, '_blank');
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

exportLista = function(idEvento){
	var urltxt = ctx+"/lms/soporteListaEvento?param="+idEvento; 
	window.open(urltxt, '_blank');
} 

getCursoEvento = function(){

	var idMonitoreoActividad=$("#idMonitoreoActividad").val();
    var idCurso = $('#verCursoId').val();
    var planName = $('#verCursoNombre').val();
    var idCertificado = $('#verCursoCertificadoId').val();
    var idInscripcion = $('#verCursoInscripcion').val();
    var idPlan = $('#verCursoPlanId').val();

	
	
	window.location = ctx + '/lms/carrera/curso?param='+Number(idCurso)+'&param2='+planName+'&param3='+Number(idCertificado)+'&param4='+idInscripcion+'&param5='+idPlan+'&param6='+idMonitoreoActividad+'&param7=0';
}