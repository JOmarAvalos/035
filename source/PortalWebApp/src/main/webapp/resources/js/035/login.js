/**
 * 
 */
 
showRegistro = function(){
	eliminaMarcaRojo($("#email"));
	eliminaMarcaRojo($("#confirmEmail"));
	eliminaMarcaRojo($("#passwordRegistro"));
	eliminaMarcaRojo($("#confirmPasswordRegistro"));
	$('#pObligatorios').hide();
	$('#pEmailFormato').hide();
	$('#pEmailNoCoincide').hide();
	$('#pContrasenaFormato').hide();
	$('#pPwdNoCoincide').hide();
	$('#divLogin').hide();
	$('#divRecuperaPwd').hide();
	$('#divRegistro').show();
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

validaRegisto = function(){
	
	
	$('#pObligatorios').hide();
	$('#pEmailFormato').hide();
	$('#pEmailNoCoincide').hide();
	$('#pContrasenaFormato').hide();
	$('#pPwdNoCoincide').hide();
	
	var regExpPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8,}$/;
	var regExpMail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	
	registroValido = true;
	if (!notNull($("#email"))) {
		registroValido = false;
		$('#pObligatorios').show();
	}else{
		if (!$("#email").val().toUpperCase().match(regExpMail)) {
			//no cumple con el formato de email
			marcaRojo($("#email"));
			registroValido = false;
			$('#pEmailFormato').show();
			//$("#span2NameRegMailFormatError").show();
		} else {
			eliminaMarcaRojo($("#email"));
		}
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
	}else{
		if (!$("#passwordRegistro").val().match(regExpPwd)) {
			//no cumple con el formato de email
			marcaRojo($("#passwordRegistro"));
			registroValido = false;
			$('#pContrasenaFormato').show();
			//$("#span2NameRegMailFormatError").show();
		} else {
			eliminaMarcaRojo($("#passwordRegistro"));
		}
	}
	if (!notNull($("#confirmPasswordRegistro"))) {
		registroValido = false;
		$('#pObligatorios').show();
	}else{
		if ($("#confirmPasswordRegistro").val() != $("#passwordRegistro").val()) {
			//contraseñas no coinciden
			marcaRojo($("#confirmPasswordRegistro"));
			registroValido = false;
			$('#pPwdNoCoincide').show();
			//$("#span2NameRegMailConfirmError").show();
		} else {
			eliminaMarcaRojo($("#confirmPasswordRegistro"));
		}
	}
	
	if(registroValido){
		var urltxt = ctx + '/registro/registro';
		
	}
	
	
}