newZona = function() {
	$('#iptClaveZona').val('');
	$('#iptDescripcionZona').val('');
	$('#iptDescripcionZonaEn').val('');
	$('#iptDescripcionZonaFr').val('');
	$('#selectEmpresaLider').val(0);
	$('#selectEmpresaLider').attr('disabled',false);
	
	eliminaMarcaRojo($("#iptDescripcionZona"));
	eliminaMarcaRojo($("#iptClaveZona"));
	eliminaMarcaRojo($("#selectEmpresaLider"));

	
	$('#modalNewZona').modal({backdrop: 'static', keyboard: false});
}

editZona = function(idZona) {

	var urltxt = ctx + '/catalogo/getZona?idZona='+idZona;
	$('#tbodyGerente').html('');
	$('#tBodyNewGerente').html('');
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
				
				var zonaInfo = response[1];
				var gerentes = zonaInfo.gerentes;
				var funcionarios = zonaInfo.funcionariosNO;
				var htmlAddGerentes = '';
				var htmlAddFuncionarios = '';
				
				$('#iptIdZonaE').val(zonaInfo.id);
				$('#iptClaveZonaE').val(zonaInfo.clave);
				$('#iptDescripcionZonaE').val(zonaInfo.descripcion);
				$('#iptDescripcionZonaEEn').val(zonaInfo.descripcionEn);
				$('#iptDescripcionZonaEFr').val(zonaInfo.descripcionFr);
				$('#selectEmpresaLiderE').val(zonaInfo.idEmpresa);
				
				if(zonaInfo.banActivo == 1){
					$('#iptCheckZonaActivo').prop('checked', true);
					$('#iptCheckZonaActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal checked'
					});
				}else{
					$('#iptCheckZonaActivo').prop('checked', false);
					$('#iptCheckZonaActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal'
					});
				}
				
				
				for (var i = 0; i < gerentes.length; i++) {
					var element = gerentes[i];
					htmlAddGerentes += '<tr><td><input type="hidden" id="idZonaGerente'+i+'" value="'+element.id+'">'+element.gerente.rfc+'</td><td>'+element.gerente.datosFuncionarioVO.nombres+' '+element.gerente.datosFuncionarioVO.apellidoUno +'</td><td><button type="button" class="btn" onclick="disabledGerente(\''+i+'\');">Eliminar</button></td></tr>';
				}
				
				for (var i = 0; i < funcionarios.length; i++) {
					var element = funcionarios[i];
					htmlAddFuncionarios += '<tr><td><input type="hidden" id="idFuncG'+i+'" value="'+element.id+'">'+element.rfc+'</td><td>'+element.datosFuncionarioVO.nombres+' '+element.datosFuncionarioVO.apellidoUno +'</td><td><button type="button" class="btn" onclick="setGerente(\''+i+'\');">Asignar</button></td></tr>';
				}
				
				$('#tbodyGerente').append(htmlAddGerentes);
				$('#tBodyNewGerente').append(htmlAddFuncionarios);
				
				$('#gerentesZona').dataTable({
					"bRetrieve": true,
					"bDestroy": true,
		            "bPaginate": true,
		            "bLengthChange": true,
		            "bFilter": true,
		            "bSort": true,
		            "bInfo": true,
		            "language": {
		                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
		            }
		        });
				
				$('#tblNewGerenteZona').dataTable({
					"bRetrieve": true,
					"bDestroy": true,
					"bPaginate": true,
		            "bLengthChange": true,
		            "bFilter": true,
		            "bSort": true,
		            "bInfo": true,
		            "language": {
		                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
		            }
		        });
				$('#modalEditZona').modal({backdrop: 'static', keyboard: false});
				
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});

}

saveZona = function() {

	zonaValid = true;

	if (!notNull($("#iptClaveZona"))) {
		zonaValid = false;
	}

	if (!notNull($("#iptDescripcionZona"))) {
		zonaValid = false;
	}
	
	if ($('#selectEmpresaLider').val() > 0) {
		eliminaMarcaRojo($("#selectEmpresaLider"));
	}else{
		marcaRojo($("#selectEmpresaLider"));
		zonaValid = false;
	}

	if (zonaValid) {

		var zona = new Object;

		zona.id = $('#iptIdZona').val();
		zona.clave = $('#iptClaveZona').val();
		zona.descripcion = $('#iptDescripcionZona').val();
		zona.descripcionEn = $('#iptDescripcionZonaEn').val();
		zona.descripcionFr = $('#iptDescripcionZonaFr').val();
		zona.idEmpresa = $('#selectEmpresaLider').val();
		
		if ($("#iptCheckZonaActivo").prop('checked')) {
			zona.banActivo = 1;
		} else {
			zona.banActivo = 0;
		}
		

		var urltxt = ctx + '/catalogo/saveZona';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(zona),
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
					window.location = ctx + '/catalogo/zona';
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

updateZona = function() {

	zonaValid = true;

	if (!notNull($("#iptClaveZonaE"))) {
		zonaValid = false;
	}

	if (!notNull($("#iptDescripcionZonaE"))) {
		zonaValid = false;
	}
	
	if ($('#selectEmpresaLiderE').val() > 0) {
		eliminaMarcaRojo($("#selectEmpresaLiderE"));
	}else{
		marcaRojo($("#selectEmpresaLiderE"));
		zonaValid = false;
	}

	if (zonaValid) {

		var zona = new Object;

		zona.id = $('#iptIdZonaE').val();
		zona.clave = $('#iptClaveZonaE').val();
		zona.descripcion = $('#iptDescripcionZonaE').val();
		zona.descripcionEn = $('#iptDescripcionZonaEEn').val();
		zona.descripcionFr = $('#iptDescripcionZonaEFr').val();
		zona.idEmpresa = $('#selectEmpresaLiderE').val();
		
		if ($("#iptCheckZonaActivo").prop('checked')) {
			zona.banActivo = 1;
		} else {
			zona.banActivo = 0;
		}
		

		var urltxt = ctx + '/catalogo/saveZona';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(zona),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					window.location = ctx + '/catalogo/zona';
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

orderArribaZona = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenArribaZona?id='+id;
	
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
				window.location = ctx+'/catalogo/zona';
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

orderAbajoZona = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenAbajoZona?id='+id;
	
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
				window.location = ctx+'/catalogo/zona';
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

nuevoGerente = function(){
	$('#listaGerentes').hide();
	$('#newGerenteZona').show();
}

exitNuevoGerente = function(){
	$('#listaGerentes').show();
	$('#newGerenteZona').hide();
}

setGerente = function(fila){
	
	var zonaGerente = new Object;
	
	zonaGerente.idZona = $('#iptIdZonaE').val();
	zonaGerente.idGerente = $('#idFuncG'+fila).val();
	zonaGerente.banActivo = 1;
	
	
	var tallaPuesto = new Object;
	
	var urltxt = ctx + '/catalogo/saveZonaGerente';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(zonaGerente),
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
				window.location = ctx + '/catalogo/zona?idZona='+$('#iptIdZonaE').val();
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

disabledGerente = function(fila){
	
	var zonaGerente = new Object;
	
	zonaGerente.id = $('#idZonaGerente'+fila).val();
	zonaGerente.banActivo = 0;
	
	
	var tallaPuesto = new Object;
	
	var urltxt = ctx + '/catalogo/saveZonaGerente';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(zonaGerente),
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
				window.location = ctx + '/catalogo/zona?idZona='+$('#iptIdZonaE').val();
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showCveZona = function(){
	if($('#selectEmpresaLider').val() > 0){
		$('#iptClaveZona').attr('disabled',false);
	}else{
		$('#iptClaveZona').attr('disabled',true);
	}
}

validaZonaDuplicado = function(){

	cveZona = $('#iptClaveZona').val();
	idEmpresa = $('#selectEmpresaLider').val();
	idZona = $('#iptIdZona').val();
	var urltxt = ctx + '/catalogo/validaDupicadoZona?cveZona='+cveZona+'&idEmpresa='+idEmpresa+'&idZona='+idZona;

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
				$('#btnSaveZona').show();
			} else {
				$('#btnSaveZona').hide();
				$('#modalZonaDuplicado').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
} 

validaZonaDuplicadoEdit = function(){

	cveZona = $('#iptClaveZonaE').val();
	idEmpresa = $('#selectEmpresaLiderE').val();
	idZona = $('#iptIdZonaE').val();
	var urltxt = ctx + '/catalogo/validaDupicadoZona?cveZona='+cveZona+'&idEmpresa='+idEmpresa+'&idZona='+idZona;

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
				$('#btnUpdateZona').show();
			} else {
				$('#btnUpdateZona').hide();
				$('#modalZonaDuplicado').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
} 

function descargarCatZonas() {
	window.open(ctx + '/catalogo/descargarZonas');
}