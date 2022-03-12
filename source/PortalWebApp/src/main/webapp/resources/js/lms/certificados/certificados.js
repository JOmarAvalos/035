
newCertificado = function() {

	// Resetea validadores
	$('#formCertificado').parsley().reset();	
	
	// Ajusta titulo de modal
	$('#iptCertificadoTitulo').html('');
	$('#iptCertificadoTitulo').append('Nueva Certificación');
	
	// Quitar renglon de descarga de imagen
	removeElement("certificadoRowDownload");

	// Limpia los campos
	$("#iptCertificadoId").val('');
	$("#iptCertificadoCodigo").val('');
	$("#iptCertificadoNombre").val('');
	$("#iptCertificadoNombreEn").val('');
	$("#iptCertificadoNombreFr").val('');
	$("#iptCertificadoDescripcion").val('');
	$("#iptCertificadoDescripcionEn").val('');
	$("#iptCertificadoDescripcionFr").val('');
	$("#selectCertificadoEstatus").val('');
	$("#selectCertificadoEmpresa").val('');
	$("#selecCertificadoProyecto").val('');
	$("#selectPlanPlantilla").val('');
	$('#selectCertificadoEmpresa').prop("disabled", false);
	$('#selecCertificadoProyecto').prop("disabled", false);
	$("#iptCertificadoVigencia").val('0');
	$('#selectCursoRevalidacionPresencial').prop("disabled", false);
	$('#selectCursoRevalidacionOnline').prop("disabled", false);
	$('#iptCertificadoImagenFile').val('');
	
	// Muestra modal
	$('#modalNewCertificado').modal({backdrop: 'static', keyboard: false});
}

getCertificadoActividades = function (id){
	window.location = ctx+'/lms/certificado?id='+id;
}

saveCertificado = function (obj){

	// Guardar nuevo registro
	var urltxt = ctx + '/lms/saveCertificado';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : false,
		processData : false,
		data : new FormData(document.getElementById("formCertificado")),
		enctype : 'multipart/form-data',
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			$('#modalNewCertificado').modal('hide');
			
			if (response[0]) {
				window.location = ctx + '/lms/certificados';
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


editCertificado = function(id) {
	
	$('#formCertificado').parsley().reset();	
	// Ajusta titulo de modal
	$('#iptCertificadoTitulo').html('');
	$('#iptCertificadoTitulo').append('Actualizar certificado');

	// Limpia los campos
	$("#iptCertificadoId").val('');
	$("#iptCertificadoCodigo").val('');
	$("#iptCertificadoNombre").val('');
	$("#iptCertificadoNombreEn").val('');
	$("#iptCertificadoNombreFr").val('');
	$("#iptCertificadoDescripcion").val('');
	$("#iptCertificadoDescripcionEn").val('');
	$("#iptCertificadoDescripcionFr").val('');
	$("#selectCertificadoEstatus").val('');
	$('#selectCertificadoEmpresa').val('');
	$('#selectCertificadoEmpresa').prop('disabled', 'disabled');
	$('#selecCertificadoProyecto').val('');
	$('#selecCertificadoProyecto').empty();
	$('#selecCertificadoProyecto').prop('disabled', 'disabled');
	$("#selectPlanPlantilla").val('');
	$("#iptCertificadoVigencia").val('0');

	$('#selectCursoRevalidacionPresencial').val('');
	$('#selectCursoRevalidacionPresencial').empty();

	$('#selectCursoRevalidacionOnline').val('');
	$('#selectCursoRevalidacionOnline').empty();
	$('#iptCertificadoImagenFile').val('');

	getCertificado(id);
	
	$('#modalNewCertificado').modal({backdrop: 'static', keyboard: false});
}

getCertificado = function(id) {

	var urltxt = ctx + '/lms/getCertificado?id='+id;
	
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

				$("#iptCertificadoId").val(object.id);
				$("#iptCertificadoCodigo").val(object.codigo);
				$("#iptCertificadoNombre").val(object.nombre);
				$("#iptCertificadoNombreEn").val(object.nombreEn);
				$("#iptCertificadoNombreFr").val(object.nombreFr);
				$("#iptCertificadoDescripcion").val(object.descripcion);
				$("#iptCertificadoDescripcionEn").val(object.descripcionEn);
				$("#iptCertificadoDescripcionFr").val(object.descripcionFr);
				$("#selectCertificadoEstatus").val(object.banActivo);
				$('#selectCertificadoEmpresa').val(object.idEmpresa);	
				$("#selectPlanPlantilla").val(object.idPlantilla);
				
				var object2 = response[2];
				var htmlAddGP = '<option value="' + object2.id + '" >'
						+ object2.nombre + '</option>';
				$("#selecCertificadoProyecto").append(htmlAddGP);			
				
				$("#iptCertificadoVigencia").val(object.vigencia);	

				var htmlAdd3 = '<option value="0" selected="selected">Seleccione...</option>';
				var object3 = response[3];
				for (var j = 0; j < object3.length; j++) {
					var element3 = object3[j];
					if(element3.id == object.idCursoRevalidacionPresencial){
						htmlAdd3 += '<option value="' + element3.id + '" selected>' + element3.nombre + '</option>';
					}else{
						htmlAdd3 += '<option value="' + element3.id + '" >' + element3.nombre + '</option>';
					}
				}
				$('#selectCursoRevalidacionPresencial').append(htmlAdd3);
				
				var htmlAdd4 = '<option value="0" selected="selected">Seleccione...</option>';
				var object4 = response[4];
				for (var k = 0; k < object4.length; k++) {
					var element4 = object4[k];
					if(element4.id == object.idCursoRevalidacionOnline){
						htmlAdd4 += '<option value="' + element4.id + '" selected>' + element4.nombre + '</option>';
					}else{
						htmlAdd4 += '<option value="' + element4.id + '" >' + element4.nombre + '</option>';
					}
				}
				$('#selectCursoRevalidacionOnline').append(htmlAdd4);
				
				if(object.imagen !== null){
					resetElement("certificadoRowDownload");
				} else {
					removeElement("certificadoRowDownload");
				}

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

estatusCertificado= function(id) {
	$("#iptEstatusCertificadoId").val(id);
	$('#modalEstatusCertificado').modal({backdrop: 'static', keyboard: false});
}

estatusCertificadoConfirmacion = function() {

	var id = $('#iptEstatusCertificadoId').val();
	var urltxt = ctx + '/lms/changeEstatusCertificado?id='+id;
	
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
			
			$('#modalEstatusCertificado').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx + '/lms/certificados';
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
orderArribaCertificado = function(id) {

	var urltxt = ctx + '/lms/changeOrdenArribaCertificados?id='+id;
	
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
				window.location = ctx+'/lms/certificados';
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


orderAbajoCertificado = function(id) {

	var urltxt = ctx + '/lms/changeOrdenAbajoCertificados?id='+id;
	
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
				window.location = ctx+'/lms/certificados';
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


getProyectos = function() {
	var empresaSelected = $('#selectCertificadoEmpresa').val();
	$('#selecCertificadoProyecto').html('');

	if (empresaSelected > 0) {
		var urltxt = ctx + "/lms/getSelectsEmpresaC?idEmpresa=" + empresaSelected;
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
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					var object = response[1];
					for (var i = 0; i < object.length; i++) {
						var element = object[i];
						htmlAdd += '<option value="' + element.id + '" >' + element.nombre + '</option>';
					}
					$('#selecCertificadoProyecto').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecCertificadoProyecto').append(htmlAdd);
				}
			},
			error : function(msg) {
				alert('Error');
			}
		});
	} else {
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecCertificadoProyecto').append(htmlAdd);
	}
}


getProyectosAndCursos = function() {
	var empresaSelected = $('#selectCertificadoEmpresa').val();
	$('#selecCertificadoProyecto').html('');
	$('#selectCursoRevalidacionPresencial').html('');
	$('#selectCursoRevalidacionOnline').html('');

	if (empresaSelected > 0) {
		var urltxt = ctx + "/lms/getSelectsEmpresaC?idEmpresa=" + empresaSelected;
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
					
					
					var htmlAdd1 = '<option value="0" selected="selected">Seleccione...</option>';
					var object = response[1];
					for (var i = 0; i < object.length; i++) {
						var element = object[i];
						htmlAdd1 += '<option value="' + element.id + '" >' + element.nombre + '</option>';
					}
					$('#selecCertificadoProyecto').append(htmlAdd1);
					
					
					var htmlAdd2 = '<option value="0" selected="selected">Seleccione...</option>';
					var object2 = response[2];
					for (var j = 0; j < object2.length; j++) {
						var element2 = object2[j];
						htmlAdd2 += '<option value="' + element2.id + '" >' + element2.nombre + '</option>';
					}
					$('#selectCursoRevalidacionPresencial').append(htmlAdd2);
					
					
					var htmlAdd3 = '<option value="0" selected="selected">Seleccione...</option>';
					var object3 = response[3];
					for (var k = 0; k < object3.length; k++) {
						var element3 = object3[k];
						htmlAdd3 += '<option value="' + element3.id + '" >' + element3.nombre + '</option>';
					}
					$('#selectCursoRevalidacionOnline').append(htmlAdd3);
					
					
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecCertificadoProyecto').append(htmlAdd);
					$('#selectCursoRevalidacionPresencial').append(htmlAdd);
					$('#selectCursoRevalidacionOnline').append(htmlAdd);
				}
			},
			error : function(msg) {
				alert('Error');
			}
		});
	} else {
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecCertificadoProyecto').append(htmlAdd);
		$('#selectCursoRevalidacionPresencial').append(htmlAdd);
		$('#selectCursoRevalidacionOnline').append(htmlAdd);
	}
}


function descargarCatCertificados() {
	window.open(ctx + '/catalogo/descargarCertificados');
}

function resetElement(id) {
	document.getElementById(id).style.display = "block";
	document.getElementById(id).style.visibility = "visible";
}

function removeElement(id) {
	document.getElementById(id).style.display = "none";
}

function downloadFile(idData) {
	window.open(ctx + '/lms/downloadFileCertificado?fileId=' + idData);
}
