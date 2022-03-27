/**
 * 
 */
 
showRegistro = function(){
	eliminaMarcaRojo($("#email"));
	eliminaMarcaRojo($("#confirmEmail"));
	eliminaMarcaRojo($("#passwordRegistro"));
	eliminaMarcaRojo($("#confirmPasswordRegistro"));
	$("#email").val('');
	$("#confirmEmail").val('');
	$("#passwordRegistro").val('');
	$("#confirmPasswordRegistro").val('');
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
					$('#btnRegistro').show();
				} else {
					// no es valido(repetido)
					$('#btnRegistro').hide();
				}
			},
			error : function(msg) {
				alert('error');
			}
		});
	}
}

validaRegisto = function(){
	
	
	$('#pObligatorios').hide();
	$('#pEmailFormato').hide();
	$('#pEmailNoCoincide').hide();
	$('#pContrasenaFormato').hide();
	$('#pPwdNoCoincide').hide();
	$('#pEmailRepetido').hide();
	
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
		
		var usuario = new Object;
		usuario.email = $('#email').val();
		usuario.contrasena = $('#passwordRegistro').val();
		
		alert(JSON.stringify(usuario));

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
					divRegistrado
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