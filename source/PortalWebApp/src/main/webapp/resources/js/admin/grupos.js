newGrupo = function() {
	$('#selectEmpresaGrupo').val(0);
	$('#iptNombreGrupo').val('');
	$('#iptDescripcionGrupo').val('');
	$('#iptCheckPuestoActivo').prop('checked', true);
	$('#iptCheckPuestoActivo').iCheck({
		checkboxClass : 'icheckbox_minimal checked'
	});
	$('#selectEmpresaGrupo').attr('disabled',false);
	
	eliminaMarcaRojo($("#selectEmpresaGrupo"));
	eliminaMarcaRojo($("#iptNombreGrupo"));
	eliminaMarcaRojo($("#iptDescripcionGrupo"));
	$('#modalNewGrupo').modal({
		backdrop : 'static',
		keyboard : false
	});
}

verGrupo = function(id) {
	window.location = ctx + '/grupo?idGrupo=' + id;
}

saveGrupo = function() {

	grupoValid = true;

	if (!notNull($("#iptNombreGrupo"))) {
		grupoValid = false;
	}

	if (!notNull($("#iptDescripcionGrupo"))) {
		grupoValid = false;
	}

	if ($('#selectEmpresaGrupo').val() > 0) {
		eliminaMarcaRojo($("#selectEmpresaGrupo"));
	} else {
		grupoValid = false;
		marcaRojo($("#selectEmpresaGrupo"));
	}

	if (grupoValid) {
		var grupoVO = new Object;
		grupoVO.id = $("#iptIdGrupoPuesto").val();
		grupoVO.idEmpresa = $("#selectEmpresaGrupo").val();
		grupoVO.nombre = $("#iptNombreGrupo").val();
		grupoVO.descripcion = $("#iptDescripcionGrupo").val();

		if ($("#iptCheckPuestoActivo").prop('checked')) {
			grupoVO.banActivo = 1;
		} else {
			grupoVO.banActivo = 0;
		}

		var urltxt = ctx + '/saveGrupo';
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(grupoVO),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					window.location = ctx + '/grupos';
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});

	}else{
		$('#modalDatosObligatorios').modal({
			backdrop : 'static',
			keyboard : false
		});
	}

}


orderArribaGrupo = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenArribaGrupo?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/grupos';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}

orderAbajoGrupo = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenAbajoGrupo?id=' + id;

    $.ajax({
        type: "POST",
        url: urltxt,
        contentType: "application/json",
        beforeSend: function() {
            maskBody();
        },
        complete: function() {
            unmaskBody();
        },
        success: function(response) {

            if (response[0]) {
                window.location = ctx + '/grupos';
            } else {
                $('#modalTxtRespuesta').html('');
                $('#modalTxtRespuesta').append('Error');
                $('#modalRespuesta').modal({ backdrop: 'static', keyboard: false });
            }
        },
        error: function(msg) {
            alert('Error alert');
        }
    });
}


addFuncionario = function(idFuncionario) {

	var funcionarioGrupoVO = new Object;
	funcionarioGrupoVO.idUsuario = idFuncionario;
	funcionarioGrupoVO.idGrupo = $('#iptIdGrupo').val();
	funcionarioGrupoVO.banActivo = 1;

	var urltxt = ctx + '/saveFuncionarioGrupo';

	$
			.ajax({
				type : "POST",
				url : urltxt,
				contentType : "application/json",
				data : JSON.stringify(funcionarioGrupoVO),
				beforeSend : function() {
					$("#wait").css("display", "block");
				},
				complete : function() {
					$("#wait").css("display", "none");
				},
				success : function(response) {
					result = response[0];
					if (result) {
						$('#h4MsgExitoGrupoF').html('');
						$('#h4MsgExitoGrupoF').append(
								'Funcionario agregado con exito');
						$('#modalExitoUsuario').modal({
							backdrop : 'static',
							keyboard : false
						});
					} else {
						$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
					}
				},
				error : function(msg) {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			});
}

addFuncionarios = function() {
	
	var listFuncionarioGrupoVO = [];
	var idGrupo = $('#iptIdGrupo').val();
	
	$("input[name=checkAddF]:checked").each(function(){
		
		var funcionarioGrupoVO = new Object;
		funcionarioGrupoVO.idUsuario = Number($(this).val());
		funcionarioGrupoVO.idGrupo = idGrupo;
		funcionarioGrupoVO.banActivo = 1;
		listFuncionarioGrupoVO.push(funcionarioGrupoVO);
    });


	var urltxt = ctx + '/saveFuncionariosGrupo';

	$.ajax({
				type : "POST",
				url : urltxt,
				contentType : "application/json",
				data : JSON.stringify(listFuncionarioGrupoVO),
				beforeSend : function() {
					$("#wait").css("display", "block");
				},
				complete : function() {
					$("#wait").css("display", "none");
				},
				success : function(response) {
					result = response[0];
					if (result) {
						$('#h4MsgExitoGrupoF').html('');
						$('#h4MsgExitoGrupoF').append(
								'Funcionarios agregados al grupo');
						$('#modalExitoUsuario').modal({
							backdrop : 'static',
							keyboard : false
						});
					} else {
						$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
					}
				},
				error : function(msg) {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			});
}

eliminaFuncionario = function(idFuncionario) {

	var funcionarioGrupoVO = new Object;
	funcionarioGrupoVO.idUsuario = idFuncionario;
	funcionarioGrupoVO.idGrupo = $('#iptIdGrupo').val();
	funcionarioGrupoVO.banActivo = 0;

	var urltxt = ctx + '/saveFuncionarioGrupo';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(funcionarioGrupoVO),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#h4MsgExitoGrupoF').html('');
				$('#h4MsgExitoGrupoF')
						.append('Funcionario eliminado con exito');
				$('#modalExitoUsuario').modal({
					backdrop : 'static',
					keyboard : false
				});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

eliminaFuncionarios = function() {

	var listFuncionarioGrupoVO = [];
	var idGrupo = $('#iptIdGrupo').val();
	
	$("input[name=checkRemoveF]:checked").each(function(){
		
		var funcionarioGrupoVO = new Object;
		funcionarioGrupoVO.idUsuario = Number($(this).val());
		funcionarioGrupoVO.idGrupo = idGrupo;
		funcionarioGrupoVO.banActivo = 0;
		listFuncionarioGrupoVO.push(funcionarioGrupoVO);
    });


	var urltxt = ctx + '/saveFuncionariosGrupo';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(listFuncionarioGrupoVO),
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			if (result) {
				$('#h4MsgExitoGrupoF').html('');
				$('#h4MsgExitoGrupoF')
						.append('Funcionarios eliminados del grupo');
				$('#modalExitoUsuario').modal({
					backdrop : 'static',
					keyboard : false
				});
			} else {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		},
		error : function(msg) {
			$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
		}
	});
}

showAddFuncionario = function() {
	$('#divFuncionariosActivos').hide();
	$('#divFuncionariosNoActivos').show();
}

hideAddFuncionario = function() {
	$('#divFuncionariosNoActivos').hide();
	$('#divFuncionariosActivos').show();
}

checkAllCheckElimina = function(){
	$("input[name=checkRemoveF]:not(:checked)").each(function(){
		$(this).prop('checked', true);
		$(this).iCheck({
			checkboxClass : 'icheckbox_minimal checked'
		});
    });
}

unCheckAllCheckElimina = function(){
	$("input[name=checkRemoveF]:checked").each(function(){
		$(this).prop('checked', false);
		$(this).iCheck({
			checkboxClass : 'icheckbox_minimal'
		});
    });
}

checkAllCheckAdd = function(){
	$("input[name=checkAddF]:not(:checked)").each(function(){
		$(this).prop('checked', true);
		$(this).iCheck({
			checkboxClass : 'icheckbox_minimal checked'
		});
    });
}

unCheckAllCheckAdd = function(){
	$("input[name=checkAddF]:checked").each(function(){
		$(this).prop('checked', false);
		$(this).iCheck({
			checkboxClass : 'icheckbox_minimal'
		});
    });
}

showSendNotificacion = function() {
	$('#selectPrioridad').val(1);
	$('#taMensaje').val('');
	$('#modalNewNotificacion').modal({
		backdrop : 'static',
		keyboard : false
	});
}


showSendEmail = function() {
	$('#selectMotivo').val('');
	// $('#taMensaje').val('');
	$('#modalNewEmail').modal({
		backdrop : 'static',
		keyboard : false
	});
}

sendNotificacionGrupo = function() {

	notificacionValid = true;

	if (!notNull($("#iptTituloNotificacion"))) {
		notificacionValid = false;
	}

	if (!notNull($("#taMensaje"))) {
		notificacionValid = false;
	}

	if (notificacionValid) {
		var envioNotificacion = new Object;
		envioNotificacion.idGrupo = $('#iptIdGrupo').val();
		envioNotificacion.idPrioridad = $('#selectPrioridad').val();
		envioNotificacion.titulo = $('#iptTituloNotificacion').val();
		envioNotificacion.notificacion = $('#taMensaje').val();

		var urltxt = ctx + '/grupos/notificaGrupo';

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(envioNotificacion),
			beforeSend : function() {
				$("#wait").css("display", "block");
			},
			complete : function() {
				$("#wait").css("display", "none");
			},
			success : function(response) {
				result = response[0];
				if (result) {
					$('#modalNewNotificacion').modal('hide');
					$('#modalExitoNotificacion').modal({
						backdrop : 'static',
						keyboard : false
					});
				} else {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}

}

function sendEmailGrupo(idGrupo) {
	var validacionData = true;
	//Esta validacion se quita por que pueden enviarse email sin motivo de contacto
//	if (!notNull($("#selectMotivo"))) {
//		validacionData = false;
//	}

	if (validacionData) {
		maskBody();
		var lengthMotivo = $("#selectMotivo").val()
		if (lengthMotivo.length > 0){
			var idMotivo = Number($('#selectMotivo').val());
			window.location = ctx + '/email?nameFolder=INBOX&param1=' + idGrupo
					+ '&param2=' + idMotivo;
		}else{
			window.location = ctx + '/email?nameFolder=INBOX&param1=' + idGrupo;
		}
	} else {
		displayErrorMessageByObjectId('Error.','Completa los datos obligatorios','modalBodyEmailGrupo');
	}
}

editar = function(id, idEmpresa, nombre, descripcion, activo){
	
	eliminaMarcaRojo($("#selectEmpresaGrupo"));
	eliminaMarcaRojo($("#iptNombreGrupo"));
	eliminaMarcaRojo($("#iptDescripcionGrupo"));

	$('#iptIdGrupoPuesto').val(id);
	$('#selectEmpresaGrupo').val(idEmpresa);
	$('#iptNombreGrupo').val(nombre);
	$('#iptDescripcionGrupo').val(descripcion);
	if(activo == 1){
		$('#iptCheckPuestoActivo').prop('checked', true);
		$('#iptCheckPuestoActivo').iCheck({
			checkboxClass : 'icheckbox_minimal checked'
		});
	}else{
		$('#iptCheckPuestoActivo').prop('checked', false);
		$('#iptCheckPuestoActivo').iCheck({
			checkboxClass : 'icheckbox_minimal'
		});
	}
	$('#selectEmpresaGrupo').attr('disabled',true);
	$('#modalNewGrupo').modal({
		backdrop : 'static',
		keyboard : false
	});
}
function descargarCatGruposContacto() {
	window.open(ctx + '/catalogo/descargarGruposContacto');
}