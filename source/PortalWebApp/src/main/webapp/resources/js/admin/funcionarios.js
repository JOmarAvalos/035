
newFuncionario = function() {
	$('#selectEmpresaFuncionario').attr('disabled',false);
	$('#iptRfcFuncionario').attr('disabled',false);
	$('#iptNombresFuncionario').attr('disabled',false);
	$('#iptApellidoPaternoFuncionario').attr('disabled',false);
	$('#iptApellidoMaternoFuncionario').attr('disabled',false);
	$('#iptNacimientoFuncionario').attr('disabled',false);
	$('#iptSexoFuncionario').attr('disabled',false);
	$('#iptEmail1Funcionario').attr('disabled',false);
	$('#iptEmail2Funcionario').attr('disabled',false);
	$('#iptCurpFuncionario').attr('disabled',false);
	$('#iptNssFuncionario').attr('disabled',false);
	$('#iptTelefonoFuncionario').attr('disabled',false);
	$('#iptExtensionFuncionario').attr('disabled',false);
	$('#iptMovilFuncionario').attr('disabled',false);
	$('#iptWorkidFuncionario').attr('disabled',false);
	$('#iptCheckFuncionarioActivo').attr('disabled',false);
	$('#selectEmpresaFuncionario').val('0');
	$('#iptRfcFuncionario').val('');
	$('#iptNombresFuncionario').val('');
	$('#iptApellidoPaternoFuncionario').val('');
	$('#iptApellidoMaternoFuncionario').val('');
	$('#iptNacimientoFuncionario').val('');
	$('#iptSexoFuncionario').val('');
	$('#iptEmail1Funcionario').val('');
	$('#iptEmail2Funcionario').val('');	
	$('#iptCurpFuncionario').val('');
	$('#iptNssFuncionario').val('');
	$('#iptTelefonoFuncionario').val('');
	$('#iptExtensionFuncionario').val('');
	$('#iptMovilFuncionario').val('');
	$('#iptWorkidFuncionario').val('');
	$('#iptClinicaFuncionario').val('');
	$('#iptNoClinicaFuncionario').val('');
	$('#iptCheckFuncionarioActivo').prop('checked', true);
	$('#iptCheckFuncionarioActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptCheckPuestoPrincipal').prop('checked', true);
	$('#iptCheckPuestoPrincipal').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	
	eliminaMarcaRojo($("#selectEmpresaFuncionario"));
	eliminaMarcaRojo($("#iptRfcFuncionario"));
	eliminaMarcaRojo($("#iptNombresFuncionario"));
	eliminaMarcaRojo($("#iptApellidoPaternoFuncionario"));
	eliminaMarcaRojo($("#iptApellidoMaternoFuncionario"));
	eliminaMarcaRojo($("#iptNacimientoFuncionario"));
	eliminaMarcaRojo($("#iptEmail1Funcionario"));
	eliminaMarcaRojo($("#iptCurpFuncionario"));
	eliminaMarcaRojo($("#iptNssFuncionario"));
	eliminaMarcaRojo($("#iptTelefonoFuncionario"));
	//Datos changue request
	$('#selectExtranjero').val('');
	$('#iptIdDocumento').val('');
	
	$('#rowIdDocumento').hide();
	$('#rowDocumentoExtranjero').hide();
	
	$("#rfcFile").val(null);
	$("#curpFile").val(null);
	$("#extranjeroFile").val(null);
	eliminaMarcaRojo($("#selectExtranjero"));
	eliminaMarcaRojo($("#iptIdDocumento"));
	eliminaMarcaRojo($("#rfcFile"));
	eliminaMarcaRojo($("#curpFile"));
	
	$('#modalNewFuncionario').modal({backdrop: 'static', keyboard: false});
	
}

function validateExtranjero(){
	var valueSelectorExtranjero = $('#selectExtranjero').val();
	if (valueSelectorExtranjero == 1) {
		$('#iptCurpFuncionario').attr('disabled',true);
		//$('#iptNssFuncionario').attr('disabled',true);
		//$('#iptClinicaFuncionario').attr('disabled',true);
		//$('#iptNoClinicaFuncionario').attr('disabled',true);
		$('#rowIdDocumento').show();
		$('#rowDocumentoExtranjero').show();
		$('#rowDocumentoRFC').hide();
		$('#rowDocumentoCURP').hide();
	}else{
		$('#iptCurpFuncionario').attr('disabled',false);
		//$('#iptNssFuncionario').attr('disabled',false);
		//$('#iptClinicaFuncionario').attr('disabled',false);
		//$('#iptNoClinicaFuncionario').attr('disabled',false);
		$('#rowIdDocumento').hide();
		$('#rowDocumentoExtranjero').hide();
		$('#rowDocumentoRFC').show();
		$('#rowDocumentoCURP').show();
	}
}

validaFuncionario= function(){
	
}

saveFuncionario = function() {
	
	regExpRFC = /^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/;
	//regexpCURP = /^[A-Z]{1}[AEIOU]{1}[A-Z]{2}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])[HM]{1}(AS|BC|BS|CC|CS|CH|CL|CM|DF|DG|GT|GR|HG|JC|MC|MN|MS|NT|NL|OC|PL|QT|QR|SP|SL|SR|TC|TS|TL|VZ|YN|ZS|NE)[B-DF-HJ-NP-TV-ZÑ]{3}[0-9A-Z]{1}[0-9]{1}$/;
	regexpCURP = /^[A-Z]{4}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])[HM]{1}(AS|BC|BS|CC|CS|CH|CL|CM|DF|DG|GT|GR|HG|JC|MC|MN|MS|NT|NL|OC|PL|QT|QR|SP|SL|SR|TC|TS|TL|VZ|YN|ZS|NE)[B-DF-HJ-NP-TV-ZÑ]{3}[0-9A-Z]{1}[0-9]{1}$/;

	funcionarioValid = true;
	
	var extranjero = false;
	if (!notNull($("#selectExtranjero"))) {
		funcionarioValid = false;
	}else{
		var valueExt = $("#selectExtranjero").val();
		if(valueExt == 1){
			extranjero = true;
		}
	}
		
	//Validacion de formato de RFC
	if($.trim($("#iptRfcFuncionario").val()) != ''){
		if(!$("#iptRfcFuncionario").val().toUpperCase().match(regExpRFC)){
			marcaRojo($("#iptRfcFuncionario"));
			funcionarioValid = false;
		}else{
			eliminaMarcaRojo($("#iptRfcFuncionario"));
		}
	}else{
		marcaRojo($("#iptRfcFuncionario"));
		funcionarioValid = false;
	}	
	//Se valida solosi no es extranjero
	if(!extranjero){
		//Validacion de formato de CURP
		if($.trim($("#iptCurpFuncionario").val()) != ''){
			if(!$("#iptCurpFuncionario").val().toUpperCase().match(regexpCURP)){
				marcaRojo($("#iptCurpFuncionario"));
				funcionarioValid = false;
			}else{
				eliminaMarcaRojo($("#iptCurpFuncionario"));
			}
		}else{
			marcaRojo($("#iptCurpFuncionario"));
			funcionarioValid = false;
		}
	}else{
		eliminaMarcaRojo($("#iptCurpFuncionario"));
	}	
	
	
	if (!notNull($("#iptNombresFuncionario"))) {
		funcionarioValid = false;
	}
	if (!notNull($("#iptApellidoMaternoFuncionario"))) {
		funcionarioValid = false;
	}
	if (!notNull($("#iptApellidoPaternoFuncionario"))) {
		funcionarioValid = false;
	}
	if (!notNull($("#iptNacimientoFuncionario"))) {
		funcionarioValid = false;
	}
	if (!notNull($("#iptEmail1Funcionario"))) {
		funcionarioValid = false;
	}
	if (!notNull($("#iptNssFuncionario"))) {
		funcionarioValid = false;
	}else{
		if($(iptNssFuncionario).val().length != 11){
			marcaRojo($("#iptNssFuncionario"));
			funcionarioValid = false;
		}else{
			eliminaMarcaRojo($("#iptNssFuncionario"));
		}
	}
	if (!notNull($("#iptTelefonoFuncionario"))) {
		funcionarioValid = false;
	}
	
	
	if($('#selectEmpresaFuncionario').val() > 0){
		eliminaMarcaRojo($("#selectEmpresaFuncionario"));
	}else{
		funcionarioValid = false;
		marcaRojo($("#selectEmpresaFuncionario"));
	}
	
	var extranjeroFile = $("#extranjeroFile").prop("files")[0];   
	var rfcFile = $("#rfcFile").prop("files")[0];   
	var curpFile = $("#curpFile").prop("files")[0];
	
	//Se valida solosi no es extranjero
	if(extranjero){
		if(extranjeroFile == null){
			funcionarioValid = false;
			marcaRojo($("#extranjeroFile"));
		}else{
			eliminaMarcaRojo($("#extranjeroFile"));
		}
		eliminaMarcaRojo($("#rfcFile"));
		eliminaMarcaRojo($("#curpFile"));
	}else{
		if(rfcFile == null){
			funcionarioValid = false;
			marcaRojo($("#rfcFile"));
		}else{
			eliminaMarcaRojo($("#rfcFile"));
		}	
		if(curpFile == null){
			funcionarioValid = false;
			marcaRojo($("#curpFile"));
		}else{
			eliminaMarcaRojo($("#curpFile"));
		}
	}
	
	if (funcionarioValid) {//descomentar
	//if (true) {//Borrar
		var funcionario = new Object;
		var dtsFuncionario = new Object;
				
		funcionario.id = $('#iptIdFuncionario').val();
		funcionario.rfc = $('#iptRfcFuncionario').val().toUpperCase();
		
		funcionario.workId = $('#iptWorkidFuncionario').val();
		
		funcionario.idEmpresa = $('#selectEmpresaFuncionario').val();
		
		if ($("#iptCheckFuncionarioActivo").prop('checked')) {
			funcionario.banActivo = 1;
		} else {
			funcionario.banActivo = 0;
		}
		
		funcionario.banExtranjero = $('#selectExtranjero').val();
		
		dtsFuncionario.nombres = $('#iptNombresFuncionario').val();
		dtsFuncionario.apellidoUno = $('#iptApellidoPaternoFuncionario').val();
		dtsFuncionario.apellidoDos = $('#iptApellidoMaternoFuncionario').val();
		
//		var nacimientoDate = $('#iptNacimientoFuncionario').val().split("/");
////		dtsFuncionario.fechaNacimiento = $('#iptNacimientoFuncionario').val();
//		dtsFuncionario.fechaNacimiento = new Date(nacimientoDate[2], nacimientoDate[1] - 1, nacimientoDate[0]);
		
		var iniAnio = $('#iptNacimientoFuncionario').val().substring(0,4);
		var iniMes  = $('#iptNacimientoFuncionario').val().substring(5,7);
		var iniDia  = $('#iptNacimientoFuncionario').val().substring(8,10);
		dtsFuncionario.fechaNacimiento = new Date(iniAnio, iniMes-1, iniDia);	
		
		
		dtsFuncionario.sexo = $('#iptSexoFuncionario').val();
		dtsFuncionario.email = $('#iptEmail1Funcionario').val();
		dtsFuncionario.emailAdicional = $('#iptEmail2Funcionario').val();
		dtsFuncionario.curp = $('#iptCurpFuncionario').val();
		dtsFuncionario.nss = $('#iptNssFuncionario').val();
		dtsFuncionario.telefono = $('#iptTelefonoFuncionario').val();
		dtsFuncionario.extencion = $('#iptExtensionFuncionario').val();
		dtsFuncionario.movil = $('#iptMovilFuncionario').val();
		dtsFuncionario.sexo = $('input:radio[name=hm]:checked').val();
		dtsFuncionario.clinica = $('#iptClinicaFuncionario').val();
		dtsFuncionario.noClinica = $('#iptNoClinicaFuncionario').val();
		
		funcionario.datosFuncionarioVO = dtsFuncionario;

		var urltxt = ctx + '/funcionarios/saveFuncionario';

		//Form para mandar tambien imagenes
		   
		var fd = new FormData();
		
		fd.append("extranjeroFile", extranjeroFile);
		fd.append("rfcFile", rfcFile);
		fd.append("curpFile", curpFile);
		fd.append("funcionario", JSON.stringify(funcionario));


		$.ajax({
			type : "POST",
			url : urltxt,
			//contentType : "application/json",
			//data : JSON.stringify(funcionario),
			contentType : false,
			processData : false,
			data : fd,
			enctype : 'multipart/form-data',			
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					$('#iptIdFuncionario').val(response[1]);
					$('#selectEmpresaFuncionario').attr('disabled',true);
					$('#iptRfcFuncionario').attr('disabled',true);
					$('#iptNombresFuncionario').attr('disabled',true);
					$('#iptApellidoPaternoFuncionario').attr('disabled',true);
					$('#iptApellidoMaternoFuncionario').attr('disabled',true);
					$('#iptNacimientoFuncionario').attr('disabled',true);
					$('#iptSexoFuncionario').attr('disabled',true);
					$('#iptEmail1Funcionario').attr('disabled',true);
					$('#iptEmail2Funcionario').attr('disabled',true);
					$('#iptCurpFuncionario').attr('disabled',true);
					$('#iptNssFuncionario').attr('disabled',true);
					$('#iptTelefonoFuncionario').attr('disabled',true);
					$('#iptExtensionFuncionario').attr('disabled',true);
					$('#iptMovilFuncionario').attr('disabled',true);
					$('#iptWorkidFuncionario').attr('disabled',true);
					$('#iptCheckFuncionarioActivo').attr('disabled',true);
					$('#btnSaveFuncionario').attr('disabled',true);
					$('#iptClinicaFuncionario').attr('disabled',true);
					$('#iptNoClinicaFuncionario').attr('disabled',true);
					$('#modalFuncionarioCreado').modal({backdrop: 'static', keyboard: false});
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

modalFuncionario = function(id) {

	window.location = ctx + '/funcionario?idFuncionario='+id;			
}

getSelectsEmpresa = function(){
	$('#selecGrupoPuesto').html('');
	$('#selecGrupoDealer').html('');
	$('#selecPuesto').html('');
	$('#selecDealer').html('');
	var empresaSelected = $('#selectEmpresaFuncionario').val();
	
	if(empresaSelected > 0){
		var urltxt = ctx+"/funcionarios/getSelectsEmpresaF?idEmpresa="+empresaSelected;
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
					var htmlAddGpoDealer = '<option value="0" selected="selected">Seleccione...</option>';
					var htmlAddGpoPuesto = '<option value="0" selected="selected">Seleccione...</option>';
//					grupos de puestos 
					var gpoPuestos = response[2];
					for (var i = 0; i < gpoPuestos.length; i++) {
						var element = gpoPuestos[i];
						htmlAddGpoPuesto += '<option value="' + element.id+ '" >' + element.descripcion + '</option>';
					}
					
//					grupos de dealers
					var gpoDealers = response[1];
					for (var i = 0; i < gpoDealers.length; i++) {
						var element = gpoDealers[i];
						htmlAddGpoDealer += '<option value="' + element.id+ '" >' + element.agrupacion + '</option>';
					}
					
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecGrupoPuesto').append(htmlAddGpoPuesto);
					$('#selecGrupoDealer').append(htmlAddGpoDealer);
					$('#selecPuesto').append(htmlAdd);
					$('#selecDealer').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecGrupoPuesto').append(htmlAdd);
					$('#selecGrupoDealer').append(htmlAdd);
					$('#selecPuesto').append(htmlAdd);
					$('#selecDealer').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecGrupoPuesto').append(htmlAdd);
		$('#selecGrupoDealer').append(htmlAdd);
		$('#selecPuesto').append(htmlAdd);
		$('#selecDealer').append(htmlAdd);
	}
	
}

getPuestos = function(){
	var grupoPuestoSelected = $('#selecGrupoPuesto').val();
	$('#selecPuesto').html('');

	if(grupoPuestoSelected > 0){
		var urltxt = ctx+"/funcionarios/getPuestos?idGrupoPuesto="+grupoPuestoSelected;
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
						htmlAdd += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
					}
					$('#selecPuesto').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecPuesto').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecPuesto').append(htmlAdd);
	}
}

getDealer = function(){
	var grupoDealerSelected = $('#selecGrupoDealer').val();
	$('#selecDealer').html('');

	if(grupoDealerSelected > 0){
		var urltxt = ctx+"/funcionarios/getDealer?idGrupoDealer="+grupoDealerSelected;
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
						htmlAdd += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
					}
					$('#selecDealer').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecDealer').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecDealer').append(htmlAdd);
	}
}

showAsignaPuesgos = function(){
	$('#divPuestosFuncionario').show();
	eliminaMarcaRojo($("#selecPuesto"));
	eliminaMarcaRojo($("#selecDealer"));
	$('#modalFuncionarioCreado').modal('hide');
}

asignarPuesto = function() {
		validacion = true;
		
		if ($('#selecPuesto').val() == 0) {
			validacion = false;
			marcaRojo($("#selecPuesto"));
		}else{
			eliminaMarcaRojo($("#selecPuesto"));
		}
		if ($('#selecDealer').val() == 0) {
			validacion = false;
			marcaRojo($("#selecDealer"));
		}else{
			eliminaMarcaRojo($("#selecDealer"));
		}
		
		if (validacion) {
			var funcionarioPuestoVO = new Object;
			funcionarioPuestoVO.idFuncionario=$('#iptIdFuncionario').val();
			funcionarioPuestoVO.idPuesto = $('#selecPuesto').val();
			funcionarioPuestoVO.idDealer = $('#selecDealer').val();
			funcionarioPuestoVO.idGrupoDealer = $('#selecGrupoDealer').val();
			var iniAnio = $('#iptIngresoPuesto').val().substring(0,4);
			var iniMes  = $('#iptIngresoPuesto').val().substring(5,7);
			var iniDia  = $('#iptIngresoPuesto').val().substring(8,10);
			funcionarioPuestoVO.ingreso = new Date(iniAnio, iniMes-1, iniDia);			
			
			if ($("#iptCheckPuestoPrincipal").prop('checked')) {
				funcionarioPuestoVO.banPrincipal = 1;
			} else {
				funcionarioPuestoVO.banPrincipal = 0;
			}
	
			var urltxt = ctx + '/funcionarios/asignarPuestoFuncionario';
			
			
	
			$.ajax({
				type : "POST",
				url : urltxt,
				contentType : "application/json",
				data : JSON.stringify(funcionarioPuestoVO),
				beforeSend : function() {
					$("#wait").css("display", "block");
				},
				complete : function() {
					$("#wait").css("display", "none");
				},
				success : function(response) {
					result = response[0];
					if (result) {
						$('#modalPuestoAsignado').modal({backdrop: 'static', keyboard: false});	
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

nuevoPuesto = function(){
	$('#listaPuestos').hide();
	eliminaMarcaRojo($("#selecPuesto"));
	eliminaMarcaRojo($("#selecDealer"));
	$('#divNuevoPuesto').show();
}

cancelaNuevoPuesto = function(){
	$('#divNuevoPuesto').hide();
	$('#listaPuestos').show();
}

validaRFC = function() {
	
	rfcValido = true;
	$('#btnSaveFuncionario').attr('disabled',false);
	$('#divMensajesC').html('');
	regExpRFC = /^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/;
	
	//Validacion de formato de RFC
	if($.trim($("#iptRfcFuncionario").val()) != ''){
		if(!$("#iptRfcFuncionario").val().toUpperCase().match(regExpRFC)){
			marcaRojo($("#iptRfcFuncionario"));
			rfcValido = false;
		}else{
			eliminaMarcaRojo($("#iptRfcFuncionario"));
		}
	}
	
	
	if (rfcValido) {
		
		rfcFuncionario = $("#iptRfcFuncionario").val();

		var urltxt = ctx + '/funcionarios/validaRFC?rfc='+rfcFuncionario;

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
					coincide = response[1];
					//se encontraron coincidencias
					if(!coincide){
						var mensajes = response[2];
						var htmlAddMsg = '';
						for (var i = 0; i < mensajes.length; i++) {
							var element = mensajes[i];
							htmlAddMsg += element+'<br>';
						}
						$('#divMensajesC').append(htmlAddMsg);
						$('#modalCoincidencias').modal({backdrop: 'static', keyboard: false});
					}
				} else {
					//se encontro un RFC identico
//					modalCoincidencias
					$('#btnSaveFuncionario').attr('disabled',true);
					$('#divMensajesC').append(response[1]);
					$('#modalCoincidencias').modal({backdrop: 'static', keyboard: false});
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

verFuncionario = function(){
	var urltxt = ctx + '/funcionario?idFuncionario='+$('#iptIdFuncionario').val();
	window.location = urltxt;
}


asignaPermiso = function(idPermiso, activo){
	var permisoFuncionario = new Object;
	permisoFuncionario.idUsuario = $('#iptIdUsuario').val();
	permisoFuncionario.idModuloWeb = idPermiso;
	permisoFuncionario.banActivo = activo;
	
	var urltxt = ctx + '/funcionarios/updateModuloWeb';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(permisoFuncionario),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#modalPermisos').modal({backdrop: 'static', keyboard: false});
				if(idPermiso == 7){
					location.reload();
				}
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

asignaReporte = function(idPermiso, activo){
	var permisoFuncionario = new Object;
	permisoFuncionario.idUsuario = $('#iptIdUsuario').val();
	permisoFuncionario.idReporte = idPermiso;
	permisoFuncionario.banActivo = activo;
	
	var urltxt = ctx + '/funcionarios/updateReporte';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(permisoFuncionario),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#modalReportes').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}


updateFuncionario = function() {
	
	regExpRFC = /^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/;
	regexpCURP = /^[A-Z]{1}[AEIOU]{1}[A-Z]{2}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])[HM]{1}(AS|BC|BS|CC|CS|CH|CL|CM|DF|DG|GT|GR|HG|JC|MC|MN|MS|NT|NL|OC|PL|QT|QR|SP|SL|SR|TC|TS|TL|VZ|YN|ZS|NE)[B-DF-HJ-NP-TV-ZÑ]{3}[0-9A-Z]{1}[0-9]{1}$/;

	funcionarioValid = true;
		
	//Validacion de formato de RFC
	if($.trim($("#iptRfcFuncionario").val()) != ''){
		if(!$("#iptRfcFuncionario").val().toUpperCase().match(regExpRFC)){
			marcaRojo($("#iptRfcFuncionario"));
			funcionarioValid = false;
		}else{
			eliminaMarcaRojo($("#iptRfcFuncionario"));
		}
	}else{
		marcaRojo($("#iptRfcFuncionario"));
		funcionarioValid = false;
	}	
	
	//Validacion de formato de CURP
	if($.trim($("#iptCurpFuncionario").val()) != ''){
		if(!$("#iptCurpFuncionario").val().toUpperCase().match(regexpCURP)){
			marcaRojo($("#iptCurpFuncionario"));
			funcionarioValid = false;
		}else{
			eliminaMarcaRojo($("#iptCurpFuncionario"));
		}
	}else{
		marcaRojo($("#iptCurpFuncionario"));
		funcionarioValid = false;
	}	
	
	
	if (!notNull($("#iptNombresFuncionario"))) {
		funcionarioValid = false;
	}
	if (!notNull($("#iptApellidoMaternoFuncionario"))) {
		funcionarioValid = false;
	}
	if (!notNull($("#iptApellidoPaternoFuncionario"))) {
		funcionarioValid = false;
	}
	if (!notNull($("#iptNacimientoFuncionario"))) {
		funcionarioValid = false;
	}
	if (!notNull($("#iptEmail1Funcionario"))) {
		funcionarioValid = false;
	}
	if (!notNull($("#iptNssFuncionario"))) {
		funcionarioValid = false;
	}else{
		if($(iptNssFuncionario).val().length != 11){
			marcaRojo($("#iptNssFuncionario"));
			funcionarioValid = false;
		}else{
			eliminaMarcaRojo($("#iptNssFuncionario"));
		}
	}
	if (!notNull($("#iptTelefonoFuncionario"))) {
		funcionarioValid = false;
	}
	
	if (funcionarioValid) {
		var funcionario = new Object;
		var dtsFuncionario = new Object;
				
		funcionario.id = $('#iptIdFuncionario').val();
		funcionario.rfc = $('#iptRfcFuncionario').val();
		
		funcionario.workId = $('#iptWorkidFuncionario').val();
		
		funcionario.idEmpresa = $('#selectEmpresaFuncionario').val();
		funcionario.usuarioCorp = $('#iptUsuarioCorp').val();
		
		if ($("#iptCheckFuncionarioActivo").prop('checked')) {
			funcionario.banActivo = 1;
		} else {
			funcionario.banActivo = 0;
		}
		
		dtsFuncionario.nombres = $('#iptNombresFuncionario').val();
		dtsFuncionario.apellidoUno = $('#iptApellidoPaternoFuncionario').val();
		dtsFuncionario.apellidoDos = $('#iptApellidoMaternoFuncionario').val();
		
		var iniAnio = $('#iptNacimientoFuncionario').val().substring(0,4);
		var iniMes  = $('#iptNacimientoFuncionario').val().substring(5,7);
		var iniDia  = $('#iptNacimientoFuncionario').val().substring(8,10);
		dtsFuncionario.fechaNacimiento = new Date(iniAnio, iniMes-1, iniDia);
//		dtsFuncionario.fechaNacimiento = new Date(nacimientoDate[2], nacimientoDate[1] - 1, nacimientoDate[0]);
		dtsFuncionario.sexo = $('#iptSexoFuncionario').val();
		dtsFuncionario.email = $('#iptEmail1Funcionario').val();
		dtsFuncionario.emailAdicional = $('#iptEmail2Funcionario').val();
		dtsFuncionario.curp = $('#iptCurpFuncionario').val();
		dtsFuncionario.nss = $('#iptNssFuncionario').val();
		dtsFuncionario.telefono = $('#iptTelefonoFuncionario').val();
		dtsFuncionario.extencion = $('#iptExtensionFuncionario').val();
		dtsFuncionario.movil = $('#iptMovilFuncionario').val();
		dtsFuncionario.sexo = $('input:radio[name=hm]:checked').val();
		dtsFuncionario.clinica = $('#iptClinicaFuncionario').val();
		dtsFuncionario.noClinica = $('#iptNoClinicaFuncionario').val();
		
		funcionario.datosFuncionarioVO = dtsFuncionario;

		var urltxt = ctx + '/funcionarios/updateFuncionario';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(funcionario),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					$('#modalFuncionarioActualizado').modal({backdrop: 'static', keyboard: false});
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

showNewInstructor = function(){
	$('#divInstructores').hide();
	$('#divInstructoresNO').show();
}

hideNewInstructor = function(){
	$('#divInstructoresNO').hide();
	$('#divInstructores').show();
}

newInstructor = function(idUsuario, rfc, nombre, idEmpresa){
	eliminaMarcaRojo($("#iptCodigoInterno"));
	$('#iptIdInstructor').val('');
	$('#iptIdUsuario').val(idUsuario);
	$('#iptRFCInst').val(rfc);
	$('#iptNombreInst').val(nombre);
	$('#selectEmpresaInstructor').val(idEmpresa);
	$('#iptCodigoInterno').val('');
	$('#iptCheckInstructorActivo').prop('checked', true);
	$('#iptCheckInstructorActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	
	$('#modalNewFuncionario').modal({backdrop: 'static', keyboard: false});
}

updateInstructor = function(idUsuario, rfc, nombre, idEmpresa, id, activo, codigo){
	eliminaMarcaRojo($("#iptCodigoInterno"));
	$('#iptIdInstructor').val(id);
	$('#iptIdUsuario').val(idUsuario);
	$('#iptRFCInst').val(rfc);
	$('#iptNombreInst').val(nombre);
	$('#selectEmpresaInstructor').val(idEmpresa);
	$('#iptCodigoInterno').val(codigo);
	if(activo == 1){
		$('#iptCheckInstructorActivo').prop('checked', true);
		$('#iptCheckInstructorActivo').iCheck({
	        checkboxClass: 'icheckbox_minimal checked'
		});
	}else{
		$('#iptCheckInstructorActivo').prop('checked', false);
		$('#iptCheckInstructorActivo').iCheck({
	        checkboxClass: 'icheckbox_minimal'
		});
	}
	
	$('#modalNewFuncionario').modal({backdrop: 'static', keyboard: false});
}


continueNewInstructor = function(){
	
	instructorValid = true;
	
	if (!notNull($("#iptCodigoInterno"))) {
		instructorValid = false;
	}
	
	if(instructorValid){
		$('#h2NombreInst').html('');
		$('#h2RFCInst').html('');
		$('#h2CodigoInInst').html('');
		$('#h2NombreInst').append('Nombre: '+$('#iptNombreInst').val());
		$('#h2RFCInst').html('RFC: '+$('#iptRFCInst').val());
		$('#h2CodigoInInst').html('Codigo Interno: '+$('#iptCodigoInterno').val());
		

		$('#modalConfirmaInstructor').modal({backdrop: 'static', keyboard: false});
	}
	
}


saveInstructor = function(){
	var instructor = new Object;
	instructor.id = $('#iptIdInstructor').val();
	instructor.idEmpresa = $('#selectEmpresaInstructor').val();
	instructor.idUsuario = $('#iptIdUsuario').val();
	instructor.codigoEmpresa = $('#iptCodigoInterno').val();
	if($("#iptCheckInstructorActivo").prop('checked')){
		instructor.banActivo = 1;
	}else{
		instructor.banActivo = 0;
	}
	
	var urltxt = ctx + '/funcionarios/saveInstructor';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(instructor),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#modalExitoInstructor').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}


orderArribaInstructor = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenArribaInstructor?id=' + id;

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
                window.location = ctx + '/funcionarios/instructores';
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

orderAbajoInstructor = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenAbajoInstructor?id=' + id;

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
                window.location = ctx + '/funcionarios/instructores';
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


asignaPermisoEmpresa = function(idUsuarioEmpresa, banActivo){
 	
	var urltxt = ctx + '/funcionarios/updatePermisoEmpresa?idUsuarioEmpresa='+idUsuarioEmpresa+'&banActivo='+banActivo;

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
				$('#modalPermisos').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}


showModalWarningInactivo = function(){
	$('#modalFuncionarioInactivo').modal({backdrop: 'static', keyboard: false});
}

showDisabledPuesto = function(id, puesto, dealer){
	
	$('#iptIdFuncionarioPuestoD').val(id);
	$('#h4PuestoDesc').html('');
	$('#h4DealerDesc').html('');
	$('#h4PuestoDesc').append(puesto);
	$('#h4DealerDesc').append(dealer);
	
	$('#modalBajaPuesto').modal({backdrop: 'static', keyboard: false});
}

disabledPuesto = function(){
	
	var funcionarioPuestoVO = new Object;
	
	funcionarioPuestoVO.id = $('#iptIdFuncionarioPuestoD').val();
	var iniAnio = $('#iptEgresoPuesto').val().substring(0,4);
	var iniMes  = $('#iptEgresoPuesto').val().substring(5,7);
	var iniDia  = $('#iptEgresoPuesto').val().substring(8,10);
	funcionarioPuestoVO.egreso = new Date(iniAnio, iniMes-1, iniDia);
	
	var urltxt = ctx + '/funcionarios/bajaPuestoFuncionario';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(funcionarioPuestoVO),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#modalBajaPuesto').modal('hide');
				$('#modalPuestoInactivo').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

asignaPrincipal = function(id, idFuncionario){
	
	var urltxt = ctx + '/funcionarios/asignarPuestoFuncionarioPrincipal?id='+id;

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
				window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showHistorico = function (){
	$('#listaPuestos').hide();
	$('#listaPuestosHist').show();
}


cerrarHistorico = function (){
	$('#listaPuestosHist').hide();
	$('#listaPuestos').show();
}

showBajaFuncionario = function(){
	
	$('#modalBajaFuncionario').modal({backdrop: 'static', keyboard: false});

}

bajaFuncionario = function(){
	var funcionarioVO = new Object;
	
	funcionarioVO.id = $('#iptIdFuncionario').val();
//	funcionarioVO.egreso = $('#iptEgresoFuncionario').val();
	
	var iniAnio = $('#iptEgresoFuncionario').val().substring(0,4);
	var iniMes  = $('#iptEgresoFuncionario').val().substring(5,7);
	var iniDia  = $('#iptEgresoFuncionario').val().substring(8,10);
	funcionarioVO.egreso = new Date(iniAnio, iniMes-1, iniDia);
	
	var urltxt = ctx + '/funcionarios/bajaFuncionario';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(funcionarioVO),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#modalBajaFuncionario').modal('hide');
				$('#modalFuncionarioInactivo').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

reingresoFuncionario = function(){
	eliminaMarcaRojo($("#selecDealerReingreso"));
	eliminaMarcaRojo($("#selecPuestoReingreso"));
	eliminaMarcaRojo($("#iptCartaLiberacionFile"));
	eliminaMarcaRojo($("#iptValidacionGerenteFile"));
	$('#selectEmpresaFuncionarioReingreso').val($("#iptEmpresaActual").val());
	getSelectsNewEmpresa($("#iptEmpresaActual").val());
	
	$('#modalReingreso').modal({backdrop: 'static', keyboard: false});
}


getPuestosAdicional = function(){
	var grupoPuestoSelected = $('#selecGrupoPuesto').val();
	var idDealer = $('#selecDealer').val();
	var idFuncionario = $('#iptIdFuncionario').val();
	$('#selecPuesto').html('');

	if(grupoPuestoSelected > 0){
		var urltxt = ctx+"/funcionarios/getPuestosAdic?idGrupoPuesto="+grupoPuestoSelected+'&idDealer='+idDealer+'&idFuncionario='+idFuncionario;
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
						htmlAdd += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
					}
					$('#selecPuesto').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecPuesto').append(htmlAdd);
				}
			},
			error : function(msg) {
//				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecPuesto').append(htmlAdd);
	}
}

onChangeDealerAdiconal = function(){
	if($('#selecDealer').val() == 0){
		$('#selecGrupoPuesto').val(0);
		$('#selecPuesto').html('');
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecPuesto').append(htmlAdd);
		$('#selecGrupoPuesto').prop('disabled', true);
	}else{
		$('#selecGrupoPuesto').val(0);
		$('#selecPuesto').html('');
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecPuesto').append(htmlAdd);
		$('#selecGrupoPuesto').prop('disabled', false);
	}
}

getDealerAdicional = function(){
	var grupoDealerSelected = $('#selecGrupoDealer').val();
	$('#selecDealer').html('');
	$('#selecGrupoPuesto').val(0);
	$('#selecPuesto').html('');
	$('#selecPuesto').append('<option value="0" selected="selected">Seleccione...</option>');
	$('#selecGrupoPuesto').prop('disabled', true);
	
	if(grupoDealerSelected > 0){
		var urltxt = ctx+"/funcionarios/getDealer?idGrupoDealer="+grupoDealerSelected;
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
						htmlAdd += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
					}
					$('#selecDealer').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecDealer').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecDealer').append(htmlAdd);

	}
}

verDocumentoFuncionario = function(nombre, idIngreso){
	var urltxt = ctx+"/funcionarios/documento?param="+nombre+'&param2='+idIngreso; 
	window.open(urltxt, '_blank');
}

autorizaReingreso = function(idReingreso, idFuncionario){

		var urltxt = ctx+"/funcionarios/autorizaReingreso?idIngreso="+idReingreso;
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
					window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
}

rechazaReingreso = function(idReingreso, idFuncionario){

	var urltxt = ctx+"/funcionarios/rechazaReingreso?idIngreso="+idReingreso;
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
				window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}


getDealerReingreso = function(){
	var grupoDealerSelected = $('#selecGrupoDealerReingreso').val();
	$('#selecDealerReingreso').html('');

	if(grupoDealerSelected > 0){
		var urltxt = ctx+"/funcionarios/getDealer?idGrupoDealer="+grupoDealerSelected;
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
						htmlAdd += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
					}
					$('#selecDealerReingreso').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecDealerReingreso').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecDealerReingreso').append(htmlAdd);
	}
}

getPuestosReingreso = function(){
	var grupoPuestoSelected = $('#selecGrupoPuestoReingreso').val();
	$('#selecPuestoReingreso').html('');

	if(grupoPuestoSelected > 0){
		var urltxt = ctx+"/funcionarios/getPuestos?idGrupoPuesto="+grupoPuestoSelected;
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
						htmlAdd += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
					}
					$('#selecPuestoReingreso').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecPuestoReingreso').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecPuestoReingreso').append(htmlAdd);
	}
}

solicitaReingreso = function(){
	validacionReingreso = true;
	
	
	if ($('#selectEmpresaFuncionarioReingreso').val() == 0) {
		validacionReingreso = false;
		marcaRojo($("#selectEmpresaFuncionarioReingreso"));
	}else{
		eliminaMarcaRojo($("#selectEmpresaFuncionarioReingreso"));
	}
	
	if ($('#selecDealerReingreso').val() == 0) {
		validacionReingreso = false;
		marcaRojo($("#selecDealerReingreso"));
	}else{
		eliminaMarcaRojo($("#selecDealerReingreso"));
	}
	
	if ($('#selecPuestoReingreso').val() == 0) {
		validacionReingreso = false;
		marcaRojo($("#selecPuestoReingreso"));
	}else{
		eliminaMarcaRojo($("#selecPuestoReingreso"));
	}
	
	
	if(validacionReingreso){
		
		var urltxt = ctx + '/funcionarios/solicitaReingreso';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formReingresoDocumento")),
			enctype : 'multipart/form-data',
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				var result = response[0];
				if (result) {
					$('#modalReingreso').modal('hide');
					window.location = ctx + '/funcionario?idFuncionario='+$('#iptIdFuncionario').val();
				} else {
					$('#modalReingreso').modal('hide');
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalReingreso').modal('hide');
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
	
	
}

funcionarioRevisado = function(idFuncionario){
	var urltxt = ctx + '/funcionarios/validaFuncionario?idFuncionario='+idFuncionario;
	
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
				window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}




validaSize = function(element){
	if(element.files[0].size > 1200000){
		element.value = "";
		$('#modalTamanioExedido').modal({backdrop: 'static', keyboard: false});
	}
}


getSelectsNewEmpresa = function(){
	$('#selecGrupoPuestoReingreso').html('');
	$('#selecGrupoDealerReingreso').html('');
	$('#selecPuestoReingreso').html('');
	$('#selecDealerReingreso').html('');
	var empresaSelected = $('#selectEmpresaFuncionarioReingreso').val();
	
	if(empresaSelected > 0){
		var urltxt = ctx+"/funcionarios/getSelectsEmpresaF?idEmpresa="+empresaSelected;
		
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
					var htmlAddGpoDealer = '<option value="0" selected="selected">Seleccione...</option>';
					var htmlAddGpoPuesto = '<option value="0" selected="selected">Seleccione...</option>';
//					grupos de puestos 
					var gpoPuestos = response[2];
					for (var i = 0; i < gpoPuestos.length; i++) {
						var element = gpoPuestos[i];
						htmlAddGpoPuesto += '<option value="'+element.id+'" >' + element.descripcion + '</option>';
					}
					
//					grupos de dealers
					var gpoDealers = response[1];
					for (var i = 0; i < gpoDealers.length; i++) {
						var element = gpoDealers[i];
						htmlAddGpoDealer += '<option value="'+element.id+'" >' + element.agrupacion + '</option>';
					}
					
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecGrupoPuestoReingreso').append(htmlAddGpoPuesto);
					$('#selecGrupoDealerReingreso').append(htmlAddGpoDealer);
					$('#selecPuestoReingreso').append(htmlAdd);
					$('#selecDealerReingreso').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecGrupoPuestoReingreso').append(htmlAdd);
					$('#selecGrupoDealerReingreso').append(htmlAdd);
					$('#selecPuestoReingreso').append(htmlAdd);
					$('#selecDealerReingreso').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
		if($('#iptEmpresaActual').val() == empresaSelected){
			if($('#iptSolicitaDoc').val() == 'true'){
				$('#divDocumentosReingreso').show();
			}
		}else{
			if($('#iptSolicitaDoc').val() == 'true'){
				$('#divDocumentosReingreso').hide();
			}
		}
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecGrupoPuestoReingreso').append(htmlAdd);
		$('#selecGrupoDealerReingreso').append(htmlAdd);
		$('#selecPuestoReingreso').append(htmlAdd);
		$('#selecDealerReingreso').append(htmlAdd);
	}
	
}


validarAltaPuesto = function(id, idFuncionario){
	
	var urltxt = ctx + '/funcionarios/validaPuesto?idFuncionarioPuesto='+id;

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
				window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showRechazarAltaPuesto= function(id){
	$('#iptIdFPRechazo').val(id);
	$('#modalConfirmaRechazoPuesto').modal({backdrop: 'static', keyboard: false});
}

rechazarAltaPuesto = function(){
	
	
	rechazoPuestoValido = true;
	
	if (!notNull($("#motivoRechazoPuesto"))) {
		rechazoPuestoValido = false;
	}
	
	if(rechazoPuestoValido){
		idFuncionario = $('#iptIdFuncionario').val();
		motivoRechazo = $('#motivoRechazoPuesto').val();
		idFuncionarioPuesto = $('#iptIdFPRechazo').val();

		var urltxt = ctx + '/funcionarios/rechazaPuesto?idFuncionarioPuesto='+idFuncionarioPuesto+'&motivo='+motivoRechazo;;

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
					window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
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


validarBajaPuesto = function(id, idFuncionario){
	
	var urltxt = ctx + '/funcionarios/validaBajaPuesto?idFuncionarioPuesto='+id;

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
				window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showRechazarBajaPuesto = function(id){
	$('#iptIdFPBajaRechazo').val(id);
	$('#modalConfirmaRechazoBajaPuesto').modal({backdrop: 'static', keyboard: false});
}

rechazarBajaPuesto = function(id, idFuncionario){
	
	rechazoPuestoValido = true;
	
	if (!notNull($("#motivoRechazoBajaPuesto"))) {
		rechazoPuestoValido = false;
	}
	
	if(rechazoPuestoValido){
		idFuncionario = $('#iptIdFuncionario').val();
		motivoRechazo = $('#motivoRechazoBajaPuesto').val();
		idFuncionarioPuesto = $('#iptIdFPBajaRechazo').val();
		
		var urltxt = ctx + '/funcionarios/rechazaBajaPuesto?idFuncionarioPuesto='+idFuncionarioPuesto+'&motivo='+motivoRechazo;

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
					window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
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


showFuncionarioRechazado = function(){
	$('#modalConfirmaRechazoFuncionario').modal({backdrop: 'static', keyboard: false});
}

funcionarioRechazado = function(){
	
	rechazoValido = true;
	
	if (!notNull($("#motivoRechazoFuncionario"))) {
		rechazoValido = false;
	}
	
	if(rechazoValido){
		idFuncionario = $('#iptIdFuncionario').val();
		motivoRechazo = $('#motivoRechazoFuncionario').val();
		var urltxt = ctx + '/funcionarios/rechazaFuncionario?idFuncionario='+idFuncionario+'&motivo='+motivoRechazo;
		
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
					window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
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

verHistoricoDatos = function(){
	$('#divHistDatos').show();
}


///Baja de funcionario
funcionarioBajaAceptado = function(idFuncionario){
	var urltxt = ctx + '/funcionarios/validaBajaFuncionario?idFuncionario='+idFuncionario;
	
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
				window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showFuncionarioBajaRechazado = function(){
	$('#modalConfirmaRechazoBajaFuncionario').modal({backdrop: 'static', keyboard: false});
}

funcionarioBajaRechazado = function(){
	
	rechazoBajaValido = true;
	
	if (!notNull($("#motivoRechazoBajaFuncionario"))) {
		rechazoBajaValido = false;
	}
	
	if(rechazoBajaValido){
		idFuncionario = $('#iptIdFuncionario').val();
		motivoRechazo = $('#motivoRechazoBajaFuncionario').val();
		var urltxt = ctx + '/funcionarios/rechazaBajaFuncionario?idFuncionario='+idFuncionario+'&motivo='+motivoRechazo;
		
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
					window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
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


//Modificacion funcionario
funcionarioModificadoAceptado = function(idFuncionario){
	var urltxt = ctx + '/funcionarios/validaCambio?idFuncionario='+idFuncionario;
	
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
				window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showFuncionarioModificadoRechazado = function(idDtsHist){
	$('#iptIdHistDts').val(idDtsHist);
	$('#modalConfirmaRechazoModificacion').modal({backdrop: 'static', keyboard: false});
}

funcionarioModificadoRechazado = function(){
	
	rechazoModificacionValido = true;
	
	if (!notNull($("#motivoRechazoModificacion"))) {
		rechazoModificacionValido = false;
	}
	
	if(rechazoModificacionValido){
		idFuncionario = $('#iptIdFuncionario').val();
		motivoRechazo = $('#motivoRechazoModificacion').val();
		idDtsHist = $('#iptIdHistDts').val();
		var urltxt = ctx + '/funcionarios/regresaCambio?idDtsHist='+idDtsHist+'&motivo='+motivoRechazo;
		
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
					window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
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

showActualizaPeriodo = function(){
	$('#btnPeriodoPrueba').show();
}

updatePeriodoPrueba = function(){
	idFuncionario = $('#iptIdFuncionario').val();
	periodoPrueba = $('#iptPeriodoPrueba').val();
	var urltxt = ctx + '/funcionarios/updatePeriodoPrueba?idFuncionario='+idFuncionario+'&periodoPrueba='+periodoPrueba;
	
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
				window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}



aplicaPeriodo = function(idFuncionarioPuesto, activo){
	idFuncionario = $('#iptIdFuncionario').val();
	var funcionarioPuesto = new Object;
	funcionarioPuesto.id = idFuncionarioPuesto
	funcionarioPuesto.aplicaPeriodo = activo;
	
	var urltxt = ctx + '/funcionarios/aplicaPeriodoPrueba';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(funcionarioPuesto),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showActualizaWorkId = function(){
	$('#btnWorkId').show();
}


updateWorkId = function(){
	idFuncionario = $('#iptIdFuncionario').val();
	workId = $('#iptWorkidFuncionario').val();
	var urltxt = ctx + '/funcionarios/updateWorkId?idFuncionario='+idFuncionario+'&workId='+workId;
	
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
				window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

function descargarCatInstructores() {
	window.open(ctx + '/catalogo/descargarInstructores');
}
function descargarCatFuncionarios() {
	window.open(ctx + '/catalogo/descargarFuncionarios');
}


function showCambiaContrasenia(){
	$('#modalNuevaContrasenia').modal({backdrop: 'static', keyboard: false});
}

function validaNuevaContrasenia(){

	contrasenia = $('#iptNewPwd').val();
	confimaContrasenia = $('#iptConfirmNewPwd').val();
	validacionPwd = true;
	$('#h1ErrorDatosObligatoriosPwd').hide();
	$('#h1ErrorCoincidenciaPwd').hide();
	
	
	
	if (!notNull($("#iptNewPwd"))) {
		validacionPwd = false;
	}
	
	if (!notNull($("#iptConfirmNewPwd"))) {
		validacionPwd = false;
	}
	
	if(validacionPwd){
		if(contrasenia != confimaContrasenia){
			$('#h1ErrorCoincidenciaPwd').show();
			$('#modalErrorNuevaContrasenia').modal({backdrop: 'static', keyboard: false});
		}else{
			$('#modalConfirmaNuevaContrasenia').modal({backdrop: 'static', keyboard: false});
		}
	}else{
		$('#h1ErrorDatosObligatoriosPwd').show();
		$('#modalErrorNuevaContrasenia').modal({backdrop: 'static', keyboard: false});
	}
	
}


function nuevaContrasenia(){

	$('#modalConfirmaNuevaContrasenia').modal('hide');
	
	contrasenia = $('#iptNewPwd').val();
	idUsuario = $('#iptIdUsuario').val();
	
	var urltxt = ctx + '/funcionarios/updatePassword?idUsuario='+idUsuario+'&contrasenia='+contrasenia;
	
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
				$('#modalNuevaContrasenia').modal('hide');
				$('#modalExitoNuevaContrasenia').modal({backdrop: 'static', keyboard: false});
				
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}


showCambiaRFC = function(){
	$('#modalActualizaRFC').modal({backdrop: 'static', keyboard: false});
}

validarNuevoRFC = function(){

	nuevoRfcValido = true;
	$('#divMensajesC').html('');
	regExpRFC = /^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/;
	
	//Validacion de formato de RFC
	if($.trim($("#iptNuevoRfcFuncionario").val()) != ''){
		if(!$("#iptNuevoRfcFuncionario").val().toUpperCase().match(regExpRFC)){
			marcaRojo($("#iptRfcFuncionario"));
			nuevoRfcValido = false;
		}else{
			eliminaMarcaRojo($("#iptNuevoRfcFuncionario"));
		}
	}
	
	if(nuevoRfcValido){
		rfcFuncionario = $("#iptNuevoRfcFuncionario").val();
		rfcFuncionarioOld = $("#iptRfcFuncionario").val();
		

		var urltxt = ctx + '/funcionarios/validaNuevoRFC?rfc='+rfcFuncionario+'&rfcOld='+rfcFuncionarioOld;

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
					coincide = response[1];
					//se encontraron coincidencias
					if(!coincide){
						var mensajes = response[2];
						var htmlAddMsg = '';
						for (var i = 0; i < mensajes.length; i++) {
							var element = mensajes[i];
							htmlAddMsg += element+'<br>';
						}
						$('#divMensajesC').append(htmlAddMsg);
						$('#modalCoincidencias').modal({backdrop: 'static', keyboard: false});
					}else{
						$('#modalRFCNuevo').modal({backdrop: 'static', keyboard: false});
					}
				} else {
					mensaje = response[1];
					activo = response[2];
					if(activo){
						//El usuario se encuentra activo
						mismaEmpresa = response[3];
						if(mismaEmpresa){
							//Se puede hacer el merge
							$('#divMensajesMerge').append(mensaje);
							$('#modalRFCMerge').modal({backdrop: 'static', keyboard: false});
							
						}else{
							//Tiene que pertenecer a la misma empresa
							$('#usuarioDiferenteEmpresaRFC').modal({backdrop: 'static', keyboard: false});
							$('#hiTextOtraEmpresa').append("El rfc ya se encutnra registrado para la empresa "+response[4]);
						}
					}else{
						//el usuario debe ser activo para continuar
						$('#usuarioInactivoRFC').modal({backdrop: 'static', keyboard: false});
					}
					
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
	// /funcionarios/validaNuevoRFC

	
}


function actualizaRFC(){

	rfcFuncionario = $("#iptNuevoRfcFuncionario").val();
	rfcFuncionarioOld = $("#iptRfcFuncionario").val();
	
	
	var urltxt = ctx + '/funcionarios/actualizaRFC?rfc='+rfcFuncionario+'&rfcOld='+rfcFuncionarioOld;
	
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
				$('#modalRFCNuevo').modal('hide');
				$('#modalActualizaRFC').modal('hide');
				$('#modalExitoRFC').modal({backdrop: 'static', keyboard: false});
				
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

function mergeRFC(){

	rfcFuncionario = $("#iptNuevoRfcFuncionario").val();
	rfcFuncionarioOld = $("#iptRfcFuncionario").val();
	
	
	var urltxt = ctx + '/funcionarios/mergeRFC?rfc='+rfcFuncionario+'&rfcOld='+rfcFuncionarioOld;
	
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
				$('#modalRFCNuevo').modal('hide');
				$('#modalRFCMerge').modal('hide');
				$('#modalExitoRFC').modal({backdrop: 'static', keyboard: false});
				
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}



updateDocumento = function(tipoDocumento, idFuncionario){
	
	justificacionValid = true; 
	$('#h4Msj').html('');
	$('#h4Msj').append('Cancelación exitosa');
	var justifFile = $("#justifFile").prop("files")[0];
		
	var fd = new FormData();
	fd.append("iptIdInscripcion", $('#iptIdInscripcionCanc').val());
	fd.append("iptIdMotivo", $('#selectMotivoCancelacion').val());
	fd.append("iptFileJustif", justifFile);
	
	var urltxt = ctx + '/calendario/cancelacionJustificadaInscripcion';
	
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
				$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
				$('#modalDetalleInscritos').modal('hide');
				$('#modalAdvertenciaCancelacion').modal('hide');
			}else{
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});

}


showUpdateRfcImg = function(){
	$("#rfcFile").val(null);
	eliminaMarcaRojo($("#rfcFile"));
	$('#modalUpdateDocRFC').modal({backdrop: 'static', keyboard: false});
} 

showUpdateCURPImg = function(){
	$("#curpFile").val(null);
	eliminaMarcaRojo($("#curpFile"));
	$('#modalUpdateDocCURP').modal({backdrop: 'static', keyboard: false});
} 


updateDocumentoRFC = function(){

	documentoValid = true;
	var documentoFile = $("#rfcFile").prop("files")[0];
	
	if(documentoFile == null){
		documentoValid = false;
		marcaRojo($("#rfcFile"));
	}else{
		eliminaMarcaRojo($("#rfcFile"));
	}
	
	if(documentoValid){
		var fd = new FormData();
		
		fd.append("documentoFile", documentoFile);
		fd.append("idFuncionario", $('#iptIdFuncionario').val());
		fd.append("tipoDoc", "rfc");
		
		
		var urltxt = ctx + '/funcionarios/updateDocumentoFuncionario';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : fd,
			enctype : 'multipart/form-data',			
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					$('#modalDocumentoActualizado').modal({backdrop: 'static', keyboard: false});
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


updateDocumentoCURP = function(){

	documentoValid = true;
	var documentoFile = $("#curpFile").prop("files")[0];
	
	if(documentoFile == null){
		documentoValid = false;
		marcaRojo($("#curpFile"));
	}else{
		eliminaMarcaRojo($("#curpFile"));
	}
	
	if(documentoValid){
		var fd = new FormData();
		
		fd.append("documentoFile", documentoFile);
		fd.append("idFuncionario", $('#iptIdFuncionario').val());
		fd.append("tipoDoc", "curp");
		
		
		var urltxt = ctx + '/funcionarios/updateDocumentoFuncionario';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : fd,
			enctype : 'multipart/form-data',			
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					$('#modalDocumentoActualizado').modal({backdrop: 'static', keyboard: false});
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


asignaPermisoEmpresaInst = function(idUsuarioEmpresa, banActivo){
 	
	var urltxt = ctx + '/funcionarios/updatePermisoEmpresaInst?idUsuarioEmpresa='+idUsuarioEmpresa+'&banActivo='+banActivo;

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
				$('#modalPermisos').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

openConfirmaReinscripcion = function(idInscripcion, curso, inicio, fin){
	$('#h4CursoR').html('');
	$('#h4CursoR').append('Curso: ');
	$('#h4CursoR').append(curso);
	$('#h4InicioR').html('');
	$('#h4InicioR').append('Inicio: ');
	$('#h4InicioR').append(inicio);
	$('#h4FinR').html('');
	$('#h4FinR').append('Fsin: ');
	$('#h4FinR').append(fin);
	$('#idReinscripcion').val(idInscripcion);
	$('#modalConfirmaReInscripcion').modal({backdrop: 'static', keyboard: false});
	
}

reinscribeFuncionario = function(){
	
	idInscripcion = $('#idReinscripcion').val();
	
	var urltxt = ctx + '/calendario/reinscribirCurso?param='+idInscripcion;
	
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
			$('#h4Msj').html('');
			$('#h4Msj').append('Funcionario Re-Inscrito');
			$('#modalConfirmaReInscripcion').modal('hide');
			$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
		},
		error : function(msg) {
			alert('Error alert');
		}
	});

}

openCancela = function(idInscripcion){
	eliminaMarcaRojo($("#selectMotivoCancelacion"));
	$('#iptIdInscripcionCanc').val(idInscripcion);
	$('#modalAdvertenciaCancelacion').modal({backdrop: 'static', keyboard: false});
}

changeTipoCancelacion = function(){
	if($('#selectTipoCancelacion').val() == 11) {
		$('#divDocumentoJustificado').show();
	}else{
		$('#divDocumentoJustificado').hide();
	}
}


cancelaInscripcion = function(){
	
	cancelacionInsValida = true;
	
	idInscripcion = $('#iptIdInscripcionCanc').val();
	idAgenda = $('#iptAgendaIdEdit').val();
	if ($('#selectMotivoCancelacion').val() > 0) {
		eliminaMarcaRojo($("#selectMotivoCancelacion"));
	}else{
		marcaRojo($("#selectMotivoCancelacion"));
		cancelacionInsValida = false;
	}
	
	if($('#selectTipoCancelacion').val() == 11){
		var justifFile = $("#justifFile").prop("files")[0]; 
		if(justifFile == null){
			cancelacionInsValida = false;
			marcaRojo($("#justifFile"));
		}else{
			eliminaMarcaRojo($("#justifFile"));
		}
	}
	
	if(cancelacionInsValida){
		if ($('#selectTipoCancelacion').val() == 11) {
			cancelacionJustificada(idInscripcion,idAgenda);
		}else{
			var tipoCancelacion = $('#selectTipoCancelacion').val();
			actualizaEstatusInscripcion(idInscripcion, tipoCancelacion, idAgenda);
		}
	}else{
		$('#modalMotivoObligatorio').modal({backdrop: 'static', keyboard: false});
	}

	
}

actualizaEstatusInscripcion = function(idInscripcion, idEstatus, idAgenda){
	
	estatusValid = true; 
	
	$('#h4Msj').html('');
	if(idEstatus == 4 || idEstatus == 10){
		$('#h4Msj').append('Cancelación exitosa');
		if ($('#selectMotivoCancelacion').val() > 0) {
			eliminaMarcaRojo($("#selectMotivoCancelacion"));
		}else{
			marcaRojo($("#selectMotivoCancelacion"));
			estatusValid = false;
		}
	}else if(idEstatus == 2){
		$('#h4Msj').append('Inscripción exitosa');
	}else if(idEstatus == 3){
		$('#h4Msj').append('Inscripcion rechazada');
	}
	
	if(estatusValid){
	
		var iniAnio = $('#iptFechaCancela').val().substring(0,4);
		var iniMes  = $('#iptFechaCancela').val().substring(5,7);
		var iniDia  = $('#iptFechaCancela').val().substring(8,10);
		var fechaC = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
		
		obs = "";
		var urltxt = ctx + '/calendario/udateEstatusInscripcion?idInscripcion='+idInscripcion+'&idEstatus='+idEstatus+'&idMotivo='+$('#selectMotivoCancelacion').val()+'&fechaC='+fechaC+'&observaciones='+obs;
		
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
				$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
				$('#modalDetalleInscritos').modal('hide');
				$('#modalAdvertenciaCancelacion').modal('hide');
				$('#modalRechazaInsc').modal('hide');
				
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		$('#modalMotivoObligatorio').modal({backdrop: 'static', keyboard: false});
	}

}

cancelacionJustificada = function(idInscripcion, idAgenda){
	
	justificacionValid = true; 
	$('#h4Msj').html('');
	$('#h4Msj').append('Cancelación exitosa');
	var justifFile = $("#justifFile").prop("files")[0];
		
	var iniAnio = $('#iptFechaCancela').val().substring(0,4);
	var iniMes  = $('#iptFechaCancela').val().substring(5,7);
	var iniDia  = $('#iptFechaCancela').val().substring(8,10);
	var fechaC = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	
	var fd = new FormData();
	fd.append("iptIdInscripcion", $('#iptIdInscripcionCanc').val());
	fd.append("iptIdMotivo", $('#selectMotivoCancelacion').val());
	fd.append("iptFileJustif", justifFile);
	fd.append("iptFechaCancela",fechaC);
	fd.append("iptObservaciones",$('#iptObservaciones').val());
	
	var urltxt = ctx + '/calendario/cancelacionJustificadaInscripcion';
	
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
				$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
				$('#modalDetalleInscritos').modal('hide');
				$('#modalAdvertenciaCancelacion').modal('hide');
				$('#modalRechazaInsc').modal('hide');
			}else{
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});

}


validarCambioPuesto = function(id, idFuncionario){
	
	var urltxt = ctx + '/funcionarios/validaCambioPuesto?idFuncionarioPuesto='+id;

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
				window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showRechazarCambioPuesto= function(id){
	$('#iptIdFPRechazoC').val(id);
	$('#modalConfirmaRechazoCambioPuesto').modal({backdrop: 'static', keyboard: false});
}

rechazarCambioPuesto = function(){
	
	
	rechazoPuestoValido = true;
	
	if (!notNull($("#motivoRechazoCambioPuesto"))) {
		rechazoPuestoValido = false;
	}
	
	if(rechazoPuestoValido){
		idFuncionario = $('#iptIdFuncionario').val();
		motivoRechazo = $('#motivoRechazoCambioPuesto').val();
		idFuncionarioPuesto = $('#iptIdFPRechazoC').val();

		var urltxt = ctx + '/funcionarios/rechazaCambioPuesto?idFuncionarioPuesto='+idFuncionarioPuesto+'&motivo='+motivoRechazo;;

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
					window.location = ctx + '/funcionario?idFuncionario='+idFuncionario;
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