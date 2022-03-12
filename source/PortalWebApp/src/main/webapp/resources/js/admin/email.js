getMensajesEmail = function(folderName) {
	maskBody();
	window.location = ctx + '/email?nameFolder=' + folderName;
}

getContenidoEmail2 = function(datos) {
	var str = datos;
	str = str.replace("\"[", "[");
	console.log(str);
	var datos2 = str;
	datos2 = datos2.replace("\]\"", "]");
	console.log("datos final:" + datos2);
	var datosJson = JSON.parse(datos2);
	$('#contenidoEmail').html('');
	$('#contenidoEmail').append('');
	var htmlAdd = '<div class="row">' + '<div class="col-sm-10">'
			+ datosJson.receivedDate + '</div></div>' + '<div class="row">'
			+ '<div class="col-sm-10">' + datosJson.from + '</div>' + '</div>'
			+ '<div class="row">' + '<div class="col-sm-10">'
			+ datosJson.subject + '</div>' + '</div>';
	if (datosJson.to != null) {
		htmlAdd += '<div class="row">' + '<div class="col-sm-10">Para:'
				+ datosJson.to + '</div>' + '</div>'
	}
	if (datosJson.to != null) {
		htmlAdd += '<div class="row">' + '<div class="col-sm-10">CC:'
				+ datosJson.cc + '</div>' + '</div>'
	}
	$('#contenidoEmail').append(htmlAdd);
}

getContenidoEmail = function(indice,idEmail,idFolder) {

////	var gt = $('#mail_content_' + indice).html();
//	$('#contenidoEmail').html('');
//	$('#contenidoEmail').append('');
////	$('#contenidoEmail').append(gt);
//	
//	var idStringEmail = $('#email_id_' + indice).val();
//	var idEmail = idStringEmail.replace('email_id_', '');
	var urltxt = ctx + '/email/read' + '?param=' + Number(idEmail);
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
			var msg = response[1];
			if (result) {
				var idUsuarioPredeterminado = $('#idUsuarioPredeterminado').val();
				var emailVO = response[2];
				
				var urltxt = ctx + '/email/content' + '?param1=' + Number(idEmail)+"&param2="+Number(indice)+'&param3='+ Number(idFolder);
				$("#frameContent").attr('src',urltxt);
//				printContentMessage(emailVO, indice ,idUsuarioPredeterminado );
				$('#loop_email_received_' + indice).removeAttr("style");
				$('#loop_email_subject_' + indice).removeClass( "novisto" ).addClass( "visto" );
				console.log(msg);
			} else {
				// displayErrorMessageByObjectId('',msg,'formActividadScorm');
				console.log(msg);
			}
		},
		error : function(msg) {
			// displayErrorMessageByObjectId('Error.','Intenta de
			// nuevo.','formActividadScorm');
			console.log("Error al leer notificacion");
		}
	});
}

function infoFile(files, nameDiv) {
	
	var arrayFiles = $('#files')[0].files;

	var l1 = arrayFiles.length;
	var l2 = files.length;
	
	for (var i = 0; i < arrayFiles.length; i++) {
		var fileName = arrayFiles[i].name;
	}
	
	var d = document.getElementById(nameDiv);
	d.innerHTML = "";
	var list = document.createElement("ul");
	d.appendChild(list);
	for (var i = 0; i < files.length; i++) {
		var li = document.createElement("li");
		list.appendChild(li);
		var info = document.createElement("span");
		info.innerHTML = files[i].name;
		li.appendChild(info);
//		var btn=document.createElement("BUTTON");
//		btn.innerHTML = "x";
//		li.appendChild(btn);
//		btn.addEventListener('click', function () {
//	        this.parentNode.remove();
//	    });
	}

}

newCorreo = function() {
	cleanNewEmailModal(); 
		
	$('#modalNewCorreo').modal({
		backdrop : 'static',
		keyboard : false
	});
	CKEDITOR.instances.iptMensaje.focus();
}

function cleanNewEmailModal() {
	$('#iptPara').val('');
	$('#iptCc').val('');
	$('#iptAsunto').val('');
	$('#iptMensaje').val('');
	$('#fileListNewCorreo').html('');
	
	eliminaMarcaRojo($('#iptPara'));
	CKEDITOR.instances.iptMensaje.setData( '' );
//	document.getElementById("iptPara").style.border = '';
//	document.getElementById("iptCc").style.border = '';
//	document.getElementById('mensajeError').style.color = '';
//	document.getElementById('mensajeError').innerHTML = '';
//	document.getElementById('mensajeErrorRemitente').innerHTML = '';
//	document.getElementById("fileListNewCorreo").innerHTML = '';
}

responderCorreo = function(indice) {
	cleanResponderEmailModal();
	
	var receive = ($('#receive' + indice).val());
	$('#fecha').val(receive);
	var from = $('#from' + indice).val();
	var to = $('#to' + indice).val();
	var subject = document.getElementById("subject" + indice).innerHTML;
	var fecha = document.getElementById("fech" + indice).innerHTML;
	var fechaHeader = "De:" + from + "<br>Enviado el:" + fecha.trim()
			+ "<br>Para:" + to + "<br>Asunto:" + subject + "<br> <br>";
	var conte = document.getElementById("conten" + indice).innerHTML;
	var contenido = fechaHeader + conte;
	$('#iptRespPara').val(from);
	$('#iptRespAsunto').val('RE: '+subject);
	
	var auxContenido = '<br><blockquote type="cite" style="border-left: 2px solid #0b9dcc; padding: 0 0 0 16px;">'
							+contenido+
							'</blockquote>';
	
//	document.getElementById("iptContenidoRes").innerHTML = contenido;
//	document.getElementById("iptMensajeContenidoRes").innerHTML = auxContenido;

	CKEDITOR.instances.iptMensajeContenidoRes.setData( auxContenido );
//	CKEDITOR.instances.iptMensajeContenidoRes.insertHtml( auxContenido );

//	document.getElementById("iptRespPara").style.border = '';
//	document.getElementById("iptRespCc").style.border = '';
//	document.getElementById('mensajeReplyError').style.color = '';
//	document.getElementById('mensajeReplyError').innerHTML = '';
//	document.getElementById("fileListNewCorreo").innerHTML = '';
//	document.getElementById('mensajeErrorRemR').innerHTML = '';
//	document.getElementById("fileListRes").innerHTML = '';
	document.getElementById('files').value= null;
	$("#btnFormResp").off('click').on('click', function() {sendReplyEmail()});
	$('#modalResponder').modal({
		backdrop : 'static',
		keyboard : false
	});
}

function cleanResponderEmailModal() {
	$('#iptRespPara').val('');
	$('#iptRespCc').val('');
	$('#iptRespAsunto').val('');
	$('#fileListNewCorreo').html('');
	
	eliminaMarcaRojo($('#iptRespPara'));
//	CKEDITOR.instances.iptMensajeContenidoRes.setData( '' );
//	document.getElementById("iptPara").style.border = '';
//	document.getElementById("iptCc").style.border = '';
//	document.getElementById('mensajeError').style.color = '';
//	document.getElementById('mensajeError').innerHTML = '';
//	document.getElementById('mensajeErrorRemitente').innerHTML = '';
//	document.getElementById("fileListNewCorreo").innerHTML = '';
}

responderTdsCorreo = function(indice) {
	cleanResponderEmailModal();

//	CKEDITOR.instances.iptMensajeContenidoResT.focus();
	var receive = $('#receive' + indice).val();
	var from = $('#from' + indice).val();
	var to = $('#to' + indice).val();
	var subject = document.getElementById("subject" + indice).innerHTML;
	var fecha = document.getElementById("fech" + indice).innerHTML;
	var fechaHeader = '';
	var cc = $('#cc' + indice).val();//
	if (cc != null) {//
		fechaHeader = " De:" + from + "<br>Enviado el:" + fecha.trim()
				+ "<br>Para:" + to + "<br>CC:" + cc + "<br>Asunto:" + subject
				+ "<br> <br>";

	} else {
		fechaHeader = "De:" + from + "<br>Enviado el:" + fecha.trim()
				+ "<br>Para:" + to + "<br>Asunto:" + subject + "<br> <br>";
	}
	
	var fromAll = $('#fromReplyAll' + indice).val();//
	var array = new Array();//
	array = fromAll.split(',');//
	var energy = array.join();//
	var ccAll = $('#ccReplyAll' + indice).val();//
	var conte = document.getElementById("conten" + indice).innerHTML;
	var contenido = fechaHeader + conte;
//	document.getElementById("iptContenidoResT").innerHTML = contenido;
	$('#fecha').val(receive);
	var idFolderAxu = $('#idFolderResp').val();
	if (idFolderAxu == 1) {
		//INBOX
		$('#iptRespPara').val(from);
		$('#iptRespCc').val(cc);
	}else if (idFolderAxu == 2) {
		//SENT
		$('#iptRespPara').val(to);
		$('#iptRespCc').val(cc);
	}	
	
	$('#iptRespAsunto').val('RE: '+subject);
//	var auxContenido = '<br><blockquote type="cite" style="border-left: 1px solid #0b9dcc;">'+
//							'<div style="opacity: .5;">'+contenido+'</div>'+
//									'</blockquote>';
	var auxContenido = '<br><blockquote type="cite" style="border-left: 2px solid #0b9dcc; padding: 0 0 0 16px;">'
						+contenido+
						'</blockquote>';
	if (ccAll != null) {
		$('#iptRespCc').val(ccAll);
	}
	CKEDITOR.instances.iptMensajeContenidoRes.setData( auxContenido );
//	document.getElementById("iptRespPara").style.border = '';
//	document.getElementById("iptRespCc").style.border = '';
//	document.getElementById('mensajeReplyError').style.color = '';
//	document.getElementById('mensajeReplyError').innerHTML = '';
//	document.getElementById("fileListNewCorreo").innerHTML = '';
//	document.getElementById('mensajeErrorRemR').innerHTML = '';
//	document.getElementById("fileListRes").innerHTML = '';
	document.getElementById('files').value= null;
	
	$("#btnFormResp").off('click').on('click', function() {sendReplyAllEmail()});
	$('#modalResponder').modal({
		backdrop : 'static',
		keyboard : false
	});
	
}
reenviarCorreo = function(indice) {
	cleanResponderEmailModal();
	var receive = $('#receive' + indice).val();
	var from = $('#from' + indice).val();
	var to = $('#to' + indice).val();
	var subject = document.getElementById("subject" + indice).innerHTML;
	var fecha = document.getElementById("fech" + indice).innerHTML;
	var fechaHeader = "De:" + from + "<br>Enviado el:" + fecha.trim()
	+ "<br>Para:" + to + "<br>Asunto:" + subject + "<br> <br>";
	var conte = document.getElementById("conten" + indice).innerHTML;
	var contenido = fechaHeader + conte;
//	document.getElementById("iptContenidoReenviar").innerHTML = contenido;
//	var auxContenido = '<br><blockquote type="cite" style="border-left: 1px solid #0b9dcc;">'+
//	'<div style="opacity: .5;">'+contenido+'</div>'+
//			'</blockquote>';
	var auxContenido = '<br><blockquote type="cite" style="border-left: 2px solid #0b9dcc; padding: 0 0 0 16px;">'
					+contenido+
					'</blockquote>';
	$('#fecha').val(receive);
	$('#iptRespPara').val('');
	$('#iptRespAsunto').val('RV: '+subject);
	$('#iptRespCc').val('');
	
	CKEDITOR.instances.iptMensajeContenidoRes.setData( auxContenido );
//	CKEDITOR.instances.iptMensajeContenidoReenviar.setData( auxContenido );
//	document.getElementById("iptRespPara").style.border = '';
//	document.getElementById("iptRespCc").style.border = '';
//	document.getElementById('mensajeReplyError').style.color = '';
//	document.getElementById('mensajeReplyError').innerHTML = '';
//	document.getElementById("fileListNewCorreo").innerHTML = '';
//	document.getElementById('mensajeErrorRemR').innerHTML = '';
	document.getElementById('files').value= null;
//	document.getElementById("fileListRes").innerHTML = '';
	
	//Poner los nombres de los archivos en la vista
	$('#adjuntosUl li a').each(function(i)
	{
	   var fileNameAux = $(this).text(); // This is your rel value
	   var flagIn = forwardNameFiles.includes(fileNameAux);  
	   if(flagIn == false){
		   forwardNameFiles.push(fileNameAux);
		   var html = '<div class="row">'
						+'<span>'+fileNameAux+'</span>'
						+'&nbsp;<button  onclick="removeFile(this)">'+'x'+'</button>'
					 +'</div>';
		   selDiv.append(html);
	   }
	});
	$("#btnFormResp").off('click').on('click', function() {sendReenviarEmail()});
//	$('#modalReenviar').modal({
		$('#modalResponder').modal({
		backdrop : 'static',
		keyboard : false
	});

}

sendEmail = function(e) {
	e.preventDefault();
	var to = $('#iptPara').val();
	var cc = $('#iptCc').val();
	
	var validacionData = true;
	if (!notNull($("#iptPara"))) {
		validacionData = false;
	}
//	if (!notNull($("#iptCc"))) {
//		validacionData = false;
//	}
	
	var urltxt = ctx + "/email/sendEmail";
	for ( instance in CKEDITOR.instances )
		CKEDITOR.instances[instance].updateElement();
	var formdata = new FormData(document.getElementById("infoForm"));
//	var data = new FormData();
	var arrayFiles = $('#files')[0].files;
	var filesEmpty = [];
	formdata.set('files[]', filesEmpty);	
	for(var i=0, len=storedFiles.length; i<len; i++) {
		formdata.append('files[]', storedFiles[i]);	
	}
//	if (to !== '' || cc !== '') {
	if (validacionData ) {
		$
				.ajax({
					type : 'POST',
					url : urltxt,
					async : true,
					contentType : false,
					processData : false,
					data : formdata,
					enctype : 'multipart/form-data',
					beforeSend : function() {
						maskBody();
					},
					complete : function() {
						unmaskBody();
					},
					success : function(response) {
						result = response[0];
						if (result) {
							window.location = ctx + '/email?nameFolder=INBOX';
						} else {
							var object = response[1];
							if (object.length > 0) {
								var error="";
								for (var i = 0; i < object.length; i++) {
									var idInput = object[i];
									error = idInput;
//									var inputStyle = document
//											.getElementById(idInput);
//									inputStyle.style.border = '1px solid #FF0000';
								}
								marcaRojo($('#iptPara'));
								if (cc.length > 0) {
									marcaRojo($('#iptCc'));
								}								
//								document.getElementById('mensajeErrorRemitente').innerHTML = error;
								displayErrorMessageByObjectId('Error.', ' ' + error, 'infoForm');
							} else {
//								alert("Hubo un error no se envio el correo");
								displayErrorMessageByObjectId('Error.', ' No se envio el correo.', 'infoForm');
							}
						}

					},
					error : function(msg) {
						alert(msg);
					}
				});
	} else {
		displayErrorMessageByObjectId('Error.', ' Especifica al menos un destinatario.', 'infoForm');
//		document.getElementById('mensajeErrorRemitente').innerHTML = '¡Error! especifica al menos un destinatario.';
	}

}

sendReplyEmail = function() {
	var to = $('#iptRespPara').val();
	var validacionData = true;
	if (!notNull($("#iptRespPara"))) {
		validacionData = false;
	}
//	var cc = $('#iptRespCc').val();
//	var contenidoMensaje = document.getElementById("iptRespMensaje").innerHTML
//	var contenidoMensaje = document.getElementById("iptMensajeContenidoRes").innerHTML
//			+ "<br><br><br>"
//			+ "<div style=\"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm 0cm 0cm;\""
//			+ ">" + document.getElementById("iptContenidoRes").innerHTML
//			+ "</div>";
	var urltxt = ctx + "/email/sendReplyEmail";
	for ( instance in CKEDITOR.instances )
		CKEDITOR.instances[instance].updateElement();
	
	var formdata = new FormData(document.getElementById("infoResponderForm"));
	var arrayFiles = $('#files')[0].files;
	var filesEmpty = [];
	formdata.set('files[]', filesEmpty);	
	for(var i=0, len=storedFiles.length; i<len; i++) {
		formdata.append('files[]', storedFiles[i]);	
	}
//	formdata.append('contenidoMens', contenidoMensaje);
	formdata.append('reply', 'false');

//	if (to !== '' || cc !== '') {
	if (validacionData) {
		$
				.ajax({
					type : 'POST',
					url : urltxt,
					async : true,
					contentType : false,
					processData : false,
					data : formdata,
					enctype : 'multipart/form-data',
					beforeSend : function() {
						maskBody();
					},
					complete : function() {
						unmaskBody();
					},
					success : function(response) {
						result = response[0];
						if (result) {
//							window.location = ctx + '/email?nameFolder=INBOX';
							$('#modalResponder').modal('hide');
						} else {
							var object = response[1];
							if (object.length > 0) {
								for (var i = 0; i < object.length; i++) {
									var idInput = object[i];
//									var inputStyle = document
//											.getElementById(idInput);
//									inputStyle.style.border = '1px solid #FF0000';
								}
								marcaRojo($('#iptRespPara'));
								if (cc.length > 0) {
									marcaRojo($('#iptRespCc'));
								}								
//								document.getElementById('mensajeErrorRemitente').innerHTML = error;
								displayErrorMessageByObjectId('Error.', ' ' + error, 'infoResponderForm');
//								document.getElementById('mensajeReplyError').style.color = '#FF0000';
//								document.getElementById('mensajeReplyError').innerHTML = '** El formato del email(s) es incorrecto';
							} else {
//								alert("Hubo un error no se envio el correo");
								displayErrorMessageByObjectId('Error.', ' No se envio el correo.', 'infoResponderForm');
							}
						}

					},
					error : function(msg) {
						alert(msg);
					}
				});

	} else {
//		document.getElementById('mensajeErrorRemR').innerHTML = '!Error especifica al menos un destinatario.';
		displayErrorMessageByObjectId('Error.', ' Especifica al menos un destinatario.', 'infoResponderForm');
	}
}

sendReplyAllEmail = function() {
	var to = $('#iptRespPara').val();
//	var cc = $('#iptRespTCc').val();
	var validacionData = true;
	if (!notNull($("#iptRespPara"))) {
		validacionData = false;
	}
//	var texto = document.getElementById("iptRespTMensaje").innerHTML
//	var texto = document.getElementById("iptMensajeContenidoResT").innerHTML
//			+ "<br><br><br>"
//			+ "<div style=\"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm 0cm 0cm;\""
//			+ ">" + document.getElementById("iptContenidoResT").innerHTML
//			+ "</div>";
	for ( instance in CKEDITOR.instances )
		CKEDITOR.instances[instance].updateElement();
//	var formdata = new FormData(document.getElementById("infoResponderAllForm"));
	var formdata = new FormData(document.getElementById("infoResponderForm"));
	var filesEmpty = [];
	formdata.set('files[]', filesEmpty);	
	for(var i=0, len=storedFiles.length; i<len; i++) {
		formdata.append('files[]', storedFiles[i]);	
	}
//	formdata.append('contenidoMensReplyAll', texto);
	formdata.append('replyTds', 'true');

	var urltxt = ctx + "/email/sendReplyAllEmail";
//	if (to !== '' || cc !== '') {
	if (validacionData ) {
		$
				.ajax({
					type : 'POST',
					url : urltxt,
					async : true,
					contentType : false,
					processData : false,
					data : formdata,
					enctype : 'multipart/form-data',
					beforeSend : function() {
						maskBody();
					},
					complete : function() {
						unmaskBody();
					},
					success : function(response) {
						result = response[0];
						if (result) {
//							window.location = ctx + '/email?nameFolder=INBOX';
//							$('#modalResponderTodos').modal('hide');
							$('#modalResponder').modal('hide');
						} else {
							var object = response[1];
							if (object.length > 0) {
								for (var i = 0; i < object.length; i++) {
									var idInput = object[i];
//									var inputStyle = document
//											.getElementById(idInput);
//									inputStyle.style.border = '1px solid #FF0000';
								}
								marcaRojo($('#iptRespPara'));
								if (cc.length > 0) {
									marcaRojo($('#iptRespCc'));
								}								
//								document.getElementById('mensajeErrorRemitente').innerHTML = error;
								displayErrorMessageByObjectId('Error.', ' ' + error, 'infoResponderForm');
//								document.getElementById('mensajeReplyAllError').style.color = '#FF0000';
//								document.getElementById('mensajeReplyAllError').innerHTML = '** El formato del email(s) es incorrecto';
//								document.getElementById('mensajeReplyError').style.color = '#FF0000';
//								document.getElementById('mensajeReplyError').innerHTML = '** El formato del email(s) es incorrecto';
							} else {
//								alert("Hubo un error no se envio el correo");
								displayErrorMessageByObjectId('Error.', ' No se envio el correo.', 'infoResponderForm');
							}
						}
					},
					error : function(msg) {
						alert(msg);
					}
				});
	} else {
//		document.getElementById('mensajeErrorRemR').innerHTML = '!Error especifica al menos un destinatario.';
		displayErrorMessageByObjectId('Error.', ' Especifica al menos un destinatario.', 'infoResponderForm');
	}
}

sendReenviarEmail = function() {
	var to = $('#iptRespPara').val();
	var validacionData = true;
	if (!notNull($("#iptRespPara"))) {
		validacionData = false;
	}
//	var contenidoMensaje = document.getElementById("iptMensajeContenidoReenviar").innerHTML;
	var urltxt = ctx + "/email/forwardEmail";
	for ( instance in CKEDITOR.instances )
		CKEDITOR.instances[instance].updateElement();
//	var formdata = new FormData(document.getElementById("infoReenviarForm"));
//	var formdata = new FormData(document.getElementById("infoResponderForm"));
//	formdata.append('contenidoMensReenviar', contenidoMensaje);
	
	var formdata = new FormData(document.getElementById("infoResponderForm"));
	var filesEmpty = [];
	formdata.set('files[]', filesEmpty);	
	formdata.set('filesNames[]', filesEmpty);	
	for(var i=0, len=storedFiles.length; i<len; i++) {
		formdata.append('files[]', storedFiles[i]);	
	}
	
	forwardNameFiles.forEach(function (value, index) {
		formdata.append('filesNames[]', value );
	});
	
	if (validacionData) {
		$
				.ajax({
					type : 'POST',
					url : urltxt,
					async : true,
					contentType : false,
					processData : false,
					data : formdata,
					enctype : 'multipart/form-data',
					beforeSend : function() {
						maskBody();
					},
					complete : function() {
						unmaskBody();
					},
					success : function(response) {

						result = response[0];
						if (result) {
//							window.location = ctx + '/email?nameFolder=INBOX';
//							$('#modalReenviar').modal('hide');
							$('#modalResponder').modal('hide');
						} else {
							var object = response[1];
							if (object.length > 0) {
								for (var i = 0; i < object.length; i++) {
									var idInput = object[i];
//									var inputStyle = document
//											.getElementById(idInput);
//									inputStyle.style.border = '1px solid #FF0000';
								}
								marcaRojo($('#iptRespPara'));
								if (cc.length > 0) {
									marcaRojo($('#iptRespCc'));
								}								
//								document.getElementById('mensajeErrorRemitente').innerHTML = error;
								displayErrorMessageByObjectId('Error.', ' ' + error, 'infoResponderForm');
//								document.getElementById('mensajeReenviarError').style.color = '#FF0000';
//								document.getElementById('mensajeReenviarError').innerHTML = '** El formato del email(s) es incorrecto';
//								document.getElementById('mensajeReplyError').style.color = '#FF0000';
//								document.getElementById('mensajeReplyError').innerHTML = '** El formato del email(s) es incorrecto';
							} else {
//								alert("Hubo un error no se envio el correo");
								displayErrorMessageByObjectId('Error.', ' No se envio el correo.', 'infoResponderForm');
							}
						}

					},
					error : function(msg) {
						alert(msg);
					}
				});
	} else {
//		document.getElementById('mensajeErrorRemRenvi').innerHTML = '!Error especifica al menos un destinatario.';
//		document.getElementById('mensajeErrorRemR').innerHTML = '!Error especifica al menos un destinatario.';
		displayErrorMessageByObjectId('Error.', ' Especifica al menos un destinatario.', 'infoResponderForm');
	}
}

function changeStyle(idInput, idMensaje, idMensajeR) {
	var x = document.getElementById(idInput);
	document.getElementById(idInput).style.border = '';
	document.getElementById(idMensaje).style.color = '';
	document.getElementById(idMensaje).innerHTML = '';
	document.getElementById(idMensajeR).innerHTML = '';
}

function showAddEmailAccount() {
	cleanNewEmailAccountForm();
	$('#rowPredeterminadaModal').show();
	// $('#iptActividadScormFile').prop('required',true);
	// $('#actividadScormRowDownload').hide();
	// Muestra modal nueva actividad scorm
	// $('#modalNewActividad').modal('hide');
	$('#modalNewEmailAccount').modal({
		backdrop : 'static',
		keyboard : false
	});
}

function cleanNewEmailAccountForm() {
	$('#usuarioEmailAccount').val('');
	$('#passwordEmailAccount').val('');
	$('#aliasEmailAccount').val('');
	$('#serverInEmailAccount').val('');
	$('#portInEmailAccount').val('');
	$('#serverOutEmailAccount').val('');
	$('#portOutEmailAccount').val('');
	$('#defaultEmailAccount').prop('checked', false);
	
	eliminaMarcaRojo($('#usuarioEmailAccount'));
	eliminaMarcaRojo($('#passwordEmailAccount'));
	eliminaMarcaRojo($('#aliasEmailAccount'));
	eliminaMarcaRojo($('#serverInEmailAccount'));
	eliminaMarcaRojo($('#portInEmailAccount'));
	eliminaMarcaRojo($('#serverOutEmailAccount'));
	eliminaMarcaRojo($('#portOutEmailAccount'));
}

function saveNewEmailAccount() {
	var validacionData = true;
	var idEmail = $('#idEmailAccount').val();
	if (!notNull($("#usuarioEmailAccount"))) {
		validacionData = false;
	}else{
		if(!isEmail($("#usuarioEmailAccount").val())){
			displayErrorMessageByObjectId('',
					' Ingresa una dirección de correo válida', 'emailForm');
			return;
		}
	}
	if (!notNull($("#passwordEmailAccount"))) {
		validacionData = false;
	}
	if (!notNull($("#serverInEmailAccount"))) {
		validacionData = false;
	}
	if (!notNull($("#portInEmailAccount"))) {
		validacionData = false;
	}
	if (!notNull($("#serverOutEmailAccount"))) {
		validacionData = false;
	}
	if (!notNull($("#portOutEmailAccount"))) {
		validacionData = false;
	}

	if (validacionData) {
		var edicionFlag = false;
		var UsuarioEmailVO = new Object;
		var urlSend = ctx + '/email/saveAccount';
		var idAccount = $('#idEmailAccount').val();
		var usuario = $('#usuarioEmailAccount').val();
		var pass = $('#passwordEmailAccount').val();
		var alias = $('#aliasEmailAccount').val();
		var serverIn = $('#serverInEmailAccount').val();
		var portIn = $('#portInEmailAccount').val();
		var serverOut = $('#serverOutEmailAccount').val();
		var porOut = $('#portOutEmailAccount').val();
		var predeterminada = $('#defaultEmailAccount').is(":checked");
		if (idAccount.length > 0) {
			UsuarioEmailVO.id = idAccount;
			edicionFlag = true;
		}
		UsuarioEmailVO.usuario = usuario;
		UsuarioEmailVO.contrasenia = pass;
		UsuarioEmailVO.alias = alias;
		UsuarioEmailVO.servidorEntrada = serverIn;
		UsuarioEmailVO.puertoEntrada = portIn;
		UsuarioEmailVO.servidorSalida = serverOut;
		UsuarioEmailVO.puertoSalida = porOut;
		if (predeterminada) {
			UsuarioEmailVO.banPredeterminado = 1;
		} else {
			UsuarioEmailVO.banPredeterminado = 0;
		}

		$.ajax({
			type : "POST",
			url : urlSend,
			contentType : "application/json",
			data : JSON.stringify(UsuarioEmailVO),
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
					var usuarioEmailRes = response[2];
					if (edicionFlag) {
						window.location = ctx + '/email?nameFolder=INBOX';
					} else {
						maskDiv("contentEmailJSP",'Espera mientras se descargan los mensajes. Esto puede tardar varios minutos....');
						$('#modalNewEmailAccount').hide();
						refreshEmail(false,usuarioEmailRes.id);
					}
					displaySuccesMessageByObjectId('', msg, 'emailForm');
				} else {
					displayErrorMessageByObjectId('', msg, 'emailForm');
				}
			},
			error : function(msg) {
				displayErrorMessageByObjectId('Error.', ' Intenta de nuevo.',
						'emailForm');
			}
		});
	} else {
		displayErrorMessageByObjectId('Error.',
				' Completa los datos obligatorios', 'emailForm');
	}

}

function changeAccount(idUsuarioEmail) {
	var urltxt = ctx + '/email/predeterminado' + '?param=' + Number(idUsuarioEmail);
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			
		},
		success : function(response) {
			var result = response[0];
			var msg = response[1];
			if (result) {
				window.location = ctx
				+ '/email?nameFolder=INBOX';
				console.log(msg);
			} else {
				// displayErrorMessageByObjectId('',msg,'formActividadScorm');
				console.log(msg);
				unmaskBody();
			}
		},
		error : function(msg) {
			unmaskBody();
			// displayErrorMessageByObjectId('Error.','Intenta de
			// nuevo.','formActividadScorm');
			console.log("Error al cambiar de cuenta de email");
		}
	});
}

function settingsEmail(idUsuarioEmail, usuario, pass, alias, serverIn,
		puertoIn, serverOut, puertoOut) {
	cleanNewEmailAccountForm();
	$('#rowPredeterminadaModal').hide();
	$('#idEmailAccount').val(idUsuarioEmail);
	$('#usuarioEmailAccount').val(usuario);
	$('#passwordEmailAccount').val(pass);
	$('#aliasEmailAccount').val(alias);
	$('#serverInEmailAccount').val(serverIn);
	$('#portInEmailAccount').val(puertoIn);
	$('#serverOutEmailAccount').val(serverOut);
	$('#portOutEmailAccount').val(puertoOut);
	// Muestra modal nueva actividad scorm
	$('#modalNewEmailAccount').modal({
		backdrop : 'static',
		keyboard : false
	});
}

function refreshEmail(reload,idNewUserEmail) {
	var validacionData = true;
	if (!notNull($("#idUsuarioEmailPredeterminado"))) {
		validacionData = false;
	}

	if (validacionData) {
		var idUsuarioEmailPredeterminado = $('#idUsuarioEmailPredeterminado').val();
		var idUsuarioPredeterminado = $('#idUsuarioPredeterminado').val();

		if (idNewUserEmail !== undefined) {
			idUsuarioEmailPredeterminado = idNewUserEmail;
		}
		var idFolerAux = $('#idFolderEmail').val();
		var urlSend = ctx + '/email/getMensajes?param='
				+ Number(idUsuarioEmailPredeterminado);
		$
				.ajax({
					type : "POST",
					url : urlSend,
					contentType : "application/json",
					// data : JSON.stringify(UsuarioEmailVO),
					beforeSend : function() {
						var divBlink = '<a id=\"blinkLoadEmail\" class=\"blink blink-two\">Comprobando mensajes...</a>&nbsp;&nbsp;'
						$('#idSectionDropdown').prepend(divBlink);
						$("#idbtnRefresh").attr('disabled','disabled');
						if(reload !== undefined)
							if (reload) {
								var divOverlay = $("#maskId");
								if(divOverlay.length <= 0){
									maskBody();
								}else{
									
								}
							} else {
//								var divBlink = '<a id=\"blinkLoadEmail\" class=\"blink blink-two\">Comprobando mensajes...</a>&nbsp;&nbsp;'
//								$('#idSectionDropdown').prepend(divBlink);
							}
					},
					complete : function() {
						var divBlink = $("#blinkLoadEmail");
						 divBlink.remove();
						 $('#idbtnRefresh').removeAttr('disabled');
						if(reload !== undefined)
							if (reload) {								
								var divOverlay = $("#overlayId");
								if(divOverlay.length <= 0){
									unmaskBody();
								}else{
									unmaskDiv();
								}
							} else {
//								 var divBlink = $("#blinkLoadEmail");
//								 divBlink.remove();
							}
					},
					success : function(response) {
						var result = response[0];
						var msg = response[1];
						if (result) {
							$("#blinkLoadEmail").text('Ok');
							// Agregar aqui la descarga de los mensajes
							if (reload) {
								window.location = ctx + '/email?nameFolder=INBOX';
							}else{
								if (idNewUserEmail !== undefined){
									window.location = ctx + '/email?nameFolder=INBOX';
								}else{								
									var lstEmailVO = response[2];
									if (lstEmailVO != null && lstEmailVO.length>0) {
										var indexAux = lstEmailVO.length;
	//									for (var i = 0; i < lstEmailVO.length; i++) {
										var count = 0;
										for (var i = indexAux-1; i >= 0; i--) {
											var emailVO = lstEmailVO[i];
											var loopIndex = emailVO.sizeMail;
											loopIndex = loopIndex + count ;
											if (idFolerAux == emailVO.idFolder) {
												printNewMessage(emailVO,loopIndex,idUsuarioEmailPredeterminado,idUsuarioPredeterminado,idFolerAux);
											}											
											count++;
										}
									}		
								}
							}
							// displaySuccesMessageByObjectId('', msg,
							// 'emailForm');
							console.log("Obtención de email correctamente -> "
									+ msg);
							
						} else {
							$("#blinkLoadEmail").text('Error');
							// displayErrorMessageByObjectId('', msg,
							// 'emailForm');
							console
									.log("Error en obtención de email correctamente -> "
											+ msg);
						}
					},
					error : function(msg) {
						displayErrorMessageByObjectId('Error.',
								'Error en la operación.', 'sectionHeaderEmail');
					}
				});
	} else {
		displayErrorMessageByObjectId('Error.', 'Email predeterminado',
				'sectionHeaderEmail');
	}

}

function printNewMessage(emailVO,loopIndex,idUsuarioEmail,idUsuario,idFolerAux){
	var html = '<tr style="cursor: pointer;" onclick="getContenidoEmail('+loopIndex+','+emailVO.id+','+idFolerAux+');">'+
				'<td>'+
				'<div class="row">'+
					'<div class="col-sm-10 m-From">'+emailVO.from+'</div>'+
				'</div>'+
				'<div class="row">';
	var styleAux = 'style="color: #017DAD; font-weight: bold;"';
	var classAux ="novisto";
	var arrayEstatus =  emailVO.estatus.split(';');
	if (arrayEstatus != null && arrayEstatus.length>0) {
		for (var ii = 0; ii < arrayEstatus.length; ii++) {
			var estatusAux = arrayEstatus[ii];
			if (estatusAux.toUpperCase() == 'SEEN' ) {
//				styleAux = 'style="width: 270px; overflow: hidden;"';
				styleAux = '';
				classAux ="visto";
			}
		}
	}
	var receivedDateAux = '';
	var receivedDateAuxDays = '';
	var receivedDateAuxHrs = '';	
	if (emailVO.receivedDate != null ) {
		var received = emailVO.receivedDate;
		if (received.toString().length > 0) {		
			receivedDateAux = new Date(emailVO.receivedDate);
			receivedDateAuxDays = moment(receivedDateAux).format('yyyy-MM-DD');
			receivedDateAuxHrs = moment(receivedDateAux).format('DD/MM/yyyy hh:mm:ss');		
		}
	}
		html += '<div id="loop_email_subject_'+loopIndex+'" class="col-sm-10 '+classAux+'" >'+emailVO.subject+'</div>'+
				'</div>'+
				'</td>'+
				'<td class="text-center m-Date">'+
				'<div class="row">'+
				'<div id="loop_email_received_'+loopIndex+'"  '+styleAux+'>'+receivedDateAuxDays+'</div>'+
			'</div>'+
		'</td>';
//		html += '<td style="display: none;"> '+
//			'<div id="mail_content_'+loopIndex+'"> '+
//			'<input type="hidden" id="email_id_'+loopIndex+'" value="'+emailVO.id+'"> '+
//				'<div class="row"> '+
//					'<div class="col-md-2"> '+
//						'<div class="user-panel"> '+
//							'<div class="pull-left image"> '+
//								'<img '+
//									'src="'+ctx+'/resources/css/img/imagen_usuario.png" '+
//									'class="img-circle" alt="User Image" '+
//									'style="width: 60px; height: 60px; border: 0px;" /> '+
//							'</div> '+
//						'</div> '+
//					'</div> '+
//					'<div class="col-md-10"> '+
//						'<div class="row"> '+
//							'<div class="col-sm-10" id="fech'+loopIndex+'"> '+
//								receivedDateAuxHrs +
//							'</div> '+
//							'<div style="display: none;"> '+
//								'<input type="text" id="receive'+loopIndex+'" '+
//									'name="receive'+loopIndex+'" '+
//									'value="'+receivedDateAuxHrs+'"> '+
//							'</div> '+
//						'</div> ';
//		
//		var fromAux = '';
//		var responderAllAux = '';
//		if (emailVO.fromAux != null && emailVO.fromAux.length > 0) {
//			fromAux = emailVO.from.replace(/["]/g, "");
//		}
//		if (emailVO.responderAll != null && emailVO.responderAll.length > 0) {
//			responderAllAux = emailVO.responderAll.replace(/["]/g, "");
//		}
//				html += '<div class="row"> '+
//							'<div class="col-sm-10">'+emailVO.from+'</div> '+
//							'<div style="display: none;"> '+
//								'<input type="text" id="from'+loopIndex+'" '+
//									'name="from'+loopIndex+'" '+
//									'value="'+fromAux+'"> '+
//								'<input type="text" id="fromReplyAll'+loopIndex+'" '+
//									'name="fromReplyAll'+loopIndex+'" '+
//									'value="'+responderAllAux+'"> '+
//							'</div> '+
//						'</div> '+
//						'<div class="row"> '+
//							'<div id="subject'+loopIndex+'" class="col-sm-10">'+emailVO.subject+'</div> '+
//						'</div> '+
//					'</div> '+
//				'</div> ';
//		var toAux = '';
//		if (emailVO.to != null && emailVO.to.length > 0) {
//			toAux = emailVO.to.replace(/["]/g, "");
//		}
//		html += '<div class="row">'+
//						'<div class="col-sm-1"> '+
//							'<span>To: </span> '+
//						'</div> '+
//						'<div class="col-sm-11">'+toAux+'</div> '+
//						'<div style="display: none;"> '+
//							'<input type="text" id="to'+loopIndex+'" '+
//							'	name="to'+loopIndex+'" '+
//							'	value="'+toAux+'"> '+
//						'</div> '+
//					'</div> ';
//		var ccAux = '';
//		if (emailVO.cc != null && emailVO.cc.length > 0) {
//			ccAux = emailVO.cc.replace(/["]/g, "");
//		}
//		var ccReplyAll = '';
//		if (emailVO.responderAllCC != null && emailVO.responderAllCC.length > 0) {
//			ccReplyAll = emailVO.responderAllCC.replace(/["]/g, "");
//		}
//		html += '<div class="row">'+
//					'<div class="row"> '+
//						'<div class="col-sm-1"> '+
//						'	<span>CC: </span> '+
//						'</div> '+
//						'<div class="col-sm-11">'+emailVO.cc+'</div> '+
//						'<div style="display: none;"> '+
//						'	<input type="text" id="cc'+loopIndex+'" '+
//							'	name="cc'+loopIndex+'" '+
//							'	value="'+ccAux+'"> '+
//							'<input type="text" id="ccReplyAll'+loopIndex+'" '+
//							'	name="ccReplyAll'+loopIndex+'" '+
//							'	value="'+ccReplyAll+'"> '+
//						'</div> '+
//					'</div> '+
//				'<br> ';
//		html += '<div class="row" style="border-bottom: 1px solid #ddd;">'+ 
//					'<button type="button" class="btn btn-cont" '+
//					'	onclick="responderCorreo('+loopIndex+');"> '+
//					'	<span role="link" class="ams bkH">Responder</span> '+
//					'</button> '+
//					'<button type="button" class="btn btn-cont" '+
//					'	onclick="responderTdsCorreo('+loopIndex+');"> '+
//					'	<span role="link" class="ams bkI">Responder a todos</span> '+
//					'</button> '+
//					'<button type="button" class="btn btn-cont" '+
//					'	onclick="reenviarCorreo('+loopIndex+');"> '+
//					'	<span role="link" class="ams bkG">Reenviar</span> '+
//					'</button> '+
//				'</div> ';
//		if (emailVO.lstFilesNames != null && emailVO.lstFilesNames.length > 0) {
//			html += '<div class="row " style="border-bottom: 1px solid #ddd;">'+
//						'<ul class="menuEmail ">';
//			for (var iii= 0; iii < emailVO.lstFilesNames.length; iii++) {
//				var fileName = emailVO.lstFilesNames[iii];
//				html += '<li class="active">'+
//							'<a '+
//							' href="'+ctx+'/email/downloadFile?idUser='+idUsuario+'&name='+fileName+'&idEmail='+emailVO.idMessage+'" '+
//							' target="_blank" class="text-center">'+fileName+'</a> '+
//						'</li> ';
//			}
//				html += '</ul>'+
//					'</div>';
//		}	
//		html += '<div class="row">'+
//					'<div id="conten'+loopIndex+'" class="col-sm-10">';
//		if (emailVO.message != null && emailVO.message.length > 0) {
//			html += emailVO.message;
//		}
//		html += 	'</div>'+
//				'</div>'+
//				'</td>'+
		html += '</tr>';
		$('#example1 > tbody').prepend(html);
}

function printContentMessage(emailVO,loopIndex,idUsuario){
//	var html = '<tr style="cursor: pointer;" onclick="getContenidoEmail('+loopIndex+');">'+
//	'<td>'+
////	'<div class="row">'+
//////	'<div class="col-sm-10">'+emailVO.from+'</div>'+
////	'</div>'+
////	'<div class="row">';
////	var styleAux = 'style="color: #36A7DF; font-weight: bold;"';			
////	var arrayEstatus =  emailVO.estatus.split(';');
////	if (arrayEstatus != null && arrayEstatus.length>0) {
////		for (var ii = 0; ii < arrayEstatus.length; ii++) {
////			var estatusAux = arrayEstatus[ii];
////			if (estatusAux.toUpperCase() == 'SEEN' ) {
////				styleAux = ' ';
////			}
////		}
////	}
////	var receivedDateAux = '';
////	var receivedDateAuxHrs = '';
////	if (emailVO.receivedDate != null && emailVO.receivedDate.length > 0) {
////		receivedDateAux = new Date(emailVO.receivedDate);
////		receivedDateAux = moment(receivedDateAux).format('DD/MM/yyyy');
////		receivedDateAuxHrs = moment(receivedDateAux).format('DD/MM/yyyy  hh:mm:ss');
////	}
////	html += '<div id="loop_email_subject_'+loopIndex+'" class="col-sm-10" '+styleAux+'>'+emailVO.subject+'</div>'+
////	'</div>'+
//	'</td>'+
//	'<td>'+
////	'<div class="row">'+
//////	'<div id="loop_email_received_'+loopIndex+'" class="col-sm-10" '+styleAux+'>'+receivedDateAux+'</div>'+
////	'</div>'+
//	'</td>';
	
	
	
//	html += '<td style="display: none;"> '+
	var receivedDateAux = '';
	var receivedDateAuxHrs = '';
	if (emailVO.receivedDate != null && emailVO.receivedDate.length > 0) {
		receivedDateAux = new Date(emailVO.receivedDate);
		receivedDateAux = moment(receivedDateAux).format('DD/MM/yyyy');
		receivedDateAuxHrs = moment(receivedDateAux).format('DD/MM/yyyy  hh:mm:ss');
	}
	
	
	
	var html = '<div id="mail_content_'+loopIndex+'"> '+
	'<input type="hidden" id="email_id_'+loopIndex+'" value="'+emailVO.id+'"> '+
	'<div class="row info-mail"> '+
	'<div class="col-xs-2"> '+
	'<div class="user-panel"> '+
	'<div class="pull-left image"> '+
	'<img '+
	'src="'+ctx+'/resources/css/img/imagen_usuario.png" '+
	'class="img-circle" alt="User Image" '+
	'style="width: 60px; height: 60px; border: 0px;" /> '+
	'</div> '+
	'</div> '+
	'</div> '+
	'<div class="col-xs-10"> '+
	'<div class="row"> '+
	'<div class="col-sm-12" id="fech'+loopIndex+'"> '+
	'<span>Fecha: </span>'+
	receivedDateAuxHrs +
	'</div> '+
	'<div style="display: none;"> '+
	'<input type="text" id="receive'+loopIndex+'" '+
	'name="receive'+loopIndex+'" '+
	'value="'+receivedDateAuxHrs+'"> '+
	'</div> '+
	'</div> ';
	
	var fromAux = '';
	var responderAllAux = '';
	if (emailVO.fromAux != null && emailVO.fromAux.length > 0) {
		fromAux = emailVO.from.replace(/["]/g, "");
	}
	if (emailVO.responderAll != null && emailVO.responderAll.length > 0) {
		responderAllAux = emailVO.responderAll.replace(/["]/g, "");
	}
	html += '<div class="row"> '+
	'<div class="col-sm-12">'+
	'<span>De: </span>'+
	emailVO.from+'</div> '+
	'<div style="display: none;"> '+
	'<input type="text" id="from'+loopIndex+'" '+
	'name="from'+loopIndex+'" '+
	'value="'+fromAux+'"> '+
	'<input type="text" id="fromReplyAll'+loopIndex+'" '+
	'name="fromReplyAll'+loopIndex+'" '+
	'value="'+responderAllAux+'"> '+
	'</div> '+
	'</div> '+
	'<div class="row"> '+
	'<div id="subject'+loopIndex+'" class="col-sm-12 sbjctMail">'+
	emailVO.subject+'</div> '+
	'</div> '
	var toAux = '';
	if (emailVO.to != null && emailVO.to.length > 0) {
		toAux = emailVO.to.replace(/["]/g, "");
	}
	html += '<div class="row">'+
	'<div class="col-sm-12">'+
	'<span>Para: </span>'+
	toAux+
	'</div> '+
	'<div style="display: none;"> '+
	'<input type="text" id="to'+loopIndex+'" '+
	'	name="to'+loopIndex+'" '+
	'	value="'+toAux+'"> '+
	'</div> '+
	'</div> ';
	var ccAux = '';
	if (emailVO.cc != null && emailVO.cc.length > 0) {
		ccAux = emailVO.cc.replace(/["]/g, "");
	}
	var ccReplyAll = '';
	if (emailVO.responderAllCC != null && emailVO.responderAllCC.length > 0) {
		ccReplyAll = emailVO.responderAllCC.replace(/["]/g, "");
	}
	html += '<div class="row">'+
//	'<div class="row"> '+
	'<div class="col-sm-12">'+
	'	<span>CC: </span> '+
	emailVO.cc+
	'</div> '+
	'<div style="display: none;"> '+
	'	<input type="text" id="cc'+loopIndex+'" '+
	'	name="cc'+loopIndex+'" '+
	'	value="'+ccAux+'"> '+
	'<input type="text" id="ccReplyAll'+loopIndex+'" '+
	'	name="ccReplyAll'+loopIndex+'" '+
	'	value="'+ccReplyAll+'"> '+
	'</div> '+
	'</div> '+
	'</div> '+
	'</div> ';

	html += '<div class="row col-md-10 actions-mail">'+ 
	'<button type="button" class="btn btn-cont" '+
	'	onclick="responderCorreo('+loopIndex+');"> '+
	'	<span role="link" class="ams bkH">Responder</span> '+
	'</button> '+
	'<button type="button" class="btn btn-cont" '+
	'	onclick="responderTdsCorreo('+loopIndex+');"> '+
	'	<span role="link" class="ams bkI">Responder a todos</span> '+
	'</button> '+
	'<button type="button" class="btn btn-cont" '+
	'	onclick="reenviarCorreo('+loopIndex+');"> '+
	'	<span role="link" class="ams bkG">Reenviar</span> '+
	'</button> '+
	'</div> ';
	if (emailVO.lstFilesNames != null && emailVO.lstFilesNames.length > 0) {
		html += '<div class="row " style="border-bottom: 1px solid #ddd;">'+
		'<ul class="menuEmail ">';
		for (var iii= 0; iii < emailVO.lstFilesNames.length; iii++) {
			var fileName = emailVO.lstFilesNames[iii];
			html += '<li class="active">'+
			'<a '+
			' href="'+ctx+'/email/downloadFile?idUser='+idUsuario+'&name='+fileName+'&idEmail='+emailVO.idMessage+'" '+
			' target="_blank" class="text-center">'+fileName+'</a> '+
			'</li> ';
		}
		html += '</ul>'+
		'</div>';
	}	
	html += '<div class="row">'+
	'<div id="conten'+loopIndex+'" class="col-sm-10">';
	if (emailVO.message != null && emailVO.message.length > 0) {
		html += emailVO.message;
	}
	html += 	'</div>'+
	'</div>';
	$('#contenidoEmail').append(html);
	
//	'</td>'+
//	'</tr>';
//	$('#example1 > tbody').prepend(html);
}

function getDataMotivo(idMotivo){
	console.log("-----Obteniendo contenido-----");
	var urltxt = ctx + '/email/getMotivoContent?param1='+idMotivo;
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
			var msg = response[1];
			if (result) {
				var motivoVO = response[2];
				$('#iptAsunto').val(motivoVO.motivoContacto);
				var dataHtml = motivoVO.template;
				CKEDITOR.instances.iptMensaje.setData( motivoVO.template );
//				CKEDITOR.instances.iptMensaje.dataProcessor.toDataFormat( dataHtml );
				for ( instance in CKEDITOR.instances )
					CKEDITOR.instances[instance].updateElement();
			} else {
				displayErrorMessageByObjectId('', msg, 'infoForm');
			}
		},
		error : function(msg) {
			displayErrorMessageByObjectId('Error.', 'Ocurrió un error en la consulta.',
					'infoForm');
		}
	});
	
}

function putDataTo(emailPrincipal,emailAdicional){
	var paraEmail = $('#iptPara').val();
	if (paraEmail.length > 0) {
		paraEmail += ',';
	}
	if (emailPrincipal.length > 0) {
		paraEmail += emailPrincipal;
		if (emailAdicional.length > 0) {
			paraEmail += ',' + emailAdicional;
		}
	}
	$('#iptPara').val(paraEmail);
}

function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
	}

function InvalidMsg(textbox) {
//    if (textbox.value === '') {
//        textbox.setCustomValidity('Required email address');
//    } else 
    	if (textbox.validity.typeMismatch){
        textbox.setCustomValidity('Ingresa una dirección válida');
    } else {
       textbox.setCustomValidity('');
    }

    return true;
}

function handleFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	filesArr.forEach(function(f) {			
//		if(!f.type.match("image.*")) {
//			return;
//		}
//		var saux = f.name;
		var auxName = f.name.replace(/\u2013|\u2014/g, "_");
//		f.name = saux.replace(/\p{Pd}/, "-");
		
//		var element = document.GetElementById('fileupload1');
//		var file = element.files[0];
		var blob = f.slice(0, f.size, f.type); 
		newFile = new File([blob], auxName, {type: f.type});
		
		storedFiles.push(newFile);
		var reader = new FileReader();
		reader.onload = function (e) {
			
//			var html = "<div><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selFile' title='Click to remove'>" + f.name +
//						"<br clear=\"left\"/>" +
//						"" +
//						"</div>";
//			var html ='<ul>'+
			var html = '<div class="row">'
						+'<span>'+f.name+'</span>'
						+'&nbsp;<button  onclick="removeFile(this)">'+'x'+'</button>'
					+'</div>';
			selDiv.append(html);
		}
		reader.readAsDataURL(f); 
	});
	document.getElementById('files').value= null;
}
	
function handleForm(e) {
	e.preventDefault();
	var data = new FormData();
	
	for(var i=0, len=storedFiles.length; i<len; i++) {
		data.append('files', storedFiles[i]);	
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open('POST', 'handler.cfm', true);
	
	xhr.onload = function(e) {
		if(this.status == 200) {
			console.log(e.currentTarget.responseText);	
			alert(e.currentTarget.responseText + ' items uploaded.');
		}
	}
	
	xhr.send(data);
}
	
function removeFile(obj) {
	var file = $(this).data("file");
	var file = $(obj).parent().find("span").text();
		
	for(var i=0;i<storedFiles.length;i++) {
		if(storedFiles[i].name === file) {
			storedFiles.splice(i,1);
			break;
		}
	}
	for(var i=0;i<forwardNameFiles.length;i++) {
		var auxS = forwardNameFiles[i];
		if(auxS == file) {
			forwardNameFiles.splice(i,1);
			break;
		}
	}
	$(obj).parent().remove();
}


