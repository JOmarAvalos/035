/**
 * 
 */
 
showRegistro = function(){
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