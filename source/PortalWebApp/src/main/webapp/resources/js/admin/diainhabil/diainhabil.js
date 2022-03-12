/**
 * 
 */
newDia = function() {
	cleanModalDia();
	eliminaMarcaRojo($("#selecEmpresaDia"));
	eliminaMarcaRojo($("#iptDiaFecha"));
	eliminaMarcaRojo($("#selectDiaEstatus"));

	// Muestra modal nueva actividad scorm
	$('#modalNewDia').modal({
		backdrop : 'static',
		keyboard : false
	});
}

function cleanModalDia() {
	// Clean data
	$('#iptIdDia').val('');
	$('#selecEmpresaDia').val('');
	$('#iptDiaFecha').val('');
	$('#selectDiaEstatus').val('');
}

function saveDia() {
	validacionData = true;
	if (!notNull($("#selecEmpresaDia"))) {
		validacionData = false;
	}
	if (!notNull($("#iptDiaFecha"))) {
		validacionData = false;
	}
	if (!notNull($("#selectDiaEstatus"))) {
		validacionData = false;
	}

	if (validacionData) {

		var DiaInhabilVO = new Object;
		var urltxt = ctx + '/catalogo/dias/save';

		DiaInhabilVO.idEmpresa = $('#selecEmpresaDia').val();
		DiaInhabilVO.banActivo = $('#selectDiaEstatus').val();

		var iniAnio = $('#iptDiaFecha').val().substring(0,4);
		var iniMes  = $('#iptDiaFecha').val().substring(5,7);
		var iniDia  = $('#iptDiaFecha').val().substring(8,10);
		DiaInhabilVO.fecha = new Date(iniAnio, iniMes-1, iniDia);
		// ActividadVO.actividadEncuestaVO.fin = new Date(finalDate[2],
		// finalDate[1]-1, finalDate[0]);
		var idDiaIn  = $('#iptIdDia').val();
		if (idDiaIn.length > 0) {
			DiaInhabilVO.id = idDiaIn;
		}

		$
				.ajax({
					type : "POST",
					url : urltxt,
					contentType : "application/json",
					data : JSON.stringify(DiaInhabilVO),
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
							window.location = ctx + '/catalogo/dias';
							displaySuccesMessageByObjectId('', msg,
									'formActividadDia');
						} else {
							displayErrorMessageByObjectId('', msg,
									'formActividadDia');
						}
					},
					error : function(msg) {
						$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
					}
				});
	} else {
		$('#modalDatosObligatorios').modal({
			backdrop : 'static',
			keyboard : false
		});
	}
}


orderArribaDia = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenArribaDia?id=' + id;

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
                window.location = ctx + '/catalogo/dias';
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

orderAbajoDia = function(id) {

    var urltxt = ctx + '/catalogo/changeOrdenAbajoDia?id=' + id;

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
                window.location = ctx + '/catalogo/dias';
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


function getDia(idDia) {
	var urltxt = ctx + '/catalogo/dia/get?param=' + idDia;
	cleanModalDia();
	// Muestra modal nueva actividad scorm
	$('#modalNewDia').modal({
		backdrop : 'static',
		keyboard : false
	});
	$('#iptIdDia').val(idDia);

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
						var diaInhabilVO = response[2];

						var dateAux = new Date(diaInhabilVO.fecha)
						
						$('#selecEmpresaDia').val(diaInhabilVO.empresaVO.id);
						$('#iptDiaFecha').val(diaInhabilVO.auxDiaInhabil);				
						$('#selectDiaEstatus').val(diaInhabilVO.banActivo);
						
//						$('#actividadScormRowDownload').show();
					} else {
						displayErrorMessageByObjectId('', msg,
								'formActividadDia');
					}
				},
				error : function(msg) {
					displayErrorMessageByObjectId('', 'Error',
							'formActividadDia');
				}
			});
}

function descargarCatDiasInhabiles() {
	window.open(ctx + '/catalogo/descargarDiasInhabiles');
}