
newPregunta = function() {
	// Muestra modal nueva pregunta
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});	
}


newAbierta = function() {
	
	$('#formPreguntaAbierta').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleAbiertaNueva");
	removeElement("hTitleAbiertaEditar");
	
	// Muestra modal nueva pregunta abierta
	$('#modalNewPregunta').modal('hide');
	$('#modalNewAbierta').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelAbierta").off("click").click(function() {
		cancelAbierta();
	});
}
cancelAbierta = function() {
	// Desaparece modal nueva pregunta abierta
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewAbierta').modal('hide');
}
closeAbierta = function(){
	$('#modalNewAbierta').modal('hide');
}


/////////

newVerdaderoFalso = function() {
	
	$('#formPreguntaVerdaderoFalso').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleVerdaderoFalsoNueva");
	removeElement("hTitleVerdaderoFalsoEditar");
	
	// Opcion por default en radio button
	$('#iptRespuestaVerdadero').prop('checked', true);
	$('#iptRespuestaVerdadero').iCheck({
	    radioClass: 'iradio_minimal checked'
	});
	
	// Muestra modal nueva pregunta Verdadero Falso
	$('#modalNewPregunta').modal('hide');
	$('#modalNewVerdaderoFalso').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelVerdaderoFalso").off("click").click(function() {
		cancelVerdaderoFalso();
	});
}
cancelVerdaderoFalso = function() {
	// Desaparece modal nueva pregunta Verdadero Falso
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewVerdaderoFalso').modal('hide');
}
closeVerdaderoFalso = function(){
	$('#modalNewVerdaderoFalso').modal('hide');
}

/////////

newMultipleUnica = function() {
	
	$('#formPreguntaMultipleUnica').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleMultipleUnicaNueva");
	removeElement("hTitleMultipleUnicaEditar");
	
	// Opcion por default en radio button
	$('#iptRespuestaMultipleUnica1').prop('checked', true);
	$('#iptRespuestaMultipleUnica1').iCheck({
	    radioClass: 'iradio_minimal checked'
	});
	
	// Muestra modal nueva pregunta Multiple Unica
	$('#modalNewPregunta').modal('hide');
	$('#modalNewMultipleUnica').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelMultipleUnica").off("click").click(function() {
		cancelMultipleUnica();
	});
}
cancelMultipleUnica = function() {
	// Desaparece modal nueva pregunta Multiple Unica
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewMultipleUnica').modal('hide');
}
closeMultipleUnica = function(){
	$('#modalNewMultipleUnica').modal('hide');
}

btnRespuestaMultipleUnicaGenerar = function() {
	var opcionSel = $("#selectPreguntaMultipleUnicaGenerar").val();
	
	if(!(opcionSel == '')) {
		$("#respuestas").empty();
		
	    for (var i = 1; i <= opcionSel; i++) {
	      $('#respuestas')
	      	.append(`<div class="input-group">`+
	      				`<span class="input-group-addon">`+
	      					`<input type="radio" name="iptRespuestaMultipleUnica" id="iptRespuestaMultipleUnica${i}" value="${i}">`+
	      				`</span>`+
	      				`<input type="text" class="form-control" id="iptRespuestaMU${i}" name="iptRespuestaMU${i}" maxlength="500" placeholder="Respuesta ${i} (Español)" required="">`+
	      				`<input type="text" class="form-control" id="iptRespuestaMUEn${i}" name="iptRespuestaMUEn${i}" maxlength="500" placeholder="Respuesta ${i} (Inglés)">`+
	      				`<input type="text" class="form-control" id="iptRespuestaMUFr${i}" name="iptRespuestaMUFr${i}" maxlength="500" placeholder="Respuesta ${i} (Frances)">`+
	      			`</div>`);
	    }

	    $('#respuestas').append(`</br>`);
	} 
}



/////////

newMultipleMultiple = function() {
	
	$('#formPreguntaMultipleMultiple').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleMultipleMultipleNueva");
	removeElement("hTitleMultipleMultipleEditar");
	
	// Muestra modal nueva pregunta Multiple Multiple
	$('#modalNewPregunta').modal('hide');
	$('#modalNewMultipleMultiple').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelMultipleMultiple").off("click").click(function() {
		cancelMultipleMultiple();
	});
}
cancelMultipleMultiple = function() {
	// Desaparece modal nueva pregunta Multiple Multiple
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewMultipleMultiple').modal('hide');
}
closeMultipleMultiple = function(){
	$('#modalNewMultipleMultiple').modal('hide');
}

btnRespuestaMultipleMultipleGenerar = function() {
	var opcionSel = $("#selectPreguntaMultipleMultipleGenerar").val();
	
	if(!(opcionSel == '')) {
		$("#respuestasMultiple").empty();
		
		$('#respuestasMultiple')
      	.append(`<div class="col-md-10">`+
      				`<div class="form-group">`+
      					`<label for="iptRespuestaMultipleMultipleNombre">Titulo</label>`+
      				`</div>`+
      		    `</div>`+
      		    `<div class="col-md-2">`+
      		    		`<div class="form-group">`+
      		    			`<label for="iptPonderacionMultipleMultipleNombre">Pond.</label>`+
      		    		`</div>`+
      		    	`</div>`);
      			
		for (var i = 1; i <= opcionSel; i++) {
		      $('#respuestasMultiple')
		      	.append(`<div class="col-md-10">`+
		      				`<div class="input-group">`+
		      					`<span class="input-group-addon">`+
		      						`<input type="checkbox" name="iptRespuestaMultipleMultiple${i}" id="iptRespuestaMultipleMultiple${i}" value="${i}">`+
		      					`</span>`+
		      					`<input type="text" class="form-control" id="iptRespuestaMM${i}" name="iptRespuestaMM${i}" maxlength="500" placeholder="Respuesta ${i} (Español)" required="">`+
		      					`<input type="text" class="form-control" id="iptRespuestaMMEn${i}" name="iptRespuestaMMEn${i}" maxlength="500" placeholder="Respuesta ${i} (Inglés)">`+
		      					`<input type="text" class="form-control" id="iptRespuestaMMFr${i}" name="iptRespuestaMMFr${i}" maxlength="500" placeholder="Respuesta ${i} (Frances)">`+
		      				`</div>`+
		      			`</div>`+
		      			`<div class="col-md-2">`+
		      				`<div class="input-group">`+
		      					`<input type="number" class="form-control" id="iptPonderacionMM${i}" name="iptPonderacionMM${i}" value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" onKeyDown="" required="" >`+
		      				`</div>`+
		      			`</div>`);
		}
		$('#respuestasMultiple').append(`<div class="col-md-12"></br></div>`);
    
	} 
}



/////////

newRelacionColumnas = function() {
	
	$('#formPreguntaRelacionColumnas').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleRelacionColumnasNueva");
	removeElement("hTitleRelacionColumnasEditar");
	
	// Muestra modal nueva pregunta Relacion Columnas
	$('#modalNewPregunta').modal('hide');
	$('#modalNewRelacionColumnas').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelRelacionColumnas").off("click").click(function() {
		cancelRelacionColumnas();
	});
}
cancelRelacionColumnas = function() {
	// Desaparece modal nueva pregunta Relacion Columnas
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewRelacionColumnas').modal('hide');
}
closeRelacionColumnas = function(){
	$('#modalNewRelacionColumnas').modal('hide');
}

btnRespuestaRelacionColumnasGenerar = function() {
	var opcionSel = $("#selectPreguntaRelacionColumnasGenerar").val();
	
	if(!(opcionSel == '')) {
		let regAbc = ["", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"];
		$("#respuestasRelacionColumnas").empty();
		
		$('#respuestasRelacionColumnas')
      	.append(`<div class="col-md-10">`+
      				`<div class="form-group">`+
      					`<label for="iptRespuestaMultipleMultipleNombre">Titulo</label>`+
      				`</div>`+
      		    `</div>`+
      		    `<div class="col-md-2">`+
      		    		`<div class="form-group">`+
      		    			`<label for="iptPonderacionMultipleMultipleNombre">Pond.</label>`+
      		    		`</div>`+
      		    	`</div>`);
      			
		for (var i = 1; i <= opcionSel; i++) {
			
			var letra = regAbc[i];
			
		      $('#respuestasRelacionColumnas')
		      	.append(`<div class="col-md-10">`+
		      				`<div class="input-group">`+
		      				 	`<span class="input-group-addon">${i}</span>`+
		      					`<input type="text" class="form-control" id="iptRespuestaRCA${i}" name="iptRespuestaRCA${i}" maxlength="500" placeholder="Respuesta ${i} (Español)" required="">`+
		      					`<input type="text" class="form-control" id="iptRespuestaRCAEn${i}" name="iptRespuestaRCAEn${i}" maxlength="500" placeholder="Respuesta ${i} (Inglés)">`+
		      					`<input type="text" class="form-control" id="iptRespuestaRCAFr${i}" name="iptRespuestaRCAFr${i}" maxlength="500" placeholder="Respuesta ${i} (Frances)">`+
		      		            `<span class="input-group-addon">${letra}</span>`+
		      		            `<input type="text" class="form-control" id="iptRespuestaRCB${i}" name="iptRespuestaRCB${i}" maxlength="500" placeholder="Respuesta ${letra} (Español)" required="">`+
		      		            `<input type="text" class="form-control" id="iptRespuestaRCBEn${i}" name="iptRespuestaRCBEn${i}" maxlength="500" placeholder="Respuesta ${letra} (Inglés)">`+
		      		            `<input type="text" class="form-control" id="iptRespuestaRCBFr${i}" name="iptRespuestaRCBFr${i}" maxlength="500" placeholder="Respuesta ${letra} (Frances)">`+
		      				`</div>`+
		      			`</div>`+
		      			`<div class="col-md-2">`+
		      				`<div class="input-group">`+
		      					`<input type="number" class="form-control" id="iptPonderacionRC${i}" name="iptPonderacionRC${i}" value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" onKeyDown="" required="" >`+
		      				`</div>`+
		      			`</div>`);
		}
		$('#respuestasRelacionColumnas').append(`<div class="col-md-12"></br></div>`);
    
	} 
}



/////////

newRellenarBlancos = function() {
	
	$('#formPreguntaRellenarBlancos').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleRellenarBlancosNueva");
	removeElement("hTitleRellenarBlancosEditar");
	
	// Muestra modal nueva pregunta Rellenar Blancos
	$('#modalNewPregunta').modal('hide');
	$('#modalNewRellenarBlancos').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelRellenarBlancos").off("click").click(function() {
		cancelRellenarBlancos();
	});
}
cancelRellenarBlancos = function() {
	// Desaparece modal nueva pregunta Rellenar Blancos
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewRellenarBlancos').modal('hide');
}
closeRellenarBlancos = function(){
	$('#modalNewRellenarBlancos').modal('hide');
}

btnRespuestaRellenarBlancosGenerar = function() {
	var opcionSel = $("#selectPreguntaRellenarBlancosGenerar").val();
	
	if(!(opcionSel == '')) {
		$("#respuestasRellenarBlancos").empty();
		
	    for (var i = 1; i <= opcionSel; i++) {
	      $('#respuestasRellenarBlancos')
	      	.append(`<div class="input-group">`+
	      				`<span class="input-group-addon">${i}</span>` +   				
				        `<input type="text" class="form-control" id="iptRespuestaRB${i}" name="iptRespuestaRB${i}" maxlength="50" placeholder="Palabra ${i} (Español)" required="">`+
				        `<input type="text" class="form-control" id="iptRespuestaRBEn${i}" name="iptRespuestaRBEn${i}" maxlength="50" placeholder="Palabra ${i} (Inglés)">`+
				        `<input type="text" class="form-control" id="iptRespuestaRBFr${i}" name="iptRespuestaRBFr${i}" maxlength="50" placeholder="Palabra ${i} (Frances)">`+
	      			`</div>`);
	    }
	    $('#respuestasRellenarBlancos').append(`<div class="col-md-12"></br></div>`);

	} 
}

/////////

newCombinacionExacta = function() {
	
	$('#formPreguntaCombinacionExacta').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleCombinacionExactaNueva");
	removeElement("hTitleCombinacionExactaEditar");
	
	// Muestra modal nueva pregunta Combinacion Exacta
	$('#modalNewPregunta').modal('hide');
	$('#modalNewCombinacionExacta').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelCombinacionExacta").off("click").click(function() {
		cancelCombinacionExacta();
	});
}
cancelCombinacionExacta = function() {
	// Desaparece modal nueva pregunta Combinacion Exacta
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewCombinacionExacta').modal('hide');
}
closeCombinacionExacta = function(){
	$('#modalNewCombinacionExacta').modal('hide');
}

btnRespuestaCombinacionExactaGenerar = function() {
	var opcionSel = $("#selectPreguntaCombinacionExactaGenerar").val();
	
	if(!(opcionSel == '')) {
		$("#respuestasCombinacionExacta").empty();
		
	    for (var i = 1; i <= opcionSel; i++) {
	      $('#respuestasCombinacionExacta')
	      	.append(`<div class="input-group">`+   				
	      				`<span class="input-group-addon">`+
				            `<input type="checkbox" name="iptRespuestaCombinacionExacta${i}" id="iptRespuestaCombinacionExacta${i}" value="${i}">`+
				        `</span>`+
				        `<input type="text" class="form-control" id="iptRespuestaCE${i}" name="iptRespuestaCE${i}" maxlength="500" placeholder="Respuesta ${i} (Español)" required="">`+
				        `<input type="text" class="form-control" id="iptRespuestaCEEn${i}" name="iptRespuestaCEEn${i}" maxlength="500" placeholder="Respuesta ${i} (Inglés)">`+
				        `<input type="text" class="form-control" id="iptRespuestaCEFr${i}" name="iptRespuestaCEFr${i}" maxlength="500" placeholder="Respuesta ${i} (Frances)">`+
	      			`</div>`);
	    }
	    $('#respuestasCombinacionExacta').append(`<div class="col-md-12"></br></div>`);

	} 
}



/////////

newGradoCerteza = function() {

	$('#formPreguntaGradoCerteza').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleGradoCertezaNueva");
	removeElement("hTitleGradoCertezaEditar");
	
	// Muestra modal nueva pregunta Grado Certeza
	$('#modalNewPregunta').modal('hide');
	$('#modalNewGradoCerteza').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelGradoCerteza").off("click").click(function() {
		cancelGradoCerteza();
	});
}
cancelGradoCerteza = function() {
	// Desaparece modal nueva pregunta Grado Certeza
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewGradoCerteza').modal('hide');
}
closeGradoCerteza = function(){
	$('#modalNewGradoCerteza').modal('hide');
}

/////////

newImagenUnica = function() {
	
	$('#formPreguntaImagenUnica').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleImagenUnicaNueva");
	removeElement("hTitleImagenUnicaEditar");
	
	$('#iptPreguntaImagenUnicaFile1').prop('required', true);
	$('#iptPreguntaImagenUnicaFile2').prop('required', true);
	$('#iptPreguntaImagenUnicaFile3').prop('required', true);
	$('#iptPreguntaImagenUnicaFile4').prop('required', true);
	
	// Opcion por default en radio button
	$('#iptRespuestaImagenUnica1').prop('checked', true);
	$('#iptRespuestaImagenUnica1').iCheck({
	    radioClass: 'iradio_minimal checked'
	});
	
	// Muestra modal nueva pregunta Imagen Unica
	$('#modalNewPregunta').modal('hide');
	$('#modalNewImagenUnica').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelImagenUnica").off("click").click(function() {
		cancelImagenUnica();
	});
}
cancelImagenUnica = function() {
	// Desaparece modal nueva pregunta Imagen Unica
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewImagenUnica').modal('hide');
}
closeImagenUnica = function(){
	$('#modalNewImagenUnica').modal('hide');
}
btnRespuestaImagenUnicaGenerar = function() {
	var opcionSel = $("#selectPreguntaImagenUnicaGenerar").val();
	
	if(!(opcionSel == '')) {
		$("#respuestasImagenUnica").empty();
		
	    for (var i = 1; i <= opcionSel; i++) {
	      $('#respuestasImagenUnica')
	      	.append(`<div class="input-group">`+
				        `<span class="input-group-addon">`+
		                     `<input type="radio" name="iptRespuestaImagenUnica" id="iptRespuestaImagenUnica${i}" value="${i}">`+
		                `</span>`+
		                `<br>`+
		                `<input type="file" id="iptPreguntaImagenUnicaFile${i}" name="iptPreguntaImagenUnicaFile${i}" accept=".jpg, .png" onchange="inUploadChange(this)">`+
		
		                `<div class="row" style="display:none">`+
		                    `<input type="file" id="iptPreguntaImagenUnicaFileReferencia${i}" name="iptPreguntaImagenUnicaFileReferencia${i}">`+
		                `</div>`+
		                `<div id="preguntaImagenUnicaRowDownload${i}" style="display:none">`+
		                    `<div>`+
		                        `<div class="form-group"> `+
		                            `<button onclick="downloadFileRes( $('#iptIdRespuestaImagenUnica${i}').val() ); return false;" >Descargar ${i}</button>`+
		                        `</div>`+
		                    `</div>`+
		                `</div>`+
	      			`</div>`);		
	    }
	    $('#respuestasImagenUnica').append(`<div class="col-md-12"></br></div>`);

	} 
}

/////////

newArrastrable = function() {
	
	$('#formPreguntaArrastrable').parsley().reset();
	
	cleanPregunta();
	
	resetElement("hTitleArrastrableNueva");
	removeElement("hTitleArrastrableEditar");
	
	// Muestra modal nueva pregunta Arrastrable
	$('#modalNewPregunta').modal('hide');
	$('#modalNewArrastrable').modal({backdrop: 'static', keyboard: false});
	$("#btnCancelArrastrable").off("click").click(function() {
		cancelArrastrable();
	});
}
cancelArrastrable = function() {
	// Desaparece modal nueva pregunta Arrastrable
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#modalNewArrastrable').modal('hide');
}
closeArrastrable = function(){
	$('#modalNewArrastrable').modal('hide');
}

btnRespuestaArrastrableGenerar = function() {
	var opcionSel = $("#selectPreguntaArrastrableGenerar").val();
	
	if(!(opcionSel == '')) {
		$("#respuestasArrastrable").empty();
		
		$('#respuestasArrastrable')
	      	.append(`<div class="col-md-10">`+
	      				`<div class="form-group">`+
	      					`<label for="iptRespuestaArrastrableNombre">Palabra</label>`+
	      				`</div>`+
	      		    `</div>`+
	      		    `<div class="col-md-2">`+
	  		    		`<div class="form-group">`+
	  		    			`<label for="iptPonderacionArrastrableNombre">Pond.</label>`+
	  		    		`</div>`+
	  		    	`</div>`);

	    for (var i = 1; i <= opcionSel; i++) {	
	      	$('#respuestasArrastrable')
		      	.append(`<div class="col-md-10">`+
		      				`<div class="input-group">`+
		      					`<span class="input-group-addon">${i}</span>`+  				
				        		`<input type="text" class="form-control" id="iptRespuestaA${i}" name="iptRespuestaA${i}" maxlength="50" placeholder="Palabra ${i} (Español)" required="">`+
				        		`<input type="text" class="form-control" id="iptRespuestaAEn${i}" name="iptRespuestaAEn${i}" maxlength="50" placeholder="Palabra ${i} (Inglés)">`+
				        		`<input type="text" class="form-control" id="iptRespuestaAFr${i}" name="iptRespuestaAFr${i}" maxlength="50" placeholder="Palabra ${i} (Frances)">`+
		      				`</div>`+
		      			`</div>`+
		      			`<div class="col-md-2">`+
		      				`<div class="input-group">`+
		      					`<input type="number" class="form-control" id="iptPonderacionA${i}" name="iptPonderacionA${i}" value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" onKeyDown="" required="" >`+
		      				`</div>`+
		      			`</div>`);
	    }
	    $('#respuestasArrastrable').append(`<div class="col-md-12"></br></div>`);

	} 
}


/////////
/////////

savePreguntaAbierta = function(obj, idCurso, idActividad) { 
	validacionData = true;
	
	if (!notNull($("#iptPreguntaAbiertaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaAbiertaEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {
		
		var urltxt = ctx + '/lms/actividad/savePreguntaAbierta';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaAbierta")),
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
				if (result) {				
					window.location = ctx + '/lms/actividad?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaAbierta');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaAbierta');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaAbierta');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaAbierta');
	}
}

/////////

savePreguntaVerdaderoFalso = function(obj, idCurso, idActividad) {
	validacionData = true;
	
	if (!notNull($("#iptPreguntaVerdaderoFalsoNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaVerdaderoFalsoEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {
		
		var urltxt = ctx + '/lms/actividad/savePreguntaVerdaderoFalso';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaVerdaderoFalso")),
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
				if (result) {				
					window.location = ctx + '/lms/actividad?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaVerdaderoFalso');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaVerdaderoFalso');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaVerdaderoFalso');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaVerdaderoFalso');
	}
}

/////////

savePreguntaMultipleUnica = function(obj, idCurso, idActividad) {
	validacionData = true;
	
	if (!notNull($("#iptPreguntaMultipleUnicaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaMultipleUnicaEstatus"))) {
		validacionData = false;
	}

	if (validacionData) {
		
		var urltxt = ctx + '/lms/actividad/savePreguntaMultipleUnica';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaMultipleUnica")),
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
				if (result) {				
					window.location = ctx + '/lms/actividad?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaMultipleUnica');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaMultipleUnica');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaMultipleUnica');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaMultipleUnica');
	}
}

/////////

savePreguntaMultipleMultiple = function(obj, idCurso, idActividad) {
	validacionData = true;
	
	if (!notNull($("#iptPreguntaMultipleMultipleNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaMultipleMultipleEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {
		
		var urltxt = ctx + '/lms/actividad/savePreguntaMultipleMultiple';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaMultipleMultiple")),
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
				if (result) {				
					window.location = ctx + '/lms/actividad?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaMultipleMultiple');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaMultipleMultiple');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaMultipleMultiple');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaMultipleMultiple');
	}
}

/////////

savePreguntaRelacionColumnas = function(obj, idCurso, idActividad) {
	validacionData = true;
	
	if (!notNull($("#iptPreguntaRelacionColumnasNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaRelacionColumnasEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {
		
		var urltxt = ctx + '/lms/actividad/savePreguntaRelacionColumnas';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaRelacionColumnas")),
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
				if (result) {				
					window.location = ctx + '/lms/actividad?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaRelacionColumnas');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaRelacionColumnas');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaRelacionColumnas');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaRelacionColumnas');
	}
}

/////////

savePreguntaRellenarBlancos = function(obj, idCurso, idActividad) {
	validacionData = true;
	
	if (!notNull($("#iptPreguntaRellenarBlancosNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaRellenarBlancosEstatus"))) {
		validacionData = false;
	}

	
	if (validacionData) {
		
		var urltxt = ctx + '/lms/actividad/savePreguntaRellenarBlancos';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaRellenarBlancos")),
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
				if (result) {				
					window.location = ctx + '/lms/actividad?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaRellenarBlancos');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaRellenarBlancos');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaRellenarBlancos');
			}
		});
		
		
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaRellenarBlancos');
	}
}

/////////

savePreguntaCombinacionExacta = function(obj, idCurso, idActividad) {
	validacionData = true;
	
	if (!notNull($("#iptPreguntaCombinacionExactaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaCombinacionExactaEstatus"))) {
		validacionData = false;
	}

	
	if (validacionData) {
		
		var urltxt = ctx + '/lms/actividad/savePreguntaCombinacionExacta';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaCombinacionExacta")),
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
				if (result) {				
					window.location = ctx + '/lms/actividad?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaCombinacionExacta');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaCombinacionExacta');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaCombinacionExacta');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaCombinacionExacta');
	}
}

/////////

savePreguntaImagenUnica = function(obj, idCurso, idActividad) {
	validacionData = true;
	
	if (!notNull($("#iptPreguntaImagenUnicaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaImagenUnicaEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {
		
		var urltxt = ctx + '/lms/actividad/savePreguntaImagenUnica';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaImagenUnica")),
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
				if (result) {				
					window.location = ctx + '/lms/actividad?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaImagenUnica');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaImagenUnica');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaImagenUnica');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaImagenUnica');
	}
}

/////////

savePreguntaArrastrable = function(obj, idCurso, idActividad) {
	validacionData = true;
	
	if (!notNull($("#iptPreguntaArrastrableNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaArrastrableEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {
		
		var urltxt = ctx + '/lms/actividad/savePreguntaArrastrable';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPreguntaArrastrable")),
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
				if (result) {				
					window.location = ctx + '/lms/actividad?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPreguntaArrastrable');
				} else {
					displayErrorMessageByObjectId('',msg,'formPreguntaArrastrable');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPreguntaArrastrable');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPreguntaArrastrable');
	}
}

/////////
/////////

editPregunta = function(idPregunta, idTipoActividad, idTipoPregunta) {
	
	var urltxt = ctx + '/lms/actividad/consultaPregunta?id='+idPregunta;
	
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
				var actividadPreguntaVO = response[1];
				var actividadRespuestaVO = response[2];

				switch (idTipoPregunta) {
					case 1:
						// PREGUNTA ABIERTA
						
						resetElement("hTitleAbiertaEditar");
						removeElement("hTitleAbiertaNueva");
						
						$('#formPreguntaAbierta').parsley().reset();
						cleanPregunta();
						$("#btnCancelAbierta").off("click").click(function() {
							closeAbierta();
				        });
						
						if(actividadPreguntaVO.imagen != null){
							resetElement("preguntaAbiertaRowDownload");
						}
						
						$('#iptIdPreguntaAbierta').val(actividadPreguntaVO.id);
						$('#iptPreguntaAbiertaNombre').val(actividadPreguntaVO.nombre);
						$('#iptPreguntaAbiertaNombreEn').val(actividadPreguntaVO.nombreEn);
						$('#iptPreguntaAbiertaNombreFr').val(actividadPreguntaVO.nombreFr);
						$('#iptPreguntaAbiertaPonderacion').val(actividadPreguntaVO.ponderacion);
						$('#selectPreguntaAbiertaEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewAbierta').modal({backdrop: 'static', keyboard: false});
						
						break;
						
					case 2:
						// PREGUNTA VERDADERO-FALSO
						
						resetElement("hTitleVerdaderoFalsoEditar");
						removeElement("hTitleVerdaderoFalsoNueva");
						
						$('#formPreguntaVerdaderoFalso').parsley().reset();
						cleanPregunta();
						$("#btnCancelVerdaderoFalso").off("click").click(function() {
							closeVerdaderoFalso();
				        });
						
						if(actividadPreguntaVO.imagen != null){
							resetElement("preguntaVerdaderoFalsoRowDownload");
						}
						
						// Respuestas
						var respVerdadero = actividadRespuestaVO[0].correcta;
						if(respVerdadero == 1) {
							$('#iptRespuestaVerdadero').prop('checked', true);
							$('#iptRespuestaVerdadero').iCheck({
							    radioClass: 'iradio_minimal checked'
							});
						} else {
							$("#iptRespuestaFalso").prop("checked", true);
							$('#iptRespuestaFalso').iCheck({
							    radioClass: 'iradio_minimal checked'
							});
						}
						
						$('#iptIdPreguntaVerdaderoFalso').val(actividadPreguntaVO.id);
						$('#iptPreguntaVerdaderoFalsoNombre').val(actividadPreguntaVO.nombre);
						$('#iptPreguntaVerdaderoFalsoNombreEn').val(actividadPreguntaVO.nombreEn);
						$('#iptPreguntaVerdaderoFalsoNombreFr').val(actividadPreguntaVO.nombreFr);
						$('#iptPreguntaVerdaderoFalsoPonderacion').val(actividadPreguntaVO.ponderacion);
						$('#selectPreguntaVerdaderoFalsoEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewVerdaderoFalso').modal({backdrop: 'static', keyboard: false});
						
						break;
						
					case 3:
						// PREGUNTA OPCION MULTIPLE (UNICA)
						
						resetElement("hTitleMultipleUnicaEditar");
						removeElement("hTitleMultipleUnicaNueva");
						
						$('#formPreguntaMultipleUnica').parsley().reset();
						cleanPregunta();
						$("#btnCancelMultipleUnica").off("click").click(function() {
							closeMultipleUnica();
				        });
						
						if(actividadPreguntaVO.imagen != null){
							resetElement("preguntaMultipleUnicaRowDownload");
						}
						
						$("#btnRespuestaMultipleUnicaG").prop('disabled', true);
						$("#selectPreguntaMultipleUnicaGenerar").prop('disabled', true);
						var actividadRespuestaVOLen = actividadRespuestaVO.length;
						$('#selectPreguntaMultipleUnicaGenerar').val(actividadRespuestaVOLen);

						$("#respuestas").empty();
					    for (var i = 0; i < actividadRespuestaVOLen; i++) {
					      $('#respuestas')
					      	.append(`<div class="input-group">`+
					      				`<span class="input-group-addon">`+
					      					`<input type="radio" name="iptRespuestaMultipleUnica" id="iptRespuestaMultipleUnica${i+1}" value="${i+1}">`+
					      				`</span>`+
					      				`<input type="text" class="form-control" id="iptRespuestaMU${i+1}" name="iptRespuestaMU${i+1}" maxlength="500" placeholder="Respuesta ${i+1} (Español)" required="">`+
					      				`<input type="text" class="form-control" id="iptRespuestaMUEn${i+1}" name="iptRespuestaMUEn${i+1}" maxlength="500" placeholder="Respuesta ${i+1} (Inglés)">`+
					      				`<input type="text" class="form-control" id="iptRespuestaMUFr${i+1}" name="iptRespuestaMUFr${i+1}" maxlength="500" placeholder="Respuesta ${i+1} (Frances)">`+
					      			`</div>`);
					      			
					      			
					      	var resp = 0;
					    	if(actividadRespuestaVO[i] != null) {
					    		resp = actividadRespuestaVO[i].correcta;
					    		j = i + 1;
					    		$('#iptRespuestaMU'+j).val(actividadRespuestaVO[i].nombre);
					    		$('#iptRespuestaMUEn'+j).val(actividadRespuestaVO[i].nombreEn);
					    		$('#iptRespuestaMUFr'+j).val(actividadRespuestaVO[i].nombreFr);
					    		
					    		if(resp == 1) {
									$('#iptRespuestaMultipleUnica'+j).prop('checked', true);
								}
					    	}

					    }
						$('#respuestas').append(`<div class="col-md-12"></br></div>`);


						$('#iptIdPreguntaMultipleUnica').val(actividadPreguntaVO.id);
						$('#iptPreguntaMultipleUnicaNombre').val(actividadPreguntaVO.nombre);
						$('#iptPreguntaMultipleUnicaNombreEn').val(actividadPreguntaVO.nombreEn);
						$('#iptPreguntaMultipleUnicaNombreFr').val(actividadPreguntaVO.nombreFr);
						$('#iptPreguntaMultipleUnicaPonderacion').val(actividadPreguntaVO.ponderacion);
						$('#selectPreguntaMultipleUnicaEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewMultipleUnica').modal({backdrop: 'static', keyboard: false});
						
						break;
						
					case 4:
						// PREGUNTA OPCION MULTIPLE (MULTIPLE)
						
						resetElement("hTitleMultipleMultipleEditar");
						removeElement("hTitleMultipleMultipleNueva");
						
						$('#formPreguntaMultipleMultiple').parsley().reset();
						cleanPregunta();
						$("#btnCancelMultipleMultiple").off("click").click(function() {
							closeMultipleMultiple();
				        });
						
						if(actividadPreguntaVO.imagen != null){
							resetElement("preguntaMultipleMultipleRowDownload");
						}
						

						$("#btnRespuestaMultipleMultipleG").prop('disabled', true);
						$("#selectPreguntaMultipleMultipleGenerar").prop('disabled', true);
						var actividadRespuestaVOLen = actividadRespuestaVO.length;
						$('#selectPreguntaMultipleMultipleGenerar').val(actividadRespuestaVOLen);

						$("#respuestasMultiple").empty();
					    $('#respuestasMultiple')
					      	.append(`<div class="col-md-10">`+
					      				`<div class="form-group">`+
					      					`<label for="iptRespuestaRelacionColumnasNombre">Titulo</label>`+
					      				`</div>`+
					      		    `</div>`+
					      		    `<div class="col-md-2">`+
					      		    		`<div class="form-group">`+
					      		    			`<label for="iptPonderacionRelacionColumnasPond">Pond.</label>`+
					      		    		`</div>`+
					      		    	`</div>`);
				      			
						for (var i = 0; i < actividadRespuestaVOLen; i++) {
						      $('#respuestasMultiple')
						      	.append(`<div class="col-md-10">`+
						      				`<div class="input-group">`+
						      					`<span class="input-group-addon">`+
						      						`<input type="checkbox" name="iptRespuestaMultipleMultiple${i+1}" id="iptRespuestaMultipleMultiple${i+1}" value="${i+1}">`+
						      					`</span>`+
						      					`<input type="text" class="form-control" id="iptRespuestaMM${i+1}" name="iptRespuestaMM${i+1}" maxlength="500" placeholder="Respuesta (Español) ${i+1}" required="">`+
						      					`<input type="text" class="form-control" id="iptRespuestaMMEn${i+1}" name="iptRespuestaMMEn${i+1}" maxlength="500" placeholder="Respuesta (Inglés) ${i+1}">`+
						      					`<input type="text" class="form-control" id="iptRespuestaMMFr${i+1}" name="iptRespuestaMMFr${i+1}" maxlength="500" placeholder="Respuesta (Frances) ${i+1}">`+
						      				`</div>`+
						      			`</div>`+
						      			`<div class="col-md-2">`+
						      				`<div class="input-group">`+
						      					`<input type="number" class="form-control" id="iptPonderacionMM${i+1}" name="iptPonderacionMM${i+1}" value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" onKeyDown="" required="" >`+
						      				`</div>`+
						      			`</div>`);
						      			
						      	var resp = 0;
						      	if(actividadRespuestaVO[i] != null) {
									resp = actividadRespuestaVO[i].correcta;
									j = i + 1;
									$('#iptRespuestaMM' + j).val(actividadRespuestaVO[i].nombre);
									$('#iptRespuestaMMEn' + j).val(actividadRespuestaVO[i].nombreEn);
									$('#iptRespuestaMMFr' + j).val(actividadRespuestaVO[i].nombreFr);
									$('#iptPonderacionMM' + j).val(actividadRespuestaVO[i].ponderacion);
									
									if(resp == 1){
										$('#iptRespuestaMultipleMultiple' + j).prop('checked', true);
									} 
									
								}
						      			
						}
						$('#respuestasMultiple').append(`<div class="col-md-12"></br></div>`);
					    

						$('#iptIdPreguntaMultipleMultiple').val(actividadPreguntaVO.id);
						$('#iptPreguntaMultipleMultipleNombre').val(actividadPreguntaVO.nombre);
						$('#iptPreguntaMultipleMultipleNombreEn').val(actividadPreguntaVO.nombreEn);
						$('#iptPreguntaMultipleMultipleNombreFr').val(actividadPreguntaVO.nombreFr);
						$('#iptPreguntaMultipleMultiplePonderacion').val(actividadPreguntaVO.ponderacion);
						$('#selectPreguntaMultipleMultipleEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewMultipleMultiple').modal({backdrop: 'static', keyboard: false});
						
						break;
						
					case 5:
						// PREGUNTA RELACION DE COLUMNAS
						
						resetElement("hTitleRelacionColumnasEditar");
						removeElement("hTitleRelacionColumnasNueva");
						
						$('#formPreguntaRelacionColumnas').parsley().reset();
						cleanPregunta();
						$("#btnCancelRelacionColumnas").off("click").click(function() {
							closeRelacionColumnas();
				        });
						
						if(actividadPreguntaVO.imagen != null){
							resetElement("preguntaRelacionColumnasRowDownload");
						}
						
						$("#btnRespuestaRelacionColumnasG").prop('disabled', true);
						$("#selectPreguntaRelacionColumnasGenerar").prop('disabled', true);
						var actividadRespuestaVOLen = actividadRespuestaVO.length;
						$('#selectPreguntaRelacionColumnasGenerar').val(actividadRespuestaVOLen);
						
						let regAbc = ["", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"];
						$("#respuestasRelacionColumnas").empty();
					    $('#respuestasRelacionColumnas')
				      	.append(`<div class="col-md-10">`+
					      			`<div class="form-group">`+
				      					`<label for="iptRespuestaRelacionColumnasNombre">Titulo</label>`+
				      				`</div>`+
				      		    `</div>`+
				      		    `<div class="col-md-2">`+
				      		    		`<div class="form-group">`+
				      		    			`<label for="iptPonderacionRelacionColumnasPond">Pond.</label>`+
				      		    		`</div>`+
				      		    	`</div>`);
				      			
						for (var i = 0; i < actividadRespuestaVOLen; i++) {
							  var letra = regAbc[i+1];
						      $('#respuestasRelacionColumnas')
						      	.append(`<div class="col-md-10">`+
						      				`<div class="input-group">`+
						      				 	`<span class="input-group-addon">${i+1}</span>`+
						      					`<input type="text" class="form-control" id="iptRespuestaRCA${i+1}" name="iptRespuestaRCA${i+1}" maxlength="500" placeholder="Respuesta ${i+1} (Español)" required="">`+
						      					`<input type="text" class="form-control" id="iptRespuestaRCAEn${i+1}" name="iptRespuestaRCAEn${i+1}" maxlength="500" placeholder="Respuesta ${i+1} (Inglés)">`+
						      					`<input type="text" class="form-control" id="iptRespuestaRCAFr${i+1}" name="iptRespuestaRCAFr${i+1}" maxlength="500" placeholder="Respuesta ${i+1} (Frances)">`+
						      		            `<span class="input-group-addon">${letra}</span>`+
						      		            `<input type="text" class="form-control" id="iptRespuestaRCB${i+1}" name="iptRespuestaRCB${i+1}" maxlength="500" placeholder="Respuesta ${letra} (Español)" required="">`+
						      		            `<input type="text" class="form-control" id="iptRespuestaRCBEn${i+1}" name="iptRespuestaRCBEn${i+1}" maxlength="500" placeholder="Respuesta ${letra} (Inglés)">`+
						      		            `<input type="text" class="form-control" id="iptRespuestaRCBFr${i+1}" name="iptRespuestaRCBFr${i+1}" maxlength="500" placeholder="Respuesta ${letra} (Frances)">`+
						      				`</div>`+
						      			`</div>`+
						      			`<div class="col-md-2">`+
						      				`<div class="input-group">`+
						      					`<input type="number" class="form-control" id="iptPonderacionRC${i+1}" name="iptPonderacionRC${i+1}" value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" onKeyDown="" required="" >`+
						      				`</div>`+
						      			`</div>`);
						      			
						      			
						      if (actividadRespuestaVO[i] != null) {
						      	j = i + 1;
						      	$('#iptRespuestaRCA'+j).val(actividadRespuestaVO[i].nombre);
						      	$('#iptRespuestaRCAEn'+j).val(actividadRespuestaVO[i].nombreEn);
						      	$('#iptRespuestaRCAFr'+j).val(actividadRespuestaVO[i].nombreFr);
						      	
								$('#iptRespuestaRCB'+j).val(actividadRespuestaVO[i].nombre2);
								$('#iptRespuestaRCBEn'+j).val(actividadRespuestaVO[i].nombre2En);
								$('#iptRespuestaRCBFr'+j).val(actividadRespuestaVO[i].nombre2Fr);
								
								$('#iptPonderacionRC'+j).val(actividadRespuestaVO[i].ponderacion);
						      }	
						}
						$('#respuestasRelacionColumnas').append(`<div class="col-md-12"></br></div>`);
						
						
						
						$('#iptIdPreguntaRelacionColumnas').val(actividadPreguntaVO.id);
						$('#iptPreguntaRelacionColumnasNombre').val(actividadPreguntaVO.nombre);
						$('#iptPreguntaRelacionColumnasNombreEn').val(actividadPreguntaVO.nombreEn);
						$('#iptPreguntaRelacionColumnasNombreFr').val(actividadPreguntaVO.nombreFr);
						$('#iptPreguntaRelacionColumnasPonderacion').val(actividadPreguntaVO.ponderacion);
						$('#selectPreguntaRelacionColumnasEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewRelacionColumnas').modal({backdrop: 'static', keyboard: false});
						
						break;
						
					case 6:
						// PREGUNTA RELLENAR BLANCOS
						
						resetElement("hTitleRellenarBlancosEditar");
						removeElement("hTitleRellenarBlancosNueva");
						
						$('#formPreguntaRellenarBlancos').parsley().reset();
						cleanPregunta();
						$("#btnCancelRellenarBlancos").off("click").click(function() {
							closeRellenarBlancos();
				        });
						
						if(actividadPreguntaVO.imagen != null){
							resetElement("preguntaRellenarBlancosRowDownload");
						}

						$("#btnRespuestaRellenarBlancosG").prop('disabled', true);
						$("#selectPreguntaRellenarBlancosGenerar").prop('disabled', true);
						var actividadRespuestaVOLen = actividadRespuestaVO.length;
						$('#selectPreguntaRellenarBlancosGenerar').val(actividadRespuestaVOLen);
						
						$("#respuestasRellenarBlancos").empty();
						for (var i = 0; i < actividadRespuestaVOLen; i++) {
					         $('#respuestasRellenarBlancos')
						      	.append(`<div class="input-group">`+
						      				`<span class="input-group-addon">${i+1}</span>` +   				
									        `<input type="text" class="form-control" id="iptRespuestaRB${i+1}" name="iptRespuestaRB${i+1}" maxlength="50" placeholder="Palabra ${i+1} (Español)" required="">`+
									        `<input type="text" class="form-control" id="iptRespuestaRBEn${i+1}" name="iptRespuestaRBEn${i+1}" maxlength="50" placeholder="Palabra ${i+1} (Inglés)">`+
									        `<input type="text" class="form-control" id="iptRespuestaRBFr${i+1}" name="iptRespuestaRBFr${i+1}" maxlength="50" placeholder="Palabra ${i+1} (Frances)">`+
						      			`</div>`);
						
							if (actividadRespuestaVO[i] != null) {
								j = i + 1;
        						$('#iptRespuestaRB' + j).val(actividadRespuestaVO[i].nombre);
        						$('#iptRespuestaRBEn' + j).val(actividadRespuestaVO[i].nombreEn);
        						$('#iptRespuestaRBFr' + j).val(actividadRespuestaVO[i].nombreFr);
							}
						}
						$('#respuestasRellenarBlancos').append(`<div class="col-md-12"></br></div>`);
						
						
						$('#iptIdPreguntaRellenarBlancos').val(actividadPreguntaVO.id);
						$('#iptPreguntaRellenarBlancosNombre').val(actividadPreguntaVO.nombre);
						$('#iptPreguntaRellenarBlancosNombreEn').val(actividadPreguntaVO.nombreEn);
						$('#iptPreguntaRellenarBlancosNombreFr').val(actividadPreguntaVO.nombreFr);
						$('#iptPreguntaRellenarBlancosPonderacion').val(actividadPreguntaVO.ponderacion);
						$('#selectPreguntaRellenarBlancosEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewRellenarBlancos').modal({backdrop: 'static', keyboard: false});
						
						break;
						
					case 7:
						// PREGUNTA COMBINACION EXACTA
						
						resetElement("hTitleCombinacionExactaEditar");
						removeElement("hTitleCombinacionExactaNueva");
						
						$('#formPreguntaCombinacionExacta').parsley().reset();
						cleanPregunta();
						$("#btnCancelCombinacionExacta").off("click").click(function() {
							closeCombinacionExacta();
				        });
						
						if(actividadPreguntaVO.imagen != null){
							resetElement("preguntaCombinacionExactaRowDownload");
						}

						$("#btnRespuestaCombinacionExactaG").prop('disabled', true);
						$("#selectPreguntaCombinacionExactaGenerar").prop('disabled', true);
						var actividadRespuestaVOLen = actividadRespuestaVO.length;
						$('#selectPreguntaCombinacionExactaGenerar').val(actividadRespuestaVOLen);

						$("#respuestasCombinacionExacta").empty();
					    for (var i = 0; i < actividadRespuestaVOLen; i++) {
					      	$('#respuestasCombinacionExacta')
						      	.append(`<div class="input-group">`+   				
						      				`<span class="input-group-addon">`+
									            `<input type="checkbox" name="iptRespuestaCombinacionExacta${i+1}" id="iptRespuestaCombinacionExacta${i+1}" value="${i+1}">`+
									        `</span>`+
									        `<input type="text" class="form-control" id="iptRespuestaCE${i+1}" name="iptRespuestaCE${i+1}" maxlength="500" placeholder="Respuesta ${i+1} (Español)" required="">`+
									        `<input type="text" class="form-control" id="iptRespuestaCEEn${i+1}" name="iptRespuestaCEEn${i+1}" maxlength="500" placeholder="Respuesta ${i+1} (Inglés)">`+
									        `<input type="text" class="form-control" id="iptRespuestaCEFr${i+1}" name="iptRespuestaCEFr${i+1}" maxlength="500" placeholder="Respuesta ${i+1} (Frances)">`+
						      			`</div>`);
						      			
							var resp = 0;
    						if (actividadRespuestaVO[i] != null) {
    							resp = actividadRespuestaVO[i].correcta;
						        j = i + 1;
						        $('#iptRespuestaCE' + j).val(actividadRespuestaVO[i].nombre);
						        $('#iptRespuestaCEEn' + j).val(actividadRespuestaVO[i].nombreEn);
						        $('#iptRespuestaCEFr' + j).val(actividadRespuestaVO[i].nombreFr);
						
						        if (resp == 1) {
						            $('#iptRespuestaCombinacionExacta' + j).prop('checked', true);
						        }
    
						    }  			
					    }
					    $('#respuestasCombinacionExacta').append(`<div class="col-md-12"></br></div>`);
					    

						$('#iptIdPreguntaCombinacionExacta').val(actividadPreguntaVO.id);
						$('#iptPreguntaCombinacionExactaNombre').val(actividadPreguntaVO.nombre);
						$('#iptPreguntaCombinacionExactaNombreEn').val(actividadPreguntaVO.nombreEn);
						$('#iptPreguntaCombinacionExactaNombreFr').val(actividadPreguntaVO.nombreFr);
						$('#iptPreguntaCombinacionExactaPonderacion').val(actividadPreguntaVO.ponderacion);
						$('#selectPreguntaCombinacionExactaEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewCombinacionExacta').modal({backdrop: 'static', keyboard: false});
						
						break;
						
					case 9:
						// PREGUNTA IMAGEN UNICA
						
						resetElement("hTitleImagenUnicaEditar");
						removeElement("hTitleImagenUnicaNueva");
						
						$('#formPreguntaImagenUnica').parsley().reset();
						cleanPregunta();
						$("#btnCancelImagenUnica").off("click").click(function() {
							closeImagenUnica();
				        });
						
						$("#btnRespuestaImagenUnicaG").prop('disabled', true);
						$("#selectPreguntaImagenUnicaGenerar").prop('disabled', true);
						var actividadRespuestaVOLen = actividadRespuestaVO.length;
						$('#selectPreguntaImagenUnicaGenerar').val(actividadRespuestaVOLen);

						
						$("#respuestasImagenUnica").empty();
						for (var i = 0; i < actividadRespuestaVOLen; i++) {
						
							$('#respuestasImagenUnica')
						       	.append(`<div class="input-group">`+
							        `<span class="input-group-addon">`+
					                     `<input type="radio" name="iptRespuestaImagenUnica" id="iptRespuestaImagenUnica${i+1}" value="${i+1}">`+
					                `</span>`+
					                `<br>`+
					                `<input type="file" id="iptPreguntaImagenUnicaFile${i+1}" name="iptPreguntaImagenUnicaFile${i+1}" accept=".jpg, .png" onchange="inUploadChange(this)">`+
					
					                `<div class="row" style="display:none">`+
					                    `<input type="file" id="iptPreguntaImagenUnicaFileReferencia${i+1}" name="iptPreguntaImagenUnicaFileReferencia${i+1}">`+
					                `</div>`+
					                `<div id="preguntaImagenUnicaRowDownload${i+1}" style="display:none">`+
					                    `<div>`+
					                        `<div class="form-group"> `+
					                            `<button onclick="downloadFileRes( $('#iptIdRespuestaImagenUnica${i+1}').val() ); return false;" >Descargar ${i+1}</button>`+
					                        `</div>`+
					                    `</div>`+
					                `</div>`+
				      			`</div>`);	
						        
					        var resp = 0;
					        if (actividadRespuestaVO[i] != null) {
					        	resp = actividadRespuestaVO[i].correcta;
					        	
					        	j = i + 1;
					        	resetElement("preguntaImagenUnicaRowDownload"+j);
					        	
					        	if (resp == 1) {
						            $('#iptRespuestaImagenUnica' + j).prop('checked', true);
						        }
					        
					        	$('#iptIdRespuestaImagenUnica' + j).val(actividadRespuestaVO[i].id);
					        }

						}
						$('#respuestasImagenUnica').append(`<div class="col-md-12"></br></div>`);

						$('#iptIdPreguntaImagenUnica').val(actividadPreguntaVO.id);
						$('#iptPreguntaImagenUnicaNombre').val(actividadPreguntaVO.nombre);
						$('#iptPreguntaImagenUnicaNombreEn').val(actividadPreguntaVO.nombreEn);
						$('#iptPreguntaImagenUnicaNombreFr').val(actividadPreguntaVO.nombreFr);
						$('#iptPreguntaImagenUnicaPonderacion').val(actividadPreguntaVO.ponderacion);
						$('#selectPreguntaImagenUnicaEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewImagenUnica').modal({backdrop: 'static', keyboard: false});
						
						break;
						
					case 10:
						// PREGUNTA ARRASTRABLE
						
						resetElement("hTitleArrastrableEditar");
						removeElement("hTitleArrastrableNueva");
						
						$('#formPreguntaArrastrable').parsley().reset();
						cleanPregunta();
						$("#btnCancelArrastrable").off("click").click(function() {
							closeArrastrable();
				        });
				        
				        $("#btnRespuestaArrastrableG").prop('disabled', true);
						$("#selectPreguntaArrastrableGenerar").prop('disabled', true);
						var actividadRespuestaVOLen = actividadRespuestaVO.length;
						$('#selectPreguntaArrastrableGenerar').val(actividadRespuestaVOLen);
						
						$("#respuestasArrastrable").empty();
						
						$('#respuestasArrastrable')
					      	.append(`<div class="col-md-10">`+
					      				`<div class="form-group">`+
					      					`<label for="iptRespuestaArrastrableNombre">Palabra</label>`+
					      				`</div>`+
					      		    `</div>`+
					      		    `<div class="col-md-2">`+
					  		    		`<div class="form-group">`+
					  		    			`<label for="iptPonderacionArrastrableNombre">Pond.</label>`+
					  		    		`</div>`+
					  		    	`</div>`);
						
						
					    for (var i = 0; i < actividadRespuestaVOLen; i++) {
					      	$('#respuestasArrastrable')
						      	.append(`<div class="col-md-10">`+
						      				`<div class="input-group">`+
						      					`<span class="input-group-addon">${i+1}</span>`+  				
								        		`<input type="text" class="form-control" id="iptRespuestaA${i+1}" name="iptRespuestaA${i+1}" maxlength="50" placeholder="Palabra ${i+1} (Español)" required="">`+
								        		`<input type="text" class="form-control" id="iptRespuestaAEn${i+1}" name="iptRespuestaAEn${i+1}" maxlength="50" placeholder="Palabra ${i+1} (Inglés)">`+
								        		`<input type="text" class="form-control" id="iptRespuestaAFr${i+1}" name="iptRespuestaAFr${i+1}" maxlength="50" placeholder="Palabra ${i+1} (Frances)">`+
						      				`</div>`+
						      			`</div>`+
						      			`<div class="col-md-2">`+
						      				`<div class="input-group">`+
						      					`<input type="number" class="form-control" id="iptPonderacionA${i+1}" name="iptPonderacionA${i+1}" value="0" min="0" max="100" step="0.01" data-parsley-range-message="Este valor debe estar entre 0 y 100" onKeyDown="" required="" >`+
						      				`</div>`+
						      			`</div>`);
						    if (actividadRespuestaVO[i] != null) {
								j = i + 1;
							    $('#iptRespuestaA' + j).val(actividadRespuestaVO[i].nombre);
							    $('#iptRespuestaAEn' + j).val(actividadRespuestaVO[i].nombreEn);
							    $('#iptRespuestaAFr' + j).val(actividadRespuestaVO[i].nombreFr);
							    $('#iptPonderacionA' + j).val(actividadRespuestaVO[i].ponderacion);
							}
					    }						

						$('#respuestasArrastrable').append(`<div class="col-md-12"></br></div>`);

						$('#iptIdPreguntaArrastrable').val(actividadPreguntaVO.id);
						$('#iptPreguntaArrastrableNombre').val(actividadPreguntaVO.nombre);
						$('#iptPreguntaArrastrableNombreEn').val(actividadPreguntaVO.nombreEn);
						$('#iptPreguntaArrastrableNombreFr').val(actividadPreguntaVO.nombreFr);
						$('#iptPreguntaArrastrablePonderacion').val(actividadPreguntaVO.ponderacion);
						$('#selectPreguntaArrastrableEstatus').val(actividadPreguntaVO.banActivo);
						$('#modalNewArrastrable').modal({backdrop: 'static', keyboard: false});
						
						break;
						
					default:
						  alert('Error alert');
				}
			} else {	
				displayErrorMessageByObjectId('',msg,'formPregunta');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formPregunta');
		}
	});
	
}







editPreguntaAnterior = function(idPregunta, idTipoActividad) {
	
	// Resetea validadores
	$('#formPregunta').parsley().reset();
	
	var urltxt = ctx + '/lms/actividad/consultaPregunta?id='+idPregunta;

	$('#selectPreguntaTipo').prop('disabled', 'disabled');
	$('#modalNewPregunta').modal({backdrop: 'static', keyboard: false});
	$('#iptIdPregunta').val(idPregunta);
	
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
				
				var actividadPreguntaVO = response[1];
				
				resetElement("hTitlePreguntaEditar");
				removeElement("hTitlePreguntaNueva");
				if(idTipoActividad != 5 && actividadPreguntaVO.imagen != null){
					resetElement("preguntaRowDownload");
				}
				
				cleanPregunta();

				$('#iptIdPregunta').val(actividadPreguntaVO.id);
				$('#iptPreguntaNombre').val(actividadPreguntaVO.nombre);
				$('#iptPreguntaPonderacion').val(actividadPreguntaVO.ponderacion);
				$('#selectPreguntaTipo').val(actividadPreguntaVO.idTipoPregunta);
				$('#selectPreguntaEstatus').val(actividadPreguntaVO.banActivo);
				
			} else {						
				displayErrorMessageByObjectId('',msg,'formPregunta');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formPregunta');
		}
	});
}













savePregunta = function(obj, idCurso, idActividad) {
	validacionData = true;

	if (!notNull($("#iptPreguntaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaTipo"))) {
		validacionData = false;
	}
	if (!notNull($("#selectPreguntaEstatus"))) {
		validacionData = false;
	}
	
	
	if (validacionData) {

		var urltxt = ctx + '/lms/actividad/savePregunta';
		

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formPregunta")),
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
				if (result) {				
					window.location = ctx + '/lms/actividad?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formPregunta');
				} else {
					displayErrorMessageByObjectId('',msg,'formPregunta');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formPregunta');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formPregunta');
	}
	
}


orderArribaPregunta = function(idC, idA, idP) {

	var urltxt = ctx + '/lms/actividad/changeOrdenArribaPregunta?idA='+idA+'&idP='+idP;
	
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
				window.location = ctx+'/lms/actividad?idCurso='+idC+'&idActividad='+idA;
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


orderAbajoPregunta = function(idC, idA, idP) {

	var urltxt = ctx + '/lms/actividad/changeOrdenAbajoPregunta?idA='+idA+'&idP='+idP;
	
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
				window.location = ctx+'/lms/actividad?idCurso='+idC+'&idActividad='+idA;
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


estatusPregunta = function(idCurso, idActividad, idPregunta) {
	$("#iptEstatusCursoId").val(idCurso);
	$("#iptEstatusActividadId").val(idActividad);
	$("#iptEstatusPreguntaId").val(idPregunta);
	$('#modalEstatusPregunta').modal({backdrop: 'static', keyboard: false});
}


estatusPreguntaConfirmacion = function() {
	
	var idCurso = $('#iptEstatusCursoId').val();
	var idActividad = $('#iptEstatusActividadId').val();
	var idPregunta = $('#iptEstatusPreguntaId').val();
	
	var urltxt = ctx + '/lms/actividad/changeEstatusPregunta?id='+idPregunta;
	
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
			
			$('#modalEstatusPregunta').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx+'/lms/actividad?idCurso='+idCurso+'&idActividad='+idActividad;
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





function getRespuesta(idCurso, idActividad, idPregunta){
	window.location = ctx+'/lms/pregunta?idCurso='+idCurso+'&idActividad='+idActividad+'&idPregunta='+idPregunta;
}

function cleanPregunta(){
	
	//Clean data
	$('#iptIdPreguntaAbierta').val('');
	$('#iptPreguntaAbiertaNombre').val('');
	$('#iptPreguntaAbiertaNombreEn').val('');
	$('#iptPreguntaAbiertaNombreFr').val('');
	$('#iptPreguntaAbiertaPonderacion').val('0');
	$('#iptPreguntaAbiertaActualFile').text('');
	$('#iptPreguntaAbiertaFile').val('');
	$('#selectPreguntaAbiertaEstatus').val('');
	
	
	
	$('#iptIdPreguntaVerdaderoFalso').val('');
	$('#iptPreguntaVerdaderoFalsoNombre').val('');
	$('#iptPreguntaVerdaderoFalsoNombreEn').val('');
	$('#iptPreguntaVerdaderoFalsoNombreFr').val('');
	$('#iptPreguntaVerdaderoFalsoPonderacion').val('0');
	$('#iptPreguntaVerdaderoFalsoActualFile').text('');
	$('#iptPreguntaVerdaderoFalsoFile').val('');
	$('#selectPreguntaVerdaderoFalsoEstatus').val('');
	$('#iptRespuestaVerdadero').prop('checked', false);
	$('#iptRespuestaVerdadero').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaFalso').prop('checked', false);
	$('#iptRespuestaFalso').iCheck({
	    radioClass: 'iradio_minimal'
	});
	
	
	
	$('#iptIdPreguntaMultipleUnica').val('');
	$('#iptPreguntaMultipleUnicaNombre').val('');
	$('#iptPreguntaMultipleUnicaNombreEn').val('');
	$('#iptPreguntaMultipleUnicaNombreFr').val('');
	$('#iptPreguntaMultipleUnicaPonderacion').val('0');
	$('#iptPreguntaMultipleUnicaActualFile').text('');
	$('#iptPreguntaMultipleUnicaFile').val('');
	$('#selectPreguntaMultipleUnicaEstatus').val('');
	$('#iptRespuestaMU1').val('');
	$('#iptRespuestaMUEn1').val('');
	$('#iptRespuestaMUFr1').val('');
	$('#iptRespuestaMU2').val('');
	$('#iptRespuestaMUEn2').val('');
	$('#iptRespuestaMUFr2').val('');
	$('#iptRespuestaMU3').val('');
	$('#iptRespuestaMUEn3').val('');
	$('#iptRespuestaMUFr3').val('');
	$('#iptRespuestaMU4').val('');
	$('#iptRespuestaMUEn4').val('');
	$('#iptRespuestaMUFr4').val('');
	$('#iptRespuestaMU5').val('');
	$('#iptRespuestaMUEn5').val('');
	$('#iptRespuestaMUFr5').val('');
	$('#iptRespuestaMU6').val('');
	$('#iptRespuestaMUEn6').val('');
	$('#iptRespuestaMUFr6').val('');
	$('#iptRespuestaMU7').val('');
	$('#iptRespuestaMUEn7').val('');
	$('#iptRespuestaMUFr7').val('');
	$('#iptRespuestaMU8').val('');
	$('#iptRespuestaMUEn8').val('');
	$('#iptRespuestaMUFr8').val('');
	$('#iptRespuestaMU9').val('');
	$('#iptRespuestaMUEn9').val('');
	$('#iptRespuestaMUFr9').val('');
	$('#iptRespuestaMU10').val('');
	$('#iptRespuestaMUEn10').val('');
	$('#iptRespuestaMUFr10').val('');
	$('#iptRespuestaMU11').val('');
	$('#iptRespuestaMUEn11').val('');
	$('#iptRespuestaMUFr11').val('');
	$('#iptRespuestaMU12').val('');
	$('#iptRespuestaMUEn12').val('');
	$('#iptRespuestaMUFr12').val('');
	$('#iptRespuestaMU13').val('');
	$('#iptRespuestaMUEn13').val('');
	$('#iptRespuestaMUFr13').val('');
	$('#iptRespuestaMU14').val('');
	$('#iptRespuestaMUEn14').val('');
	$('#iptRespuestaMUFr14').val('');
	$('#iptRespuestaMU15').val('');
	$('#iptRespuestaMUEn15').val('');
	$('#iptRespuestaMUFr15').val('');
	$('#iptRespuestaMU16').val('');
	$('#iptRespuestaMUEn16').val('');
	$('#iptRespuestaMUFr16').val('');
	$('#iptRespuestaMU17').val('');
	$('#iptRespuestaMUEn17').val('');
	$('#iptRespuestaMUFr17').val('');
	$('#iptRespuestaMU18').val('');
	$('#iptRespuestaMUEn18').val('');
	$('#iptRespuestaMUFr18').val('');
	$('#iptRespuestaMU19').val('');
	$('#iptRespuestaMUEn19').val('');
	$('#iptRespuestaMUFr19').val('');
	$('#iptRespuestaMU20').val('');
	$('#iptRespuestaMUEn20').val('');
	$('#iptRespuestaMUFr20').val('');
	$('#iptRespuestaMultipleUnica1').prop('checked', false);
	$('#iptRespuestaMultipleUnica1').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica2').prop('checked', false);
	$('#iptRespuestaMultipleUnica2').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica3').prop('checked', false);
	$('#iptRespuestaMultipleUnica3').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica4').prop('checked', false);
	$('#iptRespuestaMultipleUnica4').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica5').prop('checked', false);
	$('#iptRespuestaMultipleUnica5').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica6').prop('checked', false);
	$('#iptRespuestaMultipleUnica6').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica7').prop('checked', false);
	$('#iptRespuestaMultipleUnica7').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica8').prop('checked', false);
	$('#iptRespuestaMultipleUnica8').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica9').prop('checked', false);
	$('#iptRespuestaMultipleUnica9').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica10').prop('checked', false);
	$('#iptRespuestaMultipleUnica10').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica11').prop('checked', false);
	$('#iptRespuestaMultipleUnica11').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica12').prop('checked', false);
	$('#iptRespuestaMultipleUnica12').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica13').prop('checked', false);
	$('#iptRespuestaMultipleUnica13').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica14').prop('checked', false);
	$('#iptRespuestaMultipleUnica14').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica15').prop('checked', false);
	$('#iptRespuestaMultipleUnica15').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica16').prop('checked', false);
	$('#iptRespuestaMultipleUnica16').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica17').prop('checked', false);
	$('#iptRespuestaMultipleUnica17').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica18').prop('checked', false);
	$('#iptRespuestaMultipleUnica18').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica19').prop('checked', false);
	$('#iptRespuestaMultipleUnica19').iCheck({
	    radioClass: 'iradio_minimal'
	});
	$('#iptRespuestaMultipleUnica20').prop('checked', false);
	$('#iptRespuestaMultipleUnica20').iCheck({
	    radioClass: 'iradio_minimal'
	});
	
	
	$('#btnRespuestaMultipleUnicaG').prop('disabled', false);
	$("#selectPreguntaMultipleUnicaGenerar").prop('disabled', false);
	$('#selectPreguntaMultipleUnicaGenerar').val('');
	$("#respuestas").empty();
	///////
	
	
	$('#iptIdPreguntaMultipleMultiple').val('');
	$('#iptPreguntaMultipleMultipleNombre').val('');
	$('#iptPreguntaMultipleMultipleNombreEn').val('');
	$('#iptPreguntaMultipleMultipleNombreFr').val('');
	$('#iptPreguntaMultipleMultiplePonderacion').val('0');
	$('#iptPreguntaMultipleMultipleActualFile').text('');
	$('#iptPreguntaMultipleMultipleFile').val('');
	$('#selectPreguntaMultipleMultipleEstatus').val('');
	$('#iptRespuestaMM1').val('');
	$('#iptRespuestaMMEn1').val('');
	$('#iptRespuestaMMFr1').val('');
	$('#iptRespuestaMM2').val('');
	$('#iptRespuestaMMEn2').val('');
	$('#iptRespuestaMMFr2').val('');
	$('#iptRespuestaMM3').val('');
	$('#iptRespuestaMMEn3').val('');
	$('#iptRespuestaMMFr3').val('');
	$('#iptRespuestaMM4').val('');
	$('#iptRespuestaMMEn4').val('');
	$('#iptRespuestaMMFr4').val('');
	$('#iptRespuestaMM5').val('');
	$('#iptRespuestaMMEn5').val('');
	$('#iptRespuestaMMFr5').val('');
	$('#iptRespuestaMM6').val('');
	$('#iptRespuestaMMEn6').val('');
	$('#iptRespuestaMMFr6').val('');
	$('#iptRespuestaMM7').val('');
	$('#iptRespuestaMMEn7').val('');
	$('#iptRespuestaMMFr7').val('');
	$('#iptRespuestaMM8').val('');
	$('#iptRespuestaMMEn8').val('');
	$('#iptRespuestaMMFr8').val('');
	$('#iptRespuestaMM9').val('');
	$('#iptRespuestaMMEn9').val('');
	$('#iptRespuestaMMFr9').val('');
	$('#iptRespuestaMM10').val('');
	$('#iptRespuestaMMEn10').val('');
	$('#iptRespuestaMMFr10').val('');
	$('#iptRespuestaMM11').val('');
	$('#iptRespuestaMMEn11').val('');
	$('#iptRespuestaMMFr11').val('');
	$('#iptRespuestaMM12').val('');
	$('#iptRespuestaMMEn12').val('');
	$('#iptRespuestaMMFr12').val('');
	$('#iptRespuestaMM13').val('');
	$('#iptRespuestaMMEn13').val('');
	$('#iptRespuestaMMFr13').val('');
	$('#iptRespuestaMM14').val('');
	$('#iptRespuestaMMEn14').val('');
	$('#iptRespuestaMMFr14').val('');
	$('#iptRespuestaMM15').val('');
	$('#iptRespuestaMMEn15').val('');
	$('#iptRespuestaMMFr15').val('');
	$('#iptRespuestaMM16').val('');
	$('#iptRespuestaMMEn16').val('');
	$('#iptRespuestaMMFr16').val('');
	$('#iptRespuestaMM17').val('');
	$('#iptRespuestaMMEn17').val('');
	$('#iptRespuestaMMFr17').val('');
	$('#iptRespuestaMM18').val('');
	$('#iptRespuestaMMEn18').val('');
	$('#iptRespuestaMMFr18').val('');
	$('#iptRespuestaMM19').val('');
	$('#iptRespuestaMMEn19').val('');
	$('#iptRespuestaMMFr19').val('');
	$('#iptRespuestaMM20').val('');
	$('#iptRespuestaMMEn20').val('');
	$('#iptRespuestaMMFr20').val('');
	
	$('#iptRespuestaMultipleMultiple1').prop('checked', false);
	$('#iptRespuestaMultipleMultiple1').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple2').prop('checked', false);
	$('#iptRespuestaMultipleMultiple2').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple3').prop('checked', false);
	$('#iptRespuestaMultipleMultiple3').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple4').prop('checked', false);
	$('#iptRespuestaMultipleMultiple4').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple5').prop('checked', false);
	$('#iptRespuestaMultipleMultiple5').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple6').prop('checked', false);
	$('#iptRespuestaMultipleMultiple6').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple7').prop('checked', false);
	$('#iptRespuestaMultipleMultiple7').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple8').prop('checked', false);
	$('#iptRespuestaMultipleMultiple8').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple9').prop('checked', false);
	$('#iptRespuestaMultipleMultiple9').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple10').prop('checked', false);
	$('#iptRespuestaMultipleMultiple10').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple11').prop('checked', false);
	$('#iptRespuestaMultipleMultiple11').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple12').prop('checked', false);
	$('#iptRespuestaMultipleMultiple12').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple13').prop('checked', false);
	$('#iptRespuestaMultipleMultiple13').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple14').prop('checked', false);
	$('#iptRespuestaMultipleMultiple14').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple15').prop('checked', false);
	$('#iptRespuestaMultipleMultiple15').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple16').prop('checked', false);
	$('#iptRespuestaMultipleMultiple16').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple17').prop('checked', false);
	$('#iptRespuestaMultipleMultiple17').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple18').prop('checked', false);
	$('#iptRespuestaMultipleMultiple18').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple19').prop('checked', false);
	$('#iptRespuestaMultipleMultiple19').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaMultipleMultiple20').prop('checked', false);
	$('#iptRespuestaMultipleMultiple20').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptPonderacionMM1').val('0');
	$('#iptPonderacionMM2').val('0');
	$('#iptPonderacionMM3').val('0');
	$('#iptPonderacionMM4').val('0');
	$('#iptPonderacionMM5').val('0');
	$('#iptPonderacionMM6').val('0');
	$('#iptPonderacionMM7').val('0');
	$('#iptPonderacionMM8').val('0');
	$('#iptPonderacionMM9').val('0');
	$('#iptPonderacionMM10').val('0');
	$('#iptPonderacionMM11').val('0');
	$('#iptPonderacionMM12').val('0');
	$('#iptPonderacionMM13').val('0');
	$('#iptPonderacionMM14').val('0');
	$('#iptPonderacionMM15').val('0');
	$('#iptPonderacionMM16').val('0');
	$('#iptPonderacionMM17').val('0');
	$('#iptPonderacionMM18').val('0');
	$('#iptPonderacionMM19').val('0');
	$('#iptPonderacionMM20').val('0');
	
	
	$('#btnRespuestaMultipleMultipleG').prop('disabled', false);
	$("#selectPreguntaMultipleMultipleGenerar").prop('disabled', false);
	$('#selectPreguntaMultipleMultipleGenerar').val('');
	$("#respuestasMultiple").empty();
	///////
	
	
	$('#iptIdPreguntaRelacionColumnas').val('');
	$('#iptPreguntaRelacionColumnasNombre').val('');
	$('#iptPreguntaRelacionColumnasNombreEn').val('');
	$('#iptPreguntaRelacionColumnasNombreFr').val('');
	$('#iptPreguntaRelacionColumnasPonderacion').val('0');
	$('#iptPreguntaRelacionColumnasActualFile').text('');
	$('#iptPreguntaRelacionColumnasFile').val('');
	$('#selectPreguntaRelacionColumnasEstatus').val('');
	
	$('#iptRespuestaRCA1').val('');
	$('#iptRespuestaRCAEn1').val('');
	$('#iptRespuestaRCAFr1').val('');
	$('#iptRespuestaRCA2').val('');
	$('#iptRespuestaRCAEn2').val('');
	$('#iptRespuestaRCAFr2').val('');
	$('#iptRespuestaRCA3').val('');
	$('#iptRespuestaRCAEn3').val('');
	$('#iptRespuestaRCAFr3').val('');
	$('#iptRespuestaRCA4').val('');
	$('#iptRespuestaRCAEn4').val('');
	$('#iptRespuestaRCAFr4').val('');
	$('#iptRespuestaRCA5').val('');
	$('#iptRespuestaRCAEn5').val('');
	$('#iptRespuestaRCAFr5').val('');
	$('#iptRespuestaRCA6').val('');
	$('#iptRespuestaRCAEn6').val('');
	$('#iptRespuestaRCAFr6').val('');
	$('#iptRespuestaRCA7').val('');
	$('#iptRespuestaRCAEn7').val('');
	$('#iptRespuestaRCAFr7').val('');
	$('#iptRespuestaRCA8').val('');
	$('#iptRespuestaRCAEn8').val('');
	$('#iptRespuestaRCAFr8').val('');
	$('#iptRespuestaRCA9').val('');
	$('#iptRespuestaRCAEn9').val('');
	$('#iptRespuestaRCAFr9').val('');
	$('#iptRespuestaRCA10').val('');
	$('#iptRespuestaRCAEn10').val('');
	$('#iptRespuestaRCAFr10').val('');
	$('#iptRespuestaRCA11').val('');
	$('#iptRespuestaRCAEn11').val('');
	$('#iptRespuestaRCAFr11').val('');
	$('#iptRespuestaRCA12').val('');
	$('#iptRespuestaRCAEn12').val('');
	$('#iptRespuestaRCAFr12').val('');
	$('#iptRespuestaRCA13').val('');
	$('#iptRespuestaRCAEn13').val('');
	$('#iptRespuestaRCAFr13').val('');
	$('#iptRespuestaRCA14').val('');
	$('#iptRespuestaRCAEn14').val('');
	$('#iptRespuestaRCAFr14').val('');
	$('#iptRespuestaRCA15').val('');
	$('#iptRespuestaRCAEn15').val('');
	$('#iptRespuestaRCAFr15').val('');
	$('#iptRespuestaRCA16').val('');
	$('#iptRespuestaRCAEn16').val('');
	$('#iptRespuestaRCAFr16').val('');
	$('#iptRespuestaRCA17').val('');
	$('#iptRespuestaRCAEn17').val('');
	$('#iptRespuestaRCAFr17').val('');
	$('#iptRespuestaRCA18').val('');
	$('#iptRespuestaRCAEn18').val('');
	$('#iptRespuestaRCAFr18').val('');
	$('#iptRespuestaRCA19').val('');
	$('#iptRespuestaRCAEn19').val('');
	$('#iptRespuestaRCAFr19').val('');
	$('#iptRespuestaRCA20').val('');
	$('#iptRespuestaRCAEn20').val('');
	$('#iptRespuestaRCAFr20').val('');
	
	$('#iptRespuestaRCB1').val('');
	$('#iptRespuestaRCBEn1').val('');
	$('#iptRespuestaRCBFr1').val('');
	$('#iptRespuestaRCB2').val('');
	$('#iptRespuestaRCBEn2').val('');
	$('#iptRespuestaRCBFr2').val('');
	$('#iptRespuestaRCB3').val('');
	$('#iptRespuestaRCBEn3').val('');
	$('#iptRespuestaRCBFr3').val('');
	$('#iptRespuestaRCB4').val('');
	$('#iptRespuestaRCBEn4').val('');
	$('#iptRespuestaRCBFr4').val('');
	$('#iptRespuestaRCB5').val('');
	$('#iptRespuestaRCBEn5').val('');
	$('#iptRespuestaRCBFr5').val('');
	$('#iptRespuestaRCB6').val('');
	$('#iptRespuestaRCBEn6').val('');
	$('#iptRespuestaRCBFr6').val('');
	$('#iptRespuestaRCB7').val('');
	$('#iptRespuestaRCBEn7').val('');
	$('#iptRespuestaRCBFr7').val('');
	$('#iptRespuestaRCB8').val('');
	$('#iptRespuestaRCBEn8').val('');
	$('#iptRespuestaRCBFr8').val('');
	$('#iptRespuestaRCB9').val('');
	$('#iptRespuestaRCBEn9').val('');
	$('#iptRespuestaRCBFr9').val('');
	$('#iptRespuestaRCB10').val('');
	$('#iptRespuestaRCBEn10').val('');
	$('#iptRespuestaRCBFr10').val('');
	$('#iptRespuestaRCB11').val('');
	$('#iptRespuestaRCBEn11').val('');
	$('#iptRespuestaRCBFr11').val('');
	$('#iptRespuestaRCB12').val('');
	$('#iptRespuestaRCBEn12').val('');
	$('#iptRespuestaRCBFr12').val('');
	$('#iptRespuestaRCB13').val('');
	$('#iptRespuestaRCBEn13').val('');
	$('#iptRespuestaRCBFr13').val('');
	$('#iptRespuestaRCB14').val('');
	$('#iptRespuestaRCBEn14').val('');
	$('#iptRespuestaRCBFr14').val('');
	$('#iptRespuestaRCB15').val('');
	$('#iptRespuestaRCBEn15').val('');
	$('#iptRespuestaRCBFr15').val('');
	$('#iptRespuestaRCB16').val('');
	$('#iptRespuestaRCBEn16').val('');
	$('#iptRespuestaRCBFr16').val('');
	$('#iptRespuestaRCB17').val('');
	$('#iptRespuestaRCBEn17').val('');
	$('#iptRespuestaRCBFr17').val('');
	$('#iptRespuestaRCB18').val('');
	$('#iptRespuestaRCBEn18').val('');
	$('#iptRespuestaRCBFr18').val('');
	$('#iptRespuestaRCB19').val('');
	$('#iptRespuestaRCBEn19').val('');
	$('#iptRespuestaRCBFr19').val('');
	$('#iptRespuestaRCB20').val('');
	$('#iptRespuestaRCBEn20').val('');
	$('#iptRespuestaRCBFr20').val('');
	
	$('#iptPonderacionRC1').val('0');
	$('#iptPonderacionRC2').val('0');
	$('#iptPonderacionRC3').val('0');
	$('#iptPonderacionRC4').val('0');
	$('#iptPonderacionRC5').val('0');
	$('#iptPonderacionRC6').val('0');
	$('#iptPonderacionRC7').val('0');
	$('#iptPonderacionRC8').val('0');
	$('#iptPonderacionRC9').val('0');
	$('#iptPonderacionRC10').val('0');
	$('#iptPonderacionRC11').val('0');
	$('#iptPonderacionRC12').val('0');
	$('#iptPonderacionRC13').val('0');
	$('#iptPonderacionRC14').val('0');
	$('#iptPonderacionRC15').val('0');
	$('#iptPonderacionRC16').val('0');
	$('#iptPonderacionRC17').val('0');
	$('#iptPonderacionRC18').val('0');
	$('#iptPonderacionRC19').val('0');
	$('#iptPonderacionRC20').val('0');
	
	$('#btnRespuestaRelacionColumnasG').prop('disabled', false);
	$("#selectPreguntaRelacionColumnasGenerar").prop('disabled', false);
	$('#selectPreguntaRelacionColumnasGenerar').val('');
	$("#respuestasRelacionColumnas").empty();
	///////
	
	
	
	$('#iptIdPreguntaRellenarBlancos').val('');
	$('#iptPreguntaRellenarBlancosNombre').val('');
	$('#iptPreguntaRellenarBlancosNombreEn').val('');
	$('#iptPreguntaRellenarBlancosNombreFr').val('');
	$('#iptPreguntaRellenarBlancosPonderacion').val('0');
	$('#iptPreguntaRellenarBlancosActualFile').text('');
	$('#iptPreguntaRellenarBlancosFile').val('');
	$('#selectPreguntaRellenarBlancosEstatus').val('');
	$('#iptRespuestaRB1').val('');
	$('#iptRespuestaRBEn1').val('');
	$('#iptRespuestaRBFr1').val('');
	$('#iptRespuestaRB2').val('');
	$('#iptRespuestaRBEn2').val('');
	$('#iptRespuestaRBFr2').val('');
	$('#iptRespuestaRB3').val('');
	$('#iptRespuestaRBEn3').val('');
	$('#iptRespuestaRBFr3').val('');
	$('#iptRespuestaRB4').val('');
	$('#iptRespuestaRBEn4').val('');
	$('#iptRespuestaRBFr4').val('');
	$('#iptRespuestaRB5').val('');
	$('#iptRespuestaRBEn5').val('');
	$('#iptRespuestaRBFr5').val('');
	$('#iptRespuestaRB6').val('');
	$('#iptRespuestaRBEn6').val('');
	$('#iptRespuestaRBFr6').val('');
	$('#iptRespuestaRB7').val('');
	$('#iptRespuestaRBEn7').val('');
	$('#iptRespuestaRBFr7').val('');
	$('#iptRespuestaRB8').val('');
	$('#iptRespuestaRBEn8').val('');
	$('#iptRespuestaRBFr8').val('');
	$('#iptRespuestaRB9').val('');
	$('#iptRespuestaRBEn9').val('');
	$('#iptRespuestaRBFr9').val('');
	$('#iptRespuestaRB10').val('');
	$('#iptRespuestaRBEn10').val('');
	$('#iptRespuestaRBFr10').val('');
	$('#iptRespuestaRB11').val('');
	$('#iptRespuestaRBEn11').val('');
	$('#iptRespuestaRBFr11').val('');
	$('#iptRespuestaRB12').val('');
	$('#iptRespuestaRBEn12').val('');
	$('#iptRespuestaRBFr12').val('');
	$('#iptRespuestaRB13').val('');
	$('#iptRespuestaRBEn13').val('');
	$('#iptRespuestaRBFr13').val('');
	$('#iptRespuestaRB14').val('');
	$('#iptRespuestaRBEn14').val('');
	$('#iptRespuestaRBFr14').val('');
	$('#iptRespuestaRB15').val('');
	$('#iptRespuestaRBEn15').val('');
	$('#iptRespuestaRBFr15').val('');
	$('#iptRespuestaRB16').val('');
	$('#iptRespuestaRBEn16').val('');
	$('#iptRespuestaRBFr16').val('');
	$('#iptRespuestaRB17').val('');
	$('#iptRespuestaRBEn17').val('');
	$('#iptRespuestaRBFr17').val('');
	$('#iptRespuestaRB18').val('');
	$('#iptRespuestaRBEn18').val('');
	$('#iptRespuestaRBFr18').val('');
	$('#iptRespuestaRB19').val('');
	$('#iptRespuestaRBEn19').val('');
	$('#iptRespuestaRBFr19').val('');
	$('#iptRespuestaRB20').val('');
	$('#iptRespuestaRBEn20').val('');
	$('#iptRespuestaRBFr20').val('');
	
	///////
	
	
	$('#iptIdPreguntaCombinacionExacta').val('');
	$('#iptPreguntaCombinacionExactaNombre').val('');
	$('#iptPreguntaCombinacionExactaNombreEn').val('');
	$('#iptPreguntaCombinacionExactaNombreFr').val('');
	$('#iptPreguntaCombinacionExactaPonderacion').val('0');
	$('#iptPreguntaCombinacionExactaActualFile').text('');
	$('#iptPreguntaCombinacionExactaFile').val('');
	$('#selectPreguntaCombinacionExactaEstatus').val('');
	$('#iptRespuestaCE1').val('');
	$('#iptRespuestaCEEn1').val('');
	$('#iptRespuestaCEFr1').val('');
	$('#iptRespuestaCE2').val('');
	$('#iptRespuestaCEEn2').val('');
	$('#iptRespuestaCEFr2').val('');
	$('#iptRespuestaCE3').val('');
	$('#iptRespuestaCEEn3').val('');
	$('#iptRespuestaCEFr3').val('');
	$('#iptRespuestaCE4').val('');
	$('#iptRespuestaCEEn4').val('');
	$('#iptRespuestaCEFr4').val('');
	$('#iptRespuestaCE5').val('');
	$('#iptRespuestaCEEn5').val('');
	$('#iptRespuestaCEFr5').val('');
	$('#iptRespuestaCE6').val('');
	$('#iptRespuestaCEEn6').val('');
	$('#iptRespuestaCEFr6').val('');
	$('#iptRespuestaCE7').val('');
	$('#iptRespuestaCEEn7').val('');
	$('#iptRespuestaCEFr7').val('');
	$('#iptRespuestaCE8').val('');
	$('#iptRespuestaCEEn8').val('');
	$('#iptRespuestaCEFr8').val('');
	$('#iptRespuestaCE9').val('');
	$('#iptRespuestaCEEn9').val('');
	$('#iptRespuestaCEFr9').val('');
	$('#iptRespuestaCE10').val('');
	$('#iptRespuestaCEEn10').val('');
	$('#iptRespuestaCEFr10').val('');
	$('#iptRespuestaCE11').val('');
	$('#iptRespuestaCEEn11').val('');
	$('#iptRespuestaCEFr11').val('');
	$('#iptRespuestaCE12').val('');
	$('#iptRespuestaCEEn12').val('');
	$('#iptRespuestaCEFr12').val('');
	$('#iptRespuestaCE13').val('');
	$('#iptRespuestaCEEn13').val('');
	$('#iptRespuestaCEFr13').val('');
	$('#iptRespuestaCE14').val('');
	$('#iptRespuestaCEEn14').val('');
	$('#iptRespuestaCEFr14').val('');
	$('#iptRespuestaCE15').val('');
	$('#iptRespuestaCEEn15').val('');
	$('#iptRespuestaCEFr15').val('');
	$('#iptRespuestaCE16').val('');
	$('#iptRespuestaCEEn16').val('');
	$('#iptRespuestaCEFr16').val('');
	$('#iptRespuestaCE17').val('');
	$('#iptRespuestaCEEn17').val('');
	$('#iptRespuestaCEFr17').val('');
	$('#iptRespuestaCE18').val('');
	$('#iptRespuestaCEEn18').val('');
	$('#iptRespuestaCEFr18').val('');
	$('#iptRespuestaCE19').val('');
	$('#iptRespuestaCEEn19').val('');
	$('#iptRespuestaCEFr19').val('');
	$('#iptRespuestaCE20').val('');
	$('#iptRespuestaCEEn20').val('');
	$('#iptRespuestaCEFr20').val('');
	
	$('#iptRespuestaCombinacionExacta1').prop('checked', false);
	$('#iptRespuestaCombinacionExacta1').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta2').prop('checked', false);
	$('#iptRespuestaCombinacionExacta2').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta3').prop('checked', false);
	$('#iptRespuestaCombinacionExacta3').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta4').prop('checked', false);
	$('#iptRespuestaCombinacionExacta4').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta5').prop('checked', false);
	$('#iptRespuestaCombinacionExacta5').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta6').prop('checked', false);
	$('#iptRespuestaCombinacionExacta6').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta7').prop('checked', false);
	$('#iptRespuestaCombinacionExacta7').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta8').prop('checked', false);
	$('#iptRespuestaCombinacionExacta8').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta9').prop('checked', false);
	$('#iptRespuestaCombinacionExacta9').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta10').prop('checked', false);
	$('#iptRespuestaCombinacionExacta10').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta11').prop('checked', false);
	$('#iptRespuestaCombinacionExacta11').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta12').prop('checked', false);
	$('#iptRespuestaCombinacionExacta12').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta13').prop('checked', false);
	$('#iptRespuestaCombinacionExacta13').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta14').prop('checked', false);
	$('#iptRespuestaCombinacionExacta14').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta15').prop('checked', false);
	$('#iptRespuestaCombinacionExacta15').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta16').prop('checked', false);
	$('#iptRespuestaCombinacionExacta16').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta17').prop('checked', false);
	$('#iptRespuestaCombinacionExacta17').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta18').prop('checked', false);
	$('#iptRespuestaCombinacionExacta18').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta19').prop('checked', false);
	$('#iptRespuestaCombinacionExacta19').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	$('#iptRespuestaCombinacionExacta20').prop('checked', false);
	$('#iptRespuestaCombinacionExacta20').iCheck({
		checkboxClass: 'icheckbox_minimal checked'
	});
	
	$('#btnRespuestaCombinacionExactaG').prop('disabled', false);
	$("#selectPreguntaCombinacionExactaGenerar").prop('disabled', false);
	$('#selectPreguntaCombinacionExactaGenerar').val('');
	$("#respuestasCombinacionExacta").empty();
	///////
	
	
	
	
	$('#iptIdPreguntaImagenUnica').val('');
	$('#iptPreguntaImagenUnicaNombre').val('');
	$('#iptPreguntaImagenUnicaNombreEn').val('');
	$('#iptPreguntaImagenUnicaNombreFr').val('');
	$('#iptPreguntaImagenUnicaPonderacion').val('0');
	$('#selectPreguntaImagenUnicaEstatus').val('');
	$('#iptPreguntaImagenUnicaFile1').val('');
	$('#iptPreguntaImagenUnicaFile2').val('');
	$('#iptPreguntaImagenUnicaFile3').val('');
	$('#iptPreguntaImagenUnicaFile4').val('');
	///////
	
	
	$('#iptIdPreguntaArrastrable').val('');
	$('#iptPreguntaArrastrableNombre').val('');
	$('#iptPreguntaArrastrableNombreEn').val('');
	$('#iptPreguntaArrastrableNombreFr').val('');
	$('#iptPreguntaArrastrablePonderacion').val('0');
	$('#selectPreguntaArrastrableEstatus').val('');
	$('#iptRespuestaA1').val('');
	$('#iptRespuestaAEn1').val('');
	$('#iptRespuestaAFr1').val('');
	$('#iptRespuestaA2').val('');
	$('#iptRespuestaAEn2').val('');
	$('#iptRespuestaAFr2').val('');
	$('#iptRespuestaA3').val('');
	$('#iptRespuestaAEn3').val('');
	$('#iptRespuestaAFr3').val('');
	$('#iptRespuestaA4').val('');
	$('#iptRespuestaAEn4').val('');
	$('#iptRespuestaAFr4').val('');
	$('#iptRespuestaA5').val('');
	$('#iptRespuestaAEn5').val('');
	$('#iptRespuestaAFr5').val('');
	$('#iptRespuestaA6').val('');
	$('#iptRespuestaAEn6').val('');
	$('#iptRespuestaAFr6').val('');
	$('#iptRespuestaA7').val('');
	$('#iptRespuestaAEn7').val('');
	$('#iptRespuestaAFr7').val('');
	$('#iptRespuestaA8').val('');
	$('#iptRespuestaAEn8').val('');
	$('#iptRespuestaAFr8').val('');
	$('#iptRespuestaA9').val('');
	$('#iptRespuestaAEn9').val('');
	$('#iptRespuestaAFr9').val('');
	$('#iptRespuestaA10').val('');
	$('#iptRespuestaAEn10').val('');
	$('#iptRespuestaAFr10').val('');
	$('#iptRespuestaA11').val('');
	$('#iptRespuestaAEn11').val('');
	$('#iptRespuestaAFr11').val('');
	$('#iptRespuestaA12').val('');
	$('#iptRespuestaAEn12').val('');
	$('#iptRespuestaAFr12').val('');
	$('#iptRespuestaA13').val('');
	$('#iptRespuestaAEn13').val('');
	$('#iptRespuestaAFr13').val('');
	$('#iptRespuestaA14').val('');
	$('#iptRespuestaAEn14').val('');
	$('#iptRespuestaAFr14').val('');
	$('#iptRespuestaA15').val('');
	$('#iptRespuestaAEn15').val('');
	$('#iptRespuestaAFr15').val('');
	$('#iptRespuestaA16').val('');
	$('#iptRespuestaAEn16').val('');
	$('#iptRespuestaAFr16').val('');
	$('#iptRespuestaA17').val('');
	$('#iptRespuestaAEn17').val('');
	$('#iptRespuestaAFr17').val('');
	$('#iptRespuestaA18').val('');
	$('#iptRespuestaAEn18').val('');
	$('#iptRespuestaAFr18').val('');
	$('#iptRespuestaA19').val('');
	$('#iptRespuestaAEn19').val('');
	$('#iptRespuestaAFr19').val('');
	$('#iptRespuestaA20').val('');
	$('#iptRespuestaAEn20').val('');
	$('#iptRespuestaAFr20').val('');
	
}











function resetElement(id) {
	document.getElementById(id).style.display = "block";
	document.getElementById(id).style.visibility = "visible";
}

function removeElement(id) {
	document.getElementById(id).style.display = "none";
}

function changeVisibility(id) {
	document.getElementById(id).style.visibility = "hidden";
}



function downloadFile(idData) {
	window.open(ctx + '/lms/actividad/downloadFile?fileId=' + idData);
}

function downloadFileRes(idData) {
	window.open(ctx + '/lms/actividad/downloadFileRes?fileId=' + idData);
}



function saveCargaPreguntasMasivas(obj, idCurso, idActividad){
	validacionData = true;
	
	if (!notNull($("#iptCargaMasivaFile"))) {
		validacionData = false;
	}
	
	if (validacionData) {
		
		var urltxt = ctx + '/lms/actividad/saveCargaPreguntasMasivas';
		
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
				if (result) {				
					window.location = ctx + '/lms/actividad?idCurso='+idCurso+'&idActividad=' + idActividad;
					displaySuccesMessageByObjectId('',msg,'formCargaMasiva');
				} else {
					displayErrorMessageByObjectId('',msg,'formCargaMasiva');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formCargaMasiva');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formCargaMasiva');
	}
}


