newEmpresa = function (){
	$('#iptClaveEmpresa').val('');
	$('#iptNombreEmpresa').val('');
	$('#selectEmpresaLider').val('0');
	$('#iptCheckEmpresaActivo').prop('checked',false);
	$('#modalNewEmpresa').modal('show');
}

saveEmpresa = function(){
	
	empresaValid = true;
	
	if(!notNull($("#iptClaveEmpresa"))){
		empresaValid = false;
	}
	
	if(!notNull($("#iptNombreEmpresa"))){
		empresaValid = false;
	}
	
	
	if(empresaValid){
		
		var empresa = new Object;

		empresa.clave = $('#iptClaveEmpresa').val();
		empresa.nombre = $('#iptNombreEmpresa').val();
		if($("#iptCheckEmpresaActivo").prop('checked')){
			empresa.banActivo = 1;
		}else{
			empresa.banActivo = 0;
		}

		if($('#selectEmpresaLider').val() > 0){
			empresa.idEmpresaLider = $('#selectEmpresaLider').val();
		}
		
		var urltxt = ctx + '/catalogo/saveEmpresa';
		
		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : "application/json",
			data : JSON.stringify(empresa),
			beforeSend : function() {
			},
			complete : function() {
			},
			success : function(response) {
				result = response[0];
				 msg = response[1];
				if (result) {
					window.location = ctx+'/catalogo/empresa';
				} else {
					alert('Error');
				}
			},
			error : function(msg) {
				alert('Error');
			}
		});
	}else{
		alert('datos obligatorios');
	}
	
}