subirReporteAS = function(idCiclo) { 
 
    //limpiar();
	//getReporteAdic(idCiclo);
	$('#modalUploadDocumento').modal({backdrop: 'static', keyboard: false});

}
/*function limpiar(){
	$('#formUploadDocumento').parsley().reset();
	$('#iptIdCiclo').val('');
	$('#iptIdReporteAdic').val('');
	$('#selecTipoReporte').val('');	
	$('#iptDocumentoFile').val('');	
}

function getReporteAdic(idCiclo){
	var urltxt = ctx
	+ "/lms/reportesAdic/getReporteAdicional?idCiclo="
	+ idCiclo;
	$.ajax({
        async: false,
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
			if (response[0]) {
				var datos= response[1];
			
				$('#iptIdReporteAdic').val(datos.id);
				$('#selecTipoReporte').val(datos.idTipoReporte);	
			}
			$('#iptIdCiclo').val(idCiclo);
		},
		error : function(msg) {
			alert('Error');
		}
	});	
}*/
saveUploadDocumento = function(obj) {

	var urltxt = ctx + '/lms/reportesAdic/saveReportes';
    

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : false,
		processData : false,
		data : new FormData(document.getElementById("formUploadDocumento")),
		enctype : 'multipart/form-data',
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			$('#modalUploadDocumento').modal('hide');
			var result = response[0];
			var msg = response[1];
			if (result) {
				window.location = ctx + /lms/reportesAdic;
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