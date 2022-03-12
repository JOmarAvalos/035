function readNotificacion(idStrNot) {
//	alert(idStrNot);
	var idNot = idStrNot.replace('heading_', '');

	var urltxt = ctx + '/lms/notificacion/read' + '?param=' + Number(idNot);
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		beforeSend : function() {
			// maskBody();
		},
		complete : function() {
			// unmaskBody();
		},
		success : function(response) {
			var result = response[0];
			var msg = response[1];
			if (result) {
				$('#' + idNot).removeClass("received urgent").addClass(
						"pending");
				// window.location = ctx + '/lms/curso?id=' + idCurso;
				// displaySuccesMessageByObjectId('',msg,'formActividadScorm');
				console.log(msg);
				var sizeNot = response[2];
				updateSpanNotificaciones(sizeNot);
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

function updateSpanNotificaciones(sizeNot) {
	var sizeN = Number(sizeNot);
	if (sizeN > 0) {
		$('#idSpanNotificationsNum').text(sizeN);
	}else{
		$('#idSpanNotificationsNum').hide();
	}
}