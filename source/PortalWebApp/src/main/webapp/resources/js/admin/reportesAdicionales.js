newCicloReporte = function() {
	
	cleanModalCicloReporte();
	eliminaMarcaRojo($("#iptNombreCicloReporte"));
	eliminaMarcaRojo($("#selecCicloReporteEmpresa"));
	eliminaMarcaRojo($("#iptFechaInicioCicloReporte"));
	eliminaMarcaRojo($("#iptFechaFinCicloReporte"));

	$('#modalNewCicloReporte').modal({
		backdrop : 'static',
		keyboard : false
	});
}
function cleanModalCicloReporte() {
	$("#iptNombreCicloReporte").val('');
	$("#selecCicloReporteEmpresa").val('');
	$("#iptFechaInicioCicloReporte").val('');
	$("#iptFechaFinCicloReporte").val('');
	$('#selecCicloReporteEmpresa').prop("disabled", false);
	$('#iptFechaFinCicloReporte').prop("disabled", true);
}

validacion = function() {
	var iniAnio = $('#iptFechaInicioCicloReporte').val().substring(0,4);
	var iniMes  = $('#iptFechaInicioCicloReporte').val().substring(5,7);
	var iniDia  = $('#iptFechaInicioCicloReporte').val().substring(8,10);
	var iniHora = $('#iptFechaInicioCicloReporte').val().substring(11,13);
	var iniMin  = $('#iptFechaInicioCicloReporte').val().substring(14,16);
	
	var finAnio = $('#iptFechaFinCicloReporte').val().substring(0,4);
	var finMes  = $('#iptFechaFinCicloReporte').val().substring(5,7);
	var finDia  = $('#iptFechaFinCicloReporte').val().substring(8,10);
	var finHora = $('#iptFechaFinCicloReporte').val().substring(11,13);
	var finMin  = $('#iptFechaFinCicloReporte').val().substring(14,16); 
	var cicloReporte = new Object;
	var fchInicio = new Date(iniAnio, iniMes-1, iniDia, iniHora, iniMin, 0, 0);
	var fchCierre = new Date(finAnio, finMes-1, finDia, finHora, finMin, 0, 0);
	if(fchInicio!=null && fchCierre!=null){
		cicloReporte.idEmpresa = $("#selecCicloReporteEmpresa").val();
		cicloReporte.fchInicio = fchInicio;
		cicloReporte.fchCierre = fchCierre;
		var urltxt = ctx
		+ "/reportesAdicionales/getValidacionCiclo";

     		var jqXHR = 	$.ajax({
	        async: false,
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(cicloReporte),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {						
			},
			error : function(msg) {
				alert('Error');
			}
		});	

		var datos=jqXHR.responseJSON;
		result = datos[0];
		if (result) {
			$("#iptFechaInicioCicloReporte").val('');
			$("#iptFechaFinCicloReporte").val('');
			$('#iptFechaFinCicloReporte').prop("disabled", true);
			$('#modalDatosFechaCiclo').modal({backdrop: 'static', keyboard: false});
		}
	
	}	
}

setMinDateFin = function(){
	
	var minFinDate = $('#iptFechaInicioCicloReporte').val();
	var x = document.getElementById("iptFechaFinCicloReporte");
	x.min = minFinDate;
	$('#iptFechaFinCicloReporte').attr('disabled',false);
	$('#iptFechaFinCicloReporte').val(minFinDate);
	
}

saveCicloReporte = function() {
	var cicloReporte = new Object;
	eventoValid = true;
	if (!notNull($("#iptNombreCicloReporte"))) {
		eventoValid = false;
	}
	if (!notNull($("#selecCicloReporteEmpresa"))) {
		eventoValid = false;
	}
	if (!notNull($("#iptFechaInicioCicloReporte"))) {
		eventoValid = false;
	}
	if (!notNull($("#iptFechaFinCicloReporte"))) {
		eventoValid = false;
	}
	if(eventoValid){
	cicloReporte.nombre = $('#iptNombreCicloReporte').val();
	cicloReporte.idEmpresa = $('#selecCicloReporteEmpresa').val();
	
	var iniAnio = $('#iptFechaInicioCicloReporte').val().substring(0,4);
	var iniMes  = $('#iptFechaInicioCicloReporte').val().substring(5,7);
	var iniDia  = $('#iptFechaInicioCicloReporte').val().substring(8,10);
	var iniHora = $('#iptFechaInicioCicloReporte').val().substring(11,13);
	var iniMin  = $('#iptFechaInicioCicloReporte').val().substring(14,16);
	
	var finAnio = $('#iptFechaFinCicloReporte').val().substring(0,4);
	var finMes  = $('#iptFechaFinCicloReporte').val().substring(5,7);
	var finDia  = $('#iptFechaFinCicloReporte').val().substring(8,10);
	var finHora = $('#iptFechaFinCicloReporte').val().substring(11,13);
	var finMin  = $('#iptFechaFinCicloReporte').val().substring(14,16);

	cicloReporte.fchInicio = new Date(iniAnio, iniMes-1, iniDia, iniHora, iniMin, 0, 0);
	cicloReporte.fchCierre = new Date(finAnio, finMes-1, finDia, finHora, finMin, 0, 0);


	// Guardar nuevo registro
	var urltxt = ctx + '/reportesAdicionales/saveCicloReportes';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(cicloReporte),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {

			$('#modalNewCicloReporte').modal('hide');

			if (response[0]) {
				window.location = ctx + '/reportesAdicionales';
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Guardado correctamente');
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append(response[1]);
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

editCicloReporte = function() {
	var cicloReporte = new Object;
	eventoValid = true;
	if (!notNull($("#iptNombreCicloReporteEdit"))) {
		eventoValid = false;
	}
	if (!notNull($("#selecCicloReporteEmpresaEdit"))) {
		eventoValid = false;
	}
	if (!notNull($("#iptFechaInicioCicloReporteEdit"))) {
		eventoValid = false;
	}
	if (!notNull($("#iptFechaFinCicloReporteEdit"))) {
		eventoValid = false;
	}
	if(eventoValid){
		cicloReporte.id = $('#iptIdCicloEdit').val();
		cicloReporte.nombre = $('#iptNombreCicloReporteEdit').val();
		cicloReporte.idEmpresa = $('#selecCicloReporteEmpresaEdit').val();
		
		var iniAnio = $('#iptFechaInicioCicloReporteEdit').val().substring(0,4);
		var iniMes  = $('#iptFechaInicioCicloReporteEdit').val().substring(5,7);
		var iniDia  = $('#iptFechaInicioCicloReporteEdit').val().substring(8,10);
		var iniHora = $('#iptFechaInicioCicloReporteEdit').val().substring(11,13);
		var iniMin  = $('#iptFechaInicioCicloReporteEdit').val().substring(14,16);
		
		var finAnio = $('#iptFechaFinCicloReporteEdit').val().substring(0,4);
		var finMes  = $('#iptFechaFinCicloReporteEdit').val().substring(5,7);
		var finDia  = $('#iptFechaFinCicloReporteEdit').val().substring(8,10);
		var finHora = $('#iptFechaFinCicloReporteEdit').val().substring(11,13);
		var finMin  = $('#iptFechaFinCicloReporteEdit').val().substring(14,16);
	
		cicloReporte.fchInicio = new Date(iniAnio, iniMes-1, iniDia, iniHora, iniMin, 0, 0);
		cicloReporte.fchCierre = new Date(finAnio, finMes-1, finDia, finHora, finMin, 0, 0);
	
	
		// Guardar nuevo registro
		var urltxt = ctx + '/reportesAdicionales/updateCicloReportes';
	
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(cicloReporte),
			beforeSend : function() {
				maskBody();
			},
			complete : function() {
				unmaskBody();
			},
			success : function(response) {
	
				$('#modalEditCicloReporte').modal('hide');
	
				if (response[0]) {
					window.location = ctx + '/reportesAdicionales';
					$('#modalTxtRespuesta').html('');
					$('#modalTxtRespuesta').append('Guardado correctamente');
					$('#modalRespuesta').modal({
						backdrop : 'static',
						keyboard : false
					});
				} else {
					$('#modalTxtRespuesta').html('');
					$('#modalTxtRespuesta').append(response[1]);
					$('#modalRespuesta').modal({
						backdrop : 'static',
						keyboard : false
					});
				}
			},
			error : function(msg) {
				alert('Error alert');
			}
		});
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

verDetalle = function (id){
	window.location = ctx+'/reportesAdicionales/documentosReporte?id='+id;
}
function descargarFile(id) {
	window.open(ctx + '/reportesAdicionales/downloadFile?fileId=' + id);
}
function descargarZip(id) {
	window.open(ctx + '/reportesAdicionales/downloadZip?CicloId=' + id);
}

verEditar = function(id, idEmpresa, nombre, inicio, cierre){
	$('#iptIdCicloEdit').val(id);
	$('#selecCicloReporteEmpresaEdit').val(idEmpresa);
	$('#iptNombreCicloReporteEdit').val(nombre);
	$('#iptFechaInicioCicloReporteEdit').val(inicio);
	$('#iptFechaFinCicloReporteEdit').val(cierre);
	
	$('#modalEditCicloReporte').modal({ backdrop : 'static', keyboard : false });
	
}


showFechas = function(){
	
	idEmpresa = $('#selecCicloReporteEmpresa').val();
	if($('#selecCicloReporteEmpresa').val() > 0){
		$('#iptFechaInicioCicloReporte').attr('disabled',false);
	}else{
		$('#iptFechaInicioCicloReporte').attr('disabled',true);
		$('#iptFechaFinCicloReporte').attr('disabled',true);
	}
	
}