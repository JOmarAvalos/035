
newActividad = function() {
	// Muestra modal nueva actividad		
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
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
	window.open(ctx + '/actividad/downloadFile?fileId=' + idData);
}




newScorm = function(idCurso) {
	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadScorm').parsley().reset();
				cleanActividadScorm();
                resetElement("hTitleScormNueva");
                removeElement("hTitleScormEditar");
                removeElement("actividadScormRowDownload");
                $('#actividadScormRowDownload').hide();

				// Muestra modal nueva actividad Scorm 
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadScormRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadScormRequisitos').append(codigo);
				}

				$('#modalNewScorm').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelScorm").off("click").click(function() {
					cancelScorm();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadScorm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadScorm');
		}
	});
}
cancelScorm = function() {
	// Desaparece modal nueva actividad scorm
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewScorm').modal('hide');
}
closeScorm = function(){
	$('#modalNewScorm').modal('hide');
}


newVideo = function(idCurso) {
	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadVideo').parsley().reset();
				cleanActividadVideo();
                resetElement("hTitleVideoNuevo");
                removeElement("hTitleVideoEditar");
                removeElement("actividadVideoRowDownload");
                $('#actividadVideoRowDownload').hide();

				// Muestra modal nueva actividad Video 
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadVideoRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadVideoRequisitos').append(codigo);
				}

				$('#modalNewVideo').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelVideo").off("click").click(function() {
					cancelVideo();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadVideo');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadVideo');
		}
	});
}
cancelVideo = function() {
	// Desaparece modal nueva actividad video
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewVideo').modal('hide');
}
closeVideo = function(){
	$('#modalNewVideo').modal('hide');
}


newDocumento = function(idCurso) {
	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadDocumento').parsley().reset();
				cleanActividadDocumento();
                resetElement("iptDocumentoNuevo");
                removeElement("iptDocumentoEditar");
                removeElement("actividadDocumentoRowDownload");
                $('#actividadDocumentoRowDownload').hide();

				// Muestra modal nueva actividad Documento 
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadDocumentoRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadDocumentoRequisitos').append(codigo);
				}

				$('#modalNewDocumento').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelDocumento").off("click").click(function() {
					cancelDocumento();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadDocumento');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadDocumento');
		}
	});
}
cancelDocumento = function() {
	// Desaparece modal nueva actividad documento
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewDocumento').modal('hide');
}
closeDocumento = function(){
	$('#modalNewDocumento').modal('hide');
}


newExamen = function(idCurso) {
var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadExamen').parsley().reset();
				cleanActividadExamen();
				// Muestra modal nueva actividad Examen 
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadExamenRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadExamenRequisitos').append(codigo);
				}

				$('#modalNewExamen').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelModalExamen").off("click").click(function() {
					cancelExamen();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadExamen');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadExamen');
		}
	});
}
cancelExamen = function() {
	// Desaparece modal nueva actividad examen
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewExamen').modal('hide')
}
closeExamen = function(){
	$('#modalNewExamen').modal('hide');
}


newEncuesta = function(idCurso) {
	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadEncuesta').parsley().reset();
				cleanActividadEncuesta();

				// Muestra modal nueva actividad Encuesta 
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadEncuestaRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadEncuestaRequisitos').append(codigo);
				}

				$('#modalNewEncuesta').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelModalEncuesta").off("click").click(function() {
					cancelEncuesta();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadEncuesta');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadEncuesta');
		}
	});
}
cancelEncuesta = function() {
	// Desaparece modal nueva actividad encuesta
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewEncuesta').modal('hide');
}
closeEncuesta = function(){
	$('#modalNewEncuesta').modal('hide');
}


newConferencia = function(idCurso) {
	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadConferencia').parsley().reset();
				cleanActividadConferencia();

				// Muestra modal nueva actividad Conferencia 
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadConferenciaRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadConferenciaRequisitos').append(codigo);
				}

				$('#modalNewConferencia').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelModalConferencia").off("click").click(function() {
					cancelConferencia();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadConferencia');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadConferencia');
		}
	});
}
cancelConferencia = function() {
	// Desaparece modal nueva actividad conferencia
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewConferencia').modal('hide');
}
closeConferencia = function(){
	$('#modalNewConferencia').modal('hide');
}


newTarea = function(idCurso) {
	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadTarea').parsley().reset();
				cleanActividadTarea();

				// Muestra modal nueva actividad Tarea 
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadTareaRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadTareaRequisitos').append(codigo);
				}

				$('#modalNewTarea').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelModalTarea").off("click").click(function() {
					cancelTarea();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadTarea');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadTarea');
		}
	});
}
cancelTarea = function() {
	// Desaparece modal nueva actividad tarea
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewTarea').modal('hide');
}
closeTarea = function(){
	$('#modalNewTarea').modal('hide');
}


newAsistencia = function(idCurso) {
	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadAsistencia').parsley().reset();
				cleanActividadAsistencia();

				// Muestra modal nueva actividad Asistencia 
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadAsistenciaRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadAsistenciaRequisitos').append(codigo);
				}

				$('#modalNewAsistencia').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelModalAsistencia").off("click").click(function() {
					cancelAsistencia();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadAsistencia');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadAsistencia');
		}
	});
}
cancelAsistencia = function() {
	// Desaparece modal nueva actividad Asistencia
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewAsistencia').modal('hide');
}
closeAsistencia = function(){
	$('#modalNewAsistencia').modal('hide');
}


newExamenDiagnostico = function(idCurso) {
	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadExamenDiagnostico').parsley().reset();
				cleanActividadExamenDiagnostico();
				// Muestra modal nueva actividad Examen Diagnostico
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadExamenDiagnosticoRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadExamenDiagnosticoRequisitos').append(codigo);
				}

				$('#modalNewExamenDiagnostico').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelModalExamenDiagnostico").off("click").click(function() {
					cancelExamenDiagnostico();
				});

			} else {						
				displayErrorMessageByObjectId('','Error','formActividadExamenDiagnostico');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadExamenDiagnostico');
		}
	});
}
cancelExamenDiagnostico = function() {
	// Desaparece modal nueva actividad Examen Diagnostico
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewExamenDiagnostico').modal('hide');
}
closeExamenDiagnostico = function(){
	$('#modalNewExamenDiagnostico').modal('hide');
}


newExamenEcop = function(idCurso) {
	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadExamenEcop').parsley().reset();
				cleanActividadExamenEcop();
				// Muestra modal nueva actividad Examen Dia
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadExamenEcopRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadExamenEcopRequisitos').append(codigo);
				}

				$('#modalNewExamenEcop').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelModalExamenEcop").off("click").click(function() {
					cancelExamenEcop();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadExamenEcop');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadExamenEcop');
		}
	});
}
cancelExamenEcop = function() {
	// Desaparece modal nueva actividad Examen Ecop
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewExamenEcop').modal('hide');
}
closeExamenEcop = function(){
	$('#modalNewExamenEcop').modal('hide');
}


newExamenFinalPresencial = function(idCurso) {

	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadExamenFinalPresencial').parsley().reset();
				cleanActividadExamenFinalPresencial();
				// Muestra modal nueva actividad Examen Dia
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadExamenFinalPresencialRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadExamenFinalPresencialRequisitos').append(codigo);
				}

				$('#modalNewExamenFinalPresencial').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelModalExamenFinalPresencial").off("click").click(function() {
					cancelExamenFinalPresencial();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadExamenFinalPresencial');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadExamenFinalPresencial');
		}
	});
}
cancelExamenFinalPresencial = function() {
	// Desaparece modal nueva actividad Examen Final Presencial
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewExamenFinalPresencial').modal('hide');
}
closeExamenFinalPresencial = function(){
	$('#modalNewExamenFinalPresencial').modal('hide');
}


newExamenDia = function(idCurso) {

	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadExamenDia').parsley().reset();
				cleanActividadExamenDia();
				// Muestra modal nueva actividad Examen Dia
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadExamenDiaRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadExamenDiaRequisitos').append(codigo);
				}

				$('#modalNewExamenDia').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelModalExamenDia").off("click").click(function() {
					cancelExamenDia();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadExamenDia');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadExamenDia');
		}
	});
}
cancelExamenDia = function() {
	// Desaparece modal nueva actividad Examen Dia
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewExamenDia').modal('hide');
}
closeExamenDia = function(){
	$('#modalNewExamenDia').modal('hide');
}


newTrabajoDia = function(idCurso) {
	var urltxt = ctx + '/actividad/consultaActividades?idCur=' + idCurso;
	
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
				var actividadesVO = response[1];

				// Resetea validadores
				$('#formActividadTrabajoDia').parsley().reset();
				cleanActividadTrabajoDia();

				// Muestra modal nueva actividad TrabajoDia 
				$('#modalNewActividad').modal('hide');
				
				$("#iptActividadTrabajoDiaRequisitos").empty();
				var actividadesVOLen = actividadesVO.length;
	
				if(actividadesVOLen > 0){
				
					var codigo = ``;
					codigo += `<div class="box-body table-responsive">`+
									`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
										`<thead>`+
							            	`<tr>`+
							                	`<th style="width: 20%;">Tipo</th>`+
							                    `<th style="width: 70%;">Actividad</th>`+
							                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
							                `</tr>`+
										`</thead>`+
										`<tbody>`;
					
					for (var i = 0; i < actividadesVOLen; i++) {
				    	codigo += 	`<tr>`+
	                					`<td>`+ actividadesVO[i].tipoActividad.nombre +`</td>`+
	                					`<td>`+ actividadesVO[i].nombre +`</td>`+
	                					`<td style="text-align: center;">`+
	                						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadesVO[i].id +`">`+
						      				`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1">`+
	                					`</td>`+
	            					 `</tr>`;
				    }
					
					codigo += 	`</tbody></table></div>`+
								`<div class="col-md-12"></br></div>`;
				
					$('#iptActividadTrabajoDiaRequisitos').append(codigo);
				}

				$('#modalNewTrabajoDia').modal({backdrop: 'static', keyboard: false});
				$("#btnCancelModalTrabajoDia").off("click").click(function() {
					cancelTrabajoDia();
				});

			} else {						
				displayErrorMessageByObjectId('',msg,'formActividadTrabajoDia');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadTrabajoDia');
		}
	});
}
cancelTrabajoDia = function() {
	// Desaparece modal nueva actividad Trabajo Dia
	$('#modalNewActividad').modal({backdrop: 'static', keyboard: false});
	$('#modalNewTrabajoDia').modal('hide');
}
closeTrabajoDia = function(){
	$('#modalNewTrabajoDia').modal('hide');
}











saveActividadScorm = function(obj, idCurso) {
	validacionData = true;
	var idActividad = $('#iptIdActividadScorm').val();
	if (!notNull($("#iptActividadScormNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadScormDescripcion"))) {
		validacionData = false;
	}
	if (idActividad.length <= 0) {
		if (!notNull($("#iptActividadScormFile"))) {
			validacionData = false;
		}
	}
	if (!notNull($("#selectActividadScormEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveScorm';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadScorm")),
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
					window.location = ctx + '/lms/curso?id='+idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadScorm');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadScorm');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadScorm');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadScorm');
	}
}




saveActividadVideo = function(obj, idCurso) {
	validacionData = true;
	var idActividad = $('#iptIdActividadVideo').val();
	if (!notNull($("#iptActividadVideoNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadVideoDescripcion"))) {
		validacionData = false;
	}
	if (idActividad.length <= 0) {
		if (!notNull($("#iptActividadVideoFile"))) {
			validacionData = false;
		}
	}
	if (!notNull($("#selectActividadVideoEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveVideo';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadVideo")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadVideo');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadVideo');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadVideo');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadVideo');
	}
}




saveActividadDocumento = function(obj, idCurso) {
	validacionData = true;
	var idActividad = $('#iptIdActividadDocumento').val();
	if (!notNull($("#iptActividadDocumentoNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadDocumentoDescripcion"))) {
		validacionData = false;
	}
	if (idActividad.length <= 0) {
		if (!notNull($("#iptActividadDocumentoFile"))) {
			validacionData = false;
		}
	}
	if (!notNull($("#selectActividadDocumentoEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveDocumento';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadDocumento")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadDocumento');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadDocumento');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadDocumento');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadDocumento');
	}
}




saveActividadExamen = function(obj, idCurso) {
	validacionData = true;
	if (!notNull($("#iptActividadExamenNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenDescripcion"))) {
		validacionData = false;
	}
	if (!notNull($("#selectActividadExamenEstatus"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenTiempoEstimado"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenNumeroOportunidades"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenPreguntasMostrar"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveExamen';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadExamen")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadExamen');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadExamen');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadExamen');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadExamen');
	}
}




saveActividadEncuesta = function(obj, idCurso) {
	validacionData = true;
	if (!notNull($("#iptActividadEncuestaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadEncuestaDescripcion"))) {
		validacionData = false;
	}
	if (!notNull($("#selectActividadEncuestaEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveEncuesta';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadEncuesta")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadEncuesta');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadEncuesta');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadEncuesta');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadEncuesta');
	}
}




saveActividadConferencia = function(obj, idCurso) {
	validacionData = true;
	if (!notNull($("#iptActividadConferenciaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadConferenciaDescripcion"))) {
		validacionData = false;
	}
	if (!notNull($("#selectActividadConferenciaEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveConferencia';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadConferencia")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadConferencia');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadConferencia');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadConferencia');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadConferencia');
	}
}




saveActividadTarea = function(obj, idCurso) {
	validacionData = true;
	if (!notNull($("#iptActividadTareaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadTareaDescripcion"))) {
		validacionData = false;
	}
	if (!notNull($("#selectActividadTareaEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveTarea';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadTarea")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadTarea');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadTarea');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadTarea');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadTarea');
	}
}




saveActividadAsistencia = function(obj, idCurso) {
	validacionData = true;
	if (!notNull($("#iptActividadAsistenciaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadAsistenciaDescripcion"))) {
		validacionData = false;
	}
	if (!notNull($("#selectActividadAsistenciaEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveAsistencia';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadAsistencia")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadAsistencia');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadAsistencia');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadAsistencia');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadAsistencia');
	}
}




saveActividadExamenDiagnostico = function(obj, idCurso) {
	validacionData = true;
	if (!notNull($("#iptActividadExamenDiagnosticoNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenDiagnosticoDescripcion"))) {
		validacionData = false;
	}
	if (!notNull($("#selectActividadExamenDiagnosticoEstatus"))) {
		validacionData = false;
	}
	
	
	if (!notNull($("#iptActividadExamenDiagnosticoTiempoEstimado"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenDiagnosticoNumeroOportunidades"))) {
		validacionData = false;
	}
	
	
	if (!notNull($("#iptActividadExamenDiagnosticoPreguntasMostrar"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveExamenDiagnostico';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadExamenDiagnostico")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadExamenDiagnostico');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadExamenDiagnostico');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadExamenDiagnostico');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadExamenDiagnostico');
	}
}




saveActividadExamenEcop = function(obj, idCurso) {
	validacionData = true;
	if (!notNull($("#iptActividadExamenEcopNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenEcopDescripcion"))) {
		validacionData = false;
	}
	if (!notNull($("#selectActividadExamenEcopEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveExamenEcop';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadExamenEcop")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadExamenEcop');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadExamenEcop');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadExamenEcop');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadExamenEcop');
	}
}





saveActividadExamenFinalPresencial = function(obj, idCurso) {
	validacionData = true;
	if (!notNull($("#iptActividadExamenFinalPresencialNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenFinalPresencialDescripcion"))) {
		validacionData = false;
	}
	if (!notNull($("#selectActividadExamenFinalPresencialEstatus"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenFinalPresencialNumeroOportunidades"))) {
		validacionData = false;
	}
	
	if (validacionData) {
		
		var urltxt = ctx + '/actividad/saveExamenFinalPresencial';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadExamenFinalPresencial")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadExamenFinalPresencial');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadExamenFinalPresencial');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadExamenFinalPresencial');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadExamenFinalPresencial');
	}
}





saveActividadExamenDia = function(obj, idCurso) {
	validacionData = true;
	if (!notNull($("#iptActividadExamenDiaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenDiaDescripcion"))) {
		validacionData = false;
	}
	if (!notNull($("#selectActividadExamenDiaEstatus"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenDiaNumeroOportunidades"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadExamenDiaTiempoEstimado"))) {
		validacionData = false;
	}
    if (!notNull($("#iptActividadExamenDiaPreguntasMostrar"))) {
		validacionData = false;
	}
	
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveExamenDia';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadExamenDia")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadExamenDia');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadExamenDia');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadExamenDia');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadExamenDia');
	}
}


saveActividadTrabajoDia = function(obj, idCurso) {
	validacionData = true;
	if (!notNull($("#iptActividadTrabajoDiaNombre"))) {
		validacionData = false;
	}
	if (!notNull($("#iptActividadTrabajoDiaDescripcion"))) {
		validacionData = false;
	}
	if (!notNull($("#selectActividadTrabajoDiaEstatus"))) {
		validacionData = false;
	}
	
	if (validacionData) {

		var urltxt = ctx + '/actividad/saveTrabajoDia';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formActividadTrabajoDia")),
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
					window.location = ctx + '/lms/curso?id=' + idCurso;
					displaySuccesMessageByObjectId('',msg,'formActividadTrabajoDia');
				} else {
					displayErrorMessageByObjectId('',msg,'formActividadTrabajoDia');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.','Intenta de nuevo.','formActividadTrabajoDia');
			}
		});
	} else {	
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','formActividadTrabajoDia');
	}
}



orderArribaActividad = function(idC, idA) {

	var urltxt = ctx + '/lms/changeOrdenArribaActividad?idC='+idC+'&idA='+idA;
	
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
				window.location = ctx+'/lms/curso?id='+idC;
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


orderAbajoActividad = function(idC, idA) {

	var urltxt = ctx + '/lms/changeOrdenAbajoActividad?idC='+idC+'&idA='+idA;
	
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
				window.location = ctx+'/lms/curso?id='+idC;
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


estatusActividad = function(idCurso, idActividad) {
	$("#iptEstatusCursoId").val(idCurso);
	$("#iptEstatusActividadId").val(idActividad);
	$('#modalEstatusActividad').modal({backdrop: 'static', keyboard: false});
}


estatusActividadConfirmacion = function() {
	
	var idCurso = $('#iptEstatusCursoId').val();
	var idActividad = $('#iptEstatusActividadId').val();
	
	var urltxt = ctx + '/lms/changeEstatusActividad?id='+idActividad;
	
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
			
			$('#modalEstatusActividad').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx+'/lms/curso?id='+idCurso;
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

editActividad = function(idCurso, idActividad, idTipoActividad) {
	
	var urltxt = ctx + '/actividad/consultaActividad?idCur=' + idCurso + '&idAct=' + idActividad;
	
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
				var actividadVO = response[1];
				var actividadOtrasVO = response[2];
				
				
				switch (idTipoActividad) {
					case 1:
						resetElement("hTitleScormEditar");
						removeElement("hTitleScormNueva");
						resetElement("actividadScormRowDownload");
						
						// ACTIVIDAD SCORM
						$('#formActividadScorm').parsley().reset();
						cleanActividadScorm();
						$("#btnCancelScorm").off("click").click(function() {
							closeScorm();
				        });
					  
						$('#iptIdCursoScorm').val(actividadVO.idCurso);
						$('#iptIdActividadScorm').val(actividadVO.id);
						$('#iptActividadScormNombre').val(actividadVO.nombre);
						$('#iptActividadScormNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadScormNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadScormDescripcion').val(actividadVO.descripcion);
						$('#iptActividadScormDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadScormDescripcionFr').val(actividadVO.descripcionFr);
						$('#selectActividadScormEstatus').val(actividadVO.banActivo);
						
						if(actividadVO.promedia == true){
							$('#iptActividadScormPromedia').prop('checked', true);
							$('#iptActividadScormPromedia').iCheck('update');
							$('#iptActividadScormPromediaPorcentaje').prop('disabled', false);
							$('#iptActividadScormPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						}else{
							$("input[id=iptActividadScormPromedia]").removeAttr('checked').iCheck('update');
							$('#iptActividadScormPromediaPorcentaje').prop('disabled', true);
							$('#iptActividadScormPromediaPorcentaje').prop('value', '0');
						}
						
						$("#iptActividadScormRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadScormRequisitos').append(codigoActObligatoria);
						}
						
						$('#modalNewScorm').modal({backdrop: 'static', keyboard: false});
						
						break;
					case 2:
						
						resetElement("hTitleVideoEditar");
						removeElement("hTitleVideoNuevo");
						resetElement("actividadVideoRowDownload");
						
						// ACTIVIDAD VIDEO
						$('#formActividadVideo').parsley().reset();
				        cleanActividadVideo();
				        $("#btnCancelVideo").off("click").click(function() {
				        		closeVideo();
				        });
						
				        $('#iptIdCursoVideo').val(actividadVO.idCurso);
				        $('#iptIdActividadVideo').val(actividadVO.id);
				        $('#iptActividadVideoNombre').val(actividadVO.nombre);
				        $('#iptActividadVideoNombreEn').val(actividadVO.nombreEn);
				        $('#iptActividadVideoNombreFr').val(actividadVO.nombreFr);
				        $('#iptActividadVideoDescripcion').val(actividadVO.descripcion);
				        $('#iptActividadVideoDescripcionEn').val(actividadVO.descripcionEn);
				        $('#iptActividadVideoDescripcionFr').val(actividadVO.descripcionFr);
				        $('#selectActividadVideoEstatus').val(actividadVO.banActivo);
				        
				        if(actividadVO.promedia == true){
							$('#iptActividadVideoPromedia').prop('checked', true);
							$('#iptActividadVideoPromedia').iCheck('update');
							$('#iptActividadVideoPromediaPorcentaje').prop('disabled', false);
							$('#iptActividadVideoPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						}else{
							$("input[id=iptActividadVideoPromedia]").removeAttr('checked').iCheck('update');
							$('#iptActividadVideoPromediaPorcentaje').prop('disabled', true);
							$('#iptActividadVideoPromediaPorcentaje').prop('value', '0');
						}
						
						$("#iptActividadVideoRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadVideoRequisitos').append(codigoActObligatoria);
						}
				        
				        $('#modalNewVideo').modal({backdrop: 'static', keyboard: false});
				        
						break;
					case 3:
						resetElement("iptDocumentoEditar");
						removeElement("iptDocumentoNuevo");
						resetElement("actividadDocumentoRowDownload");
						
						// ACTIVIDAD DOCUMENTO
				        $('#formActividadDocumento').parsley().reset();
				        cleanActividadDocumento();
				        $("#btnCancelDocumento").off("click").click(function() {
				        		closeDocumento();
				        });
				        
				        $('#iptIdCursoDocumento').val(actividadVO.idCurso);
						$('#iptIdActividadDocumento').val(actividadVO.id);
						$('#iptActividadDocumentoNombre').val(actividadVO.nombre);
						$('#iptActividadDocumentoNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadDocumentoNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadDocumentoDescripcion').val(actividadVO.descripcion);
						$('#iptActividadDocumentoDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadDocumentoDescripcionFr').val(actividadVO.descripcionFr);
						$('#selectActividadDocumentoEstatus').val(actividadVO.banActivo);
						
						if(actividadVO.promedia == true){
							$('#iptActividadDocumentoPromedia').prop('checked', true);
							$('#iptActividadDocumentoPromedia').iCheck('update');
							$('#iptActividadDocumentoPromediaPorcentaje').prop('disabled', false);
							$('#iptActividadDocumentoPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						}else{
							$("input[id=iptActividadDocumentoPromedia]").removeAttr('checked').iCheck('update');
							$('#iptActividadDocumentoPromediaPorcentaje').prop('disabled', true);
							$('#iptActividadDocumentoPromediaPorcentaje').prop('value', '0');
						}
						
						$("#iptActividadDocumentoRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadDocumentoRequisitos').append(codigoActObligatoria);
						}
						
				        $('#modalNewDocumento').modal({backdrop: 'static', keyboard: false});
				        
						break;
					case 4:
						// ACTIVIDAD EXAMEN
						$('#formActividadExamen').parsley().reset();
				        cleanActividadExamen();
				        $("#btnCancelModalExamen").off("click").click(function() {
				        		closeExamen();
				        });
				        
				        $('#iptIdCursoExamen').val(actividadVO.idCurso);
						$('#iptIdActividadExamen').val(actividadVO.id);
						$('#iptActividadExamenNombre').val(actividadVO.nombre);
						$('#iptActividadExamenNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadExamenNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadExamenDescripcion').val(actividadVO.descripcion);
						$('#iptActividadExamenDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadExamenDescripcionFr').val(actividadVO.descripcionFr);					
						$('#iptActividadExamenTiempoEstimado').val(actividadVO.tiempoEstimado);
						$('#iptActividadExamenNumeroOportunidades').val(actividadVO.numeroOportunidades);
						$('#iptActividadExamenPreguntasMostrar').val(actividadVO.preguntasMostrar);
						
						if(actividadVO.preguntasAleatorias == true){
							$('#iptActividadExamenPreguntasAleatorias').prop('checked', true);
							$('#iptActividadExamenPreguntasAleatorias').iCheck({
						        checkboxClass: 'icheckbox_minimal checked'
							});
						}else{
							$('#iptActividadExamenPreguntasAleatorias').prop('checked', false);
							$('#iptActividadExamenPreguntasAleatorias').iCheck({
							    checkboxClass: 'icheckbox_minimal'
							});
						}

						$('#selectActividadExamenEstatus').val(actividadVO.banActivo);
						
						if(actividadVO.promedia == true){
							$('#iptActividadExamenPromedia').prop('checked', true);
							$('#iptActividadExamenPromedia').iCheck('update');
							$('#iptActividadExamenPromediaPorcentaje').prop('disabled', false);
							$('#iptActividadExamenPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						}else{
							$("input[id=iptActividadExamenPromedia]").removeAttr('checked').iCheck('update');
							$('#iptActividadExamenPromediaPorcentaje').prop('disabled', true);
							$('#iptActividadExamenPromediaPorcentaje').prop('value', '0');
						}
						
						if(actividadVO.calificacionMinima == true){
							$('#iptActividadExamenCalificacion').prop('checked', true);
							$('#iptActividadExamenCalificacion').iCheck('update');
							$('#iptActividadExamenCalificacionPorcentaje').prop('disabled', false);
							$('#iptActividadExamenCalificacionPorcentaje').val(actividadVO.calificacionMinimaPorcentaje);
						}else{
							$("input[id=iptActividadExamenCalificacion]").removeAttr('checked').iCheck('update');
							$('#iptActividadExamenCalificacionPorcentaje').prop('disabled', true);
							$('#iptActividadExamenCalificacionPorcentaje').prop('value', '0');
						}
						
						
						$("#iptActividadExamenRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadExamenRequisitos').append(codigoActObligatoria);
						}
						
				        $('#modalNewExamen').modal({backdrop: 'static', keyboard: false});
				        
						break;
					case 5:
						// ACTIVIDAD_ENCUESTA
						$('#formActividadEncuesta').parsley().reset();
				        cleanActividadEncuesta();
				        $("#btnCancelModalEncuesta").off("click").click(function() {
				        		closeEncuesta();
				        });
						
						$('#iptIdCursoEncuesta').val(actividadVO.idCurso);
						$('#iptIdActividadEncuesta').val(actividadVO.id);
						$('#iptActividadEncuestaNombre').val(actividadVO.nombre);
						$('#iptActividadEncuestaNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadEncuestaNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadEncuestaDescripcion').val(actividadVO.descripcion);
						$('#iptActividadEncuestaDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadEncuestaDescripcionFr').val(actividadVO.descripcionFr);
						$('#selectActividadEncuestaEstatus').val(actividadVO.banActivo);
						
						if(actividadVO.promedia == true){
							$('#iptActividadEncuestaPromedia').prop('checked', true);
							$('#iptActividadEncuestaPromedia').iCheck('update');
							$('#iptActividadEncuestaPromediaPorcentaje').prop('disabled', false);
							$('#iptActividadEncuestaPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						}else{
							$("input[id=iptActividadEncuestaPromedia]").removeAttr('checked').iCheck('update');
							$('#iptActividadEncuestaPromediaPorcentaje').prop('disabled', true);
							$('#iptActividadEncuestaPromediaPorcentaje').prop('value', '0');
						}
						
						$("#iptActividadEncuestaRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadEncuestaRequisitos').append(codigoActObligatoria);
						}
						
						$('#modalNewEncuesta').modal({backdrop: 'static', keyboard: false});
						
						break;
					case 6:
						// ACTIVIDAD_CONFERENCIA
						$('#formActividadConferencia').parsley().reset();
				        cleanActividadConferencia();
				        $("#btnCancelModalConferencia").off("click").click(function() {
				        		closeConferencia();
				        });
						
						$('#iptIdCursoConferencia').val(actividadVO.idCurso);
						$('#iptIdActividadConferencia').val(actividadVO.id);
						$('#iptActividadConferenciaNombre').val(actividadVO.nombre);
						$('#iptActividadConferenciaNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadConferenciaNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadConferenciaDescripcion').val(actividadVO.descripcion);
						$('#iptActividadConferenciaDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadConferenciaDescripcionFr').val(actividadVO.descripcionFr);
						$('#selectActividadConferenciaEstatus').val(actividadVO.banActivo);
						
						if(actividadVO.promedia == true){
							$('#iptActividadConferenciaPromedia').prop('checked', true);
							$('#iptActividadConferenciaPromedia').iCheck('update');
							$('#iptActividadConferenciaPromediaPorcentaje').prop('disabled', false);
							$('#iptActividadConferenciaPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						}else{
							$("input[id=iptActividadConferenciaPromedia]").removeAttr('checked').iCheck('update');
							$('#iptActividadConferenciaPromediaPorcentaje').prop('disabled', true);
							$('#iptActividadConferenciaPromediaPorcentaje').prop('value', '0');
						}
						
						$("#iptActividadConferenciaRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadConferenciaRequisitos').append(codigoActObligatoria);
						}
						
						$('#modalNewConferencia').modal({backdrop: 'static', keyboard: false});
						
						break;
					case 7:
						// ACTIVIDAD_TAREA
						$('#formActividadTarea').parsley().reset();
				        cleanActividadTarea();
				        $("#btnCancelModalTarea").off("click").click(function() {
				        		closeTarea();
				        });
						
						$('#iptIdCursoTarea').val(actividadVO.idCurso);
						$('#iptIdActividadTarea').val(actividadVO.id);
						$('#iptActividadTareaNombre').val(actividadVO.nombre);
						$('#iptActividadTareaNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadTareaNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadTareaDescripcion').val(actividadVO.descripcion);
						$('#iptActividadTareaDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadTareaDescripcionFr').val(actividadVO.descripcionFr);
						$('#selectActividadTareaEstatus').val(actividadVO.banActivo);
						$('#iptActividadTareaPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						
						$("#iptActividadTareaRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadTareaRequisitos').append(codigoActObligatoria);
						}
						
						$('#modalNewTarea').modal({backdrop: 'static', keyboard: false});
						
						break;
					case 8:
						// ACTIVIDAD_ASISTENCIA
						$('#formActividadAsistencia').parsley().reset();
						cleanActividadAsistencia();
						$("#btnCancelModalAsistencia").off("click").click(function() {
						        closeAsistencia();
						});

						$('#iptIdCursoAsistencia').val(actividadVO.idCurso);
						$('#iptIdActividadAsistencia').val(actividadVO.id);
						$('#iptActividadAsistenciaNombre').val(actividadVO.nombre);
						$('#iptActividadAsistenciaNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadAsistenciaNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadAsistenciaDescripcion').val(actividadVO.descripcion);
						$('#iptActividadAsistenciaDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadAsistenciaDescripcionFr').val(actividadVO.descripcionFr);
						$('#selectActividadAsistenciaEstatus').val(actividadVO.banActivo);
						
						if(actividadVO.promedia == true){
							$('#iptActividadAsistenciaPromedia').prop('checked', true);
							$('#iptActividadAsistenciaPromedia').iCheck('update');
							$('#iptActividadAsistenciaPromediaPorcentaje').prop('disabled', false);
							$('#iptActividadAsistenciaPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						}else{
							$("input[id=iptActividadAsistenciaPromedia]").removeAttr('checked').iCheck('update');
							$('#iptActividadAsistenciaPromediaPorcentaje').prop('disabled', true);
							$('#iptActividadAsistenciaPromediaPorcentaje').prop('value', '0');
						}
						
						$("#iptActividadAsistenciaRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadAsistenciaRequisitos').append(codigoActObligatoria);
						}
						
						$('#modalNewAsistencia').modal({backdrop: 'static', keyboard: false});

						break;
					case 9:
						// ACTIVIDAD_EXAMEN_DIAGNOSTICO
						$('#formActividadExamenDiagnostico').parsley().reset();
						cleanActividadExamenDiagnostico();
						$("#btnCancelModalExamenDiagnostico").off("click").click(function() {
						        closeExamenDiagnostico();
						});

						$('#iptIdCursoExamenDiagnostico').val(actividadVO.idCurso);
						$('#iptIdActividadExamenDiagnostico').val(actividadVO.id);
						$('#iptActividadExamenDiagnosticoNombre').val(actividadVO.nombre);
						$('#iptActividadExamenDiagnosticoNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadExamenDiagnosticoNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadExamenDiagnosticoDescripcion').val(actividadVO.descripcion);
						$('#iptActividadExamenDiagnosticoDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadExamenDiagnosticoDescripcionFr').val(actividadVO.descripcionFr);
						$('#selectActividadExamenDiagnosticoEstatus').val(actividadVO.banActivo);
						$('#iptActividadExamenDiagnosticoNumeroOportunidades').val(actividadVO.numeroOportunidades);
						
						$('#iptActividadExamenDiagnosticoTiempoEstimado').val(actividadVO.tiempoEstimado);
						$('#iptActividadExamenDiagnosticoPreguntasMostrar').val(actividadVO.preguntasMostrar);
						
						if(actividadVO.preguntasAleatorias == true){
						    $('#iptActividadExamenDiagnosticoPreguntasAleatorias').prop('checked', true);
						    $('#iptActividadExamenDiagnosticoPreguntasAleatorias').iCheck({
						        checkboxClass: 'icheckbox_minimal checked'
						    });
						}else{
						    $('#iptActividadExamenDiagnosticoPreguntasAleatorias').prop('checked', false);
						    $('#iptActividadExamenDiagnosticoPreguntasAleatorias').iCheck({
						        checkboxClass: 'icheckbox_minimal'
						    });
						}
						
						if(actividadVO.promedia == true){
							$('#iptActividadExamenDiagnosticoPromedia').prop('checked', true);
							$('#iptActividadExamenDiagnosticoPromedia').iCheck('update');
							$('#iptActividadExamenDiagnosticoPromediaPorcentaje').prop('disabled', false);
							$('#iptActividadExamenDiagnosticoPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						}else{
							$("input[id=iptActividadExamenDiagnosticoPromedia]").removeAttr('checked').iCheck('update');
							$('#iptActividadExamenDiagnosticoPromediaPorcentaje').prop('disabled', true);
							$('#iptActividadExamenDiagnosticoPromediaPorcentaje').prop('value', '0');
						}
						
						$("#iptActividadExamenDiagnosticoRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadExamenDiagnosticoRequisitos').append(codigoActObligatoria);
						}
						
						$('#modalNewExamenDiagnostico').modal({backdrop: 'static', keyboard: false});

						break;
					case 10:
						// ACTIVIDAD_EXAMEN_ECOP
						$('#formActividadExamenEcop').parsley().reset();
						cleanActividadExamenEcop();
						$("#btnCancelModalExamenEcop").off("click").click(function() {
						        closeExamenEcop();
						});

						$('#iptIdCursoExamenEcop').val(actividadVO.idCurso);
						$('#iptIdActividadExamenEcop').val(actividadVO.id);
						$('#iptActividadExamenEcopNombre').val(actividadVO.nombre);
						$('#iptActividadExamenEcopNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadExamenEcopNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadExamenEcopDescripcion').val(actividadVO.descripcion);
						$('#iptActividadExamenEcopDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadExamenEcopDescripcionFr').val(actividadVO.descripcionFr);
						$('#selectActividadExamenEcopEstatus').val(actividadVO.banActivo);
						$('#iptActividadExamenEcopPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						
						if(actividadVO.calificacionMinima == true){
							$('#iptActividadExamenEcopCalificacion').prop('checked', true);
							$('#iptActividadExamenEcopCalificacion').iCheck('update');
							$('#iptActividadExamenEcopCalificacionPorcentaje').prop('disabled', false);
							$('#iptActividadExamenEcopCalificacionPorcentaje').val(actividadVO.calificacionMinimaPorcentaje);
						}else{
							$("input[id=iptActividadExamenEcopCalificacion]").removeAttr('checked').iCheck('update');
							$('#iptActividadExamenEcopCalificacionPorcentaje').prop('disabled', true);
							$('#iptActividadExamenEcopCalificacionPorcentaje').prop('value', '0');
						}
						
						
						$("#iptActividadExamenEcopRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadExamenEcopRequisitos').append(codigoActObligatoria);
						}

						$('#modalNewExamenEcop').modal({backdrop: 'static', keyboard: false});

						break;
					case 11:
						// ACTIVIDAD_EXAMEN_FINAL_PRESENCIAL
						$('#formActividadExamenFinalPresencial').parsley().reset();
						cleanActividadExamenFinalPresencial();
						$("#btnCancelModalExamenFinalPresencial").off("click").click(function() {
						        closeExamenFinalPresencial();
						});

						$('#iptIdCursoExamenFinalPresencial').val(actividadVO.idCurso);
						$('#iptIdActividadExamenFinalPresencial').val(actividadVO.id);
						$('#iptActividadExamenFinalPresencialNombre').val(actividadVO.nombre);
						$('#iptActividadExamenFinalPresencialNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadExamenFinalPresencialNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadExamenFinalPresencialDescripcion').val(actividadVO.descripcion);
						$('#iptActividadExamenFinalPresencialDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadExamenFinalPresencialDescripcionFr').val(actividadVO.descripcionFr);
						$('#selectActividadExamenFinalPresencialEstatus').val(actividadVO.banActivo);
						$('#iptActividadExamenFinalPresencialPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						$('#iptActividadExamenFinalPresencialNumeroOportunidades').val(actividadVO.numeroOportunidades);
						
						if(actividadVO.calificacionMinima == true){
							$('#iptActividadExamenFinalPresencialCalificacion').prop('checked', true);
							$('#iptActividadExamenFinalPresencialCalificacion').iCheck('update');
							$('#iptActividadExamenFinalPresencialCalificacionPorcentaje').prop('disabled', false);
							$('#iptActividadExamenFinalPresencialCalificacionPorcentaje').val(actividadVO.calificacionMinimaPorcentaje);
						}else{
							$("input[id=iptActividadExamenFinalPresencialCalificacion]").removeAttr('checked').iCheck('update');
							$('#iptActividadExamenFinalPresencialCalificacionPorcentaje').prop('disabled', true);
							$('#iptActividadExamenFinalPresencialCalificacionPorcentaje').prop('value', '0');
						}
						
						$("#iptActividadExamenFinalPresencialRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadExamenFinalPresencialRequisitos').append(codigoActObligatoria);
						}
						
						$('#modalNewExamenFinalPresencial').modal({backdrop: 'static', keyboard: false});

						break;
					case 12:
						// ACTIVIDAD_EXAMEN_DIA
						$('#formActividadExamenDia').parsley().reset();
						cleanActividadExamenDia();
						$("#btnCancelModalExamenDia").off("click").click(function() {
						        closeExamenDia();
						});

						$('#iptIdCursoExamenDia').val(actividadVO.idCurso);
						$('#iptIdActividadExamenDia').val(actividadVO.id);
						$('#iptActividadExamenDiaNombre').val(actividadVO.nombre);
						$('#iptActividadExamenDiaNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadExamenDiaNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadExamenDiaDescripcion').val(actividadVO.descripcion);
						$('#iptActividadExamenDiaDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadExamenDiaDescripcionFr').val(actividadVO.descripcionFr);
						$('#selectActividadExamenDiaEstatus').val(actividadVO.banActivo);
						$('#iptActividadExamenDiaPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						$('#iptActividadExamenDiaNumeroOportunidades').val(actividadVO.numeroOportunidades);
						
						$('#iptActividadExamenDiaTiempoEstimado').val(actividadVO.tiempoEstimado);
						$('#iptActividadExamenDiaPreguntasMostrar').val(actividadVO.preguntasMostrar);
						
						if(actividadVO.preguntasAleatorias == true){
						    $('#iptActividadExamenDiaPreguntasAleatorias').prop('checked', true);
						    $('#iptActividadExamenDiaPreguntasAleatorias').iCheck({
						        checkboxClass: 'icheckbox_minimal checked'
						    });
						}else{
						    $('#iptActividadExamenDiaPreguntasAleatorias').prop('checked', false);
						    $('#iptActividadExamenDiaPreguntasAleatorias').iCheck({
						        checkboxClass: 'icheckbox_minimal'
						    });
						}
						
						if(actividadVO.calificacionMinima == true){
							$('#iptActividadExamenDiaCalificacion').prop('checked', true);
							$('#iptActividadExamenDiaCalificacion').iCheck('update');
							$('#iptActividadExamenDiaCalificacionPorcentaje').prop('disabled', false);
							$('#iptActividadExamenDiaCalificacionPorcentaje').val(actividadVO.calificacionMinimaPorcentaje);
						}else{
							$("input[id=iptActividadExamenDiaCalificacion]").removeAttr('checked').iCheck('update');
							$('#iptActividadExamenDiaCalificacionPorcentaje').prop('disabled', true);
							$('#iptActividadExamenDiaCalificacionPorcentaje').prop('value', '0');
						}

						$("#iptActividadExamenDiaRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {
						    
						    
						    
						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadExamenDiaRequisitos').append(codigoActObligatoria);
						}
						
						$('#modalNewExamenDia').modal({backdrop: 'static', keyboard: false});

						break;
					case 13:
						// ACTIVIDAD_TRABAJO_DIA
						$('#formActividadTrabajoDia').parsley().reset();
						cleanActividadTrabajoDia();
						$("#btnCancelModalTrabajoDia").off("click").click(function() {
						        closeTrabajoDia();
						});

						$('#iptIdCursoTrabajoDia').val(actividadVO.idCurso);
						$('#iptIdActividadTrabajoDia').val(actividadVO.id);
						$('#iptActividadTrabajoDiaNombre').val(actividadVO.nombre);
						$('#iptActividadTrabajoDiaNombreEn').val(actividadVO.nombreEn);
						$('#iptActividadTrabajoDiaNombreFr').val(actividadVO.nombreFr);
						$('#iptActividadTrabajoDiaDescripcion').val(actividadVO.descripcion);
						$('#iptActividadTrabajoDiaDescripcionEn').val(actividadVO.descripcionEn);
						$('#iptActividadTrabajoDiaDescripcionFr').val(actividadVO.descripcionFr);
						$('#selectActividadTrabajoDiaEstatus').val(actividadVO.banActivo);
						$('#iptActividadTrabajoDiaPromediaPorcentaje').val(actividadVO.promediaPorcentaje);
						
						if(actividadVO.calificacionMinima == true){
							$('#iptActividadTrabajoDiaCalificacion').prop('checked', true);
							$('#iptActividadTrabajoDiaCalificacion').iCheck('update');
							$('#iptActividadTrabajoDiaCalificacionPorcentaje').prop('disabled', false);
							$('#iptActividadTrabajoDiaCalificacionPorcentaje').val(actividadVO.calificacionMinimaPorcentaje);
						}else{
							$("input[id=iptActividadTrabajoDiaCalificacion]").removeAttr('checked').iCheck('update');
							$('#iptActividadTrabajoDiaCalificacionPorcentaje').prop('disabled', true);
							$('#iptActividadTrabajoDiaCalificacionPorcentaje').prop('value', '0');
						}
						
						$("#iptActividadTrabajoDiaRequisitos").empty();
						var actividadOtrasVOLen = actividadOtrasVO.length;
						
						if(actividadOtrasVOLen > 0){
						
							var codigoActObligatoria = ``;
							codigoActObligatoria += `<div class="box-body table-responsive">`+
	            							`<table id="empresasFuncionario" class="table table-bordered table-striped">`+
	                							`<thead>`+
									            	`<tr>`+
									                	`<th style="width: 20%;">Tipo</th>`+
									                    `<th style="width: 70%;">Actividad</th>`+
									                    `<th style="width: 10%; text-align: center;">Obligatoria</th>`+
									                `</tr>`+
	                							`</thead>`+
	                							`<tbody>`;
							
						    for (var i = 0; i < actividadOtrasVOLen; i++) {

						    	codigoActObligatoria += `<tr>`+
	                        					`<td>`+ actividadOtrasVO[i].nombreTipoActividad +`</td>`+
	                        					`<td>`+ actividadOtrasVO[i].nombre +`</td>`+
	                        					`<td style="text-align: center;">`+
	                        						`<input type="hidden" name="iptActividadObligatoriaId${i+1}" id="iptActividadObligatoriaId${i+1}" value="`+ actividadOtrasVO[i].id +`">`;
	                        					
	                        						if(actividadOtrasVO[i].obligatoria > 0) {
								      					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" checked >`;
								     				} else {	
								     					codigoActObligatoria +=`<input type="checkbox" name="iptActividadObligatoria${i+1}" id="iptActividadObligatoria${i+1}" value="1" >`;
								     				}			
   				
	                        	codigoActObligatoria +=`</td></tr>`;
						    }
						    
							codigoActObligatoria += `</tbody></table></div>`+
										`<div class="col-md-12"></br></div>`;
	
							$('#iptActividadTrabajoDiaRequisitos').append(codigoActObligatoria);
						}
						
						$('#modalNewTrabajoDia').modal({backdrop: 'static', keyboard: false});

						break;
					default:
						  alert('Error alert');
				}
			} else {						
				displayErrorMessageByObjectId('','Error','formActividadScorm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('','Error','formActividadScorm');
		}
	});
	
}

function cleanActividadScorm(){
	//Clean data
	$('#iptIdActividadScorm').val('');
	$('#iptActividadScormNombre').val('');
	$('#iptActividadScormNombreEn').val('');
	$('#iptActividadScormNombreFr').val('');
	$('#iptActividadScormDescripcion').text('');
	$('#iptActividadScormDescripcion').val('');
	$('#iptActividadScormDescripcionEn').text('');
	$('#iptActividadScormDescripcionEn').val('');
	$('#iptActividadScormDescripcionFr').text('');
	$('#iptActividadScormDescripcionFr').val('');
	$('#iptActividadScormActualFile').text('');
	$('#iptActividadScormFile').val('');
	$('#selectActividadScormEstatus').val('');
	
	$("input[id=iptActividadScormPromedia]").removeAttr('checked').iCheck('update');
	$('#iptActividadScormPromediaPorcentaje').prop('disabled', true);
	$('#iptActividadScormPromediaPorcentaje').prop('value', '0');
}

function cleanActividadVideo(){
	//Clean data
	$('#iptIdActividadVideo').val('');
	$('#iptActividadVideoNombre').val('');
	$('#iptActividadVideoNombreEn').val('');
	$('#iptActividadVideoNombreFr').val('');
	$('#iptActividadVideoDescripcion').text('');
	$('#iptActividadVideoDescripcion').val('');
	$('#iptActividadVideoDescripcionEn').text('');
	$('#iptActividadVideoDescripcionEn').val('');
	$('#iptActividadVideoDescripcionFr').text('');
	$('#iptActividadVideoDescripcionFr').val('');
	$('#iptActividadScormActualFile').text('');
	$('#iptActividadVideoFile').val('');
	$('#selectActividadVideoEstatus').val('');
	
	$("input[id=iptActividadVideoPromedia]").removeAttr('checked').iCheck('update');
	$('#iptActividadVideoPromediaPorcentaje').prop('disabled', true);
	$('#iptActividadVideoPromediaPorcentaje').prop('value', '0');
}

function cleanActividadDocumento(){
	//Clean data
	$('#iptIdActividadDocumento').val('');
	$('#iptActividadDocumentoNombre').val('');
	$('#iptActividadDocumentoNombreEn').val('');
	$('#iptActividadDocumentoNombreFr').val('');
	$('#iptActividadDocumentoDescripcion').text('');
	$('#iptActividadDocumentoDescripcion').val('');
	$('#iptActividadDocumentoDescripcionEn').text('');
	$('#iptActividadDocumentoDescripcionEn').val('');
	$('#iptActividadDocumentoDescripcionFr').text('');
	$('#iptActividadDocumentoDescripcionFr').val('');
	$('#iptActividadDocumentoActualFile').text('');
	$('#iptActividadDocumentoFile').val('');
	$('#selectActividadDocumentoEstatus').val('');
	
	$("input[id=iptActividadDocumentoPromedia]").removeAttr('checked').iCheck('update');
	$('#iptActividadDocumentoPromediaPorcentaje').prop('disabled', true);
	$('#iptActividadDocumentoPromediaPorcentaje').prop('value', '0');
}

function cleanActividadExamen(){
	//Clean data
	$('#iptIdActividadExamen').val('');
	$('#iptActividadExamenNombre').val('');
	$('#iptActividadExamenNombreEn').val('');
	$('#iptActividadExamenNombreFr').val('');
	$('#iptActividadExamenDescripcion').text('');
	$('#iptActividadExamenDescripcion').val('');
	$('#iptActividadExamenDescripcionEn').text('');
	$('#iptActividadExamenDescripcionEn').val('');
	$('#iptActividadExamenDescripcionFr').text('');
	$('#iptActividadExamenDescripcionFr').val('');
	$('#iptActividadExamenTiempoEstimado').val("0");
	$('#iptActividadExamenNumeroOportunidades').val("0");
	$('#iptActividadExamenPreguntasMostrar').val("0");
	$('#selectActividadExamenEstatus').val('');
	$('#iptActividadExamenPreguntasAleatorias').prop('checked',false);
	
	$("input[id=iptActividadExamenPromedia]").removeAttr('checked').iCheck('update');
	$('#iptActividadExamenPromediaPorcentaje').prop('disabled', true);
	$('#iptActividadExamenPromediaPorcentaje').prop('value', '0');
	
	$("input[id=iptActividadExamenCalificacion]").removeAttr('checked').iCheck('update');
	$('#iptActividadExamenCalificacionPorcentaje').prop('disabled', true);
	$('#iptActividadExamenCalificacionPorcentaje').prop('value', '0');
}

function cleanActividadEncuesta(){
	//Clean data
	$('#iptIdActividadEncuesta').val('');
	$('#iptActividadEncuestaNombre').val('');
	$('#iptActividadEncuestaNombreEn').val('');
	$('#iptActividadEncuestaNombreFr').val('');
	$('#iptActividadEncuestaDescripcion').text('');
	$('#iptActividadEncuestaDescripcion').val('');
	$('#iptActividadEncuestaDescripcionEn').text('');
	$('#iptActividadEncuestaDescripcionEn').val('');
	$('#iptActividadEncuestaDescripcionFr').text('');
	$('#iptActividadEncuestaDescripcionFr').val('');
	$('#iptActividadEncuestaFechaInicial').val('');
	$('#iptActividadEncuestaFechaFinal').val('');
	$('#selectActividadEncuestaEstatus').val('');
	
	$("input[id=iptActividadEncuestaPromedia]").removeAttr('checked').iCheck('update');
	$('#iptActividadEncuestaPromediaPorcentaje').prop('disabled', true);
	$('#iptActividadEncuestaPromediaPorcentaje').prop('value', '0');
}

function cleanActividadConferencia(){
	//Clean data
	$('#iptIdActividadConferencia').val('');
	$('#iptActividadConferenciaNombre').val('');
	$('#iptActividadConferenciaNombreEn').val('');
	$('#iptActividadConferenciaNombreFr').val('');
	$('#iptActividadConferenciaDescripcion').text('');
	$('#iptActividadConferenciaDescripcion').val('');
	$('#iptActividadConferenciaDescripcionEn').text('');
	$('#iptActividadConferenciaDescripcionEn').val('');
	$('#iptActividadConferenciaDescripcionFr').text('');
	$('#iptActividadConferenciaDescripcionFr').val('');
	$('#selectActividadConferenciaEstatus').val('');
	
	$("input[id=iptActividadConferenciaPromedia]").removeAttr('checked').iCheck('update');
	$('#iptActividadConferenciaPromediaPorcentaje').prop('disabled', true);
	$('#iptActividadConferenciaPromediaPorcentaje').prop('value', '0');
}

function cleanActividadTarea(){
	//Clean data
	$('#iptIdActividadTarea').val('');
	$('#iptActividadTareaNombre').val('');
	$('#iptActividadTareaNombreEn').val('');
	$('#iptActividadTareaNombreFr').val('');
	$('#iptActividadTareaDescripcion').text('');
	$('#iptActividadTareaDescripcion').val('');
	$('#iptActividadTareaDescripcionEn').text('');
	$('#iptActividadTareaDescripcionEn').val('');
	$('#iptActividadTareaDescripcionFr').text('');
	$('#iptActividadTareaDescripcionFr').val('');
	$('#selectActividadTareaEstatus').val('');
	$('#iptActividadTareaPromediaPorcentaje').val('0');
}

function cleanActividadAsistencia(){
	//Clean data
	$('#iptIdActividadAsistencia').val('');
	$('#iptActividadAsistenciaNombre').val('');
	$('#iptActividadAsistenciaNombreEn').val('');
	$('#iptActividadAsistenciaNombreFr').val('');
	$('#iptActividadAsistenciaDescripcion').text('');
	$('#iptActividadAsistenciaDescripcion').val('');
	$('#iptActividadAsistenciaDescripcionEn').text('');
	$('#iptActividadAsistenciaDescripcionEn').val('');
	$('#iptActividadAsistenciaDescripcionFr').text('');
	$('#iptActividadAsistenciaDescripcionFr').val('');
	$('#selectActividadAsistenciaEstatus').val('');
	
	$("input[id=iptActividadAsistenciaPromedia]").removeAttr('checked').iCheck('update');
	$('#iptActividadAsistenciaPromediaPorcentaje').prop('disabled', true);
	$('#iptActividadAsistenciaPromediaPorcentaje').prop('value', '0');
}

function cleanActividadExamenDiagnostico(){
	//Clean data
	$('#iptIdActividadExamenDiagnostico').val('');
	$('#iptActividadExamenDiagnosticoNombre').val('');
	$('#iptActividadExamenDiagnosticoNombreEn').val('');
	$('#iptActividadExamenDiagnosticoNombreFr').val('');
	$('#iptActividadExamenDiagnosticoDescripcion').text('');
	$('#iptActividadExamenDiagnosticoDescripcion').val('');
	$('#iptActividadExamenDiagnosticoDescripcionEn').text('');
	$('#iptActividadExamenDiagnosticoDescripcionEn').val('');
	$('#iptActividadExamenDiagnosticoDescripcionFr').text('');
	$('#iptActividadExamenDiagnosticoDescripcionFr').val('');
	$('#selectActividadExamenDiagnosticoEstatus').val('');
	$('#iptActividadExamenDiagnosticoNumeroOportunidades').val("0");
	
	$("input[id=iptActividadExamenDiagnosticoPromedia]").removeAttr('checked').iCheck('update');
	$('#iptActividadExamenDiagnosticoPromediaPorcentaje').prop('disabled', true);
	$('#iptActividadExamenDiagnosticoPromediaPorcentaje').prop('value', '0');
}

function cleanActividadExamenEcop(){
	//Clean data
	$('#iptIdActividadExamenEcop').val('');
	$('#iptActividadExamenEcopNombre').val('');
	$('#iptActividadExamenEcopNombreEn').val('');
	$('#iptActividadExamenEcopNombreFr').val('');
	$('#iptActividadExamenEcopDescripcion').text('');
	$('#iptActividadExamenEcopDescripcion').val('');
	$('#iptActividadExamenEcopDescripcionEn').text('');
	$('#iptActividadExamenEcopDescripcionEn').val('');
	$('#iptActividadExamenEcopDescripcionFr').text('');
	$('#iptActividadExamenEcopDescripcionFr').val('');
	$('#selectActividadExamenEcopEstatus').val('');
	$('#iptActividadExamenEcopPromediaPorcentaje').val('0');
	
	$("input[id=iptActividadExamenEcopCalificacion]").removeAttr('checked').iCheck('update');
	$('#iptActividadExamenEcopCalificacionPorcentaje').prop('disabled', true);
	$('#iptActividadExamenEcopCalificacionPorcentaje').prop('value', '0');
}

function cleanActividadExamenFinalPresencial(){
	//Clean data
	$('#iptIdActividadExamenFinalPresencial').val('');
	$('#iptActividadExamenFinalPresencialNombre').val('');
	$('#iptActividadExamenFinalPresencialNombreEn').val('');
	$('#iptActividadExamenFinalPresencialNombreFr').val('');
	$('#iptActividadExamenFinalPresencialDescripcion').text('');
	$('#iptActividadExamenFinalPresencialDescripcion').val('');
	$('#iptActividadExamenFinalPresencialDescripcionEn').text('');
	$('#iptActividadExamenFinalPresencialDescripcionEn').val('');
	$('#iptActividadExamenFinalPresencialDescripcionFr').text('');
	$('#iptActividadExamenFinalPresencialDescripcionFr').val('');
	$('#selectActividadExamenFinalPresencialEstatus').val('');
	$('#iptActividadExamenFinalPresencialPromediaPorcentaje').val('0');
	$('#iptActividadExamenFinalPresencialNumeroOportunidades').val("0");
	
	$("input[id=iptActividadExamenFinalPresencialCalificacion]").removeAttr('checked').iCheck('update');
	$('#iptActividadExamenFinalPresencialCalificacionPorcentaje').prop('disabled', true);
	$('#iptActividadExamenFinalPresencialCalificacionPorcentaje').prop('value', '0');
}

function cleanActividadExamenDia(){
	//Clean data
	$('#iptIdActividadExamenDia').val('');
	$('#iptActividadExamenDiaNombre').val('');
	$('#iptActividadExamenDiaNombreEn').val('');
	$('#iptActividadExamenDiaNombreFr').val('');
	$('#iptActividadExamenDiaDescripcion').text('');
	$('#iptActividadExamenDiaDescripcion').val('');
	$('#iptActividadExamenDiaDescripcionEn').text('');
	$('#iptActividadExamenDiaDescripcionEn').val('');
	$('#iptActividadExamenDiaDescripcionFr').text('');
	$('#iptActividadExamenDiaDescripcionFr').val('');
	$('#selectActividadExamenDiaEstatus').val('');
	$('#iptActividadExamenDiaPromediaPorcentaje').val('0');
	$('#iptActividadExamenDiaNumeroOportunidades').val("0");
	
	$("input[id=iptActividadExamenDiaCalificacion]").removeAttr('checked').iCheck('update');
	$('#iptActividadExamenDiaCalificacionPorcentaje').prop('disabled', true);
	$('#iptActividadExamenDiaCalificacionPorcentaje').prop('value', '0');
}

function cleanActividadTrabajoDia(){
	//Clean data
	$('#iptIdActividadTrabajoDia').val('');
	$('#iptActividadTrabajoDiaNombre').val('');
	$('#iptActividadTrabajoDiaNombreEn').val('');
	$('#iptActividadTrabajoDiaNombreFr').val('');
	$('#iptActividadTrabajoDiaDescripcion').text('');
	$('#iptActividadTrabajoDiaDescripcion').val('');
	$('#iptActividadTrabajoDiaDescripcionEn').text('');
	$('#iptActividadTrabajoDiaDescripcionEn').val('');
	$('#iptActividadTrabajoDiaDescripcionFr').text('');
	$('#iptActividadTrabajoDiaDescripcionFr').val('');
	$('#selectActividadTrabajoDiaEstatus').val('');
	$('#iptActividadTrabajoDiaPromediaPorcentaje').val('0');
	
	$("input[id=iptActividadTrabajoDiaCalificacion]").removeAttr('checked').iCheck('update');
	$('#iptActividadTrabajoDiaCalificacionPorcentaje').prop('disabled', true);
	$('#iptActividadTrabajoDiaCalificacionPorcentaje').prop('value', '0');
}


function downloadFileScorm(){
	var idActividad = $('#iptIdActividadScorm').val();
	var theUrl = ctx + '/actividad/download?param='+idActividad;
	window.location = theUrl;
//	httpGetAsync(printResponse,idActividad);
}
function downloadFileVideo(){
	var idActividad = $('#iptIdActividadVideo').val();
	var theUrl = ctx + '/actividad/download?param='+idActividad;
	window.location = theUrl;
}
function downloadFileDocumento(){
	var idActividad = $('#iptIdActividadDocumento').val();
	var theUrl = ctx + '/actividad/download?param='+idActividad;
	window.location = theUrl;
}

function httpGetAsync(/*theUrl,*/ callback,idIn){
	var theUrl = ctx + '/actividad/download?param='+idIn;
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function() { 
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
            callback(xmlHttp.responseText);
    }
    xmlHttp.open("GET", theUrl, true); // true for asynchronous 
    xmlHttp.send(null);
}

function printResponse(response){
	console.log(response);
}


function getActividadPreguntas(idCurso, idActividad){
	window.location = ctx+'/lms/actividad?idCurso='+idCurso+'&idActividad='+idActividad;
}


$(document).ready(function() {
	
	// Examen - Activa input
	$('#iptActividadExamenPromedia').on('ifChecked', function(event){
		$('#iptActividadExamenPromediaPorcentaje').prop('disabled', false);
	});
	// Examen - Inactiva input
	$('#iptActividadExamenPromedia').on('ifUnchecked', function(event){
		$('#iptActividadExamenPromediaPorcentaje').prop('disabled', true);
		$('#iptActividadExamenPromediaPorcentaje').prop('value', '0');
	});
	
	
	// Scorm - Activa input
	$('#iptActividadScormPromedia').on('ifChecked', function(event){
		$('#iptActividadScormPromediaPorcentaje').prop('disabled', false);
	});
	// Scorm - Inactiva input
	$('#iptActividadScormPromedia').on('ifUnchecked', function(event){
		$('#iptActividadScormPromediaPorcentaje').prop('disabled', true);
		$('#iptActividadScormPromediaPorcentaje').prop('value', '0');
	});
	
	
	// Video - Activa input
	$('#iptActividadVideoPromedia').on('ifChecked', function(event){
		$('#iptActividadVideoPromediaPorcentaje').prop('disabled', false);
	});
	// Video - Inactiva input
	$('#iptActividadVideoPromedia').on('ifUnchecked', function(event){
		$('#iptActividadVideoPromediaPorcentaje').prop('disabled', true);
		$('#iptActividadVideoPromediaPorcentaje').prop('value', '0');
	});
	
	
	// Documento - Activa input
	$('#iptActividadDocumentoPromedia').on('ifChecked', function(event){
		$('#iptActividadDocumentoPromediaPorcentaje').prop('disabled', false);
	});
	// Documento - Inactiva input
	$('#iptActividadDocumentoPromedia').on('ifUnchecked', function(event){
		$('#iptActividadDocumentoPromediaPorcentaje').prop('disabled', true);
		$('#iptActividadDocumentoPromediaPorcentaje').prop('value', '0');
	});
	
	
	// Encuesta - Activa input
	$('#iptActividadEncuestaPromedia').on('ifChecked', function(event){
		$('#iptActividadEncuestaPromediaPorcentaje').prop('disabled', false);
	});
	// Encuesta - Inactiva input
	$('#iptActividadEncuestaPromedia').on('ifUnchecked', function(event){
		$('#iptActividadEncuestaPromediaPorcentaje').prop('disabled', true);
		$('#iptActividadEncuestaPromediaPorcentaje').prop('value', '0');
	});
	
	
	// Conferencia - Activa input
	$('#iptActividadConferenciaPromedia').on('ifChecked', function(event){
		$('#iptActividadConferenciaPromediaPorcentaje').prop('disabled', false);
	});
	// Conferencia - Inactiva input
	$('#iptActividadConferenciaPromedia').on('ifUnchecked', function(event){
		$('#iptActividadConferenciaPromediaPorcentaje').prop('disabled', true);
		$('#iptActividadConferenciaPromediaPorcentaje').prop('value', '0');
	});
	
	
	// Asistencia - Activa input
	$('#iptActividadAsistenciaPromedia').on('ifChecked', function(event){
		$('#iptActividadAsistenciaPromediaPorcentaje').prop('disabled', false);
	});
	// Asistencia - Inactiva input
	$('#iptActividadAsistenciaPromedia').on('ifUnchecked', function(event){
		$('#iptActividadAsistenciaPromediaPorcentaje').prop('disabled', true);
		$('#iptActividadAsistenciaPromediaPorcentaje').prop('value', '0');
	});
	
	
	// Examen Diagnostico - Activa input
	$('#iptActividadExamenDiagnosticoPromedia').on('ifChecked', function(event){
		$('#iptActividadExamenDiagnosticoPromediaPorcentaje').prop('disabled', false);
	});
	// Examen Diagnostico - Inactiva input
	$('#iptActividadExamenDiagnosticoPromedia').on('ifUnchecked', function(event){
		$('#iptActividadExamenDiagnosticoPromediaPorcentaje').prop('disabled', true);
		$('#iptActividadExamenDiagnosticoPromediaPorcentaje').prop('value', '0');
	});

	// Examen ecop - Activa input (Calificacion minima)
	$('#iptActividadExamenEcopCalificacion').on('ifChecked', function(event){
		$('#iptActividadExamenEcopCalificacionPorcentaje').prop('disabled', false);
	});
	// Examen ecop - Inactiva input (Calificacion minima)
	$('#iptActividadExamenEcopCalificacion').on('ifUnchecked', function(event){
		$('#iptActividadExamenEcopCalificacionPorcentaje').prop('disabled', true);
		$('#iptActividadExamenEcopCalificacionPorcentaje').prop('value', '0');
	});
	
	
	// Examen final - Activa input (Calificacion minima)
	$('#iptActividadExamenCalificacion').on('ifChecked', function(event){
		$('#iptActividadExamenCalificacionPorcentaje').prop('disabled', false);
	});
	// Examen final - Inactiva input (Calificacion minima)
	$('#iptActividadExamenCalificacion').on('ifUnchecked', function(event){
		$('#iptActividadExamenCalificacionPorcentaje').prop('disabled', true);
		$('#iptActividadExamenCalificacionPorcentaje').prop('value', '0');
	});
	
	
	// Examen final presencial - Activa input (Calificacion minima)
	$('#iptActividadExamenFinalPresencialCalificacion').on('ifChecked', function(event){
		$('#iptActividadExamenFinalPresencialCalificacionPorcentaje').prop('disabled', false);
	});
	// Examen final presencial - Inactiva input (Calificacion minima)
	$('#iptActividadExamenFinalPresencialCalificacion').on('ifUnchecked', function(event){
		$('#iptActividadExamenFinalPresencialCalificacionPorcentaje').prop('disabled', true);
		$('#iptActividadExamenFinalPresencialCalificacionPorcentaje').prop('value', '0');
	});
	
	
	// Examen dia - Activa input (Calificacion minima)
	$('#iptActividadExamenDiaCalificacion').on('ifChecked', function(event){
		$('#iptActividadExamenDiaCalificacionPorcentaje').prop('disabled', false);
	});
	// Examen dia - Inactiva input (Calificacion minima)
	$('#iptActividadExamenDiaCalificacion').on('ifUnchecked', function(event){
		$('#iptActividadExamenDiaCalificacionPorcentaje').prop('disabled', true);
		$('#iptActividadExamenDiaCalificacionPorcentaje').prop('value', '0');
	});
	
	
	// Actividad dia - Activa input (Calificacion minima)
	$('#iptActividadTrabajoDiaCalificacion').on('ifChecked', function(event){
		$('#iptActividadTrabajoDiaCalificacionPorcentaje').prop('disabled', false);
	});
	// Actividad dia - Inactiva input (Calificacion minima)
	$('#iptActividadTrabajoDiaCalificacion').on('ifUnchecked', function(event){
		$('#iptActividadTrabajoDiaCalificacionPorcentaje').prop('disabled', true);
		$('#iptActividadTrabajoDiaCalificacionPorcentaje').prop('value', '0');
	});
	
});




