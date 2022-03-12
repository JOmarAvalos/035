getHome = function(){
	window.location = ctx+'/';
}
onInscripciones = function (){
	window.location = ctx+'/lms/inscripciones';
}
onReportes = function (){
	window.location = ctx+'/lms/reportes';
}

onFuncionarios = function (){
	window.location = ctx+'/lms/funcionarios';
}
onInsumos = function (){
	window.location = ctx+'/lms/insumos';
}

onInsumosHist = function (){
	window.location = ctx+'/lms/insumos/historico';
}

onCarrera = function (){
	window.location = ctx+'/lms/carrera';
}

onCalificaciones = function (){
	window.location = ctx+'/lms/calificaciones';
}

onAgenda = function (){
	window.location = ctx+'/lms/agenda';
}

onNotificaciones = function (){
	window.location = ctx+'/lms/notificaciones';
}

getContacto = function(){
	window.location = ctx+'/lms/contacto';
}

logout = function(){
	$(".logout_form").submit();
}

setMenuActive = function(idMenu){
	$('#'+idMenu).addClass("is-active");
}

getMiCarrera = function(){
	window.location = ctx+'/lms/carrera';
}

onDocumentos = function(){
	window.location = ctx+'/lms/repositorio';
}

getMiPlan = function(id){
	window.location = ctx+'/lms/carrera/plan?param='+id;
}

getReportesAdicionales = function(){
	window.location = ctx+'/lms/reportesAdic';
}

getMiCertificadoCurso = function(idCurso, planName, certificadoName, cursoName, idInscripcion, idPlan, idCertificado){
	idMonitoreoActividad = $('#idMonitoreoActividadPadre').val();
	window.location = ctx+'/lms/carrera/curso?param='+idCurso+'&param2='+planName+'&param3='+idCertificado+'&param4='+idInscripcion+'&param5='+idPlan+'&param6='+idMonitoreoActividad+'&param7=0';
}

onInstructor = function(){
	window.location = ctx+'/lms/instructor';
}

onValidaciones = function(){
	window.location = ctx+'/lms/validaciones';
}

onPlanCapacitacion = function(){
	window.location = ctx+'/lms/planCapacitacion';
}

//getPrioridades = function (){
//	window.location = ctx+'/catalogo/Prioridad';
//}
//
//getPuestos = function (){
//	window.location = ctx+'/catalogo/Puesto';
//}
//
//getTallas = function (){
//	window.location = ctx+'/catalogo/Talla';
//}
//
//getTipoDealers = function (){
//	window.location = ctx+'/catalogo/TipoDealer';
//}
//
//getModulosWeb = function (){
//	window.location = ctx+'/catalogo/ModuloWeb';
//}
//
//getCursos = function (){
//	window.location = ctx+'/lms/cursos';
//}
//getCertificados = function (){
//	window.location = ctx+'/lms/certificados';
//}
//getPlanesDeCarrera = function (){
//	window.location = ctx+'/lms/planes';
//}
//
//getFuncionarios = function(){
//	window.location = ctx+'/funcionarios';
//}
//getEmail = function(){
//	window.location = ctx+'/email?nameFolder=INBOX';
//}
//
//getZonas = function(){
//	window.location = ctx+'/catalogo/zona';
//}