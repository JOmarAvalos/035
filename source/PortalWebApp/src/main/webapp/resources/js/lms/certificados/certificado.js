
agregarCurso = function(idCertificado) {
	$('#listCursos').html('');
	$('#listCursos').append('');
	var urltxt = ctx + '/lms/certificado/getCursos?id=' + idCertificado;
	$('#listCursos').append('');
	$
			.ajax({
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
					var html = '';
					var cabecera='';
					var cuerpo='';
					
					
					if (response[0]) {

						var lstCurso = response[1];
					

						cabecera='<table id="example2" >'
							+'<thead><tr><th></th></tr></thead><tbody>';						
						for (var i = 0; i < lstCurso.length; i++) {
							var nombre = lstCurso[i].nombre;
							var id = lstCurso[i].id;

							cuerpo += '<tr><td><input type="checkbox"  value="'+id+'" id="' + id
							+ '" /> <label >' + nombre + '</label></td></tr>';

						}
						html =cabecera+cuerpo+'</tbody></table>';
						$('#listCursos').append(html);
						$("#iptCertificadoId").val(idCertificado);
						
						$('#example2').dataTable({
							"bRetrieve": true,
							"bDestroy": true,
				            "bPaginate": false,
				            "bLengthChange": false,
				            "bFilter": true,
				            "bSort": false,
				            "bInfo": false,
				            "language": {
				                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
				            }
				        });
						
						$('#modalAgregarCurso').modal({
							backdrop : 'static',
							keyboard : false
						});
							// agregar parametros de la lista con datos

					}
				},
				error : function(msg) {
					alert('Error alert');
				}
			});
}

agregarConfirmacion = function(){
	var listCertificadoCursoVO = [];
	var idCertificado = $('#iptCertificadoId').val();
	$("input[type=checkbox]:checked").each(function(){
		var certificadoCursoVO = new Object;
		certificadoCursoVO.idCertificado = idCertificado;
		certificadoCursoVO.idCurso = Number($(this).val());
		certificadoCursoVO.banActivo = 1;
		listCertificadoCursoVO.push(certificadoCursoVO);
    });

	urltxt = ctx + '/lms/certificado/saveListCertCurso';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(listCertificadoCursoVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			$('#modalNewCurso').modal('hide');
			
			if (response[0]) {
				window.location = ctx + '/lms/certificado?id=' + idCertificado;
				
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
editCertificadoCurso = function(id) {
	
	// Limpia los campos
	$("#iptCertificadoCursoId").val('');
	$("#iptCertificadoCursoCodigo").val('');
	$("#iptCertificadoCursNombre").val('');
	$("#iptCertificadoCursDescripcion").val('');
	$("#selectCertificadoCursEstatus").val('');
	
	
	getCertificadoCurso(id);
	
	
	$('#modalEditarCertificadoCurso').modal({backdrop: 'static', keyboard: false});
}

getCertificadoCurso = function(id) {
	
	var urltxt = ctx + '/lms/certificado/getCertificadoCurso?id='+id;
	
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

				$("#iptCertificadoCursoId").val(object.id);
				$("#iptCertificadoId").val(object.idCertificado);
				$("#selectCertificadoCursEstatus").val(object.banActivo);
								
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


saveCertificadoCurso = function() {
	var idCertificado=$("#iptCertificadoId").val();
	var CertificadoCursoVO = new Object;
	
	if ($.trim($("#iptCertificadoCursoId").val()) != ''){
	CertificadoCursoVO.id = $('#iptCertificadoCursoId').val();
	}
    CertificadoCursoVO.banActivo = $('#selectCertificadoCursEstatus').val();

	
	var urltxt = ctx + '/lms/certificado/saveCertCurso';
	
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(CertificadoCursoVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			$('#modalNewCurso').modal('hide');
			
			if (response[0]) {
				window.location = ctx + '/lms/certificado?id=' + idCertificado;
				
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

estatusCertificadoCurso = function(id,idCertificado) {
	$("#iptEstatusCertificadoCursoId").val(id);
	$("#iptCertificadoId").val(idCertificado);
	$('#modalEstatusCertificadoCurso').modal({backdrop: 'static', keyboard: false});
}

estatusCertificadoCursoConfirmacion = function() {
	var idCertificado = $('#iptCertificadoId').val();
	var id = $('#iptEstatusCertificadoCursoId').val();
	var urltxt = ctx + '/lms/certificado/changeEstatusCertificadoCurso?id='+id;
	
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
			
			$('#modalEstatusCertificadoCurso').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx + '/lms/certificado?id=' + idCertificado;
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
orderArribaCertificadoCurso = function(id,idCertificado) {

	var urltxt = ctx + '/lms/certificado/changeOrdenArribaCertificadoCurso?id='+id+'&idCertificado='+idCertificado;

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

				window.location = ctx + '/lms/certificado?id=' + idCertificado;
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Error');
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
}

orderAbajoCertificadoCurso = function(id,idCertificado) {

	var urltxt = ctx + '/lms/certificado/changeOrdenAbajoCertificadoCurso?id='+id+'&idCertificado='+idCertificado;

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
				window.location = ctx + '/lms/certificado?id=' + idCertificado;
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Error');
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
}
inscripcionCertificaCurso = function(id) {
	
	// Resetea validadores
	$('#formInscripcionCertificaCurso').parsley().reset();

	// Limpia los campos
	$("#iptCertificadoId").val('');
	$("#iptInscrpcionCertificadoCursoId").val('');
	$("#iptNoCursosOnlineCertificadoCurso").val('');
	$("#iptNoCursosPresencialesCertificadoCurso").val('');
	$("#selectCurso").val('');
	getInscripcion(id);
	

	$('#modalInscripcionCertificaCurso').modal({backdrop: 'static', keyboard: false});
}
getInscripcion = function(id) {
	
	var urltxt = ctx + '/lms/certificado/getCertificadoCurso?id='+id;
	
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

				$("#iptCertificadoId").val(object.idCertificado);
				$("#iptInscrpcionCertificadoCursoId").val(object.id);
				if(object.inscripcionCursosOnline !=null ){
					$("#iptNoCursosOnlineCertificadoCurso").val(object.inscripcionCursosOnline);
					
				}
				if( object.inscripcionCursosPresencial !=null){

					$("#iptNoCursosPresencialesCertificadoCurso").val(object.inscripcionCursosPresencial);	
				}
				if( object.inscripcionIdCursoAnterior !=null){

					$("#selectCurso").val(object.inscripcionIdCursoAnterior);	
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
saveInscripcionCertificaCurso = function (){
	var idCertificado =$('#iptCertificadoId').val();
	var certificadoCursoVO = new Object;
	
	certificadoCursoVO.id = $('#iptInscrpcionCertificadoCursoId').val();
	certificadoCursoVO.idCertificado = idCertificado;
	certificadoCursoVO.inscripcionCursosOnline = $('#iptNoCursosOnlineCertificadoCurso').val();
	certificadoCursoVO.inscripcionCursosPresencial  = $('#iptNoCursosPresencialesCertificadoCurso').val();
	certificadoCursoVO.inscripcionIdCursoAnterior =$('#selectCurso').val();
	
	// Guardar nuevo registro
	var urltxt = ctx + '/lms/certificado/saveCertCurso';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(certificadoCursoVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			$('#modalInscripcionCertificaCurso').modal('hide');
			
			if (response[0]) {
				window.location = ctx + '/lms/certificado?id=' + idCertificado;
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
finalizacionCertificaCurso = function(id) {
	
	// Resetea validadores
	$('#formFinalizacionCertificaCurso').parsley().reset();

	// Limpia los campos
	$("#iptCertificadoId").val('');
	$("#iptFinalizacionCertificadoCursoId").val('');
	$("#iptCalifAprovCertificadoCurso").val('');
	    
	getFinalizacion(id);
	

	$('#modalFinalizacionCertificaCurso').modal({backdrop: 'static', keyboard: false});
}
getFinalizacion = function(id) {
	
	var urltxt = ctx + '/lms/certificado/getCertificadoCurso?id='+id;
	
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

				$("#iptCertificadoId").val(object.idCertificado);
				$("#iptFinalizacionCertificadoCursoId").val(object.id);

				if( object.finalizacionCalificacionMinima !=null){

					$("#iptCalifAprovCertificadoCurso").val(object.finalizacionCalificacionMinima);	
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

saveFinalizacionCertificaCurso = function (){
	var idCertificado =$('#iptCertificadoId').val();
	var certificadoCursoVO = new Object;
	
	certificadoCursoVO.id = $('#iptFinalizacionCertificadoCursoId').val();
	certificadoCursoVO.idCertificado = idCertificado;
	certificadoCursoVO.finalizacionCalificacionMinima = $('#iptCalifAprovCertificadoCurso').val();
		
	// Guardar nuevo registro
	var urltxt = ctx + '/lms/certificado/saveCertCurso';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(certificadoCursoVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			$('#modalFinalizacionCertificaCurso').modal('hide');
			
			if (response[0]) {
				window.location = ctx + '/lms/certificado?id=' + idCertificado;
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

configuraCertificadoCurso = function(idCertificadoCurso){

	var urltxt = ctx + '/lms/getConfTallas?idCertificadoCurso='+idCertificadoCurso;
	$('#tbodyCertificadoCursoTalla').html('');
	
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
				var htmlAddTallas = '';
				var tallas = response[1];
				for (var i = 0; i < tallas.length; i++) {
					var element = tallas[i];
					htmlAddTallas += '<tr><td>'+element.clave+'</td><td><input onkeypress="return isNumberKey(event)" type="text" class="form-control" value="'+element.certificadoCursoTalla.funcionariosMinimo+'" id="iptFuncionariosMin'+element.certificadoCursoTalla.id+'" placeholder="Funcionarios m&iacute;nimos" onchange="showBtnModificaCertificadoCursoTalla('+element.certificadoCursoTalla.id+')"></td><td><input type="text" class="form-control" value="'+element.certificadoCursoTalla.funcionariosMinimoPorcentaje+'" id="iptPorcFuncMin'+element.certificadoCursoTalla.id+'" placeholder="Porcentaje de funcionarios m&iacute;nimos" onkeypress="return isNumberKey(event)" onchange="showBtnModificaCertificadoCursoTalla('+element.certificadoCursoTalla.id+')"></td> <td><button type="button" class="btn" onclick="updateConfTallaCurso('+element.certificadoCursoTalla.id+');" id="btnUpdateCertificadoTallaCurso'+element.certificadoCursoTalla.id+'" style="display:none">Actualizar</button></td></tr>';
				}
				
				$('#tbodyCertificadoCursoTalla').append(htmlAddTallas);
				
				$('#tblCertificadoCursoTalla').dataTable({
					"bRetrieve": true,
					"bDestroy": true,
		            "bPaginate": false,
		            "bLengthChange": false,
		            "bFilter": false,
		            "bSort": false,
		            "bInfo": false,
		            "language": {
		                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
		            }
		        });
		        
		        $('#modalConfigCertificadoCursoTalla').modal({backdrop: 'static', keyboard: false});
				
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
	
}


showBtnModificaCertificadoCursoTalla = function(idCertCurTalla){
	$('#btnUpdateCertificadoTallaCurso'+idCertCurTalla).show();
}

updateConfTallaCurso = function(idCertCurTalla){
	
	cctValid = true;

	if (!notNull($('#iptFuncionariosMin'+idCertCurTalla))) {
		cctValid = false;
	}
	
	if (!notNull($('#iptPorcFuncMin'+idCertCurTalla))) {
		cctValid = false;
	}
	
	if(cctValid){
		
		funcionariosMin = $('#iptFuncionariosMin'+idCertCurTalla).val();
		funcionariosMinPorc = $('#iptPorcFuncMin'+idCertCurTalla).val();
	
		var urltxt = ctx + '/lms/updateConfTalla?param1='+idCertCurTalla+'&param2='+funcionariosMin+'&param3='+funcionariosMinPorc;
		
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
					$('#modalExitoCCT').modal({backdrop: 'static', keyboard: false});
				} else {
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

revalidaciónCertificaCurso = function(id, idCurso) {
	
	// Resetea validadores
	$('#formCertificaCursoRevaliida').parsley().reset();

	// Limpia los campos
	$("#iptIdCertificadoCursoRev").val(id);
	$("#selectCursoRevalidacion").val(idCurso);
	

	$('#modalCursoRevalida').modal({backdrop: 'static', keyboard: false});
}

saveCursoRevalida = function (){
	var idCertificado =$('#iptIdCertificadoCursoRev').val();
	var certificadoCursoVO = new Object;
	
	certificadoCursoVO.id = idCertificado;
	certificadoCursoVO.idCursoRevalidacion = $('#selectCursoRevalidacion').val();
		
	// Guardar nuevo registro
	var urltxt = ctx + '/lms/certificado/saveCertCurso';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(certificadoCursoVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
			
			$('#modalCursoRevalida').modal('hide');
			
			if (response[0]) {
				window.location = ctx + '/lms/certificado?id=' + idCertificado;
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