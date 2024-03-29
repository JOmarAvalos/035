/**
 * 
 */
 
goPerfil = function(){
	$('#divCentros').hide();
	$('#divUsuario').hide();
	$('#divCuestionarios').hide();
	$('#divProductos').hide();
	$('#divPerfil').show();
}

goCentros = function(){
	$('#divPerfil').hide();
	$('#divUsuario').hide();
	$('#divCuestionarios').hide();
	$('#divProductos').hide();
	$('#divCentros').show();
}

goCuestionarios = function(){
	$('#divPerfil').hide();
	$('#divUsuario').hide();
	$('#divCentros').hide();
	$('#divProductos').hide();
	$('#divCuestionarios').show();
}

goUsuarios = function(){
	$('#divPerfil').hide();
	$('#divCentros').hide();
	$('#divCuestionarios').hide();
	$('#divProductos').hide();
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

copyToClip = function(iptToCopy, textToShow) {
	  /* Get the text field */
	  var copyText = document.getElementById(iptToCopy);

	  /* Select the text field */
	  copyText.select();

	  /* Copy the text inside the text field */
	  document.execCommand("copy");
	  
	  /* Success Text  */
	  $("#successText").html("<i class='fa fa-copy'></i> "+textToShow+" <br>" + copyText.value);
	  $("#elementoCopiado").fadeIn();
	  setTimeout(function(){ $("#elementoCopiado").fadeOut(); }, 2000);
	  
	}
	
showProductos = function(){
	$('#divProductos').show();
}

hideProductos = function(){
	$('#divProductos').hide();
}

agregaProducto = function(id){
	
	urltxt = ctx+'/carrito/agregaProducto?param='+id;
	
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
				location.reload();
			} else {
				// no es valido(repetido)
				alert('error');
			}
		},
		error : function(msg) {
			alert('error');
		}
	});
}

quitaProducto = function(id){
	
	urltxt = ctx+'/carrito/quitaProducto?param='+id;
	
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
				location.reload();
			} else {
				// no es valido(repetido)
				alert('error');
			}
		},
		error : function(msg) {
			alert('error');
		}
	});
}

openPago = function(){
//	$('#divPago').show();
//	document.getElementById('divPago').scrollIntoView();
window.location = ctx+'/carrito/pagomp';
}

descargaCuestionarios = function(){
	var urltxt = ctx + '/carriito/descargaCuest'; 
	window.open(urltxt, '_blank');
}

descargaCuestionariosV2 = function(idCuestionario, idCentroTrabajo){
	var urltxt = ctx + '/registro/descargaCuestionarios?param1='+idCuestionario+'&param2='+idCentroTrabajo; 
	window.open(urltxt, '_blank');
}

descargaCuestionariosV3 = function(idCuestionario, idCentroTrabajo){
	var urltxt = ctx + '/registro/descargaCuestionarios?param1='+idCuestionario+'&param2='+idCentroTrabajo; 
	
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
			referencia = response[1];
			if (result) {
				alert('Hemos enviado la información solicitada al email registrado.');
			} else {
				alert('Ocurrio un error, por favor intenta mas tarde');
			}
		},
		error : function(msg) {
				alert('Ocurrio un error, por favor intenta mas tarde');
		}
	});
}

descargaResultados = function(){
	var urltxt = ctx + '/carriito/descargaInforme'; 
	window.open(urltxt, '_blank');
}

realizaPago = function(){
	
	$('#divPago').hide();
	
	urltxt = ctx+'/carrito/pagoSimulado';
	
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
			referencia = response[1];
			if (result) {
				$('#textPagoExitoRef').html('');
				$('#textPagoExitoRef').append('Numero de referencia: '+referencia);
				$('#modalPagoExito').modal({backdrop: 'static', keyboard: false});
			} else {
				// no es valido(repetido)
				alert('error');
			}
		},
		error : function(msg) {
			alert('error');
		}
	});
}

showCarga = function(){
	$('#modalAdvertenciaFormato').modal({backdrop: 'static', keyboard: false});
}

terminaCuestionarios = function(){
	
	urltxt = ctx+'/registro/terminaCuestionarios';
	
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
			referencia = response[1];
			if (result) {
				location.reload();
			} else {
				// no es valido(repetido)
				alert('error');
			}
		},
		error : function(msg) {
			alert('error');
		}
	});
}
