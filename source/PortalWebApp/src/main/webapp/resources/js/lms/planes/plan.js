agregarCertificado = function(idPlan) {
	$('#listCertificados').html('');
	$('#listCertificados').append('');

	var urltxt = ctx + '/lms/plan/getCertificados?id=' + idPlan;
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
					var html = '';
					var cabecera='';
					var cuerpo='';
					
					
					if (response[0]) {

						var lstCertificado = response[1];
					

						cabecera='<table id="example" style="width:100%;display: block; height: calc(50vh - 1px); min-height: calc(200px + 1 px);overflow-y: auto; ">'
							+'<tr><th></th><th></th></tr>';																				
						for (var i = 0; i < lstCertificado.length; i++) {
							var nombre = lstCertificado[i].nombre;
							var id = lstCertificado[i].id;

							cuerpo += '<tr><td><input type="checkbox" value="'+id+'" id="' + id
									+ '" /> <label >' + nombre + '</label></td><tr>';

						}
						html =cabecera+cuerpo+'</table>';
						$('#listCertificados').append(html);
						$("#iptPlanCertificadoId").val(idPlan);
						
						$('#modalAgregarPlanCertificado').modal({
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


agregarConfirmacion = function(){
	var listCertificadoCursoVO = [];
	var idPlanCertificado = $('#iptPlanCertificadoId').val();

	$("input[type=checkbox]:checked").each(function(){
		var planCarreraCertificadoVO = new Object;
		planCarreraCertificadoVO.idPlanCarrera = idPlanCertificado;
		planCarreraCertificadoVO.idCertificado = Number($(this).val());
	    planCarreraCertificadoVO.banActivo = 1;
		listCertificadoCursoVO.push(planCarreraCertificadoVO);
    });
	var urltxt = ctx + '/lms/plan/saveCertPlan';
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(listCertificadoCursoVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
		$('#modalAgregarPlanCertificado').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx + '/lms/plan?id=' + idPlanCertificado;
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

estatusCertificadoPlan = function(id,idPlanCarrera) {
	$("#iptEstatusPlanCertificadoId").val(id);
	$("#iptPlanId").val(idPlanCarrera);
	$('#modalEstatusCertificadoPlan').modal({backdrop: 'static', keyboard: false});
}

estatusPlanCertificadoConfirmacion = function() {
	var idPlanCarrera = $('#iptPlanId').val();
	var id = $('#iptEstatusPlanCertificadoId').val();
	var urltxt = ctx + '/lms/plan/changeEstatusPlanCertificado?id='+id;
	
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
			
			$('#modalEstatusCertificadoPlan').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx + '/lms/plan?id=' + idPlanCarrera;
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
orderArribaCertificadoPlan = function(id,idPlanCarrera) {

	var urltxt = ctx + '/lms/plan/changeOrdenArribaPlanCertificado?id='+id+'&idPlanCarrera='+idPlanCarrera;

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

				window.location = ctx + '/lms/plan?id=' + idPlanCarrera;
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

orderAbajoCertificadoPlan = function(id,idPlanCarrera) {

	var urltxt = ctx + '/lms/plan/changeOrdenAbajoPlanCertificado?id='+id+'&idPlanCarrera='+idPlanCarrera;

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
				window.location = ctx + '/lms/plan?id=' + idPlanCarrera;
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
