/**
 * 
 */
 
goPerfil = function(){
	$('#divCentros').hide();
	$('#divUsuario').hide();
	$('#divPerfil').show();
}

goCentros = function(){
	$('#divPerfil').hide();
	$('#divUsuario').hide();
	$('#divCentros').show();
}

goCuestionarios = function(){
	url = ctx+'/cuestionarios';
	window.open(url,'_blank');
}

goUsuarios = function(){
	$('#divPerfil').hide();
	$('#divCentros').hide();
	$('#divUsuario').show();
}

actualizaUsuario = function(){
	
	datosUsuarioValidos = true; 
	
	if (!notNull($("#iptNombreHome"))) {
		datosUsuarioValidos = false;
	}
	
	if(datosUsuarioValidos){
		
		
		var usuario = new Object;
		usuario.nombre = $("#iptNombreHome").val();
		
		var urltxt = ctx + '/registro/updateUsuario';
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
					$('#modalDatosActualizados').modal({backdrop: 'static', keyboard: false});
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

actualizaCentro = function(){
	
	datosCentroValidos = true; 
	
	if (!notNull($("#iptNombreCentro"))) {
		datosCentroValidos = false;
	}
	
	if($('#selectGiroCentro').val() > 0){
		eliminaMarcaRojo($("#selectGiroCentro"));
	}else{
		marcaRojo($("#selectGiroCentro"));
		datosCentroValidos = false;
	}

	if($('#selectEstadoCentro').val() > 0){
		eliminaMarcaRojo($("#selectEstadoCentro"));
	}else{
		marcaRojo($("#selectEstadoCentro"));
		datosCentroValidos = false;
	}

	if($('#iptEmpleadosCentro').val() > 0){
		eliminaMarcaRojo($("#iptEmpleadosCentro"));
	}else{
		marcaRojo($("#iptEmpleadosCentro"));
		datosCentroValidos = false;
	}
	
	if(datosCentroValidos){
		
		
		var centro = new Object;
		centro.id = $("#iptIdCentro").val();
		centro.nombre = $("#iptNombreCentro").val();
		centro.empleadoNumero = $("#iptEmpleadosCentro").val();
		centro.idGiro = $("#selectGiroCentro").val();
		centro.idEstadoRepublica = $("#selectEstadoCentro").val();
		
		var urltxt = ctx + '/registro/updateCentro';
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(centro),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					$('#modalDatosActualizados').modal({backdrop: 'static', keyboard: false});
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