

subCarpetasDocumentos = function(idCarpeta) {
	$('#collapse' + idCarpeta).html('');
	var htmlAdd = '';
	var urltxt = ctx + "/lms/repositorio/getCarpetasArchivos?idCarpeta="
			+ idCarpeta;


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
				var object = response[1];
				htmlAdd = '<div class="body-accordion-repo">';
						//+ '<div class="container-fluid p-0">'
						//+ '<div class="row align-items-center">'
						//+ '<div class="col-12">';

				for (var i = 0; i < object.length; i++) {
					var element = object[i];
					htmlAdd += datosDocumentos(element.id);
				}
				htmlAdd += '</div></div></div></div>';
				$('#collapse' + idCarpeta).append(htmlAdd);
			} 
		},
		error : function(msg) {
			alert('Error');
		}
	});
	

}

function datosDocumentos(id) {
	var acor = '';
	var completo = '';
	var urltxt = ctx + "/lms/repositorio/getCarpetaDocumento?idCarpeta=" + id;
	var jqXHR = $.ajax({
		async : false,
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
		},
		error : function(msg) {
			alert('Error');
		}
	});

	var datos = jqXHR.responseJSON;
	result = datos[0];
	if (result) {
		var object = datos[1];

		if (object.tipo === 2) {
			var nombreDocumento = object.nombre;
			var extDocumento = nombreDocumento.substr(nombreDocumento.lastIndexOf(".") + 1);
			if (extDocumento == 'docx') {

				acor += '<a href="#" onclick="descargarFile('+object.id+');" class="dwn-file fword">' + object.nombre
						+ ' <i class="fas fa-download"></i></a>';
			} else if (extDocumento == 'xlsx'|| extDocumento == 'xls') {
				acor += '<a href="#" onclick="descargarFile('+object.id+');" class="dwn-file fexcel">' + object.nombre
						+ ' <i class="fas fa-download"></i></a>';

			} else if (extDocumento == 'ppt') {
				acor += '<a href="#" onclick="descargarFile('+object.id+');" class="dwn-file fppoint">'
						+ object.nombre
						+ ' <i class="fas fa-download"></i></a>';

			}else if (extDocumento == 'png' || extDocumento == 'jpg' || extDocumento == 'gif') {
				acor += '<a href="#" onclick="descargarFile('+object.id+');" class="dwn-file fimage">' + object.nombre
						+ ' <i class="fas fa-download"></i></a>';

			} else if (extDocumento == 'pdf') {
				acor += '<a href="#" onclick="descargarFile('+object.id+');" class="dwn-file fpdf">' + object.nombre
						+ ' <i class="fas fa-download"></i></a>';

			} else if (extDocumento == 'mp4' || extDocumento == 'avi' || extDocumento == 'mov' || extDocumento == 'webm') {
				acor += '<a href="#" onclick="descargarFile('+object.id+');" class="dwn-file fvideo">' + object.nombre
						+ ' <i class="fas fa-download"></i></a>';

			} else if (extDocumento == 'zip') {
				acor += '<a href="#" onclick="descargarFile('+object.id+');" class="dwn-file fzip">' + object.nombre
						+ ' <i class="fas fa-download"></i></a>';

			} else if (extDocumento == 'rar') {
				acor += '<a href="#" onclick="descargarFile('+object.id+');" class="dwn-file fzip">' + object.nombre
						+ ' <i class="fas fa-download"></i></a>';

			} else {
				acor += '<a href="#" onclick="descargarFile('+object.id+');" class="dwn-file fotro">' + object.nombre
						+ ' <i class="fas fa-download"></i></a>';

			}

		} else if (object.tipo === 1) {
			acor += '<div class="title-head-accordion subfolder"> <h5 class="sb-header collapsed" data-toggle="collapse" data-target="#collapse'
					+ object.id
					+ '" aria-expanded="true" aria-controls="#collapse'
					+ object.id
					+ '" onclick="subCarpetasDocumentos('
					+ object.id
					+ ');">'
					+ object.nombre
					+ '<div class="toggle-accordion"><i class="fa" aria-hidden="true"></i></div></h5></div><a class="download-folder-zip" href="#" title="Descargar Zip" onclick="descargarZip('+object.id+');"><i class="fas fa-file-archive"></i></a>';

		}

		acor += '<div id="collapse'
				+ object.id
				+ '" class="collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#collapse'
				+ object.id + '"></div>';

		completo = acor;

	}
	return completo;
}
function descargarFile(id) {
	window.open(ctx + '/lms/repositorio/downloadFile?fileId=' + id);
}

function descargarZip(idCarpeta) {
	var urltxt = ctx
	+ "/lms/repositorio/getCarpetasArchivos?idCarpeta="
	+ idCarpeta;
	
	var jqXHR = 	$.ajax({
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
		},
		error : function(msg) {
			alert('Error');
		}
	});	
	
	var datos=jqXHR.responseJSON;
	result = datos[0];
	if (result) {
		window.open(ctx + '/lms/repositorio/downloadZip?idCarpeta=' + idCarpeta);
	}else{
	
		$('#modalTxtRespuesta').html('');
		$('#modalTxtRespuesta').append('La carpeta no contiene archivos');
		$('#modalRespuesta').modal({
			backdrop : 'static',
			keyboard : false
		});
	}
	
}


