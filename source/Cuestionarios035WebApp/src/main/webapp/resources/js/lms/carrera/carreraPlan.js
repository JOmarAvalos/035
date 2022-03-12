/**
 * 
 */

function getCurso(idCurso, idCertificado, idInscripcion, idPlan){
//	var urltxt = ctx + '/lms/carrera/plan?param='+idPlanCarrera;
	var idMonitoreoActividad=$("#idMonitoreoActividad").val();

	window.location = ctx + '/lms/carrera/curso?param='+Number(idCurso)+'&param3='+Number(idCertificado)+'&param4='+idInscripcion+'&param5='+idPlan+'&param6='+idMonitoreoActividad+'&param7=0';
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
//			var result = response[0];
//			var msg = response[1];
//			if (result) {
//				window.location = ctx + '/lms/carrera/plan?param=' + folderName;
//			} else {
////				displayErrorMessageByObjectId('', msg, 'infoForm');
//				alert(msg);
//			}
//		},
//		error : function(msg) {
////			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.', 'infoForm');
//			alert('Error. Ocurrió un error en la consulta.');
//		}
//	});
}
getMiCarreraMonitoreo = function(){
	var idMonitoreoActividad=$("#idMonitoreoActividad").val();
	window.location = ctx+'/lms/carrera?idMonitoreo='+ idMonitoreoActividad;
}

descargaCertificado = function(idCertificadoUsuario){
		
	window.location = ctx + '/lms/carrera/downloadCertificado?idCertificadoUsuario=' + idCertificadoUsuario;
	
}


function search() {
	
	var busquedaActual = $('#busquedaActual').val();
	var busquedas =  $('#busquedasTodas').val();
	
	var indexUltimo = '';
	
	var buscaAgain = false;
	
	const buscados = new Array();
	
	buscados.push(busquedas);
	
	cleanCursoCard();
   var name = document.getElementById("iptSearchInPlan").value;
   var pattern = name.toLowerCase();
   var targetId = "";
	if(busquedaActual != name){
		$('#busquedaActual').val(name);
		$('#indexActual').val('');
		busquedas = "";
	}else{
		buscaAgain = true;
	}
   
   if($.trim(name) != ''){
   
   		$( "div" ).find(".collapse").removeClass("show");
		$( "div" ).find(".collapse").addClass("show");
	   var divs = document.getElementsByClassName("curso-card");
	   for (var i = 0; i < divs.length; i++) {
	      var para = divs[i].getElementsByTagName("h3");
	      var index = para[0].innerText.toLowerCase().indexOf(pattern);
	      if (index != -1) {
	     	indexUltimo =  divs[i].id;
	         targetId = divs[i].id;
	         $('#'+targetId).css('box-shadow','10px 10px 5px #c11010');
	         indexUltimo = targetId;
	      }
	   }  
	   
	   if(!buscados.toString().includes(indexUltimo)){
		   for (var i = 0; i < divs.length; i++) {
		      var para = divs[i].getElementsByTagName("h3");
		      var index = para[0].innerText.toLowerCase().indexOf(pattern);
		      if (index != -1) {
		         targetId = divs[i].id;
		         
		         if(buscaAgain){
			         if(!buscados.toString().includes(targetId)){
				         document.getElementById(targetId).scrollIntoView();
				         document.getElementById(targetId).scrollIntoView();
				         buscados.push(targetId);
				         $('#busquedasTodas').val(buscados.toString());
				         $('#'+targetId).css('box-shadow','10px 10px 5px #1000ff');
				         break;
			         }
		         }else{
			         document.getElementById(targetId).scrollIntoView();
			         buscados.push(targetId);
			         $('#busquedasTodas').val(buscados.toString());
				     $('#'+targetId).css('box-shadow','10px 10px 5px #1000ff');
			         break;
		         }
		      }
		   } 
	   }else{
		  for (var i = 0; i < divs.length; i++) {
	      	  var para = divs[i].getElementsByTagName("h3");
		      var index = para[0].innerText.toLowerCase().indexOf(pattern);
		      if (index != -1) {
		         targetId = divs[i].id;
		         document.getElementById(targetId).scrollIntoView();
		         buscados.push(targetId);
		         $('#busquedasTodas').val(targetId);
		         $('#'+targetId).css('box-shadow','10px 10px 5px #1000ff');
		         
		         break;
		      }
		   } 
		}
	   
	   
	   
   }
   
}

function cleanCursoCard(){
	var name = document.getElementById("iptSearchInPlan").value;
   var pattern = name.toLowerCase();
   var targetId = "";
 
   var divs = document.getElementsByClassName("curso-card");
   for (var i = 0; i < divs.length; i++) {
     targetId = divs[i].id;
     $('#'+targetId).css('box-shadow','0px 2px 5px #0000001F');
   }  
   
}