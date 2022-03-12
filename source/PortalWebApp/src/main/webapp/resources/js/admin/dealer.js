detalleDealer = function(idDealer){
	window.location = ctx+'/catalogo/detalleDealer?idDealer='+idDealer;
}


newGrupoDealer = function(){
	$('#iptIdGrupoDealer').val('');
	$('#selectEmpresaAgrupacion').val(0);
	$('#iptAgrupacion').val('');
	$('#selectEmpresaAgrupacion').attr('disabled',false);
	
	eliminaMarcaRojo($("#selectEmpresaAgrupacion"));
	eliminaMarcaRojo($("#iptAgrupacion"));
	
	$('#iptCheckGpoDlrActivo').prop('checked', true);
	$('#iptCheckGpoDlrActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});

	
	$('#modalNewGpoDealer').modal({backdrop: 'static', keyboard: false});
}

editGrupoDealer = function(id, idEmpresa, descripcion, activo, dealers){
	$('#iptIdGrupoDealer').val(id);
	$('#selectEmpresaAgrupacion').val(idEmpresa);
	$('#iptAgrupacion').val(descripcion);
	$('#selectEmpresaAgrupacion').attr('disabled',true);
	eliminaMarcaRojo($("#selectEmpresaAgrupacion"));
	eliminaMarcaRojo($("#iptAgrupacion"));
	if(activo == 1){
		$('#iptCheckGpoDlrActivo').prop('checked', true);
		$('#iptCheckGpoDlrActivo').iCheck({
	        checkboxClass: 'icheckbox_minimal checked'
		});
	}else{
		$('#iptCheckGpoDlrActivo').prop('checked', false);
		$('#iptCheckGpoDlrActivo').iCheck({
	        checkboxClass: 'icheckbox_minimal'
		});
	}
	
	if(activo == 1 && dealers > 0){
	    $('#iptCheckGpoDlrActivo').on('ifClicked', function(event){
	    	$('#h1WarnDealers').html('');
	    	$('#h1WarnDealers').append('El grupo no se puede desactivar porque tiene '+dealers+' dealers activos.');
	    	$('#modalNumeroDealers').modal({backdrop: 'static', keyboard: false});
	    	
		});
	}

	$('#modalNewGpoDealer').modal({backdrop: 'static', keyboard: false});
}

activaCkeck = function(){
	$('#iptCheckGpoDlrActivo').prop('checked', true);
	$('#iptCheckGpoDlrActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptCheckGpoDlrActivo').on('ifClicked', function(event){
    	$('#modalNumeroDealers').modal({backdrop: 'static', keyboard: false});
    	
	});
}

saveGrupoDealer = function(){
	
		var grupoDealerVO = new Object;
		grupoDealerVO.id = $('#iptIdGrupoDealer').val();
		grupoDealerVO.idEmpresa = $("#selectEmpresaAgrupacion").val();
		grupoDealerVO.agrupacion = $("#iptAgrupacion").val();
		
		if ($("#iptCheckGpoDlrActivo").prop('checked')) {
			grupoDealerVO.banActivo = 1;
		} else {
			grupoDealerVO.banActivo = 0;
		}
		
		var urltxt = ctx + '/catalogos/saveGrupoDealer';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(grupoDealerVO),
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
					window.location = ctx + '/catalogo/gruposDealer';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	
}


orderArribaGrupoDealer = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenArribaGrupoDealer?id='+id;
	
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
				window.location = ctx+'/catalogo/gruposDealer';
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

orderAbajoGrupoDealer = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenAbajoGrupoDealer?id='+id;
	
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
				window.location = ctx+'/catalogo/gruposDealer';
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


getSelectsDealer = function(){
	var idEmpresaSelected = $('#selectEmpresaDealer').val();
	$('#selectTallaD').html('');
	$('#selectZonaDealerD').html('');
	$('#selectTipoDealerD').html('');
	$('#selectGrupoDealerD').html('');
	$('#selectPrioridadDealerD').html('');
	
	if(idEmpresaSelected > 0){
		$('#iptClaveD').attr('disabled',false);
		var urltxt = ctx+"/catalogos/getSelectDealer?idEmpresa="+idEmpresaSelected;
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
					
					//selectTallaD
					var htmlAddTallas = '<option value="0" selected="selected">Seleccione...</option>';
					var tallas = response[1];
					if(tallas != 'undefinded'){
						for (var i = 0; i < tallas.length; i++) {
							var element = tallas[i];
							htmlAddTallas += '<option value="' + element.id+ '" >' + element.descripcion + '</option>';
						}
					}
					
					
					//selectZonaDealerD
					var htmlAddZonas = '<option value="0" selected="selected">Seleccione...</option>';
					var zonas = response[2];
					if(zonas != 'undefined'){
						for (var i = 0; i < zonas.length; i++) {
							var element = zonas[i];
							htmlAddZonas += '<option value="' + element.id+ '" >' + element.descripcion + '</option>';
						}
					}
					
					
					//selectTipoDealerD
					var htmlAddTipos = '<option value="0" selected="selected">Seleccione...</option>';
					var tipos = response[3];
					if(tipos != 'undefined'){
						for (var i = 0; i < tipos.length; i++) {
							var element = tipos[i];
							htmlAddTipos += '<option value="' + element.id+ '" >' + element.descripcion + '</option>';
						}
					}
					
					//selectGrupoDealerD
					var htmlAddGrupos = '<option value="0" selected="selected">Seleccione...</option>';
					var grupos = response[4];
					for (var i = 0; i < grupos.length; i++) {
						var element = grupos[i];
						htmlAddGrupos += '<option value="' + element.id+ '" >' + element.agrupacion + '</option>';
					}
					
					//selectTallaD
					var htmlAddPrioridad = '<option value="0" selected="selected">Seleccione...</option>';
					var prioridades = response[5];
					for (var i = 0; i < prioridades.length; i++) {
						var element = prioridades[i];
						htmlAddPrioridad += '<option value="' + element.id+ '" >' + element.descripcion + '</option>';
					}
					
					$('#selectTallaD').append(htmlAddTallas);
					$('#selectZonaDealerD').append(htmlAddZonas);
					$('#selectTipoDealerD').append(htmlAddTipos);
					$('#selectGrupoDealerD').append(htmlAddGrupos);
					$('#selectPrioridadDealerD').append(htmlAddPrioridad);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selectTallaD').append(htmlAdd);
					$('#selectZonaDealshowerD').append(htmlAdd);
					$('#selectTipoDealerD').append(htmlAdd);
					$('#selectGrupoDealerD').append(htmlAdd);
					$('#selectPrioridadDealerD').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selectTallaD').append(htmlAdd);
		$('#selectZonaDealerD').append(htmlAdd);
		$('#selectTipoDealerD').append(htmlAdd);
		$('#selectGrupoDealerD').append(htmlAdd);
		$('#selectPrioridadDealerD').append(htmlAdd);
		$('#iptClaveD').attr('disabled',true);
	}
}

showNewDealer = function(){
	$('#selectTallaD').html('');
	$('#selectZonaDealerD').html('');
	$('#selectTipoDealerD').html('');
	$('#selectGrupoDealerD').html('');
	$('#selectPrioridadDealerD').html('');
	var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
	$('#selectTallaD').append(htmlAdd);
	$('#selectZonaDealerD').append(htmlAdd);
	$('#selectTipoDealerD').append(htmlAdd);
	$('#selectGrupoDealerD').append(htmlAdd);
	$('#selectPrioridadDealerD').append(htmlAdd);
	
	$('#iptIdDealer').val('');
	$('#selectEmpresaDealer').val(0);
	$('#selectEmpresaDealer').attr('disabled',false);
	$('#selectGrupoDealerD').val(0);
	$('#selectTipoDealerD').val(0);
	$('#selectZonaDealerD').val(0);
	$('#selectTallaD').val(0);
	$('#selectPrioridadDealerD').val(0);
	$('#iptClaveD').val('');
	$('#iptNombreD').val('');
	$('#iptCodigoPlantaD').val('');
	$('#iptWeb').val('');
	$('#iptOrdenesT').val('0');
	$('#iptMantenimientoPorc').val('0');
	$('#iptReparacionPorc').val('0');
	$('#iptDiagnosticoPorc').val('0');
	
	$('#divDealerZonas').hide();
	
	$('#iptCodigoPostal').val('');
	$('#iptEstado').val('');
	$('#iptCiudad').val('');
	$('#iptColonia').val('');
	$('#iptDireccion').val('');
	$('#iptExterior').val('');
	$('#iptInterior').val('');
	$('#iptReferencia').val('');
	$('#iptTelefono').val('');
	
	$('#iptCheckDealerActivo').prop('checked', true);
	$('#iptCheckDealerActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});

	
	$('#btnsaveDealer').show();
	
	eliminaMarcaRojo($("#selectEmpresaDealer"));
	eliminaMarcaRojo($("#selectGrupoDealerD"));
	eliminaMarcaRojo($("#selectTipoDealerD"));
	eliminaMarcaRojo($("#selectTallaD"));
	eliminaMarcaRojo($("#selectPrioridadDealerD"));
	eliminaMarcaRojo($("#iptClaveD"));
	eliminaMarcaRojo($("#iptNombreD"));
	eliminaMarcaRojo($("#iptCodigoPlantaD"));
	eliminaMarcaRojo($("#iptCodigoPostal"));
	eliminaMarcaRojo($("#iptEstado"));
	eliminaMarcaRojo($("#iptCiudad"));
	eliminaMarcaRojo($("#iptColonia"));
	eliminaMarcaRojo($("#iptDireccion"));
	eliminaMarcaRojo($("#iptReferencia"));
	eliminaMarcaRojo($("#iptTelefono"));
	eliminaMarcaRojo($("#iptExterior"));
	eliminaMarcaRojo($("#iptOrdenesT"));
	eliminaMarcaRojo($("#iptMantenimientoPorc"));
	eliminaMarcaRojo($("#iptReparacionPorc"));
	eliminaMarcaRojo($("#iptDiagnosticoPorc"));
	
	$('#modalNewDealer').modal({backdrop: 'static', keyboard: false});
}

getDealer = function(idDealer){
	$('#btnsaveDealer').show();
	eliminaMarcaRojo($("#selectEmpresaDealer"));
	eliminaMarcaRojo($("#selectGrupoDealerD"));
	eliminaMarcaRojo($("#selectTipoDealerD"));
	eliminaMarcaRojo($("#selectTallaD"));
	eliminaMarcaRojo($("#selectPrioridadDealerD"));
	eliminaMarcaRojo($("#iptClaveD"));
	eliminaMarcaRojo($("#iptNombreD"));
	eliminaMarcaRojo($("#iptCodigoPlantaD"));
	eliminaMarcaRojo($("#iptCodigoPostal"));
	eliminaMarcaRojo($("#iptEstado"));
	eliminaMarcaRojo($("#iptCiudad"));
	eliminaMarcaRojo($("#iptColonia"));
	eliminaMarcaRojo($("#iptDireccion"));
	eliminaMarcaRojo($("#iptReferencia"));
	eliminaMarcaRojo($("#iptTelefono"));
	eliminaMarcaRojo($("#iptExterior"));
	eliminaMarcaRojo($("#iptOrdenesT"));
	eliminaMarcaRojo($("#iptMantenimientoPorc"));
	eliminaMarcaRojo($("#iptReparacionPorc"));
	eliminaMarcaRojo($("#iptDiagnosticoPorc"));
	var urltxt = ctx + '/catalogos/getDealer?idDealer='+idDealer;
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
				
				$('#selectTallaD').html('');
				$('#tbodyGerenteDealer').html('');
				$('#selectTipoDealerD').html('');
				$('#selectGrupoDealerD').html('');
				$('#selectPrioridadDealerD').html('');
				
				//selectTallaD
				var htmlAddTallas = '<option value="0" selected="selected">Seleccione...</option>';
				var tallas = response[1];
				for (var i = 0; i < tallas.length; i++) {
					var element = tallas[i];
					htmlAddTallas += '<option value="' + element.id+ '" >' + element.descripcion + '</option>';
				}
				
//				//selectZonaDealerD
//				var htmlAddZonas = '<option value="0" selected="selected">Seleccione...</option>';
//				var zonas = response[2];
//				for (var i = 0; i < zonas.length; i++) {
//					var element = zonas[i];
//					htmlAddZonas += '<option value="' + element.id+ '" >' + element.descripcion + '</option>';
//				}
				
				//selectZonaDealerD
				var htmlAddZonas = '';
				var zonas = response[2];
				for (var i = 0; i < zonas.length; i++) {
					var element = zonas[i];
					var gerentes = element.gerentes;
					if(element.gerente.idZonaGerente != null){
						htmlAddGerentes = '<select class="form-control" id="selectGerenteD'+i+'" onchange="showBtnDealerG(\''+i+'\')"><option value="0" >Seleccione...</option>';
					}else{
						htmlAddGerentes = '<select class="form-control" id="selectGerenteD'+i+'" onchange="showBtnDealerG(\''+i+'\')"><option value="0" selected="selected">Seleccione...</option>';
					}
					for(var j = 0; j < gerentes.length; j++){
						var gerente = gerentes[j];
						if(element.gerente.idZonaGerente != null){
							if(gerente.id == element.gerente.idZonaGerente){
								htmlAddGerentes+= '<option value="'+gerente.id+'" selected="selected">'+gerente.gerente.datosFuncionarioVO.nombres+' '+gerente.gerente.datosFuncionarioVO.apellidoUno+'</option>';
							}else{
								htmlAddGerentes+= '<option value="'+gerente.id+'">'+gerente.gerente.datosFuncionarioVO.nombres+' '+gerente.gerente.datosFuncionarioVO.apellidoUno+'</option>';
							}
						}else{
							htmlAddGerentes+= '<option value="'+gerente.id+'">'+gerente.gerente.datosFuncionarioVO.nombres+' '+gerente.gerente.datosFuncionarioVO.apellidoUno+'</option>';
						}
					}
					
					
					htmlAddGerentes+= '</select>';
					htmlAddZonas += '<tr><td> <input type="hidden" id="idZona'+i+'" value="'+element.id+'"> <input type="hidden" id="idDealerGerente'+i+'" value="'+element.gerente.id+'">';
					htmlAddZonas += element.descripcion;
					htmlAddZonas += '</td><td>';
					htmlAddZonas += htmlAddGerentes;
					htmlAddZonas += '</td><td><button type="button" class="btn" onclick="updateDealerGerente(\''+i+'\');" id="btnUpdateGerente'+i+'" style="display:none;">Actualizar</button></td></tr>';
				}

				
				//selectTipoDealerD
				var htmlAddTipos = '<option value="0" selected="selected">Seleccione...</option>';
				var tipos = response[3];
				for (var i = 0; i < tipos.length; i++) {
					var element = tipos[i];
					htmlAddTipos += '<option value="' + element.id+ '" >' + element.descripcion + '</option>';
				}
				
				//selectGrupoDealerD
				var htmlAddGrupos = '<option value="0" selected="selected">Seleccione...</option>';
				var grupos = response[4];
				for (var i = 0; i < grupos.length; i++) {
					var element = grupos[i];
					htmlAddGrupos += '<option value="' + element.id+ '" >' + element.agrupacion + '</option>';
				}
				
				//selectTallaD
				var htmlAddPrioridad = '<option value="0" selected="selected">Seleccione...</option>';
				var prioridades = response[5];
				for (var i = 0; i < prioridades.length; i++) {
					var element = prioridades[i];
					htmlAddPrioridad += '<option value="' + element.id+ '" >' + element.descripcion + '</option>';
				}
				
				$('#selectTallaD').append(htmlAddTallas);
				$('#tbodyGerenteDealer').append(htmlAddZonas);
				$('#selectTipoDealerD').append(htmlAddTipos);
				$('#selectGrupoDealerD').append(htmlAddGrupos);
				$('#selectPrioridadDealerD').append(htmlAddPrioridad);
				
				var dealer = response[6];
				var contacto = dealer.contactoVO;

				$('#iptIdDealer').val(dealer.id);
				$('#selectEmpresaDealer').val(dealer.idEmpresa);
				$('#selectEmpresaDealer').attr('disabled',true);
				$('#selectGrupoDealerD').val(dealer.idGrupoDealer);
				$('#selectTipoDealerD').val(dealer.idTipoDealer);
				$('#selectZonaDealerD').val(dealer.idZona);
				$('#selectTallaD').val(dealer.idTalla);
				$('#selectPrioridadDealerD').val(dealer.idPrioridad);
				$('#iptClaveD').val(dealer.clave);
				$('#iptNombreD').val(dealer.nombre);
				$('#iptCodigoPlantaD').val(dealer.codigoPlanta);
				$('#iptWeb').val(dealer.sitioWeb);
				
				$('#iptOrdenesT').val(dealer.ordenesTotal);
				$('#iptMantenimientoPorc').val(dealer.porcentajeMantenimiento);
				$('#iptReparacionPorc').val(dealer.porcentajeReparacion);
				$('#iptDiagnosticoPorc').val(dealer.porcentajeDiagnostico);
				
				
				if(dealer.banActivo == 1){
					$('#iptCheckDealerActivo').prop('checked', true);
					$('#iptCheckDealerActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal checked'
					});
				}else{
					$('#iptCheckDealerActivo').prop('checked', false);
					$('#iptCheckDealerActivo').iCheck({
				        checkboxClass: 'icheckbox_minimal'
					});
				}
				
				if(dealer.banActivo == 1 && dealer.totalFuncionarios > 0){
				    $('#iptCheckDealerActivo').on('ifClicked', function(event){
				    	$('#h1WarnDealers').html('');
				    	$('#h1WarnDealers').append('El dealer no se puede desactivar porque tiene '+dealer.totalFuncionarios+' funcionarios activos.');
				    	$('#modalNumeroFuncionarios').modal({backdrop: 'static', keyboard: false});
				    	
					});
				}
				
				if(contacto != null){
					$('#iptCodigoPostal').val(contacto.codigoPostal);
					$('#iptEstado').val(contacto.estado);
					$('#iptCiudad').val(contacto.ciudad);
					$('#iptColonia').val(contacto.colonia);
					$('#iptDireccion').val(contacto.direccion);
					$('#iptExterior').val(contacto.exterior);
					$('#iptInterior').val(contacto.interior);
					$('#iptReferencia').val(contacto.referencia);
					$('#iptTelefono').val(contacto.telefono);
				}else{
					$('#iptCodigoPostal').val('');
					$('#iptEstado').val('');
					$('#iptCiudad').val('');
					$('#iptColonia').val('');
					$('#iptDireccion').val('');
					$('#iptExterior').val('');
					$('#iptInterior').val('');
					$('#iptReferencia').val('');
					$('#iptTelefono').val('');
				}
				
				$('#divDealerZonas').show();
				
				$('#modalNewDealer').modal({backdrop: 'static', keyboard: false});
				
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

activaCkeckDealer = function(){
	$('#iptCheckDealerActivo').prop('checked', true);
	$('#iptCheckDealerActivo').iCheck({
        checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptCheckDealerActivo').on('ifClicked', function(event){
    	$('#modalNumeroFuncionarios').modal({backdrop: 'static', keyboard: false});
    	
	});
}

saveDealer = function(){
	
	dealerValid = true;
	
	if ($("#selectEmpresaDealer").val() == 0) {
		marcaRojo($("#selectEmpresaDealer"));
		dealerValid = false;
	}else{
		eliminaMarcaRojo($("#selectEmpresaDealer"));
	}
	
	if ($("#selectGrupoDealerD").val() == 0) {
		marcaRojo($("#selectGrupoDealerD"));
		dealerValid = false;
	}else{
		eliminaMarcaRojo($("#selectGrupoDealerD"));
	}
	
	if ($("#selectTipoDealerD").val() == 0) {
		marcaRojo($("#selectTipoDealerD"));
		dealerValid = false;
	}else{
		eliminaMarcaRojo($("#selectTipoDealerD"));
	}
	
	if ($("#selectTallaD").val() == 0) {
		marcaRojo($("#selectTallaD"));
		dealerValid = false;
	}else{
		eliminaMarcaRojo($("#selectTallaD"));
	}
	
	if ($("#selectPrioridadDealerD").val() == 0) {
		marcaRojo($("#selectPrioridadDealerD"));
		dealerValid = false;
	}else{
		eliminaMarcaRojo($("#selectPrioridadDealerD"));
	}
	
	if (!notNull($("#iptClaveD"))) {
		dealerValid = false;
	}
	
	if (!notNull($("#iptNombreD"))) {
		dealerValid = false;
	}
	
	if (!notNull($("#iptCodigoPlantaD"))) {
		dealerValid = false;
	}
	
	if (!notNull($("#iptCodigoPostal"))) {
		dealerValid = false;
	}
	if (!notNull($("#iptEstado"))) {
		dealerValid = false;
	}
	if (!notNull($("#iptColonia"))) {
		dealerValid = false;
	}
	if (!notNull($("#iptCiudad"))) {
		dealerValid = false;
	}
	if (!notNull($("#iptDireccion"))) {
		dealerValid = false;
	}
	if (!notNull($("#iptExterior"))) {
		dealerValid = false;
	}
	if (!notNull($("#iptReferencia"))) {
		dealerValid = false;
	}
	if (!notNull($("#iptTelefono"))) {
		dealerValid = false;
	}
	
	if (!notNull($("#iptOrdenesT"))) {
		dealerValid = false;
	}
	
	if (!notNull($("#iptMantenimientoPorc"))) {
		dealerValid = false;
	}
	
	if (!notNull($("#iptReparacionPorc"))) {
		dealerValid = false;
	}
	
	if (!notNull($("#iptDiagnosticoPorc"))) {
		dealerValid = false;
	}
	
	
	//agregar validacion de expresion regular
//	if (!notNull($("#iptWeb"))) {
//		dealerValid = false;
//	}
	
	if(dealerValid){
		
		var dealerVO = new Object;
		var contactoVO = new Object;
		dealerVO.id = $("#iptIdDealer").val();
		dealerVO.idEmpresa = $("#selectEmpresaDealer").val();
		dealerVO.idTalla = $("#selectTallaD").val();
		dealerVO.idTipoDealer = $("#selectTipoDealerD").val();
		dealerVO.idGrupoDealer = $("#selectGrupoDealerD").val();
		dealerVO.idPrioridad = $("#selectPrioridadDealerD").val();
		dealerVO.clave = $("#iptClaveD").val();
		dealerVO.nombre = $("#iptNombreD").val();
		dealerVO.codigoPlanta = $("#iptCodigoPlantaD").val();
		dealerVO.sitioWeb = $("#iptWeb").val();
		dealerVO.ordenesTotal = $("#iptOrdenesT").val();
		dealerVO.porcentajeMantenimiento = $("#iptMantenimientoPorc").val();
		dealerVO.porcentajeReparacion = $("#iptReparacionPorc").val();
		dealerVO.porcentajeDiagnostico = $("#iptDiagnosticoPorc").val();
		
		if ($("#iptCheckDealerActivo").prop('checked')) {
			dealerVO.banActivo = 1;
		} else {
			dealerVO.banActivo = 0;
		}
		
		contactoVO.codigoPostal = $("#iptCodigoPostal").val();
		contactoVO.estado = $("#iptEstado").val();
		contactoVO.colonia = $("#iptColonia").val();
		contactoVO.ciudad = $("#iptCiudad").val();
		contactoVO.direccion = $("#iptDireccion").val();
		contactoVO.exterior = $("#iptExterior").val();
		contactoVO.interior = $("#iptInterior").val();
		contactoVO.referencia = $("#iptReferencia").val();
		contactoVO.telefono = $("#iptTelefono").val();
		
		dealerVO.contactoVO = contactoVO;
		
		var urltxt = ctx + '/catalogo/saveDealer';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(dealerVO),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					window.location = ctx + '/catalogo/dealers';
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


orderArribaDealer = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenArribaDealer?id='+id;
	
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
				window.location = ctx+'/catalogo/dealers';
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

orderAbajoDealer = function(id) {

	var urltxt = ctx + '/catalogo/changeOrdenAbajoDealer?id='+id;
	
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
				window.location = ctx+'/catalogo/dealers';
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



showBtnDealerG = function(fila){
	
	if($('#selectGerenteD'+fila).val() > 0){
		$('#btnUpdateGerente'+fila).show();
	}else{
		$('#btnUpdateGerente'+fila).hide();
	}
	
} 

updateDealerGerente = function(fila){
	
	var dealerGerente = new Object;
	dealerGerente.id = $('#idDealerGerente'+fila).val();
	dealerGerente.idZonaGerente = $('#selectGerenteD'+fila).val();
	dealerGerente.idZona = $('#idZona'+fila).val();
	dealerGerente.idDealer = $('#iptIdDealer').val();
	
	var urltxt = ctx + '/catalogo/saveDealerGerente';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(dealerGerente),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#btnUpdateGerente'+fila).hide();
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
	
}



validaGrupoDealerDuplicado = function(){
	grupoDealerValid = true;
	
	if ($("#selectEmpresaAgrupacion").val() == 0) {
		grupoDealerValid = false;
		marcaRojo($("#selectEmpresaAgrupacion"));
	}else{
		eliminaMarcaRojo($("#selectEmpresaAgrupacion"));
	}
	
	if (!notNull($("#iptAgrupacion"))) {
		grupoDealerValid = false;
	}
	
	if(grupoDealerValid){
		nombreGrupo = $('#iptAgrupacion').val();
		idEmpresa = $('#selectEmpresaAgrupacion').val();
		idGrupoDealer = $('#iptIdGrupoDealer').val();
		var urltxt = ctx + '/catalogo/validaDupicadoGrupoDealer?nombreGrupoDealer='+nombreGrupo+'&idEmpresa='+idEmpresa+'&idGrupodealer='+idGrupoDealer;

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
					saveGrupoDealer();
				} else {
					$('#modalGrupoDealerDuplicado').modal({backdrop: 'static', keyboard: false});
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

validaDealerDuplicado = function(){

	cveDealer = $('#iptClaveD').val();
	idEmpresa = $('#selectEmpresaDealer').val();
	idDealer = $('#iptIdDealer').val();
	var urltxt = ctx + '/catalogo/validaDupicadoDealer?cveDealer='+cveDealer+'&idEmpresa='+idEmpresa+'&idDealer='+idDealer;

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
				$('#btnsaveDealer').show();
			} else {
				$('#btnsaveDealer').hide();
				$('#modalDealerDuplicado').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
} 



function descargarCatGrupoDealers() {
	window.open(ctx + '/catalogo/descargarGrupoDealers');
}

function descargarCatDealers() {
	window.open(ctx + '/catalogo/descargarDealers');
}