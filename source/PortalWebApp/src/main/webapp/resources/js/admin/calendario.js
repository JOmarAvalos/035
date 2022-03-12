newAgendarCurso = function(idEmpresa) {
	
	// Resetea validadores
	$('#formAgendarCurso').parsley().reset();
	
	
	$('#tbodyCursosAgenda').html('');
	$('#selectAgendaSede').html('');
	$('#nombreCursoSeleccionado').html('');
	
	var urltxt = ctx + '/calendario/getSelectEventoCalendario?idEmpresa='+idEmpresa;
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
			
			var result = response[0];
			
			if (result) {
				var htmlAddCursos = '';
				var cursos = response[1];
				if(cursos != 'undefined'){
					for (var i = 0; i < cursos.length; i++) {
						var element = cursos[i];
						htmlAddCursos += '<tr> <td>'+element.nombre+'</td> <td> <button type="button" class="btn" onclick="seleccionaCurso(\''+element.id+'\',\''+element.nombre+'\');">Seleccionar</button> </td> </tr>';
					}
				}
				
				
				var htmlAddSedes = '<option value="0" selected="selected">Seleccione...</option>';
				var sedes = response[2];
				if(sedes != 'undefined'){
					for (var i = 0; i < sedes.length; i++) {
						var element = sedes[i];
						htmlAddSedes += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
					}
				}
				
//				var htmlAddCancelacionCurso = '<option value="0" selected="selected">Seleccione...</option>';
//				var motivoCancelacionCursos = response[3];
//				if(motivoCancelacionCursos != 'undefined'){
//					for (var i = 0; i < motivoCancelacionCursos.length; i++) {
//						var element = motivoCancelacionCursos[i];
//						htmlAddCancelacionCurso += '<option value="' + element.id+ '" >' + element.motivoCancelacion + '</option>';
//					}
//				}
				
				$('#tbodyCursosAgenda').append(htmlAddCursos);
				$('#selectAgendaSede').append(htmlAddSedes);
//				$('#selectAgendaCancelacion').append(htmlAddCancelacionCurso);
				
				$('#tblCursosAgenda').dataTable({
					"bRetrieve": true,
					"bDestroy": true,
		            "bPaginate": true,
		            "bFilter": true,
		            "bSort": true,
		            "bInfo": true,
		            "language": {
		                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
		            }
		        });
			} else {
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formAgendarCurso');
		}
	});
	
	
	// Limpia los campos
	$("#iptEmpresaId").val(idEmpresa);
	$("#selectAgendaCurso").val('');
	$("#selectAgendaInstructor").val('');
	$("#selectAgendaSede").val('');
	$("#iptAgendaCostoCurso").val('0');
	$("#iptAgendaCostoMaterial").val('0');
	$("#iptAgendaCostoCancelacion").val('0');
	$("#iptAgendaAsistenteMinimo").val('0');
	$("#iptAgendaAsistenteMaximo").val('0');
	$("#iptAgendaFechaInicio").val('');
	$("#iptAgendaFechaFin").val('');
	$("#selectAgendaEstatus").val('');
	
	
	$('#modalNewAgenda').modal({backdrop: 'static', keyboard: false});
}

saveAgendarCurso = function() {
	
//	iptAgendaFechaInicio
//	iptAgendaFechaFin
//	iptAgendaAsistenteMinimo
//	iptAgendaAsistenteMaximo
//	selectAgendaCurso
//	iptAgendaCostoCurso
//	iptAgendaCostoCancelacion
//	iptAgendaCostoMaterial
	
	$('#btnGuardaAgenda').hide();
	eventoValid = true;
	if (!notNull($("#iptAgendaFechaInicio"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaFechaFin"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaAsistenteMinimo"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaAsistenteMaximo"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaCostoCurso"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaCostoCancelacion"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaCostoMaterial"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaCostoNoShow"))) {
		eventoValid = false;
	}
	
	if(eventoValid){
		var eventoCalendario = new Object;
		
		eventoCalendario.idEmpresa = $('#iptEmpresaId').val();
		eventoCalendario.idCurso = $('#selectAgendaCurso').val();
		if($('#selectAgendaInstructor').val() > 0){
			eventoCalendario.idInstructor = $('#selectAgendaInstructor').val();
		}
		
		if($('#selectAgendaSede').val() > 0){
			eventoCalendario.idSede = $('#selectAgendaSede').val();
		}
		
		eventoCalendario.costoCurso = $('#iptAgendaCostoCurso').val();
		eventoCalendario.costoMaterial = $('#iptAgendaCostoMaterial').val();
		eventoCalendario.costoCancelacion = $('#iptAgendaCostoCancelacion').val();
		eventoCalendario.costoNoShow = $('#iptAgendaCostoNoShow').val();
		eventoCalendario.asistentesMinimo = $('#iptAgendaAsistenteMinimo').val();
		eventoCalendario.asistentesMaximo = $('#iptAgendaAsistenteMaximo').val();
		
		var iniAnio = $('#iptAgendaFechaInicio').val().substring(0,4);
		var iniMes  = $('#iptAgendaFechaInicio').val().substring(5,7);
		var iniDia  = $('#iptAgendaFechaInicio').val().substring(8,10);
		var iniHora = $('#iptAgendaFechaInicio').val().substring(11,13);
		var iniMin  = $('#iptAgendaFechaInicio').val().substring(14,16);
		eventoCalendario.fechaInicio = new Date(iniAnio, iniMes-1, iniDia, iniHora, iniMin, 0, 0);
		
		var finAnio = $('#iptAgendaFechaFin').val().substring(0,4);
		var finMes  = $('#iptAgendaFechaFin').val().substring(5,7);
		var finDia  = $('#iptAgendaFechaFin').val().substring(8,10);
		var finHora = $('#iptAgendaFechaFin').val().substring(11,13);
		var finMin  = $('#iptAgendaFechaFin').val().substring(14,16);
		eventoCalendario.fechaFin = new Date(finAnio, finMes-1, finDia, finHora, finMin, 0, 0);
		

		// Guardar nuevo registro
		var urltxt = ctx + '/calendario/saveEventoCalendario';
		
		// Actualizar registro
		if ($.trim($("#iptAgendaId").val()) != ''){
			eventoCalendario.id = $('#iptAgendaId').val();
		} 
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(eventoCalendario),
			beforeSend : function() {
				maskBody();
			},
			complete : function() {
				unmaskBody();
			},
			success : function(response) {
				
				var result = response[0];
				var msg = response[1];
				
				if (result) {
					window.location = ctx + '/';
					displaySuccesMessageByObjectId('',msg,'formAgendarCurso');
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
					$('#btnGuardaAgenda').show();
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				$('#btnGuardaAgenda').show();
			}
		});
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
		$('#btnGuardaAgenda').show();
	}


}


updateAgendarCurso = function() {
	
//	iptAgendaFechaInicio
//	iptAgendaFechaFin
//	iptAgendaAsistenteMinimo
//	iptAgendaAsistenteMaximo
//	selectAgendaCurso
//	iptAgendaCostoCurso
//	iptAgendaCostoCancelacion
//	iptAgendaCostoMaterial
	
	
	eventoValid = true;
	if (!notNull($("#iptAgendaFechaInicio"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaFechaFin"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaAsistenteMinimo"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaAsistenteMaximo"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaCostoCurso"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaCostoCancelacion"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaCostoMaterial"))) {
		eventoValid = false;
	}
	
	if (!notNull($("#iptAgendaCostoNoShow"))) {
		eventoValid = false;
	}

	if(eventoValid){
		var eventoCalendario = new Object;
		
		eventoCalendario.idEmpresa = $('#iptEmpresaId').val();
		eventoCalendario.idCurso = $('#iptIdCurso').val();
		if($('#selectAgendaInstructor').val() > 0){
			eventoCalendario.idInstructor = $('#selectAgendaInstructor').val();
		}
		
		if($('#selectAgendaSede').val() > 0){
			eventoCalendario.idSede = $('#selectAgendaSede').val();
		}
		
		eventoCalendario.costoCurso = $('#iptAgendaCostoCurso').val();
		eventoCalendario.costoMaterial = $('#iptAgendaCostoMaterial').val();
		eventoCalendario.costoNoShow = $('#iptAgendaCostoNoShow').val();
		eventoCalendario.costoCancelacion = $('#iptAgendaCostoCancelacion').val();
		eventoCalendario.asistentesMinimo = $('#iptAgendaAsistenteMinimo').val();
		eventoCalendario.asistentesMaximo = $('#iptAgendaAsistenteMaximo').val();
		
		var iniAnio = $('#iptAgendaFechaInicio').val().substring(0,4);
		var iniMes  = $('#iptAgendaFechaInicio').val().substring(5,7);
		var iniDia  = $('#iptAgendaFechaInicio').val().substring(8,10);
		var iniHora = $('#iptAgendaFechaInicio').val().substring(11,13);
		var iniMin  = $('#iptAgendaFechaInicio').val().substring(14,16);
		eventoCalendario.fechaInicio = new Date(iniAnio, iniMes-1, iniDia, iniHora, iniMin, 0, 0);
		
		var finAnio = $('#iptAgendaFechaFin').val().substring(0,4);
		var finMes  = $('#iptAgendaFechaFin').val().substring(5,7);
		var finDia  = $('#iptAgendaFechaFin').val().substring(8,10);
		var finHora = $('#iptAgendaFechaFin').val().substring(11,13);
		var finMin  = $('#iptAgendaFechaFin').val().substring(14,16);
		eventoCalendario.fechaFin = new Date(finAnio, finMes-1, finDia, finHora, finMin, 0, 0);
		

		// Guardar nuevo registro
		var urltxt = ctx + '/calendario/saveEventoCalendario';
		
		// Actualizar registro
		if ($.trim($("#iptAgendaIdEdit").val()) != ''){
			eventoCalendario.id = $('#iptAgendaIdEdit').val();
		} 
		
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(eventoCalendario),
			beforeSend : function() {
				maskBody();
			},
			complete : function() {
				unmaskBody();
			},
			success : function(response) {
				
				var result = response[0];
				var msg = response[1];
				
				if (result) {
					window.location = ctx + '/calendario/openEventoCalendario?id='+$('#iptAgendaIdEdit').val();
					
					
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
//editAgendarCurso = function(id) {
//	
//	// Resetea validadores
//	$('#formAgendarCurso').parsley().reset();
//	
//	// Ajusta titulo de modal
////	$('#iptAgendarCursoTitulo').html('');
////	$('#iptAgendarCursoTitulo').append('Actualizar curso agendado');
//	
//	// Limpia los campos
//	$("#selectAgendaCurso").val('');
//	$("#selectAgendaInstructor").val('');
//	$("#selectAgendaSede").val('');
//	$("#iptAgendaCostoCurso").val('0');
//	$("#iptAgendaCostoMaterial").val('0');
//	$("#iptAgendaCostoCancelacion").val('0');
//	$("#iptAgendaAsistenteMinimo").val('0');
//	$("#iptAgendaAsistenteMaximo").val('0');
//	$("#iptAgendaFechaInicio").val('');
//	$("#iptAgendaFechaFin").val('');
//	$("#selectAgendaEstatus").val('');
//	
//	var urltxt = ctx + '/calendario/getEventoCalendario?id='+id;
//	
//	$.ajax({
//		type : "POST",
//		url : urltxt,
//		contentType : "application/json",
//		beforeSend : function() {
//			maskBody();
//		},
//		complete : function() {
//			unmaskBody();
//		},
//		success : function(response) {
//			
//			if (response[0]) {
//				
//				var object = response[1];
//
//				$("#iptAgendaId").val(object.id);
//				$("#selectAgendaCurso").val(object.idCurso);
//				$("#selectAgendaInstructor").val(object.idInstructor);
//				$("#selectAgendaSede").val(object.idSede);
//				$("#iptAgendaCostoCurso").val(object.costoCurso);
//				$("#iptAgendaCostoMaterial").val(object.costoMaterial);
//				$("#iptAgendaCostoCancelacion").val(object.costoCancelacion);
//				$("#iptAgendaAsistenteMinimo").val(object.asistentesMinimo);
//				$("#iptAgendaAsistenteMaximo").val(object.asistentesMaximo);
//				
//				
//				var fechaI        = new Date(object.fechaInicio);
//				var fechaIYear    = fechaI.getFullYear();
//				var fechaIMonth   = fechaI.getMonth() + 1;
//				if( fechaIMonth <= 9){
//					fechaIMonth = '0' + fechaIMonth.toString();
//				}
//				var fechaIDay     = fechaI.getDate();
//				if( fechaIDay <= 9){
//					fechaIDay = '0' + fechaIDay.toString();
//				}
//				var fechaIHour    = fechaI.getHours();
//				if( fechaIHour <= 9){
//					fechaIHour = '0' + fechaIHour.toString();
//				}
//				var fechaIMinute  = fechaI.getMinutes();
//				if( fechaIMinute <= 9){
//					fechaIMinute = '0' + fechaIMinute.toString();
//				}
//				var fechaIFormato = fechaIYear+'-'+fechaIMonth+'-'+fechaIDay+'T'+fechaIHour+':'+fechaIMinute;
//				$("#iptAgendaFechaInicio").val(fechaIFormato);
//				
//				
//				var fechaF = new Date(object.fechaFin);
//				var fechaFYear    = fechaF.getFullYear();
//				var fechaFMonth   = fechaF.getMonth() + 1;
//				if( fechaFMonth <= 9){
//					fechaFMonth = '0' + fechaFMonth.toString();
//				}
//				var fechaFDay     = fechaF.getDate();
//				if( fechaFDay <= 9){
//					fechaFDay = '0' + fechaFDay.toString();
//				}
//				var fechaFHour    = fechaF.getHours();
//				if( fechaFHour <= 9){
//					fechaFHour = '0' + fechaFHour.toString();
//				}
//				var fechaFMinute  = fechaF.getMinutes();
//				if( fechaFMinute <= 9){
//					fechaFMinute = '0' + fechaFMinute.toString();
//				}
//				var fechaFFormato = fechaFYear+'-'+fechaFMonth+'-'+fechaFDay+'T'+fechaFHour+':'+fechaFMinute;
//				$("#iptAgendaFechaFin").val(fechaFFormato);
//				
//			} else {
//				$('#modalTxtRespuesta').html('');
//				$('#modalTxtRespuesta').append('Error');
//				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
//			}
//		},
//		error : function(msg) {
//			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
//		}
//	});
//	
//	$('#modalNewAgenda').modal({backdrop: 'static', keyboard: false});
//	
//}

editAgendarCurso = function(id) {
	
	
	// Ajusta titulo de modal
//	$('#iptAgendarCursoTitulo').html('');
//	$('#iptAgendarCursoTitulo').append('Actualizar curso agendado');
	
	// Limpia los campos
	$("#selectAgendaCursoEdit").val('');
	$("#selectAgendaInstructorEdit").val('');
	$("#selectAgendaSedeEdit").val('');
	$("#iptAgendaCostoCursoEdit").val('0');
	$("#iptAgendaCostoMaterialEdit").val('0');
	$("#iptAgendaCostoNoShowEdit").val('0');
	$("#iptAgendaCostoCancelacionEdit").val('0');
	$("#iptAgendaAsistenteMinimoEdit").val('0');
	$("#iptAgendaAsistenteMaximoEdit").val('0');
	$("#iptAgendaFechaInicioEdit").val('');
	$("#iptAgendaFechaFinEdit").val('');
	$("#selectAgendaEstatusEdit").val('');
	$('#selectAgendaSedeEdit').html('');
	$('#tbodyInscritosCurso').html('');
	$('#tbodySolicitudesCurso').html('');
	$('#tbodyCanceladosCurso').html('');
	$('#selectMotivoCancelacion').html('');
	$('#iptAViewCursoTitulo').html('');
	$('#selectAgendaCancelacion').html('');
	$('#tbodyFuncionariosInscripcion').html('');
	
	var urltxt = ctx + '/calendario/getEventoCalendario?id='+id;
	
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
				
				var object = response[1];
				
				var htmlAddSedes = '<option value="0" selected="selected">Seleccione...</option>';
				var htmlAddMotivos = '<option value="0" selected="selected">Seleccione...</option>';
				var htmlAddCancelacionCurso = '<option value="0" selected="selected">Seleccione...</option>';
				var sedes = response[2];
				var motivosC = response[3];
				var motivoCancelacionCursos = response[4];
				
				if(sedes != 'undefined'){
					for (var i = 0; i < sedes.length; i++) {
						var element = sedes[i];
						htmlAddSedes += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
					}
				}
				
				if(motivosC != 'undefined'){
					for (var i = 0; i < motivosC.length; i++) {
						var element = motivosC[i];
						htmlAddMotivos += '<option value="' + element.id+ '" >' + element.motivoCancelacion + '</option>';
					}
				}
				
				if(motivoCancelacionCursos != 'undefined'){
					for (var i = 0; i < motivoCancelacionCursos.length; i++) {
						var element = motivoCancelacionCursos[i];
						htmlAddCancelacionCurso += '<option value="' + element.id+ '" >' + element.motivoCancelacion + '</option>';
					}
				}

				$('#selectAgendaSedeEdit').append(htmlAddSedes);
				$('#selectMotivoCancelacion').append(htmlAddMotivos);
				$('#selectAgendaCancelacion').append(htmlAddCancelacionCurso);
				
				$("#iptAgendaIdEdit").val(object.id);
				$("#iptEmpresaIdEdit").val(object.idEmpresa);
				$("#selectAgendaCursoEdit").val(object.idCurso);
				$("#selectAgendaInstructorEdit").val(object.idInstructor);
				$("#selectAgendaSedeEdit").val(object.idSede);
				$("#iptAgendaCostoCursoEdit").val(object.costoCurso);
				$("#iptAgendaCostoMaterialEdit").val(object.costoMaterial);
				$("#iptAgendaCostoNoShowEdit").val(object.costoNoShow);
				$("#iptAgendaCostoCancelacionEdit").val(object.costoCancelacion);
				$("#iptAgendaAsistenteMinimoEdit").val(object.asistentesMinimo);
				$("#iptAgendaAsistenteMaximoEdit").val(object.asistentesMaximo);
				$('#iptAViewCursoTitulo').append(object.cursoVO.nombre);
				
				
				
				var fechaI        = new Date(object.fechaInicio);
				var fechaIYear    = fechaI.getFullYear();
				var fechaIMonth   = fechaI.getMonth() + 1;
				if( fechaIMonth <= 9){
					fechaIMonth = '0' + fechaIMonth.toString();
				}
				var fechaIDay     = fechaI.getDate();
				if( fechaIDay <= 9){
					fechaIDay = '0' + fechaIDay.toString();
				}
				var fechaIHour    = fechaI.getHours();
				if( fechaIHour <= 9){
					fechaIHour = '0' + fechaIHour.toString();
				}
				var fechaIMinute  = fechaI.getMinutes();
				if( fechaIMinute <= 9){
					fechaIMinute = '0' + fechaIMinute.toString();
				}
				var fechaIFormato = fechaIYear+'-'+fechaIMonth+'-'+fechaIDay+'T'+fechaIHour+':'+fechaIMinute;
				$("#iptAgendaFechaInicioEdit").val(fechaIFormato);
				
				
				var fechaF = new Date(object.fechaFin);
				var fechaFYear    = fechaF.getFullYear();
				var fechaFMonth   = fechaF.getMonth() + 1;
				if( fechaFMonth <= 9){
					fechaFMonth = '0' + fechaFMonth.toString();
				}
				var fechaFDay     = fechaF.getDate();
				if( fechaFDay <= 9){
					fechaFDay = '0' + fechaFDay.toString();
				}
				var fechaFHour    = fechaF.getHours();
				if( fechaFHour <= 9){
					fechaFHour = '0' + fechaFHour.toString();
				}
				var fechaFMinute  = fechaF.getMinutes();
				if( fechaFMinute <= 9){
					fechaFMinute = '0' + fechaFMinute.toString();
				}
				var fechaFFormato = fechaFYear+'-'+fechaFMonth+'-'+fechaFDay+'T'+fechaFHour+':'+fechaFMinute;
				$("#iptAgendaFechaFinEdit").val(fechaFFormato);
				
				
				var inscritos = object.inscritos;
				var cancelados = object.cancelados;
				var solicitados = object.solicitados;
				var funcionarios = object.funcionarios;
				
				var htmlAddInscritos = '';
				maxInscritos = object.asistentesMaximo;
				totalInscritos = 0;
				if(inscritos != 'undefined'){
					for (var i = 0; i < inscritos.length; i++) {
						var element = inscritos[i];
						htmlAddInscritos += '<tr> <td>'+element.funcionarioEstatus.datosFuncionarioVO.nombres+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoUno+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoDos+'</td><td>'+element.funcionarioBy.datosFuncionarioVO.nombres+' '+element.funcionarioBy.datosFuncionarioVO.apellidoUno+' '+element.funcionarioBy.datosFuncionarioVO.apellidoDos+'</td> <td><button type="button" class="btn" onclick="openCancela(\''+element.id+'\',\''+id+'\');">Cancelar</button></td> </tr>';
						totalInscritos++;
					}
				}
				
				var htmlAddCancelados = '';
				if(cancelados != 'undefined'){
					for (var i = 0; i < cancelados.length; i++) {
						var element = cancelados[i];
						if(element.estatus == 4){
							htmlAddCancelados += '<tr> <td>'+element.funcionarioEstatus.datosFuncionarioVO.nombres+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoUno+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoDos+'</td><td>'+element.funcionarioBy.datosFuncionarioVO.nombres+' '+element.funcionarioBy.datosFuncionarioVO.apellidoUno+' '+element.funcionarioBy.datosFuncionarioVO.apellidoDos+'</td><td>'+element.auxMotivoCancelacion+'</td> <td>Oportuna</td></tr>';
						}else if (element.estatus == 10){
							htmlAddCancelados += '<tr> <td>'+element.funcionarioEstatus.datosFuncionarioVO.nombres+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoUno+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoDos+'</td><td>'+element.funcionarioBy.datosFuncionarioVO.nombres+' '+element.funcionarioBy.datosFuncionarioVO.apellidoUno+' '+element.funcionarioBy.datosFuncionarioVO.apellidoDos+'</td><td>'+element.auxMotivoCancelacion+'</td> <td>Extemporanea</td></tr>';
						}else if (element.estatus == 11){
							htmlAddCancelados += '<tr> <td>'+element.funcionarioEstatus.datosFuncionarioVO.nombres+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoUno+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoDos+'</td><td>'+element.funcionarioBy.datosFuncionarioVO.nombres+' '+element.funcionarioBy.datosFuncionarioVO.apellidoUno+' '+element.funcionarioBy.datosFuncionarioVO.apellidoDos+'</td><td>'+element.auxMotivoCancelacion+'</td> <td><a href="#" onclick="verJustificante('+element.id+');" >Justificada</a></td></tr>';
						}
					}
				}
				
				var htmlAddSolicitados = '';
				if(solicitados != 'undefined'){
					for (var i = 0; i < solicitados.length; i++) {
						var element = solicitados[i];
						
						var fechaS = new Date(element.creacion);
						var fechaSYear    = fechaF.getFullYear();
						var fechaSMonth   = fechaF.getMonth() + 1;
						if( fechaSMonth <= 9){
							fechaSMonth = '0' + fechaSMonth.toString();
						}
						var fechaSDay     = fechaS.getDate();
						if( fechaSDay <= 9){
							fechaSDay = '0' + fechaSDay.toString();
						}
						var fechaSHour    = fechaS.getHours();
						if( fechaSHour <= 9){
							fechaSHour = '0' + fechaSHour.toString();
						}
						var fechaSMinute  = fechaS.getMinutes();
						if( fechaSMinute <= 9){
							fechaSMinute = '0' + fechaSMinute.toString();
						}
						var fechaSFormato = fechaSYear+'-'+fechaSMonth+'-'+fechaSDay+' '+fechaSHour+':'+fechaSMinute;
						$("#iptAgendaFechaFinEdit").val(fechaFFormato);
						if(maxInscritos == 0){
							htmlAddSolicitados += '<tr> <td>'+element.funcionarioEstatus.rfc+' '+element.funcionarioEstatus.datosFuncionarioVO.nombres+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoUno+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoDos+'</td><td>'+element.funcionarioEstatus.auxDealerPrincipal+' '+element.funcionarioEstatus.auxPuestoPrincipal+'</td> <td>'+fechaSFormato+' </td> <td> <button type="button" class="btn" onclick="actualizaEstatusInscripcion(\''+element.id+'\',\'2\',\''+id+'\');">Aceptar</button> <button type="button" class="btn" onclick="actualizaEstatusInscripcion(\''+element.id+'\',\'3\',\''+id+'\');">Rechazar</button></td> </tr>';
						}else{
							if(totalInscritos >= maxInscritos){
								htmlAddSolicitados += '<tr> <td>'+element.funcionarioEstatus.rfc+' '+element.funcionarioEstatus.datosFuncionarioVO.nombres+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoUno+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoDos+'</td><td>'+element.funcionarioEstatus.auxDealerPrincipal+' '+element.funcionarioEstatus.auxPuestoPrincipal+'</td> <td>'+fechaSFormato+' </td> <td> <button type="button" class="btn" onclick="actualizaEstatusInscripcion(\''+element.id+'\',\'3\',\''+id+'\');">Rechazar</button></td> </tr>';
							}else{
								htmlAddSolicitados += '<tr> <td>'+element.funcionarioEstatus.rfc+' '+element.funcionarioEstatus.datosFuncionarioVO.nombres+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoUno+' '+element.funcionarioEstatus.datosFuncionarioVO.apellidoDos+'</td><td>'+element.funcionarioEstatus.auxDealerPrincipal+' '+element.funcionarioEstatus.auxPuestoPrincipal+'</td> <td>'+fechaSFormato+' </td> <td> <button type="button" class="btn" onclick="actualizaEstatusInscripcion(\''+element.id+'\',\'2\',\''+id+'\');">Aceptar</button> <button type="button" class="btn" onclick="actualizaEstatusInscripcion(\''+element.id+'\',\'3\',\''+id+'\');">Rechazar</button></td> </tr>';
							}
						}

					}
				}
				
				var htmlAddFuncionarios = '';
				if(funcionarios != 'undefined'){
					for (var i = 0; i < funcionarios.length; i++) {
						var element = funcionarios[i];
						if(totalInscritos >= maxInscritos){
							htmlAddFuncionarios += '<tr><td>'+element.rfc+'</td><td>'+element.datosFuncionarioVO.nombres+' '+element.datosFuncionarioVO.apellidoUno+' '+element.datosFuncionarioVO.apellidoDos+'</td><td>'+element.auxPuestoPrincipal+' - '+element.auxDealerPrincipal+'</td><td></td></tr>';
						}else{
							htmlAddFuncionarios += '<tr><td>'+element.rfc+'</td><td>'+element.datosFuncionarioVO.nombres+' '+element.datosFuncionarioVO.apellidoUno+' '+element.datosFuncionarioVO.apellidoDos+'</td><td>'+element.auxPuestoPrincipal+' - '+element.auxDealerPrincipal+'</td><td><input type="checkbox" name="checkAddF" value="'+element.idUsuario+'" id="'+element.idUsuario+'"></td></tr>';
						}

					}
				}
				
				$('#tbodyInscritosCurso').append(htmlAddInscritos);
				$('#tbodySolicitudesCurso').append(htmlAddSolicitados);
				$('#tbodyCanceladosCurso').append(htmlAddCancelados);
				$('#tbodyFuncionariosInscripcion').append(htmlAddFuncionarios);
				
				
				$('#tblInscritosCurso').dataTable({
					"bRetrieve": true,
					"bDestroy": true,
		            "bPaginate": false,
		            "bFilter": false,
		            "bSort": true,
		            "bInfo": false,
		            "language": {
		                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
		            }
		        });
				
				$('#tblSolicitudesCurso').dataTable({
					"bRetrieve": true,
					"bDestroy": true,
		            "bPaginate": false,
		            "bFilter": false,
		            "bSort": true,
		            "bInfo": false,
		            "language": {
		                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
		            }
		        });
				
				$('#tblCanceladosCurso').dataTable({
					"bRetrieve": true,
					"bDestroy": true,
		            "bPaginate": false,
		            "bFilter": false,
		            "bSort": true,
		            "bInfo": false,
		            "language": {
		                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
		            }
		        });
				
				$('#tblInscribirCurso').dataTable({
					"bRetrieve": true,
					"bDestroy": true,
		            "bPaginate": true,
		            "bFilter": true,
		            "bSort": true,
		            "bInfo": true,
		            "language": {
		                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
		            }
		        });
				
				if(object.aplicaCostoCancelacion){
					$('#iptAplicaCosto').val('true');
					$('#divCancelacionJustificada').show();
				}else{
					$('#iptAplicaCosto').val('false');
					$('#divCancelacionJustificada').hide();
				}
				
				if(object.idEstatus == 2 || object.idEstatus == 4){
					$('#divBotonesEdicionCalendario').hide();
				}else{
					$('#divBotonesEdicionCalendario').show();
				}
				$('#modalViewAgenda').modal({backdrop: 'static', keyboard: false});
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Error');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
	
	
	
}


openAgendarCurso = function(id) {
	var urltxt = ctx+"/calendario/openEventoCalendario?id="+id; 
	window.open(urltxt, '_blank');
}

openListcursos = function(idEmpresa){
	var urltxt = ctx+"/calendario/openListEventos?idEmpresa="+idEmpresa; 
	window.open(urltxt, '_blank');
}

seleccionaCurso = function(idCurso, nombreCurso){
	$('#selectAgendaCurso').val(idCurso);
	$('#btnGuardaAgenda').show();
	$('#divTableCursosAgenda').hide();
	$('#nombreCursoSeleccionado').append(nombreCurso);
}

verSolicitados = function(){
	$('#divTableSolicitudesCurso').show();
	$('#divTableInscritosCurso').hide();
	$('#divTableCanceladosCurso').hide();
	
	$('#titleInscritos').hide();
	$('#titleSolicitudes').show();
	$('#titleCancelados').hide();
	
	$('#modalDetalleInscritos').modal({backdrop: 'static', keyboard: false});
}

verInscritos = function(){
	$('#divTableSolicitudesCurso').hide();
	$('#divTableInscritosCurso').show();
	$('#divTableCanceladosCurso').hide();
	
	$('#titleInscritos').show();
	$('#titleSolicitudes').hide();
	$('#titleCancelados').hide();
	
	$('#modalDetalleInscritos').modal({backdrop: 'static', keyboard: false});
}

verInscribir = function(){
	
	$('#modalFuncionariosInscribir').modal({backdrop: 'static', keyboard: false});
}

verCancelados = function(){
	$('#divTableSolicitudesCurso').hide();
	$('#divTableInscritosCurso').hide();
	$('#divTableCanceladosCurso').show();
	
	$('#titleInscritos').hide();
	$('#titleSolicitudes').hide();
	$('#titleCancelados').show();
	
	$('#modalDetalleInscritos').modal({backdrop: 'static', keyboard: false});
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
		if(idEstatus == 4 || idEstatus == 10){
			obs = encodeURIComponent(document.getElementById('iptObservacionesCancela').value);
			obs = obs.replace(/%0A/g, "<br>");
			obs = decodeURIComponent(obs);
		}else{
			obs = encodeURIComponent(document.getElementById('iptObservaciones').value);
			obs = obs.replace(/%0A/g, "<br>");
			obs = decodeURIComponent(obs);
		}
		
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
	
	obs = encodeURIComponent(document.getElementById('iptObservacionesCancela').value);
	obs = obs.replace(/%0A/g, "<br>");
	obs = decodeURIComponent(obs);
	
	fd.append("iptObservaciones",obs);
	
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


openCancela = function(idInscripcion, idAgenda){
	eliminaMarcaRojo($("#selectMotivoCancelacion"));
	$('#iptIdInscripcionCanc').val(idInscripcion);
	$('#modalAdvertenciaCancelacion').modal({backdrop: 'static', keyboard: false});
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

refreshEditAgenda = function(){
	$('#modalViewAgenda').modal('hide');
	$('#modalActualizacionInscripcion').modal('hide');
	idAgenda = $('#iptAgendaIdEdit').val(); 
	editAgendarCurso(idAgenda);
}

setMinDateFin = function(){
	
	var minFinDate = $('#iptAgendaFechaInicio').val();
	var x = document.getElementById("iptAgendaFechaFin");
	x.min = minFinDate;
	$('#iptAgendaFechaFin').attr('disabled',false);
	$('#iptAgendaFechaFin').val(minFinDate);
	
}

setMinDateFinEdit = function(){
	
	var minFinDate = $('#iptAgendaFechaInicioEdit').val();
	var x = document.getElementById("iptAgendaFechaFinEdit");
	x.min = minFinDate;
	$('#iptAgendaFechaFinEdit').attr('disabled',false);
	$('#iptAgendaFechaFinEdit').val(minFinDate);
	
}

showCancelaCurso = function(){
	$('#modalCancelacionEvento').modal({backdrop: 'static', keyboard: false}); 
}

cancelaEvento = function (){
	
	motivoSeleccionado = true;
	
	if ($('#selectAgendaCancelacion').val() > 0) {
		eliminaMarcaRojo($("#selectAgendaCancelacion"));
	}else{
		marcaRojo($("#selectAgendaCancelacion"));
		motivoSeleccionado = false;
	}
	
	if(motivoSeleccionado){
		idEvento = $('#iptAgendaIdEdit').val();
		var urltxt = ctx + '/calendario/cancelaCurso?idEvento='+idEvento+'&motivo='+$('#selectAgendaCancelacion').val();
		
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
				
				if(response[0]){
					window.location = ctx + '/';
				}else{
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		$('#modalMotivoObligatorio').modal({backdrop: 'static', keyboard: false});
	}
	
}



inscribirFuncionarios = function() {
	
	var inscripcionesVO = [];
	idEvento = $('#iptAgendaIdEdit').val();
	
	$("input[name=checkAddF]:checked").each(function(){
		
		var eventoInscripcionVO = new Object;
		
		eventoInscripcionVO.idUsuario = Number($(this).val());
		eventoInscripcionVO.idEvento = idEvento;
		
		inscripcionesVO.push(eventoInscripcionVO);
    });


	var urltxt = ctx + '/calendario/inscripcionMasiva';

	$.ajax({
				type : "POST",
				url : urltxt,
				contentType : "application/json",
				data : JSON.stringify(inscripcionesVO),
				beforeSend : function() {
					$("#wait").css("display", "block");
				},
				complete : function() {
					$("#wait").css("display", "none");
				},
				success : function(response) {
					result = response[0];
					if (result) {
						window.location = ctx + '/calendario/openEventoCalendario?id='+$('#iptAgendaIdEdit').val();
					} else {
						$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
					}
				},
				error : function(msg) {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			});
}

verJustificante = function(idInscripcion){
	var urltxt = ctx+"/calendario/justificante?param="+idInscripcion; 
	window.open(urltxt, '_blank');
}

validaSize = function(element){
	if(element.files[0].size > 200000){
		element.value = "";
		$('#modalTamanioExedido').modal({backdrop: 'static', keyboard: false});
	}
}

updateEventoSesion = function(idEventoSesion, idTipoActividad){

	
	eventoSesionValid = true;
	
	if (!notNull($('#iptFchInicioES'+idEventoSesion))) {
		eventoSesionValid = false;
	}
	if (!notNull($('#iptFchFinES'+idEventoSesion))) {
		eventoSesionValid = false;
	}
	
	if(idTipoActividad == 6){
		if (!notNull($('#iptURLES'+idEventoSesion))) {
			eventoSesionValid = false;
		}
	}
	
	if(eventoSesionValid){
		var eventoSesionVO = new Object;
		eventoSesionVO.id = idEventoSesion;
		
		var iniAnio = $('#iptFchInicioES'+idEventoSesion).val().substring(0,4);
		var iniMes  = $('#iptFchInicioES'+idEventoSesion).val().substring(5,7);
		var iniDia  = $('#iptFchInicioES'+idEventoSesion).val().substring(8,10);
		var iniHora = $('#iptFchInicioES'+idEventoSesion).val().substring(11,13);
		var iniMin  = $('#iptFchInicioES'+idEventoSesion).val().substring(14,16);
		eventoSesionVO.fechaInicio = new Date(iniAnio, iniMes-1, iniDia, iniHora, iniMin, 0, 0);
		
		var finAnio = $('#iptFchFinES'+idEventoSesion).val().substring(0,4);
		var finMes  = $('#iptFchFinES'+idEventoSesion).val().substring(5,7);
		var finDia  = $('#iptFchFinES'+idEventoSesion).val().substring(8,10);
		var finHora = $('#iptFchFinES'+idEventoSesion).val().substring(11,13);
		var finMin  = $('#iptFchFinES'+idEventoSesion).val().substring(14,16);
		eventoSesionVO.fechaFin = new Date(finAnio, finMes-1, finDia, finHora, finMin, 0, 0);
		
		if(idTipoActividad == 6){
			eventoSesionVO.url = $('#iptURLES'+idEventoSesion).val();
		}
		
		var urltxt = ctx + '/calendario/updateEventoSesion';
		
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(eventoSesionVO),
			beforeSend : function() {
				maskBody();
			},
			complete : function() {
				unmaskBody();
			},
			success : function(response) {
				
				var result = response[0];
				var msg = response[1];
				
				if (result) {
					$('#modalActividadActualizada').modal({backdrop: 'static', keyboard: false});
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
					$('#btnGuardaAgenda').show();
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				$('#btnGuardaAgenda').show();
			}
		});
	}else{
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}	
}



exportLista = function(idEvento){
	var urltxt = ctx+"/reportes/soporteListaEvento?param="+idEvento; 
	window.open(urltxt, '_blank');
} 



openExportarCursos = function(idEmpresa){

	$('#selectProyectoReporteCurso').html('');
	$('#selectCursoReporteCurso').html('');
	$('#iptIdEmpresaReporte').val(idEmpresa);
	$('#selectCursoReporteCurso').val(0);
	$('#selectInstructorReporteCurso').val(0);
	$('#selectProyectoReporteCurso').val(0);
	
	var urltxt = ctx + '/calendario/getProyectoCursoByEmpresa?param='+idEmpresa;
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
			
			if(response[0]){
				var htmlAddProyectos = '<option value="0" selected="selected">Todos...</option>';
				var htmlAddCursos = '<option value="0" selected="selected">Todos...</option>';
				var proyetos = response[1];
				var cursos = response[2];
	
				if(proyetos != 'undefined'){
					for (var i = 0; i < proyetos.length; i++) {
						var element = proyetos[i];
						htmlAddProyectos += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
					}
				}
				if(cursos != 'undefined'){
					for (var i = 0; i < cursos.length; i++) {
						var element = cursos[i];
						htmlAddCursos += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
					}
				}
				$('#selectProyectoReporteCurso').append(htmlAddProyectos);
				$('#selectCursoReporteCurso').append(htmlAddCursos);
				$('#modalReporteCursos').modal({backdrop: 'static', keyboard: false});

				
			}else{
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

exportaCursos = function(){

	idEmpresa = $('#iptIdEmpresaReporte').val();
	idCurso = $('#selectCursoReporteCurso').val();
	idInstructor = $('#selectInstructorReporteCurso').val();
	idProyecto = $('#selectProyectoReporteCurso').val();

	var iniAnio = $('#iptInicioDetalleCalificaciones').val().substring(0,4);
	var iniMes  = $('#iptInicioDetalleCalificaciones').val().substring(5,7);
	var iniDia  = $('#iptInicioDetalleCalificaciones').val().substring(8,10);
	var finAnio = $('#iptFinDetalleCalificaciones').val().substring(0,4);
	var finMes  = $('#iptFinDetalleCalificaciones').val().substring(5,7);
	var finDia  = $('#iptFinDetalleCalificaciones').val().substring(8,10);
	
	var fechaInicio = iniDia+"-"+iniMes+"-"+iniAnio+" 00:00:00"
	var fechaFin = finDia+"-"+finMes+"-"+finAnio+" 23:59:59"

	var urltxt = ctx+"/reportes/exportarCursos?param="+idEmpresa+"&param2="+fechaInicio+"&param3="+fechaFin+"&param4="+idProyecto+"&param5="+idCurso+"&param6="+idInstructor; 
	window.open(urltxt, '_blank');
	
}


changeTipoCancelacion = function(){
	if($('#selectTipoCancelacion').val() == 11) {
		$('#divDocumentoJustificado').show();
	}else{
		$('#divDocumentoJustificado').hide();
	}
}


openConfirmaReinscripcion = function(RFC, idInscripcion){
	$('#h4Reinscribe').html('');
	$('#h4Reinscribe').append('Funcionario: ');
	$('#h4Reinscribe').append(RFC);
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
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});

}

showNuevoJustif = function(idInscripcion,descripcion){
	$('#iptIdInscripcionJustif').val(idInscripcion);
	$('#iptDescJustA').val(descripcion); 
	$('#modalAdvertenciaJustificante').modal({backdrop: 'static', keyboard: false});
	$('#modalJustificantes').modal('hide');
}

closeNuevoJustif = function(){
	$('#modalJustificantes').modal({backdrop: 'static', keyboard: false});
	$('#modalAdvertenciaJustificante').modal('hide');
}


actualizaJustificante = function(){

	nuevoJustValid = true;

	var justifFile = $("#justifFileNuevo").prop("files")[0];
	
	if (!notNull($("#iptDescJustA"))) {
		nuevoJustValid = false;
	}
	
	if(justifFile == null){
		nuevoJustValid = false;
		marcaRojo($("#justifFileNuevo"));
	}else{
		eliminaMarcaRojo($("#justifFileNuevo"));
	}	
	
	if(nuevoJustValid){
		var fd = new FormData();
		fd.append("iptIdInscripcionJustifA", $('#iptIdInscripcionJustif').val());
		fd.append("iptFileJustifA", justifFile);
		fd.append("iptIdDescripcionJustifA", $('#iptDescJustA').val());
		
		var urltxt = ctx + '/calendario/actualizaJustificante';
		
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
					$('#modalAdvertenciaJustificante').modal('hide');
					$('#h4Msj').html('');
					$('#h4Msj').append('Documento actualizado');
					$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
				}else{
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

openCargaMasiva = function(){
	$('#modalInscripcionMasiva').modal({backdrop: 'static', keyboard: false});
}


function saveInscripcionMasiva(){
	validacionData = true;
	
	if (!notNull($("#iptCargaMasivaFile"))) {
		validacionData = false;
	}
	
	if (validacionData) {
		
		var urltxt = ctx + '/calendario/inscripcionMasivaFile';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formCargaMasiva")),
			enctype : 'multipart/form-data',
			beforeSend : function() {
				maskBody();
			},
			complete : function() {
				unmaskBody();
			},
			success : function(response) {
				var result = response[0];
				var msg = response[1];
				var htmlAddGerentes = '';
				$('#tbodyErrores').html('');
				if (result) {		
					var errores = response[1];
					
					if(errores.length > 0){
						for (var i = 0; i < errores.length; i++) {
							var element = errores[i];
							htmlAddGerentes += '<tr><td>'+element+'</td></tr>';
						}
					}else{
						htmlAddGerentes += '<tr><td>sin errores</td></tr>';
					}
					
					$('#tbodyErrores').append(htmlAddGerentes);
					
					
					$('#modalInscripcionMasiva').modal('hide');
					$('#modalInscripcionMasivaResp').modal({backdrop: 'static', keyboard: false});
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


showRechazo = function(idInscripcion){
	//actualizaEstatusInscripcion
	$('#iptIdRechazo').val(idInscripcion);
	$('#modalRechazaInsc').modal({backdrop: 'static', keyboard: false});
}

saveRechazo = function(){
	idInscripcion =  $('#iptIdRechazo').val();
	actualizaEstatusInscripcion(idInscripcion,3,0);
}

getJustificantes = function(idInscripcion, funcionario){

	$('#iptIdInscripcionJustifN').val(idInscripcion);
	$('#h4JustifInfo').html(funcionario);
	var urltxt = ctx + '/calendario/getJustificantes?param='+idInscripcion;
	
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
			var result = response[0];
			if(result){
				var object = response[1];
				$('#tBodyJustificantes').html('');
				if(object != 'undefined' && object != ''){
						var htmlAdd = '';
						for (var i = 0; i < object.length; i++) {
							var element = object[i];
							htmlAdd += '<tr><td>'+element.descripcion+'</td><td>'+element.extencion+'</td><td><a href="#" title="Descargar justificante" onclick="verJustificante('+element.id+');"><i class="fa fa-download"></i></a>&nbsp;<a href="#" title="Subir/actulizar justificante" onclick="showNuevoJustif('+element.id+',\''+element.descripcion+'\');"><i class="fa fa-upload"></i></a></td></tr>';
						}
						
						$('#tBodyJustificantes').append(htmlAdd);
				}else{
					var htmlAdd = '';
					htmlAdd += '<tr><td>Sin Documentos</td><td></td><td></td></tr>';
					$('#tBodyJustificantes').append(htmlAdd);
				}
				$('#modalJustificantes').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
	
}

openNewJustificante = function(){
	$('#modalNuevoJustificante').modal({backdrop: 'static', keyboard: false});
}

nuevoJustificante = function(){

	var justifFile = $("#iptFileJustifN").prop("files")[0];
	var fd = new FormData();
	fd.append("iptIdInscripcionJustifN", $('#iptIdInscripcionJustifN').val());
	fd.append("iptFileJustifN", justifFile);
	fd.append("iptIdDescripcionJustifN", $('#iptDescJustN').val());
	
	var urltxt = ctx + '/calendario/nuevoJustificante';
	
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
				$('#modalNuevoJustificante').modal('hide');
				$('#modalJustificantes').modal('hide');
				$('#h4Msj').html('');
				$('#h4Msj').append('Documento guardado');
				$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
			}else{
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}


abrirCurso = function(){ 

	var urltxt = ctx + '/calendario/abrirCurso?param='+$('#iptIdEvento').val();
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
				location.reload();
			}else{
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}


verFormtoCalificacion = function(){
	$('#modalFormatos').modal({backdrop: 'static', keyboard: false});
//	var urltxt = ctx+"/calificador/getCalificaciones?param="+idEvento; 
//	window.open(urltxt, '_blank');
}

terminaCurso = function(idEvento){
	var urltxt = ctx+"/calificador/terminaCurso?param="+idEvento;
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
				window.location =  ctx+"/calificador";
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showSubirFormato = function(){
	$('#modalSubirFormato').modal({backdrop: 'static', keyboard: false});
}

subirFormato = function(){
	var justifFile = $("#formatoFile").prop("files")[0];
	var fd = new FormData();
	fd.append("iptIdEvento", $('#iptIdEvento').val());
	fd.append("iptFormatoCalificacionesFile", justifFile);
	
	var urltxt = ctx + '/calificador/subirCalificaciones';
	
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
				$('#modalSubirFormato').modal('hide');
				$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
			}else{
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
}

openNewFormato = function(){
	$('#modalNuevoFormato').modal({backdrop: 'static', keyboard: false});
}

nuevoFormato = function(){

	var justifFile = $("#iptFormatoCalificacionesFile").prop("files")[0];
	var fd = new FormData();
	fd.append("iptIdEventoFormN", $('#iptIdEventoFormN').val());
	fd.append("iptFormatoCalificacionesFile", justifFile);
	fd.append("iptIdDescripcionFormN", $('#iptIdDescripcionFormN').val());
	
	var urltxt = ctx + '/calificador/subirCalificaciones';
	
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
				$('#modalNuevoFormato').modal('hide');
				$('#modalFormatos').modal('hide');
				$('#h4Msj').html('');
				$('#h4Msj').append('Documento guardado');
				$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
			}else{
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

verFormato = function(id){
	var urltxt = ctx+"/calificador/getCalificaciones?param="+id; 
	window.open(urltxt, '_blank');
	
}

actualizaFormato = function(){

	nuevoFormValid = true;

	var justifFile = $("#iptFileFormA").prop("files")[0];
	
	if (!notNull($("#iptIdDescripcionFormA"))) {
		nuevoFormValid = false;
	}
	
	if(justifFile == null){
		nuevoFormValid = false;
		marcaRojo($("#justifFileNuevo"));
	}else{
		eliminaMarcaRojo($("#justifFileNuevo"));
	}	
	
	if(nuevoFormValid){
		var fd = new FormData();
		fd.append("iptIdFormatoA", $('#iptIdFormatoA').val());
		fd.append("iptFileFormA", justifFile);
		fd.append("iptIdDescripcionFormA", $('#iptIdDescripcionFormA').val());
		
		var urltxt = ctx + '/calificador/actualizarCalificaciones';
		
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
					$('#modalAdvertenciaFormato').modal('hide');
					$('#h4Msj').html('');
					$('#h4Msj').append('Documento actualizado');
					$('#modalActualizacionInscripcion').modal({backdrop: 'static', keyboard: false});
				}else{
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

showNuevoFormato = function(idInscripcion,descripcion){
	$('#iptIdFormatoA').val(idInscripcion);
	$('#iptIdDescripcionFormA').val(descripcion); 
	$('#modalAdvertenciaFormato').modal({backdrop: 'static', keyboard: false});
	$('#modalFormatos').modal('hide');
}

closeNuevoFormato = function(){
	$('#modalFormatos').modal({backdrop: 'static', keyboard: false});
	$('#modalAdvertenciaFormato').modal('hide');
}

openInstructoresNO = function(){
	$('#divLstInstrutoresNO').show();
	$('#divLstInstrutores').hide();
}

closeInstructoresNO = function(){
	$('#divLstInstrutoresNO').hide();
	$('#divLstInstrutores').show();
}

agregarInstructor = function(idInstuctor){
	idEvento = $('#iptIdEvento').val();
	var urltxt = ctx+"/calendario/agregaInstructor?param="+idEvento+"&param2="+idInstuctor;
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
				location.reload();
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

cambiaPrincipal = function(idInstuctor){
	idEvento = $('#iptIdEvento').val();
	var urltxt = ctx+"/calendario/setInstructorPrincipal?param="+idEvento+"&param2="+idInstuctor;
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
				location.reload();
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

quitarInstructor = function(idInstuctor){
	idEvento = $('#iptIdEvento').val();
	var urltxt = ctx+"/calendario/quitarInstructor?param="+idEvento+"&param2="+idInstuctor;
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
				location.reload();
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showCambiaCurso = function(){
	$('#selectNuevoCurso').val('');
	$('#modalNuevoCurso').modal({backdrop: 'static', keyboard: false});
} 

updateNewCurso = function(){
	idEvento = $('#iptIdEvento').val();
	idCurso = $('#selectNuevoCurso').val();
	var urltxt = ctx+"/calendario/cambiaCursoEvento?param="+idEvento+"&param2="+idCurso;
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
				$('#modalActualizacionCurso').modal({backdrop: 'static', keyboard: false});
				location.reload();
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}
