
getEventoActividades = function(idEventoCal) {
	
	if ($('#actividades-'+idEventoCal).is(':visible')) {
	    $('#actividades-'+idEventoCal).hide();
	} else {
		
		var urltxt = ctx + '/calificador/getEventoActividades?id='+idEventoCal;
		
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
					
					var object = response[1];

					$('#actividades-'+idEventoCal).show();
					
					var actividadesStr = "" +
					"<td colspan='4'>" +
					"	<table id='example2' class='table table-bordered table-striped' style='width: 90%; margin-right: auto; margin-left: auto;'>" +
					"		<thead>" +
					"			<tr>" +
					"				<th style='width: 30%;'>Tipo</th>" +
					"				<th style='width: 60%;'>Actividad</th>" +
					"				<th style='width: 10%; text-align: center;'>Acciones</th>" +
					"			</tr>" +
					"		</thead>" +
					"		<tbody>";
					
					for (var i=0; i<object.length; i++) { 
						actividadesStr += "<tr>" +
										  "		<td>" + object[i].tipoActividad.nombre + "</td>" + 
										  "		<td>" + object[i].nombre + "</td>" +
										  "		<td style='text-align: center;'>" +
										  "			<a href='#' title='Visible' onclick='getActividadFuncionarios("+ object[i].id +");'><i class='fa fa-caret-down'></i></a>" +
										  "		</td>" +
										  "</tr>";
					}
					
					actividadesStr += "" +
					"		</tbody>" +
					"	</table>" +
					"</td>" +
					"";
					
					$('#actividades-'+idEventoCal).html(actividadesStr);
					
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
}

getActividadFuncionarios = function(idActividad) {
	alert("idActividad");
}

showInscripcion = function(idEvento){
	window.location =   ctx+"/calificador/listaInscripcion?param="+idEvento; 
}

calificaManual = function(idConsultaActividad, idTipo){
	calificacion = 0;
	if(idTipo == 1 || idTipo == 2 || idTipo == 3 || idTipo == 5 || idTipo == 6 || idTipo == 8 ){
		if ($('#iptCheckActividad'+idConsultaActividad).prop('checked')) {
			calificacion = 1;
		}
	}else if(idTipo == 4 || idTipo == 7 || idTipo == 9 || idTipo == 10 || idTipo == 11 || idTipo == 12 || idTipo == 13){
		calificacion = $('#iptCalificacion'+idConsultaActividad).val();
	}
	
	var urltxt = ctx+"/calificador/calificaActividad?param="+idConsultaActividad+"&param2="+calificacion;
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#modalCalificacionActualizada').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showNoShow = function(idInscripcion, nombre){
	$('#idEventoInscripcionNoShow').val(idInscripcion);
	$('#h2NameNoShow').html('');
	$('#h2NameNoShow').append(nombre);
	$('#modalVerificaNoShow').modal({backdrop: 'static', keyboard: false});
}

noShow = function(){
	var urltxt = ctx+"/calificador/noShow?param="+$('#idEventoInscripcionNoShow').val();
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#modalVerificaNoShow').hide();
				$('#modalCursoCalificado').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showNoExamen = function(idInscripcion, nombre){
	$('#idEventoInscripcionNoExamen').val(idInscripcion);
	$('#h2NameNoExamen').html('');
	$('#h2NameNoExamen').append(nombre);
	$('#modalVerificaNoExamen').modal({backdrop: 'static', keyboard: false});
}

noExamen = function(){
	var urltxt = ctx+"/calificador/noExamen?param="+$('#idEventoInscripcionNoExamen').val();
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#modalVerificaNoExamen').hide();
				$('#modalCursoCalificado').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showCalificaCurso = function(idInscripcion, nombre){
	$('#idEventoInscripcionCurso').val(idInscripcion);
	$('#h2NameCurso').html('');
	$('#h2NameCurso').append(nombre);
	$('#modalVerificaCalificaCurso').modal({backdrop: 'static', keyboard: false});
}

calificaCurso = function(){
	var urltxt = ctx+"/calificador/calificaCurso?param="+$('#idEventoInscripcionCurso').val();
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#modalVerificaCalificaCurso').hide();
				$('#modalCursoCalificado').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}


verFormtoCalificacion = function(){
	$('#modalFormatos').modal({backdrop: 'static', keyboard: false});
//	var urltxt = ctx+"/calificador/getCalificaciones?param="+idEvento; 
//	window.open(urltxt, '_blank');
}

terminaCurso = function(idEvento){
	var urltxt = ctx+"/calificador/terminaCurso?param="+idEvento;
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				window.location =  ctx+"/calificador";
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showSubirFormato = function(){
	$('#modalSubirFormato').modal({backdrop: 'static', keyboard: false});
}

subirFormato = function(){
	var justifFile = $("#formatoFile").prop("files")[0];
	var fd = new FormData();
	fd.append("iptIdEvento", $('#iptIdEvento').val());
	fd.append("iptFormatoCalificacionesFile", justifFile);
	
	var urltxt = ctx + '/calificador/subirCalificaciones';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : false,
		processData : false,
		data : fd,
		enctype : 'multipart/form-data',			
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			if (response[0]) {
				$('#modalSubirFormato').modal('hide');
				$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
			}else{
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
}

openNewFormato = function(){
	$('#modalNuevoFormato').modal({backdrop: 'static', keyboard: false});
}

nuevoFormato = function(){

	var justifFile = $("#iptFormatoCalificacionesFile").prop("files")[0];
	var fd = new FormData();
	fd.append("iptIdEventoFormN", $('#iptIdEventoFormN').val());
	fd.append("iptFormatoCalificacionesFile", justifFile);
	fd.append("iptIdDescripcionFormN", $('#iptIdDescripcionFormN').val());
	
	var urltxt = ctx + '/calificador/subirCalificaciones';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : false,
		processData : false,
		data : fd,
		enctype : 'multipart/form-data',			
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			if (response[0]) {
				$('#modalNuevoFormato').modal('hide');
				$('#modalFormatos').modal('hide');
				$('#h4Msj').html('');
				$('#h4Msj').append('Documento guardado');
				$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
			}else{
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

verFormato = function(id){
	var urltxt = ctx+"/calificador/getCalificaciones?param="+id; 
	window.open(urltxt, '_blank');
	
}

actualizaFormato = function(){

	nuevoFormValid = true;

	var justifFile = $("#iptFileFormA").prop("files")[0];
	
	if (!notNull($("#iptIdDescripcionFormA"))) {
		nuevoFormValid = false;
	}
	
	if(justifFile == null){
		nuevoFormValid = false;
		marcaRojo($("#justifFileNuevo"));
	}else{
		eliminaMarcaRojo($("#justifFileNuevo"));
	}	
	
	if(nuevoFormValid){
		var fd = new FormData();
		fd.append("iptIdFormatoA", $('#iptIdFormatoA').val());
		fd.append("iptFileFormA", justifFile);
		fd.append("iptIdDescripcionFormA", $('#iptIdDescripcionFormA').val());
		
		var urltxt = ctx + '/calificador/actualizarCalificaciones';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : fd,
			enctype : 'multipart/form-data',			
			beforeSend : function() {
				maskBody();
			},
			complete : function() {
				unmaskBody();
			},
			success : function(response) {
				
				if (response[0]) {
					$('#modalAdvertenciaFormato').modal('hide');
					$('#h4Msj').html('');
					$('#h4Msj').append('Documento actualizado');
					$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
				}else{
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}

}

showNuevoFormato = function(idInscripcion,descripcion){
	$('#iptIdFormatoA').val(idInscripcion);
	$('#iptIdDescripcionFormA').val(descripcion); 
	$('#modalAdvertenciaFormato').modal({backdrop: 'static', keyboard: false});
	$('#modalFormatos').modal('hide');
}

closeNuevoFormato = function(){
	$('#modalFormatos').modal({backdrop: 'static', keyboard: false});
	$('#modalAdvertenciaFormato').modal('hide');
}

function downloadTarea(idData) {
	window.open(ctx + '/calificador/tarea/downloadFile?fileId=' + idData);
}