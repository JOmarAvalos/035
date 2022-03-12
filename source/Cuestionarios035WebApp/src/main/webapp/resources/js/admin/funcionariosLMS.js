newFuncionario = function() {
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
	eliminaMarcaRojo($("#iptWorkidFuncionario"));
	
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
	
	$('#rowSelectExtranjero').show();
	$('#rowDocumentoExtranjero').show();
	$('#rowIdDocumento').show();
	$('#rowDocumentoRFC').show();
	$('#rowDocumentoCURP').show();
	
	$('#btnSaveFuncionario').show();
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
	
	if (!notNull($("#iptWorkidFuncionario"))) {
		funcionarioValid = false;
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
	
	if (funcionarioValid) {
		
		$('#btnExitFuncionarioFooter').hide();
		$('#btnExitFuncionarioHeader').hide();
		$('#btnSaveFuncionario').hide();
		var funcionario = new Object;
		var dtsFuncionario = new Object;
				
		funcionario.rfc = $('#iptRfcFuncionario').val();
		funcionario.workId = $('#iptWorkidFuncionario').val();
		
		funcionario.banExtranjero = $('#selectExtranjero').val();
		
		dtsFuncionario.nombres = $('#iptNombresFuncionario').val();
		dtsFuncionario.apellidoUno = $('#iptApellidoPaternoFuncionario').val();
		dtsFuncionario.apellidoDos = $('#iptApellidoMaternoFuncionario').val();
		
		var iniAnio = $('#iptNacimientoFuncionario').val().substring(0,4);
		var iniMes  = $('#iptNacimientoFuncionario').val().substring(5,7);
		var iniDia  = $('#iptNacimientoFuncionario').val().substring(8,10);
		dtsFuncionario.fechaNacimiento = new Date(iniAnio, iniMes-1, iniDia);
		
//		dtsFuncionario.fechaNacimiento = $('#iptNacimientoFuncionario').val();
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
		
		//Form para mandar tambien imagenes		   
		var fd = new FormData();		
		fd.append("extranjeroFile", extranjeroFile);
		fd.append("rfcFile", rfcFile);
		fd.append("curpFile", curpFile);
		fd.append("funcionario", JSON.stringify(funcionario));
		

		var urltxt = ctx + '/lms/funcionarios/saveFuncionario';

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
					$('#iptIdFuncionarioNuevo').val(response[1]);
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
					$('#btnSaveFuncionario').attr('disabled',true);
					$('#iptClinicaFuncionario').attr('disabled',true);
					$('#iptNoClinicaFuncionario').attr('disabled',true);
					$('#divPuestosFuncionario').show();
					$('#divDatosAdicinalesF').hide();
					//Rows de archivos
					$('#rowSelectExtranjero').hide();
					$('#rowDocumentoExtranjero').hide();
					$('#rowIdDocumento').hide();
					$('#rowDocumentoRFC').hide();
					$('#rowDocumentoCURP').hide();
					$('#modalFuncionarioCreado').modal({backdrop: 'static', keyboard: false});
				} else {
					$('#btnExitFuncionarioFooter').show();
					$('#btnExitFuncionarioHeader').show();
					$('#btnSaveFuncionario').show();
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#btnExitFuncionarioFooter').show();
		$('#btnExitFuncionarioHeader').show();
		$('#btnSaveFuncionario').show();
	    $('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

modalFuncionario = function() {

	$('#modalInfoFuncionario').modal('show');			
}

modalAsignarGrupo = function() {

	$('#modalAsignarGrupo').modal('show');			
}

getPuestos = function(){
	var grupoPuestoSelected = $('#selecGrupoPuesto').val();
	$('#selecPuesto').html('');

	if(grupoPuestoSelected > 0){
		var urltxt = ctx+"/lms/funcionarios/getPuestos?idGrupoPuesto="+grupoPuestoSelected;
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

asignarPuesto = function() {
	validacion = true;
	
	if ($('#selecPuesto').val() == 0) {
		marcaRojo($("#selecPuesto"));
		validacion = false;
	}
	if ($('#selecDealer').val() == 0) {
		marcaRojo($("#selecPuesto"));
		validacion = false;
	}
	
	if (validacion) {
		var funcionarioPuestoVO = new Object;
		funcionarioPuestoVO.idFuncionario=$('#iptIdFuncionarioNuevo').val();
		funcionarioPuestoVO.idPuesto = $('#selecPuesto').val();
		funcionarioPuestoVO.idDealer = $('#selecDealer').val();
		funcionarioPuestoVO.idGrupoDealer = $('#iptGrupoDealer').val();
//		funcionarioPuestoVO.ingreso = $('#iptIngresoPuesto').val();
		
		var iniAnio = $('#iptIngresoPuesto').val().substring(0,4);
		var iniMes  = $('#iptIngresoPuesto').val().substring(5,7);
		var iniDia  = $('#iptIngresoPuesto').val().substring(8,10);
		funcionarioPuestoVO.ingreso = new Date(iniAnio, iniMes-1, iniDia);

		
		if ($("#iptCheckPuestoPrincipal").prop('checked')) {
			funcionarioPuestoVO.banPrincipal = 1;
		} else {
			funcionarioPuestoVO.banPrincipal = 0;
		}

		var urltxt = ctx + '/lms/funcionarios/asignarPuestoFuncionario';
		
		

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
	$('#divNuevoPuesto').show();
}

cancelaNuevoPuesto = function(){
	$('#divNuevoPuesto').hide();
	$('#listaPuestos').show();
}



viewFuncionario = function(){
	getPagination('#table-adicionales');
	$('#edit-funcionario').modal({backdrop: 'static', keyboard: false});
}

validaRFC = function() {
	
	rfcValido = true;
	$('#btnSaveFuncionario').show();
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

		var urltxt = ctx + '/lms/funcionarios/validaRFC?rfc='+rfcFuncionario;

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
					$('#btnSaveFuncionario').hide();
					var mensaje = response[1]
					var activo = response[2];
					if(activo){
						$('#btnSolicitaReingreso').hide();
						$('#divMensajesC').append(mensaje);
						$('#modalCoincidencias').modal({backdrop: 'static', keyboard: false});
					}else{
						var funcionarioVO = response[3];
						
						$('#pRFCReingreso').html('');
						$('#pNombre').html('');
						$('#pGrupoDealer').html('');
						$('#iptIdFuncionarioReingreso').val(funcionarioVO.id);
						$('#pRFCReingreso').append('RFC: '+funcionarioVO.rfc);
						$('#pNombre').append('Nombre: '+funcionarioVO.datosFuncionarioVO.nombres+' '+funcionarioVO.datosFuncionarioVO.apellidoUno+' '+funcionarioVO.datosFuncionarioVO.apellidoDos);
						$('#pGrupoDealer').append('Grupo: '+funcionarioVO.auxGrupoDealer);
						$('#btnSolicitaReingreso').show();
						$('#divMensajesC').append(mensaje);
						$('#modalCoincidencias').modal({backdrop: 'static', keyboard: false});
					}
					
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	} else {
		$('#modalErrorFormato').modal({backdrop: 'static', keyboard: false});
	}
}

getFuncionario = function(idFuncionario, idUsuario, locale){
	
	if(idFuncionario == idUsuario){
		$('#btnBajaFuncionario').hide();
		$('#btnEditFuncionario').show();
		$('#btnCerrarFuncionario').show();
		$('#btnNuevoPuesto').show();
	}else{
		$('#btnEditFuncionario').show();
		$('#btnBajaFuncionario').show();
		$('#btnCerrarFuncionario').show();
		$('#btnNuevoPuesto').show();
	}
	$('#divInfoFuncionarioCard').show();
	$('#divEditFuncionarioCard').hide();
	
	$('#selecGrupoPuestoAdicional').val(0);
	$('#selecPuestoAdicional').html('');
	
	if(locale == 'es') {
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecPuestoAdicional').append(htmlAdd);
	} else if (locale == 'fr') {
		var htmlAdd = '<option value="0" selected="selected">Sélectionner...</option>';
		$('#selecPuestoAdicional').append(htmlAdd);
	} else if (locale == 'en') {
		var htmlAdd = '<option value="0" selected="selected">Select...</option>';
		$('#selecPuestoAdicional').append(htmlAdd);
	} else {
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecPuestoAdicional').append(htmlAdd);
	}
	
	$('#selecGrupoPuestoAdicional').prop('disabled', true);
	$('#divPuestoAdicional').hide();
	$('#divRowCursosPendientes').hide();
	
	$('#iptNombresFuncionarioEdit').val('');
	$('#iptApellidoPaternoFuncionarioEdit').val('');
	$('#iptApellidoMaternoFuncionarioEdit').val('');
	$('#iptNacimientoFuncionarioEdit').val('');
	$('#iptCurpFuncionarioEdit').val('');
	$('#iptEmail1FuncionarioEdit').val('');
	$('#iptEmail2FuncionarioEdit').val('');
	$('#iptNssFuncionarioEdit').val('');
	$('#iptWorkidFuncionarioEdit').val('');
	$('#iptTelefonoFuncionarioEdit').val('');
	$('#iptExtensionFuncionarioEdit').val('');
	$('#iptMovilFuncionarioEdit').val('');
	$('#iptNoClinicaFuncionarioEdit').val('');
	$('#iptClinicaFuncionarioEdit').val('');
	
	eliminaMarcaRojo($("#iptNombresFuncionarioEdit"));
	eliminaMarcaRojo($("#iptApellidoPaternoFuncionarioEdit"));
	eliminaMarcaRojo($("#iptApellidoMaternoFuncionarioEdit"));
	eliminaMarcaRojo($("#iptNacimientoFuncionarioEdit"));
	eliminaMarcaRojo($("#iptCurpFuncionarioEdit"));
	eliminaMarcaRojo($("#iptEmail1FuncionarioEdit"));
	eliminaMarcaRojo($("#iptNssFuncionarioEdit"));
	eliminaMarcaRojo($("#iptWorkidFuncionarioEdit"));
	eliminaMarcaRojo($("#iptTelefonoFuncionarioEdit"));


	
	$('#iptFuncionarioEdit').val('');
	$('#h4Nombre').html('');
	$('#pRFC').html('');
	$('#pDistribuidor').html('');
	$('#pEmail').html('');
	$('#pPuesto').html('');
	$('#pTelefono').html('');
	$('#tbodyPuestos').html('');
	$('#tbodyCursos').html('');
	var urltxt = ctx + '/lms/getFuncionario?idFuncionario='+idFuncionario;
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
				var infoFuncionario = response[1];
				
				var puestos = infoFuncionario.lstPuestosVO;
				var cursos = infoFuncionario.calificaciones;
				
				var htmlAddNombre = '';
				var htmlAddRFC = '';
				var htmlAddDistribuidor = '';
				var htmlAddEmail = '';
				var htmlAddPuesto = '';
				var htmlAddTelefono = '';
				var htmlAddTablePuestos = '';
				var htmlAddTableCursos = '';
				var htmlAddTablePuestosEn = '';
				var htmlAddTableCursosEn = '';
				var htmlAddTablePuestosFr = '';
				var htmlAddTableCursosFr = '';
				
				//Se agregan los valores principales de la tarjeta
				//ID de funcionario (Oculto)
				$('#iptFuncionarioEdit').val(infoFuncionario.id);
				//Nombre
				htmlAddNombre += infoFuncionario.datosFuncionarioVO.nombres+' '+infoFuncionario.datosFuncionarioVO.apellidoUno+' '+infoFuncionario.datosFuncionarioVO.apellidoDos;
				$('#h4Nombre').append(htmlAddNombre);
				//RFC
				htmlAddRFC += '<span>RFC:</span> '+infoFuncionario.rfc;
				$('#pRFC').append(htmlAddRFC);
				
				
				//Distribuidor principal
				htmlAddDistribuidor += infoFuncionario.auxDealerPrincipal;
				$('#pDistribuidor').append(htmlAddDistribuidor);
				
				
				
				//email
				htmlAddEmail += '<a href="mailto:'+infoFuncionario.datosFuncionarioVO.email+'">'+infoFuncionario.datosFuncionarioVO.email+'</a>';
				$('#pEmail').append(htmlAddEmail);
				
				
				
				//Puesto principal
				htmlAddPuesto += infoFuncionario.auxPuestoPrincipal;
				$('#pPuesto').html(htmlAddPuesto);
				
				
				
				//Telefono
				htmlAddTelefono += '<a class="telF" href="tel:'+infoFuncionario.datosFuncionarioVO.telefono+'">'+infoFuncionario.datosFuncionarioVO.telefono+'</a>';
				$('#pTelefono').append(htmlAddTelefono);
				
				
				
				//tabla de puestos
				
				if(puestos.length > 0){
					for (var i = 0; i < puestos.length; i++) {
						var element = puestos[i];
						if(infoFuncionario.idEstatusFuncionario != 2 && infoFuncionario.idEstatusFuncionario != 6){
								htmlAddTablePuestos += '<tr><td class="text-left">'+element.auxDealer.nombre+'</td><td class="text-center">'+element.auxPuesto.nombre+'</td><td class="text-center"></td></tr>';
						}else{
							if(element.estatus == 1){
								htmlAddTablePuestos += '<tr><td class="text-left">'+element.auxDealer.nombre+'</td><td class="text-center">'+element.auxPuesto.nombre+'</td><td class="text-center"><a href="#"  data-toggle="tooltip" data-placement="top"  title="Puesto principal" onclick="showCambiaPuesto(\''+element.id+'\')"><i class="fas fa-user"></i></a>&nbsp<a href="#"  data-toggle="tooltip" data-placement="top"  title="Eliminar puesto" onclick="showBajaPuesto(\''+element.id+'\')"><i class="fas fa-trash-alt"></i></a></td></tr>';
							}else{
								htmlAddTablePuestos += '<tr><td class="text-left">'+element.auxDealer.nombre+'</td><td class="text-center">'+element.auxPuesto.nombre+'</td><td class="text-center"></td></tr>';
							}
						}
						
					}
				}else{
					htmlAddTablePuestos += '<tr><td>Sin puestos adicionales</td></tr>';	
					htmlAddTablePuestosEn = '<tr><td>No additional positions</td></tr>';	
					htmlAddTablePuestosFr = '<tr><td>Pas de postes supplementaires</td></tr>';	
									
				}
				
				
				
				
				
				if(cursos.length > 0){
					for (var i = 0; i < cursos.length; i++) {
						var element = cursos[i];
						htmlAddTableCursos += '<tr><td class="text-left">'+element.curso+'</td><td class="text-center">'+element.inicioFin+'</td><td class="text-center">'+element.calificacion+'</td></tr>';
					}
				}else{
					htmlAddTableCursos += '<tr><td>Sin cursos</td></tr>';
					htmlAddTableCursosEn = '<tr><td>No courses</td></tr>';
					htmlAddTableCursosFr = '<tr><td>Pas de cours</td></tr>';					
				}
				
				$('#tbodyPuestos').append(htmlAddTablePuestos);
				$('#tbodyPuestosEn').append(htmlAddTablePuestosEn);
				$('#tbodyPuestosFr').append(htmlAddTablePuestosFr);
				
//				//tabla de puestos
				$('#tbodyCursos').append(htmlAddTableCursos);
				$('#tbodyCursosEn').append(htmlAddTableCursosEn);
				$('#tbodyCursosFr').append(htmlAddTableCursosFr);
				
				
				//Se agregan los valores para update
				$('#iptNombresFuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.nombres);
				$('#iptApellidoPaternoFuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.apellidoUno);
				$('#iptApellidoMaternoFuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.apellidoDos);
				$('#iptNacimientoFuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.auxfechaNacimientoStr);
				$('#iptCurpFuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.curp);
				$('#iptEmail1FuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.email);
				$('#iptEmail2FuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.emailAdicional);
				$('#iptNssFuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.nss);
				$('#iptWorkidFuncionarioEdit').val(infoFuncionario.workId);
				$('#iptTelefonoFuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.telefono);
				$('#iptExtensionFuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.extencion);
				$('#iptMovilFuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.movil);
				$('#iptNoClinicaFuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.noClinica);
				$('#iptClinicaFuncionarioEdit').val(infoFuncionario.datosFuncionarioVO.clinica);
				
				if(infoFuncionario.datosFuncionarioVO.sexo == 'H'){
					$('#iptSexoFuncionarioHEdit').prop('checked', true);
				}else if(infoFuncionario.datosFuncionarioVO.sexo == 'M'){
					$('#iptSexoFuncionarioMEdit').prop('checked', true);
				}
				if(infoFuncionario.inscripcionesAbiertas > 0){
					$('#divRowCursosPendientes').show();
				}
				
				if(infoFuncionario.idEstatusFuncionario != 2 && infoFuncionario.idEstatusFuncionario != 6){
					$('#btnBajaFuncionario').hide();
					$('#btnNuevoPuesto').hide();
					$('#btnEditFuncionario').hide();
				}
								
				
				$('#edit-funcionario').modal({backdrop: 'static', keyboard: false});
				
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
	
}

showEditFuncionario = function(){
	$('#divInfoFuncionarioCard').hide();
	$('#btnEditFuncionario').hide();
	$('#btnBajaFuncionario').hide();
	$('#btnCerrarFuncionario').hide();
	$('#btnNuevoPuesto').hide();
	$('#divEditFuncionarioCard').show();
}

cancelaUpdate = function(){
	$('#divEditFuncionarioCard').hide();
	$('#btnEditFuncionario').show();
	$('#btnBajaFuncionario').show();
	$('#btnCerrarFuncionario').show();
	$('#btnNuevoPuesto').show();
	$('#divInfoFuncionarioCard').show();
}

showPuestoAdicional = function(){
	$('#btnEditFuncionario').hide();
	$('#btnBajaFuncionario').hide();
	$('#btnCerrarFuncionario').hide();
	$('#btnNuevoPuesto').hide();
	$('#divPuestoAdicional').show();
	eliminaMarcaRojo($("#selecDealerAdicional"));
	eliminaMarcaRojo($("#selecPuestoAdicional"));
}

cancelaPuestoAdicional = function(){
	$('#btnEditFuncionario').show();
	$('#btnBajaFuncionario').show();
	$('#btnCerrarFuncionario').show();
	$('#btnNuevoPuesto').show();
	$('#divPuestoAdicional').hide();
}

updateFuncionario = function(){
	
	regexpCURP = /^[A-Z]{1}[AEIOU]{1}[A-Z]{2}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])[HM]{1}(AS|BC|BS|CC|CS|CH|CL|CM|DF|DG|GT|GR|HG|JC|MC|MN|MS|NT|NL|OC|PL|QT|QR|SP|SL|SR|TC|TS|TL|VZ|YN|ZS|NE)[B-DF-HJ-NP-TV-ZÑ]{3}[0-9A-Z]{1}[0-9]{1}$/;
	regExpMail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	editFuncionarioValid = true;
		
	//Validacion de formato de CURP
	if($.trim($("#iptCurpFuncionarioEdit").val()) != ''){
		if(!$("#iptCurpFuncionarioEdit").val().toUpperCase().match(regexpCURP)){
			marcaRojo($("#iptCurpFuncionarioEdit"));
			editFuncionarioValid = false;
		}else{
			eliminaMarcaRojo($("#iptCurpFuncionarioEdit"));
		}
	}else{
		marcaRojo($("#iptCurpFuncionarioEdit"));
		editFuncionarioValid = false;
	}	
	
	
	if (!notNull($("#iptNombresFuncionarioEdit"))) {
		editFuncionarioValid = false;
	}
	if (!notNull($("#iptApellidoMaternoFuncionarioEdit"))) {
		editFuncionarioValid = false;
	}
	if (!notNull($("#iptApellidoPaternoFuncionarioEdit"))) {
		editFuncionarioValid = false;
	}
	if (!notNull($("#iptNacimientoFuncionarioEdit"))) {
		editFuncionarioValid = false;
	}
	if (!notNull($("#iptEmail1FuncionarioEdit"))) {
		editFuncionarioValid = false;
	}
	if (!notNull($("#iptNssFuncionarioEdit"))) {
		editFuncionarioValid = false;
	}else{
		if($("#iptNssFuncionarioEdit").val().length != 11){
			marcaRojo($("#iptNssFuncionarioEdit"));
			editFuncionarioValid = false;
		}else{
			eliminaMarcaRojo($("#iptNssFuncionarioEdit"));
		}
	}
	if (!notNull($("#iptTelefonoFuncionarioEdit"))) {
		editFuncionarioValid = false;
	}
	
	
	if($.trim($("#iptEmail1FuncionarioEdit").val()) != ''){
		if(!$("#iptEmail1FuncionarioEdit").val().toUpperCase().match(regExpMail)){
			marcaRojo($("#iptEmail1FuncionarioEdit"));
			editFuncionarioValid = false;
		}else{
			eliminaMarcaRojo($("#iptEmail1FuncionarioEdit"));
		}
	}else{
		marcaRojo($("#iptEmail1FuncionarioEdit"));
		editFuncionarioValid = false;
	}
	
	if (editFuncionarioValid) {
		
		var funcionario = new Object;
		var dtsFuncionario = new Object;
				
		funcionario.id = $('#iptFuncionarioEdit').val();
		
		dtsFuncionario.nombres = $('#iptNombresFuncionarioEdit').val();
		dtsFuncionario.apellidoUno = $('#iptApellidoPaternoFuncionarioEdit').val();
		dtsFuncionario.apellidoDos = $('#iptApellidoMaternoFuncionarioEdit').val();
		
		
//		dtsFuncionario.fechaNacimiento = $('#iptNacimientoFuncionarioEdit').val();
		
		var iniAnio = $('#iptNacimientoFuncionarioEdit').val().substring(0,4);
		var iniMes  = $('#iptNacimientoFuncionarioEdit').val().substring(5,7);
		var iniDia  = $('#iptNacimientoFuncionarioEdit').val().substring(8,10);
		dtsFuncionario.fechaNacimiento = new Date(iniAnio, iniMes-1, iniDia);
		
		
		dtsFuncionario.sexo = $('#iptSexoFuncionarioEdit').val();
		dtsFuncionario.email = $('#iptEmail1FuncionarioEdit').val();
		dtsFuncionario.emailAdicional = $('#iptEmail2FuncionarioEdit').val();
		dtsFuncionario.curp = $('#iptCurpFuncionarioEdit').val();
		dtsFuncionario.nss = $('#iptNssFuncionarioEdit').val();
		dtsFuncionario.telefono = $('#iptTelefonoFuncionarioEdit').val();
		dtsFuncionario.extencion = $('#iptExtensionFuncionarioEdit').val();
		dtsFuncionario.movil = $('#iptMovilFuncionarioEdit').val();
		dtsFuncionario.sexo = $('input:radio[name=hmEdit]:checked').val();
		dtsFuncionario.clinica = $('#iptClinicaFuncionarioEdit').val();
		dtsFuncionario.noClinica = $('#iptNoClinicaFuncionarioEdit').val();
		
		funcionario.datosFuncionarioVO = dtsFuncionario;
		
		var urltxt = ctx + '/lms/funcionarios/updateFuncionario';

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





asignarPuestoAdicional = function() {
	adicionalValidacion = true;
	
	if ($('#selecPuestoAdicional').val() == 0) {
		marcaRojo($("#selecPuestoAdicional"));
		adicionalValidacion = false;
	}else{
		eliminaMarcaRojo($("#selecPuestoAdicional"));
	}
	
	if ($('#selecDealerAdicional').val() == 0) {
		adicionalValidacion = false;
		marcaRojo($("#selecDealerAdicional"));
	}else{
		eliminaMarcaRojo($("#selecDealerAdicional"));
	}
	
	if (adicionalValidacion) {
		var funcionarioPuestoVO = new Object;
		funcionarioPuestoVO.idFuncionario=$('#iptFuncionarioEdit').val();
		funcionarioPuestoVO.idPuesto = $('#selecPuestoAdicional').val();
		funcionarioPuestoVO.idDealer = $('#selecDealerAdicional').val();
		funcionarioPuestoVO.idGrupoDealer = $('#iptGrupoDealer').val();
//		funcionarioPuestoVO.ingreso = $('#iptIngresoPuestoAdicional').val();
		
		var iniAnio = $('#iptIngresoPuestoAdicional').val().substring(0,4);
		var iniMes  = $('#iptIngresoPuestoAdicional').val().substring(5,7);
		var iniDia  = $('#iptIngresoPuestoAdicional').val().substring(8,10);
		funcionarioPuestoVO.ingreso = new Date(iniAnio, iniMes-1, iniDia);

		
		funcionarioPuestoVO.banPrincipal = 0;

		var urltxt = ctx + '/lms/funcionarios/asignarPuestoFuncionario';
		
		

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
					$('#edit-funcionario').modal('hide');
					$('#modalAdicionalAsignado').modal({backdrop: 'static', keyboard: false});	
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

showBajaPuesto = function(id){
	$('#iptIdPuestoBaja').val(id);
	$('#modalBajaPuesto').modal({backdrop: 'static', keyboard: false});
}

showCambiaPuesto = function(id){
	$('#iptIdPuestoCambio').val(id);
	$('#modalCambioPrincipal').modal({backdrop: 'static', keyboard: false});
}



disabledPuesto = function(){
	
	var funcionarioPuestoVO = new Object;
	
	funcionarioPuestoVO.id = $('#iptIdPuestoBaja').val();
	funcionarioPuestoVO.egreso = $('#iptEgresoPuesto').val();
	
	var iniAnio = $('#iptEgresoPuesto').val().substring(0,4);
	var iniMes  = $('#iptEgresoPuesto').val().substring(5,7);
	var iniDia  = $('#iptEgresoPuesto').val().substring(8,10);
	funcionarioPuestoVO.egreso = new Date(iniAnio, iniMes-1, iniDia);
	
	var urltxt = ctx + '/lms/funcionarios/bajaPuestoFuncionario';

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
				$('#edit-funcionario').modal('hide');
				$('#modalBajaPuestoExito').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

cambiaPuesto = function(){
	
	var urltxt = ctx + '/lms/funcionarios/asignarPuestoFuncionarioPrincipal?id='+$('#iptIdPuestoCambio').val();

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
				$('#modalCambioPrincipal').modal('hide');
				$('#edit-funcionario').modal('hide');
				$('#modalCambioPuestoExito').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

bajaFuncionario = function(){
	var funcionarioVO = new Object;
	
	funcionarioVO.id = $('#iptFuncionarioEdit').val();
//	funcionarioVO.egreso = $('#iptEgresoFuncionario').val();
	
	var iniAnio = $('#iptEgresoFuncionario').val().substring(0,4);
	var iniMes  = $('#iptEgresoFuncionario').val().substring(5,7);
	var iniDia  = $('#iptEgresoFuncionario').val().substring(8,10);
	funcionarioVO.egreso = new Date(iniAnio, iniMes-1, iniDia);

	
	var urltxt = ctx + '/lms/funcionarios/bajaFuncionario';

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
				$('#modalBajaUsuario').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}


showBajaFuncionario = function(){
	$('#modalBajaFuncionario').modal({backdrop: 'static', keyboard: false});
}

showModalReingreso = function(){
	$('#modalNewFuncionario').modal('hide');
	$('#modalCoincidencias').modal('hide');
	$('#modalReingreso').modal({backdrop: 'static', keyboard: false});
}

getPuestosR = function(){
	var grupoPuestoSelected = $('#selecGrupoPuestoReingreso').val();
	$('#selecPuestoReingreso').html('');

	if(grupoPuestoSelected > 0){
		var urltxt = ctx+"/lms/funcionarios/getPuestos?idGrupoPuesto="+grupoPuestoSelected;
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
	//var solicitaCarta = $('#iptSolicitaDoc').val();
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
		
		var urltxt = ctx + '/lms/funcionarios/solicitaReingreso';
		
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
					$('#modalReingresoExito').modal({backdrop: 'static', keyboard: false});
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
	}
	
	
}


validaSize = function(element){
	if(element.files[0].size > 200000){
		element.value = "";
		$('#modalTamanioExedido').modal({backdrop: 'static', keyboard: false});
	}
}


showAcepta = function(id, accion, nombre){
	$('#pCambioA').html('');
	var htmlAdd = '';
	htmlAdd += accion;
	htmlAdd += ' - ';
	htmlAdd += nombre;
	
	$('#pCambioA').append(htmlAdd);
	
	$('#iptIdMesaA').val(id);
	
	$('#modalAceptaValida').modal({backdrop: 'static', keyboard: false});		
}

showRechaza = function(id, accion, nombre){
	$('#pCambioR').html('');
	var htmlAdd = '';
	htmlAdd += accion;
	htmlAdd += ' - ';
	htmlAdd += nombre;
	
	$('#pCambioR').append(htmlAdd);
	
	$('#iptIdMesaR').val(id);
	
	$('#modalRechazoValida').modal({backdrop: 'static', keyboard: false});		
}

aceptaCambio = function(){

	var idMesa = $('#iptIdMesaA').val();
	
	obs = escape(document.getElementById('iptObservacionesA').value);
	obs = obs.replace(/%0A/g, "<br>");
	
	
	var urltxt = ctx+"/lms/validaciones/actualizaMesa?param="+idMesa+"&param2=1&param3="+obs;
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
					$('#modalExitoValida').modal({backdrop: 'static', keyboard: false});
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
}

rechazaCambio = function(){

	var idMesa = $('#iptIdMesaR').val();
	
	obs = escape(document.getElementById('iptObservacionesR').value);
	obs = obs.replace(/%0A/g, "<br>");
	
	var urltxt = ctx+"/lms/validaciones/actualizaMesa?param="+idMesa+"&param2=0&param3="+obs;
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
					$('#modalExitoValida').modal({backdrop: 'static', keyboard: false});
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
}