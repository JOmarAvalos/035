function moduloUsuario(idMonitoreo){

	window.location = ctx + '/monitoreoActividadUsuario?idMonitoreo='+idMonitoreo;
}

cursos =function (id){
	$('#collapse'+id).html('');
	var cabecera='.sub-card-header'+id;

	    $(".collapse" ).on('show.bs.collapse',(e) =>{
	    	e.stopPropagation();
	    	var hijo ="#"+e.target.id;
	    	$(hijo).prev(cabecera).find(".glyphicon").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");	
	    
	    });
	    $(".collapse" ).on('hide.bs.collapse',(e) =>{
	    	e.stopPropagation();
	    	var hijo ="#"+e.target.id;
	    	$(hijo).prev(cabecera).find(".glyphicon").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
	  
	    });
	
	var htmlAdd ='';
		var urltxt = ctx
				+ "/monitoreoActividadUsuario/getMonitoreoActividadCursos?idMonitoreo="
				+ id;
		$
				.ajax({
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
							var object = response[1];
							htmlAdd='<div class="card-body" id="'+object.id+object.modulo+'">';
						var lista =object.lstMonitoreo;
								for (var i = 0; i < lista.length; i++) {
									var element = lista[i];									
									htmlAdd += datos(element.id);
								}
								htmlAdd +='</div>';
							$('#collapse'+id).append(htmlAdd);
							
							
						} else {

							// $('#acordion'+id).append(htmlAdd);
						}
					},
					error : function(msg) {
						alert('Error');
					}
				});
	
}

function datos(id) {	
	var acor ='';
	var completo='';
		var urltxt = ctx
				+ "/monitoreoActividadUsuario/getMonitoreoActividad?idMonitoreo="
				+ id;
		var jqXHR = 	$.ajax({
			        async: false,
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
					},
					error : function(msg) {
						alert('Error');
					}
				});	
		
		var datos=jqXHR.responseJSON;
		result = datos[0];
		if (result) {
			var object = datos[1];
			
			acor=' <div class="card">'
			+'<div class="sub-card-header'+object.id+'" style="padding: .75rem 1.25rem; margin-bottom: 0; background-color: rgba(0, 0, 0, .03); border-bottom: 1px solid rgba(0, 0, 0, .125);">	'
			+'<div class="row">'
			+'<div class="col-md-3">'
			+'<div class="form-group">'
			+'<h5 class="mb-0">'+object.cursoVO.nombre+'</h5></div></div>'
			+'<div class="col-md-2">'
			+'<div class="form-group">'
			+'<h5 class="mb-0">'+object.tiempo+'</h5></div></div>'
			+'<div class="col-md-1">'
			+'<div class="form-group">'
            +'<button onclick="getActividad('+object.id+');" class="btn btn-link" data-toggle="collapse" data-target="#collapse'+object.id+'"> <i class="glyphicon glyphicon-chevron-down" aria-hidden="true"></i> </button>'
					+'&nbsp;';		
	
			acor +='</div></div></div></div><div id="collapse'+object.id+'" class="collapse" aria-labelledby="headingOne" data-parent="#collapse'+object.id+'"></div></div>';
			completo=acor;


		}
		 return completo ;
	}

getActividad =function (id){
	$('#collapse'+id).html('');
	var cabecera='.sub-card-header'+id;

	    $(".collapse" ).on('show.bs.collapse',(e) =>{
	    	e.stopPropagation();
	    	var hijo ="#"+e.target.id;
	    	$(hijo).prev(cabecera).find(".glyphicon").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");	
	    
	    });
	    $(".collapse" ).on('hide.bs.collapse',(e) =>{
	    	e.stopPropagation();
	    	var hijo ="#"+e.target.id;
	    	$(hijo).prev(cabecera).find(".glyphicon").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
	  
	    });
	
	var htmlAdd ='';
		var urltxt = ctx
				+ "/monitoreoActividadUsuario/getMonitoreoActividadActi?idMonitoreoCurso="
				+ id;
		$
				.ajax({
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
							var object = response[1];
							htmlAdd='<div class="card-body" id="'+object.id+object.modulo+'">';
						var lista =object.lstMonitoreo;
								for (var i = 0; i < lista.length; i++) {
									var element = lista[i];									
									htmlAdd += datosActividad(element.id);
								}
								htmlAdd +='</div>';
							$('#collapse'+id).append(htmlAdd);
							
							
						} else {

							// $('#acordion'+id).append(htmlAdd);
						}
					},
					error : function(msg) {
						alert('Error');
					}
				});
	
}

function datosActividad(id) {	
	var acor ='';
	var completo='';
		var urltxt = ctx
				+ "/monitoreoActividadUsuario/getMonitoreoActividad?idMonitoreo="
				+ id;
		var jqXHR = 	$.ajax({
			        async: false,
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
					},
					error : function(msg) {
						alert('Error');
					}
				});	
		
		var datos=jqXHR.responseJSON;
		result = datos[0];
		if (result) {
			var object = datos[1];
			
			acor=' <div class="card">'
			+'<div class="sub-card-header'+object.id+'" style="padding: .75rem 1.25rem; margin-bottom: 0; background-color: rgba(0, 0, 0, .03); border-bottom: 1px solid rgba(0, 0, 0, .125);">	'
			+'<div class="row">'
			+'<div class="col-md-3">'
			+'<div class="form-group">'
			+'<h5 class="mb-0">'+object.actividadVO.nombre+'</h5></div></div>'
			+'<div class="col-md-2">'
			+'<div class="form-group">'
			+'<h5 class="mb-0">'+object.tiempo+'</h5></div></div>';			
			acor +='</div></div><div id="collapse'+object.id+'" class="collapse" aria-labelledby="headingOne" data-parent="#collapse'+object.id+'"></div></div>';
			completo=acor;


		}
		 return completo ;
	}