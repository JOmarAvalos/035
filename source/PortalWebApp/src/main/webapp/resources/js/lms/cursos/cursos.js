
newCurso = function() {
	
	// Resetea validadores
	$('#formCurso').parsley().reset();
	
	// Ajusta titulo de modal
	$('#iptCursoTitulo').html('');
	$('#iptCursoTitulo').append('Nuevo curso');
	
	// Quitar renglon de descarga de imagen
	removeElement("cursoRowDownload");

	// Limpia los campos
	$("#iptCursoId").val('');
	$("#iptCursoClave").val('');
	$("#iptCursoNombre").val('');
	$("#iptCursoNombreEn").val('');
	$("#iptCursoNombreFr").val('');
	$("#iptCursoDescripcion").val('');
	$("#iptCursoDescripcionEn").val('');
	$("#iptCursoDescripcionFr").val('');
	$("#selectCursoIdioma").val('');
	$("#selectCursoTipo").val('');
	$("#selectCursoEmpresa").val('');
	$("#selectCursoEstatus").val('');
	$("#iptCursoCodigoPlanta").val('');
	$("#selectPlanPlantilla").val('');
	$('#iptCursoImagenFile').val('');
	
	$("input[id=iptCursoCalificacion]").removeAttr('checked').iCheck('update');
	$('#iptCursoCalificacionPorcentaje').prop('disabled', true);
	$('#iptCursoCalificacionPorcentaje').prop('value', '0');

	// Muestra modal
	$('#modalNewCurso').modal({backdrop: 'static', keyboard: false});
}


editCurso = function(id) {
	
	// Resetea validadores
	$('#formCurso').parsley().reset();
	
	// Ajusta titulo de modal
	$('#iptCursoTitulo').html('');
	$('#iptCursoTitulo').append('Actualizar curso');
	
	// Limpia los campos
	$("#iptCursoId").val('');
	$("#iptCursoClave").val('');
	$("#iptCursoNombre").val('');
	$("#iptCursoNombreEn").val('');
	$("#iptCursoNombreFr").val('');
	$("#iptCursoDescripcion").val('');
	$("#iptCursoDescripcionEn").val('');
	$("#iptCursoDescripcionFr").val('');
	$("#selectCursoIdioma").val('');
	$("#selectCursoTipo").val('');
	$("#selectCursoEmpresa").val('');
	$("#selectCursoEstatus").val('');
	$("#iptCursoCodigoPlanta").val('');
	$("#selectPlanPlantilla").val('');
	$('#iptCursoImagenFile').val('');
	
	$('#selectCursoRevalida').val('');
	$('#iptVigencia').val('');
	
	$('#divRevalida').hide();
	
	$("input[id=iptCursoCalificacion]").removeAttr('checked').iCheck('update');
	$('#iptCursoCalificacionPorcentaje').prop('disabled', true);
	$('#iptCursoCalificacionPorcentaje').prop('value', '0');
	
	// Obtiene los datos
	getCurso(id);
	
	// Muestra modal
	$('#modalNewCurso').modal({backdrop: 'static', keyboard: false});
}


getCurso = function(id) {
	
	var urltxt = ctx + '/lms/getCurso?id='+id;
	
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

				$("#iptCursoId").val(object.id);
				$("#iptCursoClave").val(object.codigo);
				$("#iptCursoNombre").val(object.nombre);
				$("#iptCursoNombreEn").val(object.nombreEn);
				$("#iptCursoNombreFr").val(object.nombreFr);
				$("#iptCursoDescripcion").val(object.descripcion);
				$("#iptCursoDescripcionEn").val(object.descripcionEn);
				$("#iptCursoDescripcionFr").val(object.descripcionFr);
				$("#selectCursoIdioma").val(object.idIdioma);
				$("#selectCursoTipo").val(object.idTipoCurso);
				$("#selectCursoEmpresa").val(object.idEmpresa);
				$("#selectCursoEstatus").val(object.banActivo);
				$("#iptCursoCodigoPlanta").val(object.codigoPlanta);
				$("#selectPlanPlantilla").val(object.idPlantilla);
				$("#iptCursoHoras").val(object.minutos);
				$("#iptCursoDias").val(object.dias);
				$('#iptVigencia').val(object.vigencia);
				
				
				if(object.calificacionMinima == true){
					$('#iptCursoCalificacion').prop('checked', true);
					$('#iptCursoCalificacion').iCheck('update');
					$('#iptCursoCalificacionPorcentaje').prop('disabled', false);
					$('#iptCursoCalificacionPorcentaje').val(object.calificacionMinimaPorcentaje);
				}else{
					$("input[id=iptCursoCalificacion]").removeAttr('checked').iCheck('update');
					$('#iptCursoCalificacionPorcentaje').prop('disabled', true);
					$('#iptCursoCalificacionPorcentaje').prop('value', '0');
				}
				
				if(object.imagen !== null){
					resetElement("cursoRowDownload");
				} else {
					removeElement("cursoRowDownload");
				}
				
				if(object.idTipoCurso == 1 || object.idTipoCurso == 2 || object.idTipoCurso == 3){
					var cursosR = response[2];
					$('#selectCursoRevalida').html('');
					var htmlAddCursosR = '<option value="">Seleccione...</option>';
					
					for (var i = 0; i < cursosR.length; i++) {
						var element = cursosR[i];
						htmlAddCursosR += '<option value="'+element.id+'">'+element.nombre+'</option>';
					}
					
					$('#selectCursoRevalida').append(htmlAddCursosR);
					
					$('#selectCursoRevalida').val(object.idCursoRevalidacion);
					
					$('#divRevalida').show();
					
					
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


saveCurso = function(obj) {

	// Guardar nuevo registro
	var urltxt = ctx + '/lms/saveCurso';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : false,
		processData : false,
		data : new FormData(document.getElementById("formCurso")),
		enctype : 'multipart/form-data',
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			$('#modalNewCurso').modal('hide');
			
			if (response[0]) {
				window.location = ctx + '/lms/cursos';
				
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


getCursoActividades = function (id){
	window.location = ctx+'/lms/curso?id='+id;
}


estatusCurso = function(id) {
	$("#iptEstatusCursoId").val(id);
	$('#modalEstatusCurso').modal({backdrop: 'static', keyboard: false});
}


estatusCursoConfirmacion = function() {
	
	var id = $('#iptEstatusCursoId').val();
	var urltxt = ctx + '/lms/changeEstatusCurso?id='+id;
	
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
			
			$('#modalEstatusCurso').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx+'/lms/cursos';
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


orderArribaCurso = function(id) {

	var urltxt = ctx + '/lms/changeOrdenArribaCurso?id='+id;
	
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
				window.location = ctx+'/lms/cursos';
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


orderAbajoCurso = function(id) {

	var urltxt = ctx + '/lms/changeOrdenAbajoCurso?id='+id;
	
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
				window.location = ctx+'/lms/cursos';
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

function descargarCatCursos() {
	window.open(ctx + '/catalogo/descargarCursos');
}


$(document).ready(function() {
	
	// Curso - Activa input
	$('#iptCursoCalificacion').on('ifChecked', function(event){
		$('#iptCursoCalificacionPorcentaje').prop('disabled', false);
	});
	// Curso - Inactiva input
	$('#iptCursoCalificacion').on('ifUnchecked', function(event){
		$('#iptCursoCalificacionPorcentaje').prop('disabled', true);
		$('#iptCursoCalificacionPorcentaje').prop('value', '0');
	});
	
});


function resetElement(id) {
	document.getElementById(id).style.display = "block";
	document.getElementById(id).style.visibility = "visible";
}

function removeElement(id) {
	document.getElementById(id).style.display = "none";
}

function downloadFile(idData) {
	window.open(ctx + '/lms/downloadFile?fileId=' + idData);
}






