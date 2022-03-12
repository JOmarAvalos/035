var generateDepartmentReport = function() {
	var department_id = 1;
var ruta =ctx + '/home/getInvDepartmentProduction?departmentId='+ department_id;
		window.location = ruta;
		var as = 1;
	
}

function generateReport() {
	var urltxt = ctx + "/home/generarReporte"

	var usuarioVO = new Object;
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "text/plain",
		data : JSON.stringify(usuarioVO),
		async : false,
		success : function(response) {
			var dataurl = response;
			var filename = "reporte.pdf";
			var a = document.createElement("a");
			a.href = dataurl;
			a.setAttribute("download", filename);
			a.click();
		},
		error : function(xhr, status, error) {
			console.log(xhr.response);
			console.log(xhr.responseText);
		}
	});

}

function prueba() {

	var urltxt = ctx + "/home/generarReporte"
	var usuarioVO = new Object;
	usuarioVO.username = "5544332240";

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(usuarioVO),
		beforeSend : function() {
		},
		complete : function() {
		},
		success : function(response) {
			var dataurl = response;
		},
		error : function(xhr, status, error) {
			var err = eval("(" + xhr.responseText + ")");
			alert(err.Message);
		}
	});
}
