/**
 * 
 */

function showNewMessage() {
	cleanData();
	$('#sectionNewHiloContacto').show();
}
function hideNewMessage() {
	$('#sectionNewHiloContacto').hide();
}
function saveNewHiloContacto(idForm, idHiloPadre) {
	// var titulo = $('#sectionNewHiloContactoTitulo').val();
	// var mensaje = $('#sectionNewHiloContactoMensaje').text();
	validacionData = true;
	if (idForm == 'sectionNewHiloContactoFormRespuesta'+idHiloPadre) {
		if (!notNull($("#sectionNewHiloContactoMensajeRespuesta"+idHiloPadre))) {
			validacionData = false;
		}
	} else if (idForm == 'sectionNewHiloContactoForm') {

		if (!notNull($("#sectionNewHiloContactoTitulo"))) {
			validacionData = false;
		}
		if (!notNull($("#sectionNewHiloContactoMensaje"))) {
			validacionData = false;
		}
		
	}
	if (validacionData) {
		var HiloContactoVO = new Object;
		var urltxt = ctx + '/lms/contacto/save';

		if (idForm == 'sectionNewHiloContactoFormRespuesta'+idHiloPadre) {
			HiloContactoVO.mensaje = $(
					'#sectionNewHiloContactoMensajeRespuesta'+idHiloPadre).val();
			if (idHiloPadre.length > 0) {
				HiloContactoVO.idHiloContactoPadre = idHiloPadre;
			}
		} else if (idForm == 'sectionNewHiloContactoForm') {
			HiloContactoVO.titulo = $('#sectionNewHiloContactoTitulo').val();
			HiloContactoVO.mensaje = $('#sectionNewHiloContactoMensaje').val();
			if (idHiloPadre.length > 0) {
				HiloContactoVO.idHiloContactoPadre = idHiloPadre;
			}
		}

		HiloContactoVO.estatusMensaje(1);
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(HiloContactoVO),
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
					window.location = ctx + '/lms/contacto';
					if (idForm == 'sectionNewHiloContactoFormRespuesta') {
						displaySuccesMessageByObjectId('', msg,
								'sectionNewHiloContactoFormRespuesta');
					} else if (idForm == 'sectionNewHiloContactoForm') {
						displaySuccesMessageByObjectId('', msg,
								'sectionNewHiloContactoForm');
					}
				} else {
					if (idForm == 'sectionNewHiloContactoFormRespuesta') {
						displayErrorMessageByObjectId('', msg,
								'sectionNewHiloContactoFormRespuesta');
					} else if (idForm == 'sectionNewHiloContactoForm') {
						displayErrorMessageByObjectId('', msg,
								'sectionNewHiloContactoForm');
					}
				}
			},
			error : function(msg) {
				if (idForm == 'sectionNewHiloContactoFormRespuesta') {
					displayErrorMessageByObjectId('Error.', 'Intenta de nuevo.',
					'sectionNewHiloContactoFormRespuesta');
				} else if (idForm == 'sectionNewHiloContactoForm') {
					displayErrorMessageByObjectId('Error.', 'Intenta de nuevo.',
					'sectionNewHiloContactoForm');
				}
			}
		});
	} else {
		if (idForm == 'sectionNewHiloContactoFormRespuesta') {
			displayErrorMessageByObjectId('Error.',
					'Completa los datos obligatorios', 'sectionNewHiloContactoFormRespuesta');
		} else if (idForm == 'sectionNewHiloContactoForm') {
			displayErrorMessageByObjectId('Error.',
					'Completa los datos obligatorios', 'sectionNewHiloContactoForm');
		}
	}
}

function cleanData() {
	$('#sectionNewHiloContactoTitulo').val('');
	$('#sectionNewHiloContactoMensaje').text('');
	$('#sectionNewHiloContactoMensaje').val('');
}