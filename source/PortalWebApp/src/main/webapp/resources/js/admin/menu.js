getHome = function(){
	window.location = ctx+'/';
}
getEmpresas = function (){
	window.location = ctx+'/catalogo/empresa';
}
getGrupoPuestos = function (){
	window.location = ctx+'/catalogo/GrupoPuesto';
}

getCalificacionMetodos = function (){
	window.location = ctx+'/catalogo/CalificacionMetodo';
}

getIdiomas = function (){
	window.location = ctx+'/catalogo/Idioma';
}

getTipoActividades = function (){
	window.location = ctx+'/catalogo/TipoActividad';
}

getTipoCursos = function (){
	window.location = ctx+'/catalogo/TipoCurso';
}

getTipoPreguntas = function (){
	window.location = ctx+'/catalogo/TipoPregunta';
}

getCategoriaCursos = function (){
	window.location = ctx+'/catalogo/CategoriaCurso';
}

getPrioridades = function (){
	window.location = ctx+'/catalogo/Prioridad';
}

getPuestosMenu = function (){
	window.location = ctx+'/catalogo/Puesto';
}

getTallas = function (){
	window.location = ctx+'/catalogo/Talla';
}

getTipoDealers = function (){
	window.location = ctx+'/catalogo/TipoDealer';
}

getModulosWeb = function (){
	window.location = ctx+'/catalogo/ModuloWeb';
}

getCursos = function (){
	window.location = ctx+'/lms/cursos';
}

getCurso = function (idCurso){
	window.location = ctx+'/lms/curso?id='+idCurso;
}

getActividad = function (idCurso, idActividad){
	window.location = ctx+'/lms/actividad?idCurso='+idCurso+'&idActividad='+idActividad;
}

function getInsumoActividad( idActividad){
	window.location = ctx+'/insumos/actividad?idActividad='+idActividad;
}

getCertificados = function (){
	window.location = ctx+'/lms/certificados';
}
getPlanesDeCarrera = function (){
	window.location = ctx+'/lms/planes';
}

getFuncionarios = function(){
	window.location = ctx+'/funcionarios';
}
getEmail = function(){
	window.location = ctx+'/email?nameFolder=INBOX';
}

getZonas = function(){
	window.location = ctx+'/catalogo/zona';
}

getDealers = function(){
	window.location = ctx+'/catalogo/dealers';
}

getGrupoDealers = function(){
	window.location = ctx+'/catalogo/gruposDealer';
}

getSedes = function(){
	window.location = ctx+'/catalogo/sedes';
}

getGrupos = function(){
	window.location = ctx+'/grupos';
}

getContacto = function(){
	window.location = ctx+'/contacto';
}
getDias = function(){
	window.location = ctx+'/catalogo/dias';
}
getMotivosContacto = function(){
	window.location = ctx+'/catalogo/motivosContacto';
}
getProyectos = function(){
	window.location = ctx+'/catalogo/proyectos';
}
getInstructores = function(){
	window.location = ctx+'/funcionarios/instructores';
}

getMotivosCancelaciones = function(){
	window.location = ctx+'/catalogo/motivosCancelaciones';
}

getMotivosCancelacionesCursos = function(){
	window.location = ctx+'/catalogo/motivosCancelacionesCurso';
}

getMesa = function(){
	window.location = ctx+'/funcionarios/mesa';
}

getAdminRepositorio = function(){
	window.location = ctx+'/administradorRepositorio';
}
getInsumos = function(){
	window.location = ctx+'/administradorInsumos';
}

getCalificador = function(){
	window.location = ctx+'/calificador';
}
getReportesAdicionales = function(){
	window.location = ctx+'/reportesAdicionales';
}

getTipoReportesAdicionales = function (){
	window.location = ctx+'/catalogo/tipoReportesAdicionales';
}

getTipoReportes = function (){
	window.location = ctx+'/reportes';
}

getCicloInsumos = function(){
	window.location = ctx+'/insumos/ciclos';
}

getReportes = function(){
	window.location = ctx+'/reportes';
}

getMonitoreo = function(){
	window.location = ctx+'/monitoreoActividad';
}


showUpdatePassword = function(){
	$("#iptOldPwd").val('');
	$("#iptNewPwd").val('');
	$("#iptNewPwdConfirm").val('');
	$('#modalNewPwd').modal({backdrop: 'static', keyboard: false});
}

validaUpdatePassword = function(){
	
	pwdValid = true;
	
	if (!notNull($("#iptOldPwd"))) {
		pwdValid = false;
	}
	if (!notNull($("#iptNewPwd"))) {
		pwdValid = false;
	}
	if (!notNull($("#iptNewPwdConfirm"))) {
		pwdValid = false;
	}else{
		if($("#iptNewPwd").val() != $("#iptNewPwdConfirm").val()){
			pwdValid = false;
			alert('La confirmación de contraseña no coincide');
		}
	}

	if(pwdValid){
		
		$('#modalConfirmUpdate').modal({backdrop: 'static', keyboard: false});
		
	}
	
}


updatePassword = function(){
	
	$('#modalConfirmUpdate').modal('hide');
	var urltxt = ctx + '/updetePassword?oldP='+$("#iptOldPwd").val()+'&newP='+$("#iptNewPwd").val();
	
	
	
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
				$('#modalNewPwd').modal('hide');
				$('#modalExitoPwd').modal({backdrop: 'static', keyboard: false});
			} else {
				msg = response[1];
				$('#h4MsgErr').html('');
				$('#h4MsgErr').append(msg);
				$('#modalErrUpdate').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			alert('Error');
		}
	});
}