getDealerInvitPorDealer = function(){
	var grupoDealerSelected = $('#selectGrupoDInvitacionDist').val();
	$('#selectDealerInvitacionDist').html('');

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
					$('#selectDealerInvitacionDist').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selectDealerInvitacionDist').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selectDealerInvitacionDist').append(htmlAdd);
	}
}

showFuncionariosTodos = function(){
	eliminaMarcaRojo($("#selectEmpresaFuncTodos"));
	$('#selectEmpresaFuncTodos').val(0);
	$('#modalReporteFuncionariosTodos').modal({backdrop: 'static', keyboard: false});
}

generaFuncionariosTodos = function(){
	
	funcTodosValid = true;
	if($('#selectEmpresaFuncTodos').val() <= 0){
		marcaRojo($("#selectEmpresaFuncTodos"));
		funcTodosValid = false;
	}else{
		eliminaMarcaRojo($("#selectEmpresaFuncTodos"));
	}
	
	if(funcTodosValid){
		var urltxt = ctx+"/reportes/funcionariosTodos?idEmpresa="+$('#selectEmpresaFuncTodos').val(); 
		window.open(urltxt, '_blank');
		
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
	
}

showFuncionariosPrincipales = function(){
	eliminaMarcaRojo($("#selectEmpresaFuncPrinc"));
	$('#selectEmpresaFuncPrinc').val(0);
	$('#modalReporteFuncionariosPrincipales').modal({backdrop: 'static', keyboard: false});
}

generaFuncionariosPrinc = function(){
	
	funcPrincValid = true;
	if($('#selectEmpresaFuncPrinc').val() <= 0){
		marcaRojo($("#selectEmpresaFuncPrinc"));
		funcPrincValid = false;
	}else{
		eliminaMarcaRojo($("#selectEmpresaFuncPrinc"));
	}
	
	if(funcPrincValid){
		var urltxt = ctx+"/reportes/funcionariosPrincipal?idEmpresa="+$('#selectEmpresaFuncPrinc').val(); 
		window.open(urltxt, '_blank');
		
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
	
}

showCenso = function(){
	eliminaMarcaRojo($("#selectEmpresaCenso"));
	$('#selectEmpresaCenso').val(0);
	$('#modalReporteCenso').modal({backdrop: 'static', keyboard: false});
}

generaCenso = function(){
	
	censoValid = true;
	if($('#selectEmpresaCenso').val() <= 0){
		marcaRojo($("#selectEmpresaCenso"));
		censoValid = false;
	}else{
		eliminaMarcaRojo($("#selectEmpresaCenso"));
	}
	
	if(censoValid){
		var urltxt = ctx+"/reportes/censo?idEmpresa="+$('#selectEmpresaCenso').val(); 
		window.open(urltxt, '_blank');
		
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}


showListaInscripcion = function(){
	eliminaMarcaRojo($("#selectEmpresaListaInscripcion"));
	$('#selectEmpresaListaInscripcion').val(0);
	$('#modalReporteListaInscripcion').modal({backdrop: 'static', keyboard: false});
}

generaListaInscripcion = function(){
	
	listaInscripcionValid = true;
	if($('#selectEmpresaListaInscripcion').val() <= 0){
		marcaRojo($("#selectEmpresaListaInscripcion"));
		listaInscripcionValid = false;
	}else{
		eliminaMarcaRojo($("#selectEmpresaListaInscripcion"));
	}
	
	if(listaInscripcionValid){
		var urltxt = ctx+"/reportes/listaInscripcion?idEmpresa="+$('#selectEmpresaListaInscripcion').val(); 
		window.open(urltxt, '_blank');
		
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

generaListaInscripcionEder = function(){
	var urltxt = ctx+"/reportes/listaInscripcionEder"; 
	window.open(urltxt, '_blank');
}

showCobranza = function(){
	eliminaMarcaRojo($("#selectEmpresaCobranza"));
	$('#selectEmpresaCobranza').val(0);
	$('#modalReporteCobranza').modal({backdrop: 'static', keyboard: false});
}

generaCobranza = function(){
	
	cobranzaValid = true;
	if($('#selectEmpresaCobranza').val() <= 0){
		marcaRojo($("#selectEmpresaCobranza"));
		cobranzaValid = false;
	}else{
		eliminaMarcaRojo($("#selectEmpresaCobranza"));
	}
	
	if(cobranzaValid){
		var urltxt = ctx+"/reportes/cobranza?idEmpresa="+$('#selectEmpresaCobranza').val(); 
		window.open(urltxt, '_blank');
		
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

openAsesores = function(){
	var urltxt = ctx+"/reportes/asesores"; 
	window.open(urltxt, '_blank');
}

openCerAS = function(){
	$('#modalReporteCerAs').modal({backdrop: 'static', keyboard: false});
}

openCerASSPP = function(){
	$('#modalReporteCerAsSPP').modal({backdrop: 'static', keyboard: false});
}

generaCerAs = function(){
	var iniAnio = $('#iptInicioCerAs').val().substring(0,4);
	var iniMes  = $('#iptInicioCerAs').val().substring(5,7);
	var iniDia  = $('#iptInicioCerAs').val().substring(8,10);
	var finAnio = $('#iptFinCerAs').val().substring(0,4);
	var finMes  = $('#iptFinCerAs').val().substring(5,7);
	var finDia  = $('#iptFinCerAs').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"

	var urltxt = ctx+"/reportes/cerAs?param="+fechaInicio+"&param2="+fechaFin; 
	window.open(urltxt, '_blank');
}

generaCerAsSPP = function(){
	var iniAnio = $('#iptInicioCerAsSPP').val().substring(0,4);
	var iniMes  = $('#iptInicioCerAsSPP').val().substring(5,7);
	var iniDia  = $('#iptInicioCerAsSPP').val().substring(8,10);
	var finAnio = $('#iptFinCerAsSPP').val().substring(0,4);
	var finMes  = $('#iptFinCerAsSPP').val().substring(5,7);
	var finDia  = $('#iptFinCerAsSPP').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"

	var urltxt = ctx+"/reportes/cerAsSpp?param="+fechaInicio+"&param2="+fechaFin; 
	window.open(urltxt, '_blank');
}



openCerTec = function(){
	$('#modalReporteCerTec').modal({backdrop: 'static', keyboard: false});
}

openCerTecSPP = function(){
	var iniAnio = $('#iptInicioCerAsSPP').val().substring(0,4);
	var iniMes  = $('#iptInicioCerAsSPP').val().substring(5,7);
	var iniDia  = $('#iptInicioCerAsSPP').val().substring(8,10);
	var finAnio = $('#iptFinCerAsSPP').val().substring(0,4);
	var finMes  = $('#iptFinCerAsSPP').val().substring(5,7);
	var finDia  = $('#iptFinCerAsSPP').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"
	$('#modalReporteCerTecSPP').modal({backdrop: 'static', keyboard: false});
}

openCerTecKPI = function(){
	$('#modalReporteCerTecKPI').modal({backdrop: 'static', keyboard: false});
}

openCerTecKPISPP = function(){
	$('#modalReporteCerTecKPISPP').modal({backdrop: 'static', keyboard: false});
}

openCerTecMes = function(){
	$('#modalReporteCerTecMes').modal({backdrop: 'static', keyboard: false});
}

openCerTecMesSPP = function(){
	$('#modalReporteCerTecMesSPP').modal({backdrop: 'static', keyboard: false});
}


generaCerTec = function(){
	var iniAnio = $('#iptInicioCerAsSPP').val().substring(0,4);
	var iniMes  = $('#iptInicioCerAsSPP').val().substring(5,7);
	var iniDia  = $('#iptInicioCerAsSPP').val().substring(8,10);
	var finAnio = $('#iptFinCerAsSPP').val().substring(0,4);
	var finMes  = $('#iptFinCerAsSPP').val().substring(5,7);
	var finDia  = $('#iptFinCerAsSPP').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"

	var urltxt = ctx+"/reportes/cerTec?param="+$('#selectPeriodoCerTec').val(); 
	window.open(urltxt, '_blank');
}

generaCerTecSPP = function(){
	var iniAnio = $('#iptInicioCerAsSPP').val().substring(0,4);
	var iniMes  = $('#iptInicioCerAsSPP').val().substring(5,7);
	var iniDia  = $('#iptInicioCerAsSPP').val().substring(8,10);
	var finAnio = $('#iptFinCerAsSPP').val().substring(0,4);
	var finMes  = $('#iptFinCerAsSPP').val().substring(5,7);
	var finDia  = $('#iptFinCerAsSPP').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"

	var urltxt = ctx+"/reportes/cerTecSPP?param="+$('#selectPeriodoCerTecSPP').val(); 
	window.open(urltxt, '_blank');
}

generaCerTecKPI = function(){
	var urltxt = ctx+"/reportes/cerTecKPI?param="+$('#selectPeriodoCerTecKPI').val(); 
	window.open(urltxt, '_blank');
}

generaCerTecKPISPP = function(){
	var urltxt = ctx+"/reportes/cerTecKPISPP?param="+$('#selectPeriodoCerTecKPISPP').val(); 
	window.open(urltxt, '_blank');
}

generaCerTecMes = function(){
	var urltxt = ctx+"/reportes/cerTecMes?param="+$('#selectPeriodoCerTecMes').val(); 
	window.open(urltxt, '_blank');
}

generaCerTecMesSPP = function(){
	var urltxt = ctx+"/reportes/cerTecMesSPP?param="+$('#selectPeriodoCerTecMesSPP').val(); 
	window.open(urltxt, '_blank');
}


openCuadernillos = function(){
	$('#modalReporteCuadernillos').modal({backdrop: 'static', keyboard: false});
}

generaCuadernillos = function(){
	var urltxt = ctx+"/reportes/reporteCuadernillosTSM?param="+$('#selectPeriodoCuadernillos').val(); 
	window.open(urltxt, '_blank');
}

generaCensoGeneralEDER = function(){
	var urltxt = ctx+"/reportes/censoGeneralEDER"; 
	window.open(urltxt, '_blank');
}


generaDealersEDER = function(){
	var urltxt = ctx+"/reportes/dealersEder"; 
	window.open(urltxt, '_blank');
}

openNotasDojo = function(){
	$('#modalReporteNotasDojo').modal({backdrop: 'static', keyboard: false});
}

generaNotasDojo = function(){
	var urltxt = ctx+"/reportes/notasDojo?param="+$('#selectPeriodoNotasDojo').val(); 
	window.open(urltxt, '_blank');
}


openCobrosFYA = function(){
	$('#modalReporteCobrosFYA').modal({backdrop: 'static', keyboard: false});
}

generaNotasDojo = function(){
	var urltxt = ctx+"/reportes/cobrosFYA?param="+$('#selectPeriodoFYA').val(); 
	window.open(urltxt, '_blank');
}

openCalculoCancelacion = function(){
	$('#modalReporteCalculoCancelacion').modal({backdrop: 'static', keyboard: false});
}

generaCalculoCancelacion = function(){
	var urltxt = ctx+"/reportes/calculoCancelacion?param="+$('#selectPeriodoCalculoCancelacion').val(); 
	window.open(urltxt, '_blank');
}

openInscSintetico = function(){
	$('#modalInscNoSCancNoES').modal({backdrop: 'static', keyboard: false});
}

generaInscripcionesSintetico = function(){
	var urltxt = ctx+"/reportes/inscNoShowCanc?param="+$('#selectPeriodoInscNosCancNoES').val(); 
	window.open(urltxt, '_blank');
}

openInvitacionDistribuidor = function(){
	$('#modalInvitacionDistribuidor').modal({backdrop: 'static', keyboard: false});
}

generaInvitacionDistribuidor = function(){

	var iniAnio = $('#iptInicioInvitDist').val().substring(0,4);
	var iniMes  = $('#iptInicioInvitDist').val().substring(5,7);
	var iniDia  = $('#iptInicioInvitDist').val().substring(8,10);
	var finAnio = $('#iptFinInvitDist').val().substring(0,4);
	var finMes  = $('#iptFinInvitDist').val().substring(5,7);
	var finDia  = $('#iptFinInvitDist').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"
	
	
	var grupoDealerSelected = $('#selectDealerInvitacionDist').val();
	
	if(grupoDealerSelected > 0){
		eliminaMarcaRojo($("#selectDealerInvitacionDist"));
		var urltxt = ctx+"/reportes/invDistribuidor?param3="+grupoDealerSelected+"&param="+fechaInicio+"&param2="+fechaFin; 
		window.open(urltxt, '_blank');
	}else{
		marcaRojo($("#selectDealerInvitacionDist"));
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

generaSkillAS = function(){
	var urltxt = ctx+"/reportes/skillAS"; 
	window.open(urltxt, '_blank');
}
generaSkillTec = function(){
	var urltxt = ctx+"/reportes/skillTEC"; 
	window.open(urltxt, '_blank');
}

generaTecnicos = function(){
	var urltxt = ctx+"/reportes/tecnicos"; 
	window.open(urltxt, '_blank');
}


openSkillDNAsesores = function(){
	$('#modalSkillDNAsesores').modal({backdrop: 'static', keyboard: false});
}

openSkillDNTecnicos = function(){
	$('#modalSkillDNTecnicos').modal({backdrop: 'static', keyboard: false});
}

openCalifToyota = function(){
	$('#modalCalifToyota').modal({backdrop: 'static', keyboard: false});
}

openMatrizToyota = function(){
	$('#modalMatrizToyota').modal({backdrop: 'static', keyboard: false});
}

getDealerSkillDNAsesores = function(){
	var grupoDealerSelected = $('#selectGrupoDSkillDNAsesores').val();
	$('#selectDealerSkillDNAsesores').html('');

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
					$('#selectDealerSkillDNAsesores').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selectDealerSkillDNAsesores').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selectDealerSkillDNAsesores').append(htmlAdd);
	}
}

generaSkillDNAsesores = function(){
	var grupoDealerSelected = $('#selectDealerSkillDNAsesores').val();
	if(grupoDealerSelected > 0){
		eliminaMarcaRojo($("#selectDealerSkillDNAsesores"));
		var urltxt = ctx+"/reportes/skillDNAS?param="+$('#selectDealerSkillDNAsesores').val(); 
		window.open(urltxt, '_blank');
	}else{
		marcaRojo($("#selectDealerSkillDNAsesores"));
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}


getDealerSkillDNTecnicos = function(){
	var grupoDealerSelected = $('#selectGrupoDSkillDNTecnicos').val();
	$('#selectDealerSkillDNTecnicos').html('');

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
					$('#selectDealerSkillDNTecnicos').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selectDealerSkillDNTecnicos').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selectDealerSkillDNTecnicos').append(htmlAdd);
	}
}

generaSkillDNTecnicos = function(){
	var grupoDealerSelected = $('#selectDealerSkillDNTecnicos').val();
	if(grupoDealerSelected > 0){
		eliminaMarcaRojo($("#selectDealerSkillDNTecnicos"));
		var urltxt = ctx+"/reportes/skillDNTEC?param="+$('#selectDealerSkillDNTecnicos').val(); 
		window.open(urltxt, '_blank');
	}else{
		marcaRojo($("#selectDealerSkillDNTecnicos"));
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}



getDealerCalifToyota = function(){
	var grupoDealerSelected = $('#selectGrupoDCalifToyota').val();
	$('#selectDealerCalifToyota').html('');

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
					$('#selectDealerCalifToyota').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selectDealerCalifToyota').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selectDealerCalifToyota').append(htmlAdd);
	}
}

generaCalifToyota = function(){
	var grupoDealerSelected = $('#selectDealerCalifToyota').val();
	if(grupoDealerSelected > 0){
		eliminaMarcaRojo($("#selectDealerCalifToyota"));
		var urltxt = ctx+"/reportes/califToyo?param="+$('#selectDealerCalifToyota').val(); 
		window.open(urltxt, '_blank');
	}else{
		marcaRojo($("#selectDealerCalifToyota"));
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}


getDealerMatrizToyota = function(){
	var grupoDealerSelected = $('#selectGrupoDMatrizToyota').val();
	$('#selectDealerMatrizToyota').html('');

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
					$('#selectDealerMatrizToyota').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selectDealerMatrizToyota').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selectDealerMatrizToyota').append(htmlAdd);
	}
}

generaMatrizToyota = function(){
	var grupoDealerSelected = $('#selectDealerMatrizToyota').val();
	if(grupoDealerSelected > 0){
		eliminaMarcaRojo($("#selectDealerMatrizToyota"));
		var urltxt = ctx+"/reportes/matrizToyota?param="+$('#selectDealerMatrizToyota').val(); 
		window.open(urltxt, '_blank');
	}else{
		marcaRojo($("#selectDealerMatrizToyota"));
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}




openCalendarioCursos = function(){
	$('#modalCalendarioCursos').modal({backdrop: 'static', keyboard: false});
}


generaCalendarioCursos = function(){

	var iniAnio = $('#iptInicioCalendarioCursos').val().substring(0,4);
	var iniMes  = $('#iptInicioCalendarioCursos').val().substring(5,7);
	var iniDia  = $('#iptInicioCalendarioCursos').val().substring(8,10);
	var finAnio = $('#iptFinCalendarioCursos').val().substring(0,4);
	var finMes  = $('#iptFinCalendarioCursos').val().substring(5,7);
	var finDia  = $('#iptFinCalendarioCursos').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"

	var urltxt = ctx+"/reportes/calendarioCurso?param="+fechaInicio+"&param2="+fechaFin; 
	window.open(urltxt, '_blank');
}


generaDSC = function(){
	var urltxt = ctx+"/reportes/DSC"; 
	window.open(urltxt, '_blank');
}


generaMezclaTrabajo = function(){
	var urltxt = ctx+"/reportes/mezclaTrabajo"; 
	window.open(urltxt, '_blank');
} 


openCalificacionCursoActividad = function(){
	$('#selectEmpresaCalificacionCursoActividad').val(0);
	eliminaMarcaRojo($("#selectEmpresaCalificacionCursoActividad"));
	$('#modalCalificacionCursoActividad').modal({backdrop: 'static', keyboard: false});
}

generaCalificacionCursoActividad = function(){

	var iniAnio = $('#iptInicioCalificacionCursoActividad').val().substring(0,4);
	var iniMes  = $('#iptInicioCalificacionCursoActividad').val().substring(5,7);
	var iniDia  = $('#iptInicioCalificacionCursoActividad').val().substring(8,10);
	var finAnio = $('#iptFinCalificacionCursoActividad').val().substring(0,4);
	var finMes  = $('#iptFinCalificacionCursoActividad').val().substring(5,7);
	var finDia  = $('#iptFinCalificacionCursoActividad').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"
	
	
	reporteCCAValido = true;
	if($('#selectEmpresaCalificacionCursoActividad').val() <= 0){
		marcaRojo($("#selectEmpresaCalificacionCursoActividad"));
		reporteCCAValido = false;
	}else{
		eliminaMarcaRojo($("#selectEmpresaCalificacionCursoActividad"));
	}
	
	if(reporteCCAValido){
		var urltxt = ctx+"/reportes/calificacionesCursoActividad?param="+$('#selectEmpresaCalificacionCursoActividad').val()+"&param1="+fechaInicio+"&param2="+fechaFin; 
		window.open(urltxt, '_blank');
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

openDetalleCalificaciones = function(){
	$('#selectEmpresaDetalleCalificaciones').val(0);
	eliminaMarcaRojo($("#selectEmpresaDetalleCalificaciones"));
	$('#modalDetalleCalificaciones').modal({backdrop: 'static', keyboard: false});
}

generaDetalleCalificaciones = function(){

	var iniAnio = $('#iptInicioDetalleCalificaciones').val().substring(0,4);
	var iniMes  = $('#iptInicioDetalleCalificaciones').val().substring(5,7);
	var iniDia  = $('#iptInicioDetalleCalificaciones').val().substring(8,10);
	var finAnio = $('#iptFinDetalleCalificaciones').val().substring(0,4);
	var finMes  = $('#iptFinDetalleCalificaciones').val().substring(5,7);
	var finDia  = $('#iptFinDetalleCalificaciones').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"
	
	
	reporteDCValido = true;
	if($('#selectEmpresaDetalleCalificaciones').val() <= 0){
		marcaRojo($("#selectEmpresaDetalleCalificaciones"));
		reporteCCAValido = false;
	}else{
		eliminaMarcaRojo($("#selectEmpresaDetalleCalificaciones"));
	}
	
	if(reporteDCValido){
		var urltxt = ctx+"/reportes/detalleCalificaciones?param="+$('#selectEmpresaDetalleCalificaciones').val()+"&param1="+fechaInicio+"&param2="+fechaFin; 
		window.open(urltxt, '_blank');
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

openReporteNecDetalle = function(){
	$('#selectTipoCursoNecDetalle').val(2);
	getCursosNecDetalle();
	
	eliminaMarcaRojo($("#selectTipoCursoNecDetalle"));
	$('#selectCursoNecDetalle').html('<option value="0">Seleccione...</option>');
	$('#modalReporteNecDetalle').modal({backdrop: 'static', keyboard: false});
}

getCursosNecDetalle = function(){
	idTipo = $('#selectTipoCursoNecDetalle').val();
	
	$('#selectCursoNecDetalle').html('');
	
	if(idTipo > 0){
		var urltxt = ctx+"/cursos/getByTipo?param=2&param2="+idTipo;
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
					$('#selectCursoNecDetalle').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selectCursoNecDetalle').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selectCursoNecDetalle').append(htmlAdd);
	}
}

generaNecCursoDetalle = function(){
	idCurso = $("#selectCursoNecDetalle").val();
	if(idCurso > 0){
		eliminaMarcaRojo($("#selectCursoNecDetalle"));
		var urltxt = ctx+"/reportes/reportNecCursoDet?param="+idCurso; 
		window.open(urltxt, '_blank');
	}else{
		marcaRojo($("#selectCursoNecDetalle"));
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
} 


generaRCE = function(){
	var urltxt = ctx+"/reportes/rce"; 
	window.open(urltxt, '_blank');
}


openDetalleCalificacionesHorizontal = function(){
	$('#modalDetalleCalificacionesHorizontal').modal({backdrop: 'static', keyboard: false});
}

function validateEmpresaDetalle(){

	var valueSelectorEmpresaDetalle = $('#selectEmpresaDetalleCalificacionesHorizontal').val();
	$('#selectEmpresaDetalleEncuesta').html('');
	
	if(valueSelectorEmpresaDetalle > 0){
	
		var urltxt = ctx+"/reportes/getEncuestasByEmpresa?idEmpresa="+valueSelectorEmpresaDetalle;
		
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
						htmlAdd += '<option value="' + element.id+ '" >' + element.cursoVO.codigo + '-' + element.nombre + '</option>';
					}
					$('#selectEmpresaDetalleEncuesta').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selectEmpresaDetalleEncuesta').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selectEmpresaDetalleEncuesta').append(htmlAdd);
	}
}

generaDetalleCalificacionesV2 = function(){

	var iniAnio = $('#iptInicioDetalleCalificacionesHorizontal').val().substring(0,4);
	var iniMes  = $('#iptInicioDetalleCalificacionesHorizontal').val().substring(5,7);
	var iniDia  = $('#iptInicioDetalleCalificacionesHorizontal').val().substring(8,10);
	var finAnio = $('#iptFinDetalleCalificacionesHorizontal').val().substring(0,4);
	var finMes  = $('#iptFinDetalleCalificacionesHorizontal').val().substring(5,7);
	var finDia  = $('#iptFinDetalleCalificacionesHorizontal').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"
	
	reporteDCValido = true;
	if($('#selectEmpresaDetalleCalificacionesHorizontal').val() <= 0){
		marcaRojo($("#selectEmpresaDetalleCalificacionesHorizontal"));
		reporteDCValido = false;
	}else{
		eliminaMarcaRojo($("#selectEmpresaDetalleCalificacionesHorizontal"));
	}
	
	/*
	if($('#selectEmpresaDetalleEncuesta').val() <= 0){
		marcaRojo($("#selectEmpresaDetalleEncuesta"));
		reporteDCValido = false;
	}else{
		eliminaMarcaRojo($("#selectEmpresaDetalleEncuesta"));
	}
	*/
	
	if(reporteDCValido){
		var urltxt = ctx+"/reportes/detalleCalificacionesHorizontal?param="+$('#selectEmpresaDetalleCalificacionesHorizontal').val()+"&param1="+$('#selectEmpresaDetalleEncuesta').val()+"&param2="+fechaInicio+"&param3="+fechaFin; 
		window.open(urltxt, '_blank');
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
}

getGrupoDealerEmpresaInv = function(){

	var empresaSelected = $('#selectEmpresaInvitacionDist').val();
	$('#selectGrupoDInvitacionDist').html('');
	$('#selectDealerInvitacionDist').html('');

	if(empresaSelected > 0){
		var urltxt = ctx+"/catalogos/getGrupoDealer?idEmpresa="+empresaSelected;
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
						htmlAdd += '<option value="' + element.id+ '" >' + element.agrupacion + '</option>';
					}
					$('#selectGrupoDInvitacionDist').append(htmlAdd);
					var htmlAddDealer = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selectDealerInvitacionDist').append(htmlAddDealer);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selectGrupoDInvitacionDist').append(htmlAdd);
					$('#selectDealerInvitacionDist').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selectGrupoDInvitacionDist').append(htmlAdd);
		$('#selectDealerInvitacionDist').append(htmlAdd);
	}
}







