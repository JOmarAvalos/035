//Acciones de catalogo de empresas
newEmpresa = function() {
	$('#btnSaveEmpresa').show();
	$('#iptIdEmpresa').val('');
	$('#iptClaveEmpresa').val('');
	$('#iptNombreEmpresa').val('');
	$('#iptContactoEmpresa').val('');
	$('#selectEmpresaLider').val('0');
	$('#iptCheckEmpresaActivo').prop('checked', true);
	$('#iptCheckEmpresaActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	$(".my-colorpicker1").colorpicker('destroy');
	$(".my-colorpicker2").colorpicker('destroy');
	$(".my-colorpicker1").colorpicker({"color": "#000000"});
	$(".my-colorpicker2").colorpicker({"color": "#ffffff"});
	$(".my-colorpicker3").colorpicker('destroy');
	$(".my-colorpicker4").colorpicker('destroy');
	$(".my-colorpicker3").colorpicker({"color": "#000000"});
	$(".my-colorpicker4").colorpicker({"color": "#ffffff"});
	$('#iptColorPrimario').val('#000000');
	$('#iptColorSecundario').val('#ffffff');
	$('#iptColorSecContraste').val('#000000');
	$('#iptColorTexto').val('#ffffff');
	
	
	
	eliminaMarcaRojo($("#iptClaveEmpresa"));
	eliminaMarcaRojo($("#iptNombreEmpresa"));
	
	$('#modalNewEmpresa').modal({backdrop: 'static', keyboard: false});
}

getEmpresa = function(idEmpresa){
	var urltxt = ctx + '/catalogo/getEmpresa?idEmpresa='+idEmpresa;
	$('#btnSaveEmpresa').show();
	eliminaMarcaRojo($("#iptClaveEmpresa"));
	eliminaMarcaRojo($("#iptNombreEmpresa"));
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
				
				var empresaInfo =  response[1];
				$('#iptIdEmpresa').val(empresaInfo.id);
				$('#iptClaveEmpresa').val(empresaInfo.clave);
				$('#iptNombreEmpresa').val(empresaInfo.nombre);
				if(empresaInfo.idEmpresaLider != null && empresaInfo.idEmpresaLider > 0){
					$('#selectEmpresaLider').val(empresaInfo.idEmpresaLider);
				}
				if(empresaInfo.banActivo == 1){
					$('#iptCheckEmpresaActivo').prop('checked', true);
					$('#iptCheckEmpresaActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal checked'
					});
				}else{
					$('#iptCheckEmpresaActivo').prop('checked', false);
					$('#iptCheckEmpresaActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal'
					});
				}
				if(empresaInfo.colorPrimario == null){
					$(".my-colorpicker1").colorpicker('destroy');
					$(".my-colorpicker1").colorpicker({"color": "#000000"});
					$('#iptColorPrimario').val('#000000');
					
				}else{
					$(".my-colorpicker1").colorpicker('destroy');
					$(".my-colorpicker1").colorpicker({"color": "'"+empresaInfo.colorPrimario+"'"});
					$('#iptColorPrimario').val(empresaInfo.colorPrimario);
				}
				if(empresaInfo.colorSecundario == null){
					$(".my-colorpicker2").colorpicker('destroy');
					$(".my-colorpicker2").colorpicker({"color": "#ffffff"});
					$('#iptColorSecundario').val('#ffffff');
				}else{
					$(".my-colorpicker2").colorpicker('destroy');
					$(".my-colorpicker2").colorpicker({"color": "'"+empresaInfo.colorSecundario+"'"});
					$('#iptColorSecundario').val(empresaInfo.colorSecundario);
				}
				
				if(empresaInfo.colorSecundarioAlt == null){
					$(".my-colorpicker3").colorpicker('destroy');
					$(".my-colorpicker3").colorpicker({"color": "#ffffff"});
					$('#iptColorSecContraste').val('#ffffff');
				}else{
					$(".my-colorpicker3").colorpicker('destroy');
					$(".my-colorpicker3").colorpicker({"color": "'"+empresaInfo.colorSecundarioAlt+"'"});
					$('#iptColorSecContraste').val(empresaInfo.colorSecundarioAlt);
				}
				
				if(empresaInfo.colorTexto == null){
					$(".my-colorpicker4").colorpicker('destroy');
					$(".my-colorpicker4").colorpicker({"color": "#ffffff"});
					$('#iptColorTexto').val('#ffffff');
				}else{
					$(".my-colorpicker4").colorpicker('destroy');
					$(".my-colorpicker4").colorpicker({"color": "'"+empresaInfo.colorTexto+"'"});
					$('#iptColorTexto').val(empresaInfo.colorTexto);
				}
				
				$('#iptContactoEmpresa').val(empresaInfo.contacto);
				
				$('#modalNewEmpresa').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

getEmpresaByCve = function(){
	
	var cveEmpresa = $('#iptClaveEmpresa').val().toUpperCase();
	
	var urltxt = ctx + '/catalogo/getEmpresaByCVE?cveEmpresa='+cveEmpresa;
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
				$('#btnSaveEmpresa').show();
			}else{
				$('#btnSaveEmpresa').hide();
				$('#modalEmpresaDuplicada').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

saveEmpresa = function() {

	empresaValid = true;

	if (!notNull($("#iptClaveEmpresa"))) {
		empresaValid = false;
	}

	if (!notNull($("#iptNombreEmpresa"))) {
		empresaValid = false;
	}

	if (empresaValid) {

		var empresa = new Object;

		empresa.id = $('#iptIdEmpresa').val();
		empresa.clave = $('#iptClaveEmpresa').val().toUpperCase();
		empresa.nombre = $('#iptNombreEmpresa').val();
		empresa.colorPrimario = $('#iptColorPrimario').val();
		empresa.colorSecundario = $('#iptColorSecundario').val();
		empresa.colorSecundarioAlt = $('#iptColorSecContraste').val();
		empresa.colorTexto = $('#iptColorTexto').val();
		empresa.contacto = $('#iptContactoEmpresa').val();
		if ($("#iptCheckEmpresaActivo").prop('checked')) {
			empresa.banActivo = 1;
		} else {
			empresa.banActivo = 0;
		}

		if ($('#selectEmpresaLider').val() > 0) {
			empresa.idEmpresaLider = $('#selectEmpresaLider').val();
		}

		var urltxt = ctx + '/catalogo/saveEmpresa';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(empresa),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/empresa';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}

}

orderArribaEmpresa = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenArribaEmpresa?id='+id;
	
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
				window.location = ctx+'/catalogo/empresa';
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


orderAbajoEmpresa = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenAbajoEmpresa?id='+id;
	
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
				window.location = ctx+'/catalogo/empresa';
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

// Grupo Puesto Acciones

newGrupoPuesto = function() {
	$('#iptIdGrupoPuesto').val('');
	$('#iptClaveGrupoPuesto').val('');
	$('#iptDescripcionGrupoPuesto').val('');
	$('#iptDescripcionGrupoPuestoEn').val('');
	$('#iptDescripcionGrupoPuestoFr').val('');
	$('#selectEmpresaGrupoP').val(0);
	$('#selectEmpresaGrupoP').attr('disabled',false);
	$('#iptClaveGrupoPuesto').attr('disabled',true);
	$('#iptCheckGrupoPuestoActivo').prop('checked', true);
	$('#btnSaveGrupoPuesto').show();
	$('#iptCheckGrupoPuestoActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	
	eliminaMarcaRojo($("#iptClaveGrupoPuesto"));
	eliminaMarcaRojo($("#iptDescripcionGrupoPuesto"));
	eliminaMarcaRojo($("#selectEmpresaGrupoP"));
	
	$('#modalNewGrupoPuesto').modal({backdrop: 'static', keyboard: false});
}

updateGrupoPuesto = function(id, idEmpresa, clave, descripcion, activo, funcionarios) {
	$('#iptIdGrupoPuesto').val(id);
	$('#iptClaveGrupoPuesto').val(clave);
	$('#iptDescripcionGrupoPuesto').val(descripcion);
	$('#selectEmpresaGrupoP').val(idEmpresa);
	$('#selectEmpresaGrupoP').attr('disabled',true);
	$('#iptClaveGrupoPuesto').attr('disabled',false);
	if(activo == 1){
		$('#iptCheckGrupoPuestoActivo').prop('checked', true);
		$('#iptCheckGrupoPuestoActivo').iCheck({
	        checkboxClass: 'icheckbox_minimal checked'
		});
	}else{
		$('#iptCheckGrupoPuestoActivo').prop('checked', false);
		$('#iptCheckGrupoPuestoActivo').iCheck({
	        checkboxClass: 'icheckbox_minimal'
		});
	}
	
//	if(activo == 1 && funcionarios > 0){
//	    $('#iptCheckGrupoPuestoActivo').on('ifClicked', function(event){
//	    	$('#h1WarnDealers').html('');
//	    	$('#h1WarnDealers').append('El grupo no se puede desactivar porque tiene '+funcionarios+' funcionarios activos.');
//	    	$('#modalNumeroFuncionarios').modal({backdrop: 'static', keyboard: false});
//	    	
//		});
//	}
	
	eliminaMarcaRojo($("#iptClaveGrupoPuesto"));
	eliminaMarcaRojo($("#iptDescripcionGrupoPuesto"));
	eliminaMarcaRojo($("#selectEmpresaGrupoP"));
	$('#modalNewGrupoPuesto').modal({backdrop: 'static', keyboard: false});
}

activaCkeckGrupoPuesto = function(){
	$('#iptCheckGrupoPuestoActivo').prop('checked', true);
	$('#iptCheckGrupoPuestoActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptCheckGrupoPuestoActivo').on('ifClicked', function(event){
    	$('#modalNumeroFuncionarios').modal({backdrop: 'static', keyboard: false});
    	
	});
}


saveGrupoPuesto = function() {

	grupoPuestoValid = true;

	if (!notNull($("#iptClaveGrupoPuesto"))) {
		grupoPuestoValid = false;
	}

	if (!notNull($("#iptDescripcionGrupoPuesto"))) {
		grupoPuestoValid = false;
	}
	
	if ($('#selectEmpresaGrupoP').val() <= 0) {
		grupoPuestoValid = false;
		marcaRojo($("#selectEmpresaGrupoP"));
	}else{
		eliminaMarcaRojo($("#selectEmpresaGrupoP"));
	}
	

	if (grupoPuestoValid) {

		var grupoPuesto = new Object;

		grupoPuesto.id = $('#iptIdGrupoPuesto').val();
		grupoPuesto.clave = $('#iptClaveGrupoPuesto').val();
		grupoPuesto.descripcion = $('#iptDescripcionGrupoPuesto').val();
		grupoPuesto.descripcionEn = $('#iptDescripcionGrupoPuestoEn').val();
		grupoPuesto.descripcionFr = $('#iptDescripcionGrupoPuestoFr').val();
		grupoPuesto.idEmpresa = $('#selectEmpresaGrupoP').val();
		
		if ($("#iptCheckGrupoPuestoActivo").prop('checked')) {
			grupoPuesto.banActivo = 1;
		} else {
			grupoPuesto.banActivo = 0;
		}

		var urltxt = ctx + '/catalogo/saveGrupoPuesto';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(grupoPuesto),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/GrupoPuesto';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}

}

orderArribaGrupoPuesto = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenArribaGrupoPuesto?id='+id;
	
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
				window.location = ctx+'/catalogo/GrupoPuesto';
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

orderAbajoGrupoPuesto = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenAbajoGrupoPuesto?id='+id;
	
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
				window.location = ctx+'/catalogo/GrupoPuesto';
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

getGrupoPuesto = function(idGrupoPuesto){

	$('#selectEmpresaGrupoP').attr('disabled',true);
	$('#iptClaveGrupoPuesto').attr('disabled',false);
	
	eliminaMarcaRojo($("#iptClaveGrupoPuesto"));
	eliminaMarcaRojo($("#iptDescripcionGrupoPuesto"));
	eliminaMarcaRojo($("#iptDescripcionGrupoPuestoEn"));
	eliminaMarcaRojo($("#iptDescripcionGrupoPuestoFr"));
	
	$('#btnSaveGrupoPuesto').show();

	var urltxt = ctx + '/catalogo/getGrupoPuesto?idGrupoPuesto='+idGrupoPuesto;
	
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
				
				var grupoPuestoInfo =  response[1];
				
				$('#iptIdGrupoPuesto').val(grupoPuestoInfo.id);
				$('#selectEmpresaGrupoP').val(grupoPuestoInfo.idEmpresa);
				$('#iptClaveGrupoPuesto').val(grupoPuestoInfo.clave);
				$('#iptDescripcionGrupoPuesto').val(grupoPuestoInfo.descripcion);
				$('#iptDescripcionGrupoPuestoEn').val(grupoPuestoInfo.descripcionEn);
				$('#iptDescripcionGrupoPuestoFr').val(grupoPuestoInfo.descripcionFr);
				
				if(grupoPuestoInfo.banActivo == 1){
					$('#iptCheckGrupoPuestoActivo').prop('checked', true);
					$('#iptCheckGrupoPuestoActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal checked'
					});
				}else{
					$('#iptCheckGrupoPuestoActivo').prop('checked', false);
					$('#iptCheckGrupoPuestoActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal'
					});
				}
				
				$('#modalNewGrupoPuesto').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

//Acciones Calificaciones Metodo
newCalificacionMetodo = function() {
	$('#iptDescripcionCalificacionMetodo').val('');
	$('#iptCheckCalificacionMetodoActivo').prop('checked', false);
	$('#modalNewCalificacionMetodo').modal({backdrop: 'static', keyboard: false});
}

saveCalificacionMetodo = function() {

	calificacionMetodoValid = true;

	if (!notNull($("#iptDescripcionCalificacionMetodo"))) {
		calificacionMetodoValid = false;
	}

	if (calificacionMetodoValid) {

		var calificacionMetodo = new Object;
		
		calificacionMetodo.descripcion = $('#iptDescripcionCalificacionMetodo').val();
		if ($("#iptCheckCalificacionMetodoActivo").prop('checked')) {
			calificacionMetodo.banActivo = 1;
		} else {
			calificacionMetodo.banActivo = 0;
		}

		var urltxt = ctx + '/catalogo/saveCalificacionMetodo';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(calificacionMetodo),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/CalificacionMetodo';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}
//Acciones de catalogo Idioma
newIdioma = function() {
	$('#iptIdioma').val('');
	$('#iptCodioIsoIdioma').val('');
	$('#iptCheckIdiomaActivo').prop('checked', true);
	$('#iptCheckIdiomaActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	eliminaMarcaRojo($("#iptIdioma"));
	eliminaMarcaRojo($("#iptCodioIsoIdioma"));
	$('#modalNewIdioma').modal({backdrop: 'static', keyboard: false});
}

editIdioma = function(id, codigo, activo, idioma) {
	$('#iptIdIdioma').val(id);
	$('#iptIdioma').val(idioma);
	$('#iptCodioIsoIdioma').val(codigo);
	
	if(activo = 1){
		$('#iptCheckIdiomaActivo').prop('checked', true);
		$('#iptCheckIdiomaActivo').iCheck({
	        checkboxClass: 'icheckbox_minimal checked'
		});
	}else{
		$('#iptCheckIdiomaActivo').prop('checked', false);
		$('#iptCheckIdiomaActivo').iCheck({
	        checkboxClass: 'icheckbox_minimal'
		});
	}
	
	eliminaMarcaRojo($("#iptIdioma"));
	eliminaMarcaRojo($("#iptCodioIsoIdioma"));
	$('#modalNewIdioma').modal({backdrop: 'static', keyboard: false});
}

saveIdioma = function() {

	idiomaValid = true;

	if (!notNull($("#iptIdioma"))) {
		idiomaValid = false;
	}
	if (!notNull($("#iptCodioIsoIdioma"))) {
		idiomaValid = false;
	}

	if (idiomaValid) {

		var idioma = new Object;
		idioma.id = $('#iptIdIdioma').val();
		idioma.idioma = $('#iptIdioma').val();
		idioma.codigoIso = $('#iptCodioIsoIdioma').val();
		if ($("#iptCheckIdiomaActivo").prop('checked')) {
			idioma.baActivo = 1;
		} else {
			idioma.baActivo = 0;
		}

		var urltxt = ctx + '/catalogo/saveIdioma';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(idioma),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/Idioma';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

orderArribaIdioma = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenArribaIdioma?id='+id;
	
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
				window.location = ctx+'/catalogo/Idioma';
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

orderAbajoIdioma = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenAbajoIdioma?id='+id;
	
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
				window.location = ctx+'/catalogo/Idioma';
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


//Acciones Catalogo Tipo actividad
newTipoActividad = function() {
	$('#iptTipoActividad').val('');
	$('#iptCheckTipoActividadActivo').prop('checked', true);
	$('#modalNewTipoActividad').modal({backdrop: 'static', keyboard: false});
}

saveTipoActividad = function() {

	tipoActividadValid = true;

	if (!notNull($("#iptTipoActividad"))) {
		tipoActividadValid = false;
	}

	if (tipoActividadValid) {

		var tipoActividad = new Object;
		
		tipoActividad.tipoActividad = $('#iptTipoActividad').val();
		if ($("#iptCheckTipoActividadActivo").prop('checked')) {
			tipoActividad.banActivo = 1;
		} else {
			tipoActividad.banActivo = 0;
		}

		var urltxt = ctx + '/catalogo/saveTipoActividad';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(tipoActividad),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/TipoActividad';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}
//Acciones Catalogo Tipo de Curso
newTipoCurso = function() {
	$('#iptnombreTipoCurso').val('');
	$('#iptCheckTipoCursoActivo').prop('checked', false);
	$('#modalNewTipoCurso').modal({backdrop: 'static', keyboard: false});
}

saveTipoCurso = function() {

	tipoCursoValid = true;

	if (!notNull($("#iptnombreTipoCurso"))) {
		tipoCursoValid = false;
	}

	if (tipoCursoValid) {

		var tipoCurso = new Object;
		
		tipoCurso.nombre = $('#iptnombreTipoCurso').val();
		if ($("#iptCheckTipoCursoActivo").prop('checked')) {
			tipoCurso.banActivo = 1;
		} else {
			tipoCurso.banActivo = 0;
		}

		var urltxt = ctx + '/catalogo/saveTipoCurso';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(tipoCurso),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/TipoCurso';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}
//Acciones Catalogo Tipo Pregunta
newTipoPregunta = function() {
	$('#iptDescripcionTipoPregunta').val('');
	$('#iptCheckTipoPreguntaActivo').prop('checked', false);
	$('#modalNewTipoPregunta').modal({backdrop: 'static', keyboard: false});
}

saveTipoPregunta = function() {

	tipoPreguntaValid = true;

	if (!notNull($("#iptDescripcionTipoPregunta"))) {
		tipoPreguntaValid = false;
	}

	if (tipoPreguntaValid) {

		var tipoPregunta = new Object;
		
		tipoPregunta.descripcion = $('#iptDescripcionTipoPregunta').val();
		if ($("#iptCheckTipoPreguntaActivo").prop('checked')) {
			tipoPregunta.banActivo = 1;
		} else {
			tipoPregunta.banActivo = 0;
		}

		var urltxt = ctx + '/catalogo/saveTipoPregunta';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(tipoPregunta),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/TipoPregunta';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}
//Acciones Catalogo Categoria Curso
newCategoriaCurso = function() {
	$('#iptCategoriaCategoriaCurso').val('');
	$('#iptDescripcionCategoriaCurso').val('');
	$('#iptCodigoCategoriaCurso').val('');
	$('#iptOrdenCategoriaCurso').val('');
	$('#iptCheckCategoriaCursoActivo').prop('checked', true);
	$('#modalNewCategoriaCurso').modal({backdrop: 'static', keyboard: false});
}

saveCategoriaCurso = function() {

	categoriaCursoValid = true;
	
	if (!notNull($("#iptCategoriaCategoriaCurso"))) {
		categoriaCursoValid = false;
	}
	
	if (!notNull($("#iptDescripcionCategoriaCurso"))) {
		categoriaCursoValid = false;
	}
	
	if (!notNull($("#iptCodigoCategoriaCurso"))) {
		categoriaCursoValid = false;
	}
	
	if (!notNull($("#iptOrdenCategoriaCurso"))) {
		categoriaCursoValid = false;
	}

	if (categoriaCursoValid) {

		var categoriaCurso = new Object;
		
		categoriaCurso.categoria = $('#iptCategoriaCategoriaCurso').val();
		categoriaCurso.descripcion = $('#iptDescripcionCategoriaCurso').val();
		categoriaCurso.codigo = $('#iptCodigoCategoriaCurso').val();
		categoriaCurso.orden = $('#iptOrdenCategoriaCurso').val();
		
		if ($("#iptCheckCategoriaCursoActivo").prop('checked')) {
			categoriaCurso.banActivo = 1;
		} else {
			categoriaCurso.banActivo = 0;
		}
	
		var urltxt = ctx + '/catalogo/saveCategoriaCurso';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(categoriaCurso),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/CategoriaCurso';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}
//Acciones Catalogo Prioridad
newPrioridad = function() {
	$('#selecEmpresaPrioridad').val('');
	$('#iptClavePrioridad').val('');
	$('#iptDescripcionPrioridad').val('');
	$('#iptCheckPrioridadActivo').prop('checked', true);
	$('#modalNewPrioridad').modal({backdrop: 'static', keyboard: false});
}

savePrioridad = function() {

	prioridadValid = true;
	
	if (!notNull($("#iptClavePrioridad"))) {
		prioridadValid = false;
	}
	
	if (!notNull($("#iptDescripcionPrioridad"))) {
		prioridadValid = false;
	}

	if (prioridadValid) {

		var prioridad = new Object;
		
		prioridad.clave = $('#iptClavePrioridad').val();
		prioridad.descripcion = $('#iptDescripcionPrioridad').val();

		if ($("#iptCheckPrioridadActivo").prop('checked')) {
			prioridad.banActivo = 1;
		} else {
			prioridad.banActivo = 0;
		}
		
		if ($('#selecEmpresaPrioridad').val() > 0) {
			prioridad.idEmpresa = $('#selecEmpresaPrioridad').val();
		}

		var urltxt = ctx + '/catalogo/savePrioridad';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(prioridad),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/Prioridad';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}
//Acciones Catalogo Puesto
newPuesto = function() {
	$('#iptIdPuesto').val('');
	$('#selecEmpresaPuesto').val(0);
	$('#selecGrupoPuestoPuesto').val(0);
	$('#iptClavePuesto').val('');
	$('#iptCodigoAgrupacionPuesto').val('');
	$('#ipNombrePuesto').val('');
	$('#ipNombrePuestoEn').val('');
	$('#ipNombrePuestoFr').val('');
	$('#iptCodigoAreaPuesto').val('');
	$('#iptPeriodoPruebaPuesto').val('');
	$('#iptDescripcionPruebaPuesto').val('');
	$('#selecEmpresaPuesto').attr('disabled',false);
	$('#iptClavePuesto').attr('disabled',true);
	$('#iptCheckPuestoActivo').prop('checked', true);
	$('#btnSavePuesto').show();
	$('#iptCheckPuestoActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	$('#lstFuncionarios').html('');
	eliminaMarcaRojo($("#selecEmpresaPuesto"));
	eliminaMarcaRojo($("#selecGrupoPuestoPuesto"));
	eliminaMarcaRojo($("#iptClavePuesto"));
	eliminaMarcaRojo($("#iptCodigoAgrupacionPuesto"));
	eliminaMarcaRojo($("#ipNombrePuesto"));
	eliminaMarcaRojo($("#iptCodigoAreaPuesto"));
	eliminaMarcaRojo($("#iptPeriodoPruebaPuesto"));
	eliminaMarcaRojo($("#iptDescripcionPruebaPuesto"));
	$('#modalNewPuesto').modal({backdrop: 'static', keyboard: false});
}

getGruposByEmpresa = function(){
	var empresaSelectedPuesto = $('#selecEmpresaPuesto').val();
	$('#selecGrupoPuestoPuesto').html('');
	if(empresaSelectedPuesto > 0){
		$('#iptClavePuesto').attr('disabled',false);
		var urltxt = ctx+"/catalogo/getGrupoPuestoByEmpresa?idEmpresa="+empresaSelectedPuesto;
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
						htmlAdd += '<option value="' + element.id+ '" >' + element.descripcion + '</option>';
					}
					$('#selecGrupoPuestoPuesto').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecGrupoPuestoPuesto').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecGrupoPuestoPuesto').append(htmlAdd);
		$('#iptClavePuesto').attr('disabled',true);
	}
}

getPuesto = function(idPuesto){
	$('#selecEmpresaPuesto').attr('disabled',true);
	$('#selecGrupoPuestoPuesto').html('');
	eliminaMarcaRojo($("#selecEmpresaPuesto"));
	eliminaMarcaRojo($("#selecGrupoPuestoPuesto"));
	eliminaMarcaRojo($("#iptClavePuesto"));
	eliminaMarcaRojo($("#iptCodigoAgrupacionPuesto"));
	eliminaMarcaRojo($("#ipNombrePuesto"));
	eliminaMarcaRojo($("#ipNombrePuestoEn"));
	eliminaMarcaRojo($("#ipNombrePuestoFr"));
	eliminaMarcaRojo($("#iptCodigoAreaPuesto"));
	eliminaMarcaRojo($("#iptPeriodoPruebaPuesto"));
	eliminaMarcaRojo($("#iptDescripcionPruebaPuesto"));
	$('#btnSavePuesto').show();
	$('#lstFuncionarios').html('');

	var urltxt = ctx + '/catalogo/getPuesto?idPuesto='+idPuesto;
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
				
				var puestoInfo =  response[1];
				var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
				var htmlAddLstFunc='';
				var htmlLstFunc=' <label>Funcionarios del puesto </label><div class="box-body table-responsive"><table id="" class="table table-bordered table-striped"><thead><tr><th>Nombre</th>'
					+'<th>Apellidos</th></tr></thead><tbody>';
				var tableLstFunc ='';
				var object = response[2];
				for (var i = 0; i < object.length; i++) {
					var element = object[i];
					htmlAdd += '<option value="' + element.id+ '" >' + element.descripcion + '</option>';
				}
				$('#selecGrupoPuestoPuesto').append(htmlAdd);
				$('#iptIdPuesto').val(puestoInfo.id);
				$('#selecEmpresaPuesto').val(puestoInfo.idEmpresa);
				$('#selecGrupoPuestoPuesto').val(puestoInfo.idGrupoPuesto);
				$('#iptClavePuesto').val(puestoInfo.clave);
				$('#iptCodigoAgrupacionPuesto').val(puestoInfo.codigoAgrupacion);
				$('#ipNombrePuesto').val(puestoInfo.nombre);
				$('#ipNombrePuestoEn').val(puestoInfo.nombreEn);
				$('#ipNombrePuestoFr').val(puestoInfo.nombreFr);
				$('#iptCodigoAreaPuesto').val(puestoInfo.codigoArea);
				$('#iptDescripcionPruebaPuesto').val(puestoInfo.descripcionPrueba);
				$('#iptPeriodoPruebaPuesto').val(puestoInfo.periodoPrueba);
				
				if(puestoInfo.banActivo == 1){
					$('#iptCheckPuestoActivo').prop('checked', true);
					$('#iptCheckPuestoActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal checked'
					});
				}else{
					$('#iptCheckPuestoActivo').prop('checked', false);
					$('#iptCheckPuestoActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal'
					});
				}
				
				
//				if(puestoInfo.banActivo == 1 && puestoInfo.totalFuncionarios > 0){
//				    $('#iptCheckPuestoActivo').on('ifClicked', function(event){
//				    	$('#h1WarnDealers').html('');
//				    	$('#h1WarnDealers').append('El puesto no se puede desactivar porque tiene '+puestoInfo.totalFuncionarios+' funcionarios activos.');
//				    	$('#modalNumeroFuncionarios').modal({backdrop: 'static', keyboard: false});
//				    	
//					});
	//			}
//				if(puestoInfo.lstFuncionariosVO.length!= null){
//					for (var x = 0; x < puestoInfo.lstFuncionariosVO.length; x++) {
//						var datos = puestoInfo.lstFuncionariosVO[x];
//						tableLstFunc += '<tr><td>' + datos.datosFuncionarioVO.nombres + '</td><td>' + datos.datosFuncionarioVO.apellidoUno + ' '+datos.datosFuncionarioVO.apellidoDos + '</td></tr>';
//					}
//					htmlAddLstFunc = htmlLstFunc +tableLstFunc +'</tbody></table>';
//					$('#lstFuncionarios').append(htmlAddLstFunc);	
//				}
				
				$('#modalNewPuesto').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

verFuncionariosPuesto = function(idPuesto){
	var urltxt = ctx+"/catalogo/detallePuesto?idPuesto="+idPuesto; 
	window.open(urltxt, '_blank');
}

activaCkeckPuesto = function(){
	$('#iptCheckPuestoActivo').prop('checked', true);
	$('#iptCheckPuestoActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptCheckPuestoActivo').on('ifClicked', function(event){
    	$('#modalNumeroFuncionarios').modal({backdrop: 'static', keyboard: false});
    	
	});
}


savePuesto = function() {

	puestoValid = true;
	
	if (!notNull($("#iptClavePuesto"))) {
		puestoValid = false;
	}
	
	if (!notNull($("#iptCodigoAgrupacionPuesto"))) {
		puestoValid = false;
	}
	
	if (!notNull($("#ipNombrePuesto"))) {
		puestoValid = false;
	}
	
	if (!notNull($("#iptCodigoAreaPuesto"))) {
		puestoValid = false;
	}

	if (!notNull($("#iptPeriodoPruebaPuesto"))) {
		puestoValid = false;
	}
	if (!notNull($("#iptDescripcionPruebaPuesto"))) {
		puestoValid = false;
	}
	
	if($('#selecGrupoPuestoPuesto').val() > 0){
		eliminaMarcaRojo($("#selecGrupoPuestoPuesto"));
	}else{
		marcaRojo($("#selecGrupoPuestoPuesto"));
		puestoValid = false;
	}
	
	if($('#selecEmpresaPuesto').val() > 0){
		eliminaMarcaRojo($("#selecEmpresaPuesto"));
	}else{
		marcaRojo($("#selecEmpresaPuesto"));
		puestoValid = false;
	}
	
	
	if (puestoValid) {

		var puesto = new Object;
		
		puesto.id = $('#iptIdPuesto').val();
		puesto.clave = $('#iptClavePuesto').val();
		puesto.codigoAgrupacion = $('#iptCodigoAgrupacionPuesto').val();
		puesto.nombre = $('#ipNombrePuesto').val();
		puesto.nombreEn = $('#ipNombrePuestoEn').val();
		puesto.nombreFr = $('#ipNombrePuestoFr').val();
		puesto.codigoArea = $('#iptCodigoAreaPuesto').val();
		puesto.periodoPrueba = $('#iptPeriodoPruebaPuesto').val();
		puesto.descripcionPrueba = $('#iptDescripcionPruebaPuesto').val();
		if ($("#iptCheckPuestoActivo").prop('checked')) {
			puesto.banActivo = 1;
		} else {
			puesto.banActivo = 0;
		}
		
		if ($('#selecEmpresaPuesto').val() > 0) {
			puesto.idEmpresa = $('#selecEmpresaPuesto').val();
		}
		
		if ($('#selecGrupoPuestoPuesto').val() > 0) {
			puesto.idGrupoPuesto = $('#selecGrupoPuestoPuesto').val();
		}

		var urltxt = ctx + '/catalogo/savePuesto';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(puesto),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/Puesto';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}


orderArribaPuesto = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenArribaPuesto?id='+id;
	
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
				window.location = ctx+'/catalogo/Puesto';
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

orderAbajoPuesto = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenAbajoPuesto?id='+id;
	
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
				window.location = ctx+'/catalogo/Puesto';
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


//Acciones Catalogo Talla
newTalla = function() {
	$('#selecEmpresaTalla').val(0);	
	$('#iptClaveTalla').val('');
	$('#iptDescripcionTalla').val('');
	$('#iptDescripcionTallaEn').val('');
	$('#iptDescripcionTallaFr').val('');
	$('#ipMinAtencionTalla').val('');
	$('#ipMaxAtencionTalla').val('');
	$('#iptCheckTallaActivo').prop('checked', true);
	
	$('#btnSaveTalla').show();
	
	eliminaMarcaRojo($("#selecEmpresaTalla"));
	eliminaMarcaRojo($("#iptClaveTalla"));
	eliminaMarcaRojo($("#iptDescripcionTalla"));
	eliminaMarcaRojo($("#iptDescripcionTallaEn"));
	eliminaMarcaRojo($("#iptDescripcionTallaFr"));
	eliminaMarcaRojo($("#ipMinAtencionTalla"));
	eliminaMarcaRojo($("#ipMaxAtencionTalla"));
	
	
	$('#modalNewTalla').modal({backdrop: 'static', keyboard: false});
}

saveTalla = function() {

	tallaValid = true;
	
	if (!notNull($("#iptClaveTalla"))) {
		tallaValid = false;
	}
	
	if (!notNull($("#iptDescripcionTalla"))) {
		tallaValid = false;
	}
	
	if (!notNull($("#ipMinAtencionTalla"))) {
		tallaValid = false;
	}
	
	if (!notNull($("#ipMaxAtencionTalla"))) {
		tallaValid = false;
	}
	
	if ($('#selecEmpresaTalla').val() > 0) {
		eliminaMarcaRojo($("#selecEmpresaTalla"));
	}else{
		tallaValid = false;
		marcaRojo($("#selecEmpresaTalla"));
	}

	if (tallaValid) {

		var talla = new Object;
		
		talla.clave = $('#iptClaveTalla').val();
		talla.descripcion = $('#iptDescripcionTalla').val();
		talla.descripcionEn = $('#iptDescripcionTallaEn').val();
		talla.descripcionFr = $('#iptDescripcionTallaFr').val();
		talla.minAtencion = $('#ipMinAtencionTalla').val();
		talla.maxAtencion = $('#ipMaxAtencionTalla').val();
		
		if ($('#selecEmpresaTalla').val() > 0) {
			talla.idEmpresa = $('#selecEmpresaTalla').val();
		}

		var urltxt = ctx + '/catalogo/saveTalla';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(talla),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/Talla';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

getTalla = function(idTalla){
	var urltxt = ctx + '/catalogo/getTalla?idTalla='+idTalla;
	$('#btnUpdateTalla').show();
	$('#tbodyTalla').html('');
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
				
				var tallaInfo =  response[1];
				var tallaPuestos = tallaInfo.puestos;
				var tallaPuestosP = tallaInfo.sinPuesto;
				var htmlAddPuesto = '';
				$('#iptIdTallaEdit').val(tallaInfo.id);
				$('#iptEmpresaEdit').val(tallaInfo.idEmpresa);
				$('#iptClaveEdit').val(tallaInfo.clave);
				$('#ipMinAtencionTallaEdit').val(tallaInfo.minAtencion);
				$('#ipMaxAtencionTallaEdit').val(tallaInfo.maxAtencion);
				$('#iptDescripcionTallaEdit').val(tallaInfo.descripcion);
				$('#iptDescripcionTallaEditEn').val(tallaInfo.descripcionEn);
				$('#iptDescripcionTallaEditFr').val(tallaInfo.descripcionFr);
				
				//codigo aqui
				
				if(tallaInfo.banActivo == 1){
					$('#iptCheckTallaActivoEdit').prop('checked', true);
					$('#iptCheckTallaActivoEdit').iCheck({
				        checkboxClass: 'icheckbox_minimal checked'
					});
				}else{
					$('#iptCheckTallaActivoEdit').prop('checked', false);
					$('#iptCheckTallaActivoEdit').iCheck({
				        checkboxClass: 'icheckbox_minimal'
					});
				}
				
				if(tallaInfo.banActivo == 1 && tallaInfo.totalDealers > 0){
				    $('#iptCheckTallaActivoEdit').on('ifClicked', function(event){
				    	$('#h1WarnDealers').html('');
				    	$('#h1WarnDealers').append('El nivel de dealer no se puede desactivar porque tiene '+tallaInfo.totalDealers+' dealers activos.');
				    	$('#modalNumeroDealers').modal({backdrop: 'static', keyboard: false});
				    	
					});
				}

				
				for (var i = 0; i < tallaPuestos.length; i++) {
					var element = tallaPuestos[i];
					htmlAddPuesto += '<tr><td><input type="hidden" id="iptIdTallaP'+i+'" value="'+element.id+'" >'+element.puesto.nombre+'</td>'+'<td><input onchange="$(\'#btnEditTalla'+i+'\').show();" type="text" id="iptMinEdit'+i+'" value="'+element.min+'"></td>'+'<td><input onchange="$(\'#btnEditTalla'+i+'\').show();" type="text" id="iptMaxEdit'+i+'" value="'+element.max+'"></td>'+'<td> <button id="btnEditTalla'+i+'" style="display:none;" type="button" class="btn" onclick="updateTallaPuesto(\''+i+'\');">Guardar</button></td></tr>';
				}
				
				$('#tbodyTalla').append(htmlAddPuesto);
				$('#modalTallaDetalle').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

activaCkeckTallaD = function(){
	$('#iptCheckTallaActivoEdit').prop('checked', true);
	$('#iptCheckTallaActivoEdit').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptCheckTallaActivoEdit').on('ifClicked', function(event){
    	$('#modalNumeroDealers').modal({backdrop: 'static', keyboard: false});
    	
	});
}

updateTallaPuesto = function(fila){
	
	var tallaPuesto = new Object;
	
	if (!notNull($('#iptMinEdit'+fila))) {
		tallaPuesto.min = 0;
	}
	if (!notNull($('#iptMaxEdit'+fila))) {
		tallaPuesto.max = 0;
	}
	
	tallaPuesto.id = $('#iptIdTallaP'+fila).val();
	tallaPuesto.min = $('#iptMinEdit'+fila).val();
	tallaPuesto.max = $('#iptMaxEdit'+fila).val();
	
	var urltxt = ctx + '/catalogo/updateTallaPuesto';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(tallaPuesto),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			msg = response[1];
			if (result) {
				$('#btnEditTalla'+fila).hide();
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

updateTalla = function(){
	
	tallaValid = true;
	
	if (!notNull($("#iptClaveEdit"))) {
		tallaValid = false;
	}
	
	if (!notNull($("#iptDescripcionTallaEdit"))) {
		tallaValid = false;
	}
	
	if (!notNull($("#ipMinAtencionTallaEdit"))) {
		tallaValid = false;
	}
	
	if (!notNull($("#ipMaxAtencionTallaEdit"))) {
		tallaValid = false;
	}

	if (tallaValid) {

		var talla = new Object;
		
		talla.id = $('#iptIdTallaEdit').val();
		talla.clave = $('#iptClaveEdit').val();
		talla.descripcion = $('#iptDescripcionTallaEdit').val();
		talla.descripcionEn = $('#iptDescripcionTallaEditEn').val();
		talla.descripcionFr = $('#iptDescripcionTallaEditFr').val();
		talla.minAtencion = $('#ipMinAtencionTallaEdit').val();
		talla.maxAtencion = $('#ipMaxAtencionTallaEdit').val();
		
		var urltxt = ctx + '/catalogo/saveTalla';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(talla),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/Talla';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}


orderArribaTalla = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenArribaTalla?id='+id;
	
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
				window.location = ctx+'/catalogo/Talla';
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

orderAbajoTalla = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenAbajoTalla?id='+id;
	
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
				window.location = ctx+'/catalogo/Talla';
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


//Acciones TipoDealer
newTipoDealer = function() {
	$('#iptIdTipoDealer').val('');
	$('#selecEmpresaTipoDealer').val(0);	
	$('#iptClaveTipoDealer').val('');
	$('#iptDescripcionTipoDealer').val('');
	$('#iptDescripcionTipoDealerEn').val('');
	$('#iptDescripcionTipoDealerFr').val('');
	$('#selecEmpresaTipoDealer').attr('disabled',false);
	$('#btnSaveTipoDealer').show();
	$('#iptClaveTipoDealer').attr('disabled',true);
	
	eliminaMarcaRojo($("#selecEmpresaTipoDealer"));
	eliminaMarcaRojo($("#iptClaveTipoDealer"));
	eliminaMarcaRojo($("#iptDescripcionTipoDealer"));
	
	$('#modalNewTipoDealer').modal({backdrop: 'static', keyboard: false});
}

updateTipoDealer = function(id, idEmpresa, clave, descripcion, activo, dealers, descripcionEn, descripcionFr) {
	$('#iptIdTipoDealer').val(id);
	$('#selecEmpresaTipoDealer').val(idEmpresa);	
	$('#iptClaveTipoDealer').val(clave);
	$('#iptDescripcionTipoDealer').val(descripcion);
	$('#iptDescripcionTipoDealerEn').val(descripcionEn);
	$('#iptDescripcionTipoDealerFr').val(descripcionFr);
	$('#selecEmpresaTipoDealer').attr('disabled',true);
	$('#iptClaveTipoDealer').attr('disabled',false);
	$('#btnSaveTipoDealer').show();
	if(activo == 1){
		$('#iptCheckTipoDealerActivo').prop('checked', true);
		$('#iptCheckTipoDealerActivo').iCheck({
	        checkboxClass: 'icheckbox_minimal checked'
		});
	}else{
		$('#iptCheckTipoDealerActivo').prop('checked', false);
		$('#iptCheckTipoDealerActivo').iCheck({
	        checkboxClass: 'icheckbox_minimal'
		});
	}
	
	if(activo == 1 && dealers > 0){
	    $('#iptCheckTipoDealerActivo').on('ifClicked', function(event){
	    	$('#h1WarnDealers').html('');
	    	$('#h1WarnDealers').append('El tipo de dealer no se puede desactivar porque tiene '+dealers+' dealers activos.');
	    	$('#modalNumeroDealers').modal({backdrop: 'static', keyboard: false});
	    	
		});
	}
	
	eliminaMarcaRojo($("#selecEmpresaTipoDealer"));
	eliminaMarcaRojo($("#iptClaveTipoDealer"));
	eliminaMarcaRojo($("#iptDescripcionTipoDealer"));


	$('#modalNewTipoDealer').modal({backdrop: 'static', keyboard: false});
}

activaCkeckTipoD = function(){
	$('#iptCheckTipoDealerActivo').prop('checked', true);
	$('#iptCheckTipoDealerActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptCheckTipoDealerActivo').on('ifClicked', function(event){
    	$('#modalNumeroDealers').modal({backdrop: 'static', keyboard: false});
    	
	});
}

saveTipoDealer = function() {

	tipoDealerValid = true;
	
	if (!notNull($("#iptClaveTipoDealer"))) {
		tipoDealerValid = false;
	}
	
	if (!notNull($("#iptDescripcionTipoDealer"))) {
		tipoDealerValid = false;
	}
	
	if($('#selecEmpresaTipoDealer').val() > 0){
		eliminaMarcaRojo($("#selecEmpresaTipoDealer"));
	}else{
		tipoDealerValid = false;
		marcaRojo($("#selecEmpresaTipoDealer"));
	}
	

	if (tipoDealerValid) {

		var tipoDealer = new Object;
		
		tipoDealer.id = $('#iptIdTipoDealer').val();
		tipoDealer.clave = $('#iptClaveTipoDealer').val();
		tipoDealer.descripcion = $('#iptDescripcionTipoDealer').val();
		tipoDealer.descripcionEn = $('#iptDescripcionTipoDealerEn').val();
		tipoDealer.descripcionFr = $('#iptDescripcionTipoDealerFr').val();

		
		if ($("#iptCheckTipoDealerActivo").prop('checked')) {
			tipoDealer.banActivo = 1;
		} else {
			tipoDealer.banActivo = 0;
		}
		
		if ($('#selecEmpresaTipoDealer').val() > 0) {
			tipoDealer.idEmpresa = $('#selecEmpresaTipoDealer').val();
		}

		var urltxt = ctx + '/catalogo/saveTipoDealer';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(tipoDealer),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/TipoDealer';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}


orderArribaTipoDealer = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenArribaTipoDealer?id='+id;
	
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
				window.location = ctx+'/catalogo/TipoDealer';
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

orderAbajoTipoDealer = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenAbajoTipoDealer?id='+id;
	
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
				window.location = ctx+'/catalogo/TipoDealer';
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


//Acciones ModuloWeb
newModuloWeb = function() {		
	$('#iptDescripcionModuloWeb').val('');
	$('#iptPerfilModuloWeb').val('');
	$('#iptCheckModuloWebActivo').prop('checked', false);
	$('#modalNewModuloWeb').modal({backdrop: 'static', keyboard: false});
}

saveModuloWeb = function() {

	moduloWebValid = true;
	
	if (!notNull($("#iptDescripcionModuloWeb"))) {
		moduloWebValid = false;
	}
	
	if (!notNull($("#iptPerfilModuloWeb"))) {
		moduloWebValid = false;
	}
	

	if (moduloWebValid) {

		var moduloWeb = new Object;
		
		moduloWeb.descripcion = $('#iptDescripcionModuloWeb').val();
		moduloWeb.perfil = $('#iptPerfilModuloWeb').val();
		
		if ($("#iptCheckModuloWebActivo").prop('checked')) {
			moduloWeb.banActivo = 1;
		} else {
			moduloWeb.banActivo = 0;
		}		

		var urltxt = ctx + '/catalogo/saveModuloWeb';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(moduloWeb),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/ModuloWeb';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

//Funciones para sedes
newSede = function(){


	$('#iptIdSede').val('');
	$('#selectEmpresaSede').val(0);
	$('#iptNombreSede').val('');
	$('#iptNombreSedeEn').val('');
	$('#iptNombreSedeFr').val('');
	$('#iptDescSede').val('');
	$('#iptDescSedeEn').val('');
	$('#iptDescSedeFr').val('');
	$('#iptCPSede').val('');
	$('#iptEstadoSede').val('');
	$('#iptCiudadSede').val('');
	$('#iptColoniaSede').val('');
	$('#iptDireccionSede').val('');
	$('#iptExteriorSede').val('');
	$('#iptInteriorSede').val('');
	$('#iptRefSede').val('');
	$('#iptTelefonoSede').val('');
	$('#iptURLSede').val('');
	$('#iptCheckSedeActivo').prop('checked', true);
	$('#iptCheckSedeActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	eliminaMarcaRojo($("#selectEmpresaSede"));
	eliminaMarcaRojo($("#iptNombreSede"));
	eliminaMarcaRojo($("#iptNombreSedeEn"));
	eliminaMarcaRojo($("#iptNombreSedeFr"));
	eliminaMarcaRojo($("#iptDescSede"));
	eliminaMarcaRojo($("#iptDescSedeEn"));
	eliminaMarcaRojo($("#iptDescSedeFr"));
	eliminaMarcaRojo($("#iptCPSede"));
	eliminaMarcaRojo($("#iptEstadoSede"));
	eliminaMarcaRojo($("#iptCiudadSede"));
	eliminaMarcaRojo($("#iptColoniaSede"));
	eliminaMarcaRojo($("#iptDireccionSede"));
	eliminaMarcaRojo($("#iptExteriorSede"));
	eliminaMarcaRojo($("#iptInteriorSede"));
	eliminaMarcaRojo($("#iptRefSede"));
	eliminaMarcaRojo($("#iptTelefonoSede"));
	eliminaMarcaRojo($("#iptURLSede"));
	eliminaMarcaRojo($("#iptCheckSedeActivo"));
	$('#modalNewSede').modal({backdrop: 'static', keyboard: false});
}

saveSede = function(){
	sedeValida = true;
	
	if (!notNull($("#iptNombreSede"))) {
		sedeValida = false;
	}

	if (!notNull($("#iptDescSede"))) {
		sedeValida = false;
	}

	if (!notNull($("#iptCPSede"))) {
		sedeValida = false;
	}

	if (!notNull($("#iptEstadoSede"))) {
		sedeValida = false;
	}

	if (!notNull($("#iptCiudadSede"))) {
		sedeValida = false;
	}

	if (!notNull($("#iptColoniaSede"))) {
		sedeValida = false;
	}

	if (!notNull($("#iptDireccionSede"))) {
		sedeValida = false;
	}

	if (!notNull($("#iptExteriorSede"))) {
		sedeValida = false;
	}

	if (!notNull($("#iptRefSede"))) {
		sedeValida = false;
	}

	if (!notNull($("#iptTelefonoSede"))) {
		sedeValida = false;
	}

	if (!notNull($("#iptURLSede"))) {
		sedeValida = false;
	}
	
	if ($('#selectEmpresaSede').val() <= 0) {
		marcaRojo($("#selectEmpresaSede"));
		sedeValida = false;
	}else{
		eliminaMarcaRojo($("#selectEmpresaSede"));
	}


	if (sedeValida) {

		var sede = new Object;

		sede.id = $('#iptIdSede').val();
		sede.idEmpresa = $('#selectEmpresaSede').val();
		sede.nombre = $('#iptNombreSede').val();
		sede.nombreEn = $('#iptNombreSedeEn').val();
		sede.nombreFr = $('#iptNombreSedeFr').val();
		sede.descripcion = $('#iptDescSede').val();
		sede.descripcionEn = $('#iptDescSedeEn').val();
		sede.descripcionFr = $('#iptDescSedeFr').val();
		sede.url = $('#iptURLSede').val();
		sede.codigoPostal = $('#iptCPSede').val();
		sede.estado = $('#iptEstadoSede').val();
		sede.colonia = $('#iptColoniaSede').val();
		sede.ciudad = $('#iptCiudadSede').val();
		sede.direccion = $('#iptDireccionSede').val();
		sede.interior = $('#iptInteriorSede').val();
		sede.exterior = $('#iptExteriorSede').val();
		sede.referencia = $('#iptRefSede').val();
		sede.telefono = $('#iptTelefonoSede').val();
		if ($("#iptCheckSedeActivo").prop('checked')) {
			sede.banActivo = 1;
		} else {
			sede.banActivo = 0;
		}
		
		var urltxt = ctx + '/catalogo/saveSede';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(sede),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				msg = response[1];
				if (result) {
					window.location = ctx + '/catalogo/sedes';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
} 


getSede = function(id){
	eliminaMarcaRojo($("#selectEmpresaSede"));
	eliminaMarcaRojo($("#iptNombreSede"));
	eliminaMarcaRojo($("#iptNombreSedeEn"));
	eliminaMarcaRojo($("#iptNombreSedeFr"));
	eliminaMarcaRojo($("#iptDescSede"));
	eliminaMarcaRojo($("#iptDescSedeEn"));
	eliminaMarcaRojo($("#iptDescSedeFr"));
	eliminaMarcaRojo($("#iptCPSede"));
	eliminaMarcaRojo($("#iptEstadoSede"));
	eliminaMarcaRojo($("#iptCiudadSede"));
	eliminaMarcaRojo($("#iptColoniaSede"));
	eliminaMarcaRojo($("#iptDireccionSede"));
	eliminaMarcaRojo($("#iptExteriorSede"));
	eliminaMarcaRojo($("#iptInteriorSede"));
	eliminaMarcaRojo($("#iptRefSede"));
	eliminaMarcaRojo($("#iptTelefonoSede"));
	eliminaMarcaRojo($("#iptURLSede"));
	eliminaMarcaRojo($("#iptCheckSedeActivo"));
	var sede = new Object;

	var urltxt = ctx + '/catalogo/getSede?idSede='+id;

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
				var sede = response[1];
				$('#iptIdSede').val(sede.id);
				$('#selectEmpresaSede').val(sede.idEmpresa);
				$('#iptNombreSede').val(sede.nombre);
				$('#iptNombreSedeEn').val(sede.nombreEn);
				$('#iptNombreSedeFr').val(sede.nombreFr);
				$('#iptDescSede').val(sede.descripcion);
				$('#iptDescSedeEn').val(sede.descripcionEn);
				$('#iptDescSedeFr').val(sede.descripcionFr);
				$('#iptURLSede').val(sede.url);
				$('#iptCPSede').val(sede.codigoPostal);
				$('#iptEstadoSede').val(sede.estado);
				$('#iptColoniaSede').val(sede.colonia);
				$('#iptCiudadSede').val(sede.ciudad);
				$('#iptDireccionSede').val(sede.direccion);
				$('#iptInteriorSede').val(sede.interior);
				$('#iptExteriorSede').val(sede.exterior);
				$('#iptRefSede').val(sede.referencia);
				$('#iptTelefonoSede').val(sede.telefono);
				if(sede.banActivo == 1){
					$('#iptCheckSedeActivo').prop('checked', true);
					$('#iptCheckSedeActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal checked'
					});
				}else{
					$('#iptCheckSedeActivo').prop('checked', false);
					$('#iptCheckSedeActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal'
					});
				}
				
				$('#modalNewSede').modal({backdrop: 'static', keyboard: false});
				
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
} 


orderArribaSede = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenArribaSede?id='+id;
	
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
				window.location = ctx+'/catalogo/sedes';
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

orderAbajoSede = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenAbajoSede?id='+id;
	
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
				window.location = ctx+'/catalogo/sedes';
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


//validacion de duplicados en catalogos
validaEmpresaDuplicada = function(){

	cveEmpresa = $('#iptClaveEmpresa').val();
	idEmpresa = $('#iptIdEmpresa').val();
	var urltxt = ctx + '/catalogo/validaDuplicadoEmpresa?cveEmpresa='+cveEmpresa+'&idEmpresa='+idEmpresa;

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
				$('#btnSaveEmpresa').show();
			} else {
				$('#btnSaveEmpresa').hide();
				$('#modalEmpresaDuplicada').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
} 

empresaGrupoPSelected = function(){
	if($('#selectEmpresaGrupoP').val() > 0){
		$('#iptClaveGrupoPuesto').attr('disabled',false);
	}else{
		$('#iptClaveGrupoPuesto').attr('disabled',true);
	}
}


empresaTipoDealerSelected = function(){
	if($('#selecEmpresaTipoDealer').val() > 0){
		$('#iptClaveTipoDealer').attr('disabled',false);
	}else{
		$('#iptClaveTipoDealer').attr('disabled',true);
	}
}

validaGrupoPuestoDuplicado = function(){

	cveGrupoPuesto = $('#iptClaveGrupoPuesto').val();
	idEmpresa = $('#selectEmpresaGrupoP').val();
	idGrupoPuesto = $('#iptIdGrupoPuesto').val();
	var urltxt = ctx + '/catalogo/validaDupicadoGrupoPuesto?cveGrupoPuesto='+cveGrupoPuesto+'&idEmpresa='+idEmpresa+'&idGrupoPuesto='+idGrupoPuesto;

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
				$('#btnSaveGrupoPuesto').show();
			} else {
				$('#btnSaveGrupoPuesto').hide();
				$('#modalGrupoPuestoDuplicado').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
} 

validaPuestoDuplicado = function(){

	cvePuesto = $('#iptClavePuesto').val();
	idEmpresa = $('#selecEmpresaPuesto').val();
	idPuesto = $('#iptIdPuesto').val();
	var urltxt = ctx + '/catalogo/validaDupicadoPuesto?cvePuesto='+cvePuesto+'&idEmpresa='+idEmpresa+'&idPuesto='+idPuesto;

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
				$('#btnSavePuesto').show();
			} else {
				$('#btnSavePuesto').hide();
				$('#modalPuestoDuplicado').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
} 

validaTipoDealerDuplicado = function(){

	cveTipo = $('#iptClaveTipoDealer').val();
	idEmpresa = $('#selecEmpresaTipoDealer').val();
	idTipo = $('#iptIdTipoDealer').val();
	var urltxt = ctx + '/catalogo/validaDupicadoTipoDealer?cveTipo='+cveTipo+'&idEmpresa='+idEmpresa+'&idTipo='+idTipo;

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
				$('#btnSaveTipoDealer').show();
			} else {
				$('#btnSaveTipoDealer').hide();
				$('#modalTipoDealerDuplicado').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
} 

empresaTallaSelected = function(){
	if($('#selecEmpresaTalla').val() > 0){
		$('#iptClaveTalla').attr('disabled',false);
	}else{
		$('#iptClaveTalla').attr('disabled',true);
	}
}


validaTallaDuplicado = function(){

	cveTalla = $('#iptClaveTalla').val();
	idEmpresa = $('#selecEmpresaTalla').val();
	idTalla = $('#iptIdTallaN').val();
	var urltxt = ctx + '/catalogo/validaDupicadoTalla?cveTalla='+cveTalla+'&idEmpresa='+idEmpresa+'&idTalla='+idTalla;

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
				$('#btnSaveTalla').show();
			} else {
				$('#btnSaveTalla').hide();
				$('#modalTallaDuplicado').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
} 


validaTallaDuplicadoEdit = function(){

	cveTalla = $('#iptClaveEdit').val();
	idEmpresa = $('#iptEmpresaEdit').val();
	idTalla = $('#iptIdTallaEdit').val();
	var urltxt = ctx + '/catalogo/validaDupicadoTalla?cveTalla='+cveTalla+'&idEmpresa='+idEmpresa+'&idTalla='+idTalla;

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
				$('#btnUpdateTalla').show();
			} else {
				$('#btnUpdateTalla').hide();
				$('#modalTallaDuplicado').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
} 

newMotivoContacto = function() {
	// Resetea validadores
	$('#formMotivoContacto').parsley().reset();
	$('#iptIdMotivoContacto').val('');
	$('#selectEmpresaMotivoContacto').val(0);
	$('#iptNombreMotivoContacto').val('');
	$('#iptNombreMotivoContactoEn').val('');
	$('#iptNombreMotivoContactoFr').val('');
	$('#iptTemplateMotivoContacto').val('');
	$('#iptCheckMotivoContactoActivo').prop('checked', true);
	$('#iptCheckMotivoContactoActivo').iCheck({
		checkboxClass : 'icheckbox_minimal checked'
	});
	CKEDITOR.instances['iptTemplateMotivoContacto'].setData(''); 
	$('#modalNewMotivoContacto').modal({
		backdrop : 'static',
		keyboard : false
	});
}

saveMotivoContacto = function() {
	var motivoContacto = new Object;
	motivoContacto.id = $('#iptIdMotivoContacto').val();
	motivoContacto.idEmpresa = $('#selectEmpresaMotivoContacto').val();
	motivoContacto.motivoContacto = $('#iptNombreMotivoContacto').val();
	motivoContacto.motivoContactoEn = $('#iptNombreMotivoContactoEn').val();
	motivoContacto.motivoContactoFr = $('#iptNombreMotivoContactoFr').val();
	motivoContacto.template=$('#iptTemplateMotivoContacto').val();
	if ($("#iptCheckMotivoContactoActivo").prop('checked')) {
		motivoContacto.banActivo = 1;
	} else {
		motivoContacto.banActivo = 0;
	}

	var urltxt = ctx + '/catalogo/saveMotivoContacto';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(motivoContacto),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			msg = response[1];
			if (result) {
				window.location = ctx + '/catalogo/motivosContacto';
			} else {
				alert('Error');
			}
		},
		error : function(msg) {
			alert('Error');
		}
	});

}


orderArribaMotivoContacto = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenArribaMotivoContacto?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/catalogo/motivosContacto';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}

orderAbajoMotivoContacto = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenAbajoMotivoContacto?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/catalogo/motivosContacto';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}


getMotivoContacto = function(id) {
	$('#formMotivoContacto').parsley().reset();
	$('#iptIdMotivoContacto').val('');
	$('#selectEmpresaMotivoContacto').val(0);
	$('#iptNombreMotivoContacto').val('');
	$('#iptNombreMotivoContactoEn').val('');
	$('#iptNombreMotivoContactoFr').val('');
	$('#iptTemplateMotivoContacto').val('');
	$('#iptCheckMotivoContactoActivo').prop('checked', true);
	$('#iptCheckMotivoContactoActivo').iCheck({
		checkboxClass : 'icheckbox_minimal checked'
	});
	CKEDITOR.instances['iptTemplateMotivoContacto'].setData(''); 
	var urltxt = ctx + '/catalogo/getMotivoContato?param=' + id;

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
				var motivoContacto = response[1];
				$('#iptIdMotivoContacto').val(motivoContacto.id);
				$('#selectEmpresaMotivoContacto').val(motivoContacto.idEmpresa);
				$('#iptNombreMotivoContacto').val(motivoContacto.motivoContacto);
				$('#iptNombreMotivoContactoEn').val(motivoContacto.motivoContactoEn);
				$('#iptNombreMotivoContactoFr').val(motivoContacto.motivoContactoFr);
				$('#iptTemplateMotivoContacto').val(motivoContacto.template);
				CKEDITOR.instances['iptTemplateMotivoContacto'].setData(motivoContacto.template); 
				if (motivoContacto.banActivo == 1) {
					$('#iptCheckMotivoContactoActivo').prop('checked', true);
					$('#iptCheckMotivoContactoActivo').iCheck({
						checkboxClass : 'icheckbox_minimal checked'
					});
				} else {
					$('#iptCheckMotivoContactoActivo').prop('checked', false);
					$('#iptCheckMotivoContactoActivo').iCheck({
						checkboxClass : 'icheckbox_minimal'
					});
				}

				
				$('#modalNewMotivoContacto').modal({
					backdrop : 'static',
					keyboard : false
				});

			} else {
				alert('Error');
			}
		},
		error : function(msg) {
			alert('Error');
		}
	});
}


newProyecto = function() {
	// Resetea validadores
	$('#formProyecto').parsley().reset();
	$('#iptProyectoId').val('');
	$('#selectEmpresaproyecto').val(0);	
	$('#iptClaveProyecto').val('');
	$('#iptNombreProyecto').val('');
	$('#iptNombreProyectoEn').val('');
	$('#iptNombreProyectoFr').val('');
	$('#iptCheckProyectoActivo').prop('checked', true);
	$('#iptCheckProyectoActivo').iCheck({
		checkboxClass : 'icheckbox_minimal checked'
	});

	$('#modalNewProyecto').modal({
		backdrop : 'static',
		keyboard : false
	});
}

saveProyecto = function() {
	var proyecto = new Object;
	proyecto.id = $('#iptProyectoId').val();
	proyecto.idEmpresa = $('#selectEmpresaproyecto').val();
	proyecto.clave = $('#iptClaveProyecto').val();
	proyecto.nombre = $('#iptNombreProyecto').val();
	proyecto.nombreEn = $('#iptNombreProyectoEn').val();
	proyecto.nombreFr = $('#iptNombreProyectoFr').val();
	
	if ($("#iptCheckProyectoActivo").prop('checked')) {
		proyecto.banActivo = 1;
	} else {
		proyecto.banActivo = 0;
	}

	var urltxt = ctx + '/catalogo/saveProyecto';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(proyecto),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			msg = response[1];
			if (result) {
				window.location = ctx + '/catalogo/proyectos';
			} else {
				alert('Error');
			}
		},
		error : function(msg) {
			alert('Error');
		}
	});

}


orderArribaProyecto = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenArribaProyecto?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/catalogo/proyectos';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}

orderAbajoProyecto = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenAbajoProyecto?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/catalogo/proyectos';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}


getProyecto = function(id) {
	$('#formProyecto').parsley().reset();
	var urltxt = ctx + '/catalogo/getProyecto?param=' + id;

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
				var proyecto = response[1];
				$('#iptProyectoId').val(proyecto.id);
				$('#selectEmpresaproyecto').val(proyecto.idEmpresa);
				$('#iptNombreProyecto').val(proyecto.nombre);
				$('#iptNombreProyectoEn').val(proyecto.nombreEn);
				$('#iptNombreProyectoFr').val(proyecto.nombreFr);
				$('#iptClaveProyecto').val(proyecto.clave);
				if (proyecto.banActivo == 1) {
					$('#iptCheckProyectoActivo').prop('checked', true);
					$('#iptCheckProyectoActivo').iCheck({
						checkboxClass : 'icheckbox_minimal checked'
					});
				} else {
					$('#iptCheckProyectoActivo').prop('checked', false);
					$('#iptCheckProyectoActivo').iCheck({
						checkboxClass : 'icheckbox_minimal'
					});
				}

				$('#modalNewProyecto').modal({
					backdrop : 'static',
					keyboard : false
				});
			}
		}
	});
}



newMotivoCancelacion = function() {
	// Resetea validadores
	$('#formMotivoCancelacion').parsley().reset();
	$('#iptIdMotivoCancelacion').val('');
	$('#selectEmpresaMotivoCancelacion').val(0);
	$('#iptNombreMotivoCancelacion').val('');
	$('#iptNombreMotivoCancelacionEn').val('');
	$('#iptNombreMotivoCancelacionFr').val('');
	$('#iptCheckMotivoCancelacionActivo').prop('checked', true);
	$('#iptCheckMotivoCancelacionActivo').iCheck({
		checkboxClass : 'icheckbox_minimal checked'
	});
	$('#selectEmpresaMotivoCancelacion').prop("disabled", false);
	$('#modalNewMotivoCancelacion').modal({
		backdrop : 'static',
		keyboard : false
	});
}

saveMotivoCancelacion = function() {
	var motivoCancelacion = new Object;
	motivoCancelacion.id = $('#iptIdMotivoCancelacion').val();
	motivoCancelacion.idEmpresa = $('#selectEmpresaMotivoCancelacion').val();
	motivoCancelacion.motivoCancelacion = $('#iptNombreMotivoCancelacion').val();
	motivoCancelacion.motivoCancelacionEn = $('#iptNombreMotivoCancelacionEn').val();
	motivoCancelacion.motivoCancelacionFr = $('#iptNombreMotivoCancelacionFr').val();
	if ($("#iptCheckMotivoCancelacionActivo").prop('checked')) {
		motivoCancelacion.banActivo = 1;
	} else {
		motivoCancelacion.banActivo = 0;
	}

	var urltxt = ctx + '/catalogo/saveMotivoCancelacion';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(motivoCancelacion),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			msg = response[1];
			if (result) {
				window.location = ctx + '/catalogo/motivosCancelaciones';
			} else {
				alert('Error');
			}
		},
		error : function(msg) {
			alert('Error');
		}
	});

}

getMotivoCancelacion = function(id) {
	$('#formMotivoCancelacion').parsley().reset();
	$('#iptIdMotivoCancelacion').val('');
	$('#selectEmpresaMotivoCancelacion').val(0);
	$('#iptNombreMotivoCancelacion').val('');
	$('#iptNombreMotivoCancelacionEn').val('');
	$('#iptNombreMotivoCancelacionFr').val('');
	$('#iptCheckMotivoCancelacionActivo').prop('checked', true);
	$('#iptCheckMotivoCancelacionActivo').iCheck({
		checkboxClass : 'icheckbox_minimal checked'
	});
	var urltxt = ctx + '/catalogo/getMotivoCancelacion?param=' + id;

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
				var motivoCancelacion = response[1];
				$('#iptIdMotivoCancelacion').val(motivoCancelacion.id);
				$('#selectEmpresaMotivoCancelacion').val(motivoCancelacion.idEmpresa);
				$('#iptNombreMotivoCancelacion').val(motivoCancelacion.motivoCancelacion);
				$('#iptNombreMotivoCancelacionEn').val(motivoCancelacion.motivoCancelacionEn);
				$('#iptNombreMotivoCancelacionFr').val(motivoCancelacion.motivoCancelacionFr);

				if (motivoCancelacion.banActivo == 1) {
					$('#iptCheckMotivoCancelacionActivo').prop('checked', true);
					$('#iptCheckMotivoCancelacionActivo').iCheck({
						checkboxClass : 'icheckbox_minimal checked'
					});
				} else {
					$('#iptCheckMotivoCancelacionActivo').prop('checked', false);
					$('#iptCheckMotivoCancelacionActivo').iCheck({
						checkboxClass : 'icheckbox_minimal'
					});
				}

				$('#selectEmpresaMotivoCancelacion').prop('disabled', 'disabled');
				$('#modalNewMotivoCancelacion').modal({
					backdrop : 'static',
					keyboard : false
				});

			} else {
				alert('Error');
			}
		},
		error : function(msg) {
			alert('Error');
		}
	});
}


orderArribaMotivoCancelacion = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenArribaMotivoCancelacion?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/catalogo/motivosCancelaciones';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}

orderAbajoMotivoCancelacion = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenAbajoMotivoCancelacion?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/catalogo/motivosCancelaciones';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}



//Motivo cancelacion curso
newMotivoCancelacionCurso = function() {
	// Resetea validadores
	$('#formMotivoCancelacion').parsley().reset();
	$('#iptIdMotivoCancelacion').val('');
	$('#selectEmpresaMotivoCancelacion').val(0);
	$('#iptNombreMotivoCancelacion').val('');
	$('#iptNombreMotivoCancelacionEn').val('');
	$('#iptNombreMotivoCancelacionFr').val('');
	$('#iptCheckMotivoCancelacionActivo').prop('checked', true);
	$('#iptCheckMotivoCancelacionActivo').iCheck({
		checkboxClass : 'icheckbox_minimal checked'
	});
	$('#selectEmpresaMotivoCancelacion').prop("disabled", false);
	$('#modalNewMotivoCancelacion').modal({
		backdrop : 'static',
		keyboard : false
	});
}

saveMotivoCancelacionCurso = function() {
	var motivoCancelacion = new Object;
	motivoCancelacion.id = $('#iptIdMotivoCancelacion').val();
	motivoCancelacion.idEmpresa = $('#selectEmpresaMotivoCancelacion').val();
	motivoCancelacion.motivoCancelacion = $('#iptNombreMotivoCancelacion').val();
	motivoCancelacion.motivoCancelacionEn = $('#iptNombreMotivoCancelacionEn').val();
	motivoCancelacion.motivoCancelacionFr = $('#iptNombreMotivoCancelacionFr').val();
	
	if ($("#iptCheckMotivoCancelacionActivo").prop('checked')) {
		motivoCancelacion.banActivo = 1;
	} else {
		motivoCancelacion.banActivo = 0;
	}

	var urltxt = ctx + '/catalogo/saveMotivoCancelacionCurso';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(motivoCancelacion),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			msg = response[1];
			if (result) {
				window.location = ctx + '/catalogo/motivosCancelacionesCurso';
			} else {
				alert('Error');
			}
		},
		error : function(msg) {
			alert('Error');
		}
	});

}

getMotivoCancelacionCurso = function(id) {
	$('#formMotivoCancelacion').parsley().reset();
	$('#iptIdMotivoCancelacion').val('');
	$('#selectEmpresaMotivoCancelacion').val(0);
	$('#iptNombreMotivoCancelacion').val('');
	$('#iptNombreMotivoCancelacionEn').val('');
	$('#iptNombreMotivoCancelacionFr').val('');
	$('#iptCheckMotivoCancelacionActivo').prop('checked', true);
	$('#iptCheckMotivoCancelacionActivo').iCheck({
		checkboxClass : 'icheckbox_minimal checked'
	});
	var urltxt = ctx + '/catalogo/getMotivoCancelacionCurso?param=' + id;

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
				var motivoCancelacion = response[1];
				$('#iptIdMotivoCancelacion').val(motivoCancelacion.id);
				$('#selectEmpresaMotivoCancelacion').val(motivoCancelacion.idEmpresa);
				$('#iptNombreMotivoCancelacion').val(motivoCancelacion.motivoCancelacion);
				$('#iptNombreMotivoCancelacionEn').val(motivoCancelacion.motivoCancelacionEn);
				$('#iptNombreMotivoCancelacionFr').val(motivoCancelacion.motivoCancelacionFr);

				if (motivoCancelacion.banActivo == 1) {
					$('#iptCheckMotivoCancelacionActivo').prop('checked', true);
					$('#iptCheckMotivoCancelacionActivo').iCheck({
						checkboxClass : 'icheckbox_minimal checked'
					});
				} else {
					$('#iptCheckMotivoCancelacionActivo').prop('checked', false);
					$('#iptCheckMotivoCancelacionActivo').iCheck({
						checkboxClass : 'icheckbox_minimal'
					});
				}

				$('#selectEmpresaMotivoCancelacion').prop('disabled', 'disabled');
				$('#modalNewMotivoCancelacion').modal({
					backdrop : 'static',
					keyboard : false
				});

			} else {
				alert('Error');
			}
		},
		error : function(msg) {
			alert('Error');
		}
	});
}


orderArribaMotivoCancelacionCurso = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenArribaMotivoCancelacionCurso?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/catalogo/motivosCancelacionesCurso';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}

orderAbajoMotivoCancelacionCurso = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenAbajoMotivoCancelacionCurso?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/catalogo/motivosCancelacionesCurso';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}


newTipoReporte = function() {
	$('#formTipoReporte').parsley().reset();
	// Limpia los campos
	$("#iptNombreTipoReporte").val('');
	$("#iptDescripcionTipoReporte").val('');
	$("#selecTipoReporteEmpresa").val('');
	$('#selectTipoReporteActivo').val('');
	$('#selecTipoReporteEmpresa').prop("disabled", false);
	$('#modalNewTipoReporte').modal({
		backdrop : 'static',
		keyboard : false
	});
}

saveTipoReporte = function() {
	var tipoReporte = new Object;

	tipoReporte.nombre = $('#iptNombreTipoReporte').val();
	tipoReporte.descripcion = $('#iptDescripcionTipoReporte').val();
	tipoReporte.idEmpresa = $('#selecTipoReporteEmpresa').val();
	tipoReporte.banActivo = $('#selectTipoReporteActivo').val();
	

	// Guardar nuevo registro
	var urltxt = ctx + '/catalogo/saveTipoReporte';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(tipoReporte),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {

			$('#modalNewTipoReporte').modal('hide');

			if (response[0]) {
				window.location = ctx + '/catalogo/tipoReportesAdicionales';
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
}
estatusTipoReporte =function(id) {
	var urltxt = ctx +'/catalogo/changeEstatusTipoReporte?id=' + id;

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
				window.location = ctx + '/catalogo/tipoReportesAdicionales';
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
			alert('Error');
		}
	});
}


orderArribaTipoReporte = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenArribaTipoReporte?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/catalogo/tipoReportesAdicionales';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}

orderAbajoTipoReporte = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenAbajoTipoReporte?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/catalogo/tipoReportesAdicionales';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}


function descargarCatEmpresas() {
	window.open(ctx + '/catalogo/descargarEmpresa');
}

function descargarCatGrupoPuesto() {
	window.open(ctx + '/catalogo/descargarGrupoPuesto');
}
function descargarCatPuesto() {
	window.open(ctx + '/catalogo/descargarPuesto');
}
function descargarCatTipoDealer() {
	window.open(ctx + '/catalogo/descargarTipoDealer');
}
function descargarCatTalla() {
	window.open(ctx + '/catalogo/descargarTalla');
}


function descargarCatSedes() {
	window.open(ctx + '/catalogo/descargarSedes');
}
function descargarCatIdioma() {
	window.open(ctx + '/catalogo/descargarIdioma');
}

function descargarCatMotivosContacto() {
	window.open(ctx + '/catalogo/descargarMotivosContacto');
}
function descargarCatProyectos() {
	window.open(ctx + '/catalogo/descargarProyectos');
}
function descargarCatMotivosCancelaciones() {
	window.open(ctx + '/catalogo/descargarMotivosCancelaciones');
}
function descargarCatMotivosCancelacionesCursos() {
	window.open(ctx + '/catalogo/descargarMotivosCancelacionesCursos');
}
function descargarCatTipoReportes() {
	window.open(ctx + '/catalogo/descargarTipoReportes');
}