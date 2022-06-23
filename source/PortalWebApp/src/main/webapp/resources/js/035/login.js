/**
 * 
 */
 
showRegistro = function(){
	eliminaMarcaRojo($("#email"));
	eliminaMarcaRojo($("#confirmEmail"));
	eliminaMarcaRojo($("#centroNombre"));
	eliminaMarcaRojo($("#centroTamanio"));
	eliminaMarcaRojo($("#selectGiroCentro"));
	eliminaMarcaRojo($("#selectEstadoCentro"));
//	eliminaMarcaRojo($("#passwordRegistro"));
//	eliminaMarcaRojo($("#confirmPasswordRegistro"));
	$("#email").val('');
	$("#confirmEmail").val('');
	$("#centroNombre").val('');
	$("#centroTamanio").val('');
	$("#selectGiroCentro").val(0);
	$("#selectEstadoCentro").val(0);
//	$("#passwordRegistro").val('');
//	$("#confirmPasswordRegistro").val('');

	$('#pObligatorios').hide();
	$('#pEmailFormato').hide();
	$('#pEmailNoCoincide').hide();
	$('#pContrasenaFormato').hide();
	$('#pPwdNoCoincide').hide();
	$('#pEmailRepetido').hide();
	$('#divLogin').hide();
	$('#divRecuperaPwd').hide();
	$('#divRegistro').show();
	$('btnRegistro').show();
}

showLogin = function(){
	$('#divRegistro').hide();
	$('#divRecuperaPwd').hide();
	$('#divLogin').show();
}

showRecuperaPwd = function(){
	$('#divRegistro').hide();
	$('#divLogin').hide();
	$('#divRecuperaPwd').show();
}

validaMail = function(){
	
	$('#pEmailRepetido').hide();
	emailValido = true; 
	var regExpMail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if (!notNull($("#email"))) {
		eliminaMarcaRojo($("#email"));
		emailValido = false;
	}else{
		if (!$("#email").val().toUpperCase().match(regExpMail)) {
			//no cumple con el formato de email
			marcaRojo($("#email"));
			emailValido = false;
			$('#pEmailFormato').show();
			//$("#span2NameRegMailFormatError").show();
		} else {
			eliminaMarcaRojo($("#email"));
		}
	}
	
	if(emailValido){
		emailToValidate = $("#email").val();

		var urltxt = ctx + '/registro/validaMail?mail='+emailToValidate;
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			async:false,
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				coincidencias = response[1];
				if (result) {
					//es valido
					return 'true';
				} else {
					// no es valido(repetido)
					$('#pCoincidencias').add(coincidencias);
					return 'false';
				}
			},
			error : function(msg) {
				return 'false';
			}
		});
	}else{
		return false;
	}
}

validaRegistOld = function(){
	
	
	$('#pObligatorios').hide();
	$('#pEmailFormato').hide();
	$('#pEmailNoCoincide').hide();
	$('#pContrasenaFormato').hide();
	$('#pPwdNoCoincide').hide();
	$('#pEmailRepetido').hide();
	
	var regExpPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8,}$/;
	var regExpMail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	
	registroValido = true;
	
	emailValidoReg = false;
	
	emailDuplicado = false;
	
	$('#pEmailRepetido').hide();
	emailValido = true; 
	var regExpMail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if (!notNull($("#email"))) {
		eliminaMarcaRojo($("#email"));
		emailValido = false;
	}else{
		if (!$("#email").val().toUpperCase().match(regExpMail)) {
			//no cumple con el formato de email
			marcaRojo($("#email"));
			emailValido = false;
			$('#pEmailFormato').show();
			//$("#span2NameRegMailFormatError").show();
		} else {
			eliminaMarcaRojo($("#email"));
		}
	}
	
	if(emailValido){
		emailToValidate = $("#email").val();

		var urltxt = ctx + '/registro/validaMail?mail='+emailToValidate;
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			async:false,
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					//es valido
					emailValidoReg = true;
				} else {
					// no es valido(repetido)
					$('#pCoincidencias').add(coincidencias);
					emailDuplicado = true;
					emailValidoReg = false;
				}
			},
			error : function(msg) {
				emailValidoReg = false;
			}
		});
	}else{
		emailValidoReg = false;
	}
	
	if(!emailValidoReg){
		registroValido = false;
		marcaRojo($("#email"));
	}
	if (!notNull($("#confirmEmail"))) {
		registroValido = false;
		$('#pObligatorios').show();
	}else{
		if ($("#confirmEmail").val() != $("#email").val()) {
			//correos no coinciden
			marcaRojo($("#confirmEmail"));
			registroValido = false;
			$('#pEmailNoCoincide').show();
			//$("#span2NameRegMailConfirmError").show();
		} else {
			eliminaMarcaRojo($("#confirmEmail"));
		}
	}
	if (!notNull($("#passwordRegistro"))) {
		registroValido = false;
		$('#pObligatorios').show();
	}
	if (!notNull($("#confirmPasswordRegistro"))) {
		registroValido = false;
		$('#pObligatorios').show();
	}
	
	if(registroValido){
		
		var usuario = new Object;
		var centro = new Object;
		
		usuario.email = $('#email').val();
		
		var urltxt = ctx + '/registro/registro';
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(usuario),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					//registrado
					$('#divRegistro').hide();
					$('#divRecuperaPwd').hide();
					$('#divLogin').hide();
					$('#divRegistrado').show();
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}
	
	
}

validaRegisto = function(){
	
	var regExpMail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	datosRegistroValido = true;
	emailValidoReg = true;
	emailUnico = true;
	
	//Validación de email(no nulo y con formato correcto)
	if (!notNull($("#email"))) {
		emailValidoReg = false;
		datosRegistroValido = false;
	}else{
		if (!$("#email").val().toUpperCase().match(regExpMail)) {
			//no cumple con el formato de email
			marcaRojo($("#email"));
			emailValidoReg = false;
			datosRegistroValido = false;
			//$('#pEmailFormato').show();
			//$("#span2NameRegMailFormatError").show();
		} else {
			eliminaMarcaRojo($("#email"));
		}
	}
	
	//Validación de  confirmación de email(no nulo e identico a email)
	if (!notNull($("#confirmEmail"))) {
		datosRegistroValido = false;
		$('#pObligatorios').show();
	}else{
		if ($("#confirmEmail").val() != $("#email").val()) {
			//correos no coinciden
			marcaRojo($("#confirmEmail"));
			datosRegistroValido = false;
			//$('#pEmailNoCoincide').show();
			//$("#span2NameRegMailConfirmError").show();
		} else {
			eliminaMarcaRojo($("#confirmEmail"));
		}
	}
	
	//validación de alias de centro de trabajo
	if (!notNull($("#centroNombre"))) {
		datosRegistroValido = false;
	}
	
	//validación de alias de centro de trabajo
	if (!notNull($("#centroContacto"))) {
		datosRegistroValido = false;
	}
	
	//validación de tamaño de centro de trabajo
	if($("#centroTamanio").val() > 0 ){
		eliminaMarcaRojo($("#centroTamanio"));
	}else{
		marcaRojo($("#centroTamanio"));
		datosRegistroValido = false;
	}
	
	//validación de giro de centro de trabajo
	if($("#selectGiroCentro").val() > 0 ){
		eliminaMarcaRojo($("#selectGiroCentro"));
	}else{
		marcaRojo($("#selectGiroCentro"));
		datosRegistroValido = false;
	}
	
	//validación de estado de centro de trabajo
	if($("#selectEstadoCentro").val() > 0 ){
		eliminaMarcaRojo($("#selectEstadoCentro"));
	}else{
		marcaRojo($("#selectEstadoCentro"));
		datosRegistroValido = false;
	}
	
	if(datosRegistroValido && emailValidoReg){
		emailToValidate = $("#email").val();

		var urltxt = ctx + '/registro/validaMail?mail='+emailToValidate;
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			async:false,
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				coincidencias = response[1];
				if (result) {
					//es valido
					emailUnico = true;
				} else {
					// no es valido(repetido)
					emailUnico = false;
					$('#pCoincidencias').html('');
					$('#pCoincidencias').append(coincidencias);
				}
			},
			error : function(msg) {
				emailValidoReg = false;
			}
		});
		
		if(emailUnico){
			creaContrato();
		}else{
			$('#modalCoincidencias').modal({backdrop: 'static', keyboard: false});
		}
	}
	
}

creaContrato = function(){
	
		var usuario = new Object;
		var centro = new Object;
		
		usuario.email = $('#email').val();
		usuario.nombre = $('#centroContacto').val();
		centro.nombre = $('#centroNombre').val();
		centro.empleadoNumero = $('#centroTamanio').val();
		centro.idGiro = $('#selectGiroCentro').val();
		centro.idEstadoRepublica = $('#selectEstadoCentro').val();
		
		usuario.centroTrabajoVO = centro;
		
		
		var urltxt = ctx + '/registro/registro';
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(usuario),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					//registrado
					$('#modalCoincidencias').modal('hide');
					$('#modalCredo').modal({backdrop: 'static', keyboard: false});
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	
	
}

goInfoHome = function(){
	window.location = 'https://035.com.mx/';
}

validaPwd = function(){
	
	var regExpPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8,}$/;
	
	datosPasswordValido = true;

	if(!notNull($("#password"))){
		datosPasswordValido = false;
	}
	
	if(!notNull($("#passwordConf"))){
		datosPasswordValido = false;
	}else{
		if ($("#passwordConf").val() != $("#password").val()) {
			//pwds no coinciden
			marcaRojo($("#passwordConf"));
			datosPasswordValido = false;
		} else {
			eliminaMarcaRojo($("#datosPasswordValido"));
		}
	}
	
	if(datosPasswordValido){
		$('#pwdForm').submit();
	}else{
		alert('se muuestra el error');
	}
}