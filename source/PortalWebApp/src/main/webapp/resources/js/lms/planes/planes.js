newPlan = function() {
	// Resetea validadores
	$('#formPlan').parsley().reset();
	
	// Ajusta titulo de modal
	$('#iptPlanTitulo').html('');
	$('#iptPlanTitulo').append('Nuevo plan de carrera');

	// Quitar renglon de descarga de imagen
	removeElement("planRowDownload");
	
	// Limpia los campos
	$("#iptPlanId").val('');
	$("#iptPlanCodigo").val('');
	$("#iptPlanNombre").val('');
	$("#iptPlanNombreEn").val('');
	$("#iptPlanNombreFr").val('');
	$("#iptPlanDescripcion").val('');
	$("#iptPlanDescripcionEn").val('');
	$("#iptPlanDescripcionFr").val('');
	$("#selectPlanEstatus").val('');
	$("#selectPlanEmpresa").val('');
	$("#selectPlanPlantilla").val('');
	$("#selectPlanPlantilla").val();
	$("#selecPlanGrupoPuesto").val('');
	$("#selecPlanPuesto").val('');
	$('#selecPlanGrupoPuesto').html('');
	$('#selecPlanPuesto').html('');
	$("#selecPlanGrupoPuesto").append('');
	$("#selecPlanPuesto").append('');
	$('#selectPlanEmpresa').prop("disabled", false);
	$('#selecPlanGrupoPuesto').prop("disabled", false);
	$('#selecPlanPuesto').prop("disabled", false);
	$('#iptPlanImagenFile').val('');

	// Muestra modal
	$('#modalNewPlan').modal({
		backdrop : 'static',
		keyboard : false
	});
}

getPlanActividades = function(id) {
	window.location = ctx + '/lms/plan?id=' + id;
}

savePlan = function(obj) {

	// Guardar nuevo registro
	var urltxt = ctx + '/lms/savePlan';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : false,
		processData : false,
		data : new FormData(document.getElementById("formPlan")),
		enctype : 'multipart/form-data',
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {

			$('#modalNewPlan').modal('hide');

			if (response[0]) {
				window.location = ctx + '/lms/planes';
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Guardado correctamente');
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Error');
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
}

editPlan = function(id) {
	
	// Resetea validadores
	$('#formPlan').parsley().reset();
	
	// Ajusta titulo de modal
	$('#iptPlanTitulo').html('');
	$('#iptPlanTitulo').append('Actualizar plan de carrera');

	// Limpia los campos
	$("#iptPlanId").val('');
	$("#iptPlanCodigo").val('');
	$("#iptPlanNombre").val('');
	$("#iptPlanNombreEn").val('');
	$("#iptPlanNombreFr").val('');
	$("#iptPlanDescripcion").val('');
	$("#iptPlanDescripcionEn").val('');
	$("#iptPlanDescripcionFr").val('');
	$("#selectPlanEstatus").val('');
	$("#selectPlanEmpresa").val('');
	$("#selecPlanGrupoPuesto").val('');
	$("#selecPlanPuesto").val('');
	$("#selectPlanPlantilla").val('');
	$('#iptPlanImagenFile').val('');

	getPlan(id);

	$('#modalNewPlan').modal({
		backdrop : 'static',
		keyboard : false
	});
}

getPlan = function(id) {

	var urltxt = ctx + '/lms/getPlan?id=' + id;

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

				var object = response[1];

				$("#iptPlanId").val(object.id);
				$("#iptPlanCodigo").val(object.codigo);
				$("#iptPlanNombre").val(object.nombre);
				$("#iptPlanNombreEn").val(object.nombreEn);
				$("#iptPlanNombreFr").val(object.nombreFr);
				$("#iptPlanDescripcion").val(object.descripcion);
				$("#iptPlanDescripcionEn").val(object.descripcionEn);
				$("#iptPlanDescripcionFr").val(object.descripcionFr);
				$("#selectPlanEstatus").val(object.banActivo);
				$("#selectPlanEmpresa").val(object.idEmpresa);
				$("#selectPlanPlantilla").val(object.idPlantilla);
				
				var object2 = response[2];
				var htmlAddGP = '<option value="' + object2.id + '" >' + object2.descripcion + '</option>';
				$('#selecPlanGrupoPuesto').html('');
				$("#selecPlanGrupoPuesto").append(htmlAddGP);

				var object3 = response[3];
				var htmlAddP = '<option value="' + object3.id + '" >' + object3.nombre + '</option>';
				$('#selecPlanPuesto').html('');
				$('#selecPlanPuesto').append(htmlAddP);

				$('#selectPlanEmpresa').prop('disabled', 'disabled');
				$('#selecPlanGrupoPuesto').prop('disabled', 'disabled');
				$('#selecPlanPuesto').prop('disabled', 'disabled');
				
				if(object.imagen !== null){
					resetElement("planRowDownload");
				} else {
					removeElement("planRowDownload");
				}

			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Error');
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
}

estatusPlan = function(id) {
	$("#iptEstatusPlanId").val(id);
	$('#modalEstatusPlan').modal({backdrop: 'static', keyboard : false});
}

estatusPlanConfirmacion = function() {

	var id = $('#iptEstatusPlanId').val();
	var urltxt = ctx + '/lms/changeEstatusPlan?id=' + id;

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

			$('#modalEstatusPlan').modal('hide');

			if (response[0]) {

				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});

				window.location = ctx + '/lms/planes';
			} else {

				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Error');
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
}

orderArribaPlan = function(id) {

	var urltxt = ctx + '/lms/changeOrdenArribaPlans?id=' + id;

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
				window.location = ctx + '/lms/planes';
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Error');
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
}

orderAbajoPlan = function(id) {

	var urltxt = ctx + '/lms/changeOrdenAbajoPlans?id=' + id;

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
				window.location = ctx + '/lms/planes';
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Error');
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			}
		},
		error : function(msg) {
			alert('Error alert');
		}
	});
}

getSelectsEmpresa = function() {
	$('#selecPlanGrupoPuesto').html('');
	$('#selecPlanPuesto').html('');

	var empresaSelected = $('#selectPlanEmpresa').val();

	if (empresaSelected > 0) {
		var urltxt = ctx + "/lms/getSelectsEmpresaP?idEmpresa="
				+ empresaSelected;
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

							var htmlAddGpoPuesto = '<option value="0" selected="selected">Seleccione...</option>';
							// grupos de puestos
							var gpoPuestos = response[1];
							for (var i = 0; i < gpoPuestos.length; i++) {
								var element = gpoPuestos[i];
								htmlAddGpoPuesto += '<option value="'
										+ element.id + '" >'
										+ element.descripcion + '</option>';
							}
							var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
							$('#selecPlanGrupoPuesto').append(htmlAddGpoPuesto);
							$('#selecPlanPuesto').append(htmlAdd);

						} else {
							var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
							$('#selecPlanGrupoPuesto').append(htmlAdd);
							$('#selecPlanPuesto').append(htmlAdd);

						}
					},
					error : function(msg) {
						alert('Error');
					}
				});
	} else {
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecPlanGrupoPuesto').append(htmlAdd);
		$('#selecPlanPuesto').append(htmlAdd);

	}

}

getPuestos = function() {
	var grupoPuestoSelected = $('#selecPlanGrupoPuesto').val();
	$('#selecPlanPuesto').html('');

	if (grupoPuestoSelected > 0) {
		var urltxt = ctx + "/lms/getPuestos?idGrupoPuesto="
				+ grupoPuestoSelected;
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
							var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
							var object = response[1];
							for (var i = 0; i < object.length; i++) {
								var element = object[i];
								htmlAdd += '<option value="' + element.id
										+ '" >' + element.nombre + '</option>';
							}
							$('#selecPlanPuesto').append(htmlAdd);
						} else {
							var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
							$('#selecPlanPuesto').append(htmlAdd);
						}
					},
					error : function(msg) {
						alert('Error');
					}
				});
	} else {
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecPlanPuesto').append(htmlAdd);
	}
}

function descargarCatPlanes() {
	window.open(ctx + '/catalogo/descargarPlanes');
}

function resetElement(id) {
	document.getElementById(id).style.display = "block";
	document.getElementById(id).style.visibility = "visible";
}

function removeElement(id) {
	document.getElementById(id).style.display = "none";
}

function downloadFile(idData) {
	window.open(ctx + '/lms/downloadFilePlan?fileId=' + idData);
}
