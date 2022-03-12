newCarpeta = function() {
	$('#formCarpeta').parsley().reset();
	// Limpia los campos
	$("#iptNombreCarpeta").val('');
	$("#selecCarpetaEmpresa").val('');
	$("#selecCarpetaPadre").val('');
	$('#selectCarpetaVisible').val('');
	$('#selecCarpetaEmpresa').prop("disabled", false);
	$('#selecCarpetaPadre').prop("disabled", false);
	$('#modalNewCarpeta').modal({
		backdrop : 'static',
		keyboard : false
	});
}

getCarpetas	 = function() {
	var empresaSelected = $('#selecCarpetaEmpresa').val();
	$('#selecCarpetaPadre').html('');

	if (empresaSelected > 0) {
		var urltxt = ctx
				+ "/administradorRepositorio/getCarpetasByEmpresa?idEmpresa="
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
							var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
							var object = response[1];
							for (var i = 0; i < object.length; i++) {
								var element = object[i];
								htmlAdd += '<option value="' + element.id
										+ '" >' + element.nombre + '</option>';
							}
							$('#selecCarpetaPadre').append(htmlAdd);
						} else {
							var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
							$('#selecCarpetaPadre').append(htmlAdd);
						}
					},
					error : function(msg) {
						alert('Error');
					}
				});
	} else {
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selecCarpetaPadre').append(htmlAdd);
	}
}
saveCarpeta = function() {
	var carpeta = new Object;

	carpeta.nombre = $('#iptNombreCarpeta').val();
	carpeta.idEmpresa = $('#selecCarpetaEmpresa').val();
	carpeta.tipo = 1;
	carpeta.visible = $('#selectCarpetaVisible').val();
	// Guardar nuevo registro
	var urltxt = ctx + '/administradorRepositorio/saveCarpeta';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(carpeta),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {

			$('#modalNewCarpeta').modal('hide');

			if (response[0]) {
				window.location = ctx + '/administradorRepositorio';
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Guardado correctamente');
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append(response[1]);
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
getCarpetasArchivos = function (id){
	window.location = ctx+'/administradorRepositorio/carpeta?id='+id;
}
subCarpetas =function (id){
	$('#collapse'+id).html('');
	var cabecera='.sub-card-header'+id;

	    $(".collapse" ).on('show.bs.collapse',(e) =>{
	    	e.stopPropagation();
	    	var hijo ="#"+e.target.id;
	    	$(hijo).prev(cabecera).find(".glyphicon").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");	
	    
	    });
	    $(".collapse" ).on('hide.bs.collapse',(e) =>{
	    	e.stopPropagation();
	    	var hijo ="#"+e.target.id;
	    	$(hijo).prev(cabecera).find(".glyphicon").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
	  
	    });
	
	var htmlAdd ='';
		var urltxt = ctx
				+ "/administradorRepositorio/getCarpetasArchivos?idCarpeta="
				+ id;
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
							var object = response[1];
							htmlAdd='<div class="card-body" id="'+object.id+object.nombre+'">';
						var lista =object.carpetaRepositorioVOLst;
								for (var i = 0; i < lista.length; i++) {
									var element = lista[i];									
									htmlAdd += datos(element.id);
								}
								htmlAdd +='</div>';
							$('#collapse'+id).append(htmlAdd);
							
							
						} else {

							// $('#acordion'+id).append(htmlAdd);
						}
					},
					error : function(msg) {
						alert('Error');
					}
				});
	
}
function datos(id) {	
	var acor ='';
	var completo='';
		var urltxt = ctx
				+ "/administradorRepositorio/getCarpeta?idCarpeta="
				+ id;
		var jqXHR = 	$.ajax({
			        async: false,
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
					},
					error : function(msg) {
						alert('Error');
					}
				});	
		
		var datos=jqXHR.responseJSON;
		result = datos[0];
		if (result) {
			var object = datos[1];
			
			acor=' <div class="card">'
			+'<div class="sub-card-header'+object.id+'" style="padding: .75rem 1.25rem; margin-bottom: 0; background-color: rgba(0, 0, 0, .03); border-bottom: 1px solid rgba(0, 0, 0, .125);">	'
			+'<div class="row">'
			+'<div class="col-md-8">'
			+'<div class="form-group">'
			+'<h5 class="mb-0">'+object.nombre+'</h5></div></div>'
			+'<div class="col-md-4">'
			+'<div class="form-group">';
			if(object.tipo === 1){
			
				acor +='<button onclick="subCarpetas('+object.id+');" class="btn btn-link" data-toggle="collapse" data-target="#collapse'+object.id+'"> <i class="glyphicon glyphicon-chevron-down" aria-hidden="true"></i> </button>'
					+'&nbsp;'
					+'<a href="#" title="Agregar carpeta" onclick="agregarSubCarpeta('+object.id+');"><i class="glyphicon glyphicon-folder-open"></i></a>'				
					+'&nbsp;'
					+'<a href="#" title="Subir Archivo" onclick="saveFile('+object.id+');"><i class="fa fa-fw fa-file-text-o"></i></a>'
					+'&nbsp;'								
					+'<a href="#" title="Descargar Zip" onclick="descargarZip('+object.id+');"><i class="glyphicon glyphicon-save"></i></a>'
					+'&nbsp;';			
			}else if(object.tipo === 2){
				acor +='<a href="#" title="Descargar Archivo" onclick="descargarFile('+object.id+');"style="padding: 6px 12px;"><i class="glyphicon glyphicon-save"></i></a>&nbsp;';
			}
			if(object.visible === 0){
				acor +='<a href="#" title="Visible" onclick="visible('+object.id+');"><i class="fa fa-eye-slash"></i></a>&nbsp;';
					
			}else{
				acor +='<a href="#" title="Visible" onclick="visible('+object.id+');"><i class="fa fa-eye"></i></a>&nbsp;';
			}
			
			acor +='</div></div></div></div><div id="collapse'+object.id+'" class="collapse" aria-labelledby="headingOne" data-parent="#collapse'+object.id+'"></div></div>';
			completo=acor;


		}
		 return completo ;
	}
saveFile = function(idCarpeta) {
    var idCarperaRaiz=$('#iptIdCarpetaRaiz').val();	
	$('#formUploadDocumento').parsley().reset();
	$('#iptIdCarpeta').val('');
	$('#iptIdCarpetaRaizDocumento').val('');
	$('#iptDocumentoNombre').val('');
	$('#iptDocumentoFile').val('');
	$('#selectDocumentoVisible').val('');
	$('#iptIdCarpeta').val(idCarpeta);
	$('#iptIdCarpetaRaizDocumento').val(idCarperaRaiz);
	$('#modalUploadDocumento').modal({backdrop: 'static', keyboard: false});

}


saveUploadDocumento = function(obj) {

		var urltxt = ctx + '/administradorRepositorio/saveDocumento';
        var idCarpetaRaiz=$('#iptIdCarpetaRaizDocumento').val();

		$.ajax({
			type : "POST",
			url : urltxt,
			contentType : false,
			processData : false,
			data : new FormData(document.getElementById("formUploadDocumento")),
			enctype : 'multipart/form-data',
			beforeSend : function() {
				maskBody();
			},
			complete : function() {
				unmaskBody();
			},
			success : function(response) {
				$('#modalUploadDocumento').modal('hide');
				var result = response[0];
				var msg = response[1];
				if (result) {
					window.location = ctx + '/administradorRepositorio/carpeta?id=' + idCarpetaRaiz;
					$('#modalTxtRespuesta').html('');
					$('#modalTxtRespuesta').append('Guardado correctamente');
					$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
					
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

visible = function(idCarpeta) {
	var idCarpetaRaiz = $('#iptIdCarpetaRaiz').val();
	$("#iptVisibleCarperaId").val(idCarpeta);
	$("#iptCarpetaRaizId").val(idCarpetaRaiz);
	$('#modalVisible').modal({backdrop: 'static', keyboard: false});
}
visibleCarpetaConfirmacion= function() {
	var idCarpetaRaiz = $('#iptCarpetaRaizId').val();
	var id = $('#iptVisibleCarperaId').val();
	var urltxt = ctx + '/administradorRepositorio/changeVisibilidad?id='+id;
	
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
			
			$('#modalVisible').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx + '/administradorRepositorio/carpeta?id=' + idCarpetaRaiz;
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
visibilidadCarpetaRaiz= function(id) {

	var urltxt = ctx + '/administradorRepositorio/changeVisibilidad?id='+id;
	
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
								
				window.location = ctx + '/administradorRepositorio';
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
function descargarZip(idCarpeta) {
	var urltxt = ctx
	+ "/administradorRepositorio/getCarpetasArchivos?idCarpeta="
	+ idCarpeta;
	
	var jqXHR = 	$.ajax({
        async: false,
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
		},
		error : function(msg) {
			alert('Error');
		}
	});	
	
	var datos=jqXHR.responseJSON;
	result = datos[0];
	if (result) {
		window.open(ctx + '/administradorRepositorio/downloadZip?idCarpeta=' + idCarpeta);
	}else{
	
		$('#modalTxtRespuesta').html('');
		$('#modalTxtRespuesta').append('La carpeta no contiene archivos');
		$('#modalRespuesta').modal({
			backdrop : 'static',
			keyboard : false
		});
	}
	
}

function descargarFile(id) {
	window.open(ctx + '/administradorRepositorio/downloadFile?fileId=' + id);
}

agregarPermisos = function() {
	var idCarpetaRaiz = $('#iptIdCarpetaRaiz').val();	
	$('#iptCarpetaId').val(idCarpetaRaiz);
	//$('#modalAgregarPermisos').modal({backdrop: 'static', keyboard: false});
	$('#divFuncionarios').hide();
	$('#divFuncionariosNO').show();
}

closeAgregarFuncionario = function(){
	$('#divFuncionariosNO').hide();
	$('#divFuncionarios').show();
}

agregarConfirmacion = function(){
	var listpermisosCarpetaRepositorioVO = [];
	var idCarpeta = $('#iptCarpetaId').val();

	$("input[type=checkbox]:checked").each(function(){
		var permisosCarpetaRepositorioVO = new Object;
		permisosCarpetaRepositorioVO.idCarpeta = idCarpeta;
		permisosCarpetaRepositorioVO.idFuncionario = Number($(this).val());
		permisosCarpetaRepositorioVO.banActivo = 1;
		listpermisosCarpetaRepositorioVO.push(permisosCarpetaRepositorioVO);
    });
	var urltxt = ctx + '/administradorRepositorio/savePermiso';
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(listpermisosCarpetaRepositorioVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {
		$('#modalAgregarPermisos').modal('hide');
			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx + '/administradorRepositorio/carpeta?id=' + idCarpeta;
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

agregarPermiso = function(idPermiso) {
	var idCarpeta = $('#iptIdCarpetaRaiz').val();	
	var permisosCarpetaRepositorioVO = new Object;
	permisosCarpetaRepositorioVO.id=idPermiso;
	permisosCarpetaRepositorioVO.idCarpeta = idCarpeta;
	permisosCarpetaRepositorioVO.banActivo = 1;
	var urltxt = ctx + '/administradorRepositorio/estatusPermiso';
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(permisosCarpetaRepositorioVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {

			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx + '/administradorRepositorio/carpeta?id=' + idCarpeta;
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
quitarPermiso = function(idPermiso) {
	var idCarpeta = $('#iptIdCarpetaRaiz').val();	
	var permisosCarpetaRepositorioVO = new Object;
	permisosCarpetaRepositorioVO.id=idPermiso;
	permisosCarpetaRepositorioVO.idCarpeta = idCarpeta;
	permisosCarpetaRepositorioVO.banActivo = 0;
	var urltxt = ctx + '/administradorRepositorio/estatusPermiso';
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(permisosCarpetaRepositorioVO),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {

			
			if (response[0]) {
				
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Correcto');
				$('#modalRespuesta').modal({backdrop: 'static', keyboard: false});
				
				window.location = ctx + '/administradorRepositorio/carpeta?id=' + idCarpeta;
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

newSubCarpeta = function() {
	var idCarpetaRaiz = $('#iptIdCarpetaRaiz').val();
	$('#formSubCarpeta').parsley().reset();
	// Limpia los campos
	$("#iptNombreSubCarpeta").val('');
	$('#selectSubCarpetaVisible').val('');
	$("#selecSubCarpetaPadre").val(idCarpetaRaiz);
	$("#iptCarpetaRaizId").val(idCarpetaRaiz);
	$('#modalNewSubCarpeta').modal({
		backdrop : 'static',
		keyboard : false
	});
}



agregarSubCarpeta = function(idCarpeta) {
	var idCarpetaRaiz = $('#iptIdCarpetaRaiz').val();
	// Resetea validadores
	$('#formSubCarpeta').parsley().reset();		
	// Limpia los campos
	$("#iptNombreSubCarpeta").val('');
	$('#selectSubCarpetaVisible').val('');
	$("#selecSubCarpetaPadre").val(idCarpeta);
	$("#iptCarpetaRaizId").val(idCarpetaRaiz);
	

	
	$('#modalNewSubCarpeta').modal({
		backdrop : 'static',
		keyboard : false
	});
}


saveSubCarpeta = function() {
	var idCarpetaRaiz =  $("#iptCarpetaRaizId").val();
	var carpeta = new Object;

	carpeta.nombre = $('#iptNombreSubCarpeta').val();
	carpeta.idEmpresa = $('#selecSubCarpetaEmpresa').val();
	carpeta.tipo = 1;
	carpeta.visible = $('#selectSubCarpetaVisible').val();
	carpeta.idCarpetaPadre = $('#selecSubCarpetaPadre').val();
	
	// Guardar nuevo registro
	var urltxt = ctx + '/administradorRepositorio/saveCarpeta';

	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : "application/json",
		data : JSON.stringify(carpeta),
		beforeSend : function() {
			maskBody();
		},
		complete : function() {
			unmaskBody();
		},
		success : function(response) {

			$('#modalNewSubCarpeta').modal('hide');

			if (response[0]) {
				window.location = ctx + '/administradorRepositorio/carpeta?id='+ idCarpetaRaiz;
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append('Guardado correctamente');
				$('#modalRespuesta').modal({
					backdrop : 'static',
					keyboard : false
				});
			} else {
				$('#modalTxtRespuesta').html('');
				$('#modalTxtRespuesta').append(response[1]);
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

function inUploadChange(element) {
	var valueUpload = $(element).val();
	if (valueUpload != null && valueUpload != '') {
		var fileName = valueUpload.substring(valueUpload.lastIndexOf("\\") + 1,valueUpload.length);
		$('#iptDocumentoNombre').val(fileName);
	}
}


showBuscaFuncionarios = function(){
	var idCarpetaRaiz = $('#iptIdCarpetaRaiz').val();	
	$('#iptCarpetaId').val(idCarpetaRaiz);

	$('#selectGrupoD').val(0);
	eliminaMarcaRojo($("#selectDealer"));
	$('#selectDealer').html('');
	var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
	$('#selectDealer').append(htmlAdd);
	$('#modalBuscaFuncionarios').modal({backdrop: 'static', keyboard: false});
}

getDealer = function(){
	var grupoDealerSelected = $('#selectGrupoD').val();
	$('#selectDealer').html('');

	if(grupoDealerSelected > 0){
		var urltxt = ctx+"/funcionarios/getDealer?idGrupoDealer="+grupoDealerSelected;
		$.ajax({
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
						htmlAdd += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
					}
					$('#selectDealer').append(htmlAdd);
				} else {
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selectDealer').append(htmlAdd);
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
		$('#selectDealer').append(htmlAdd);
	}
}

buscaFuncionarios = function(idCarpeta){
	
	var dealerSelected = $('#selectDealer').val();
	
	$('#tbodyGerente').html('');

	if(dealerSelected > 0){
	
		eliminaMarcaRojo($("#selectDealer"));
	
	
		var urltxt = ctx+"/administradorRepositorio/buscaFuncionarios?id="+idCarpeta+"&idDealer="+dealerSelected;
		$.ajax({
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
				
					var gerentes = response[1];
					var htmlAddGerentes = '';
					for (var i = 0; i < gerentes.length; i++) {
						var element = gerentes[i];
						htmlAddGerentes += '<tr><td>'+element.rfc+'</td><td>'+element.datosFuncionarioVO.nombres+' '+element.datosFuncionarioVO.apellidoUno+' '+element.datosFuncionarioVO.apellidoDos+'</td> <td style="text-align: center;"><input type="checkbox" value="'+element.id+'" id="'+element.id+'"/></td></tr>';
					}
					
					$('#tbodyGerente').append(htmlAddGerentes);
				
					$('#tablaFuncionario').dataTable({
						"bRetrieve": true,
						"bDestroy": true,
			            "bPaginate": true,
			            "bLengthChange": true,
			            "bFilter": true,
			            "bSort": true,
			            "bInfo": true,
			            "language": {
			                "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
			            }
			        });
			        $('#modalBuscaFuncionarios').modal('hide');
				} else {
					$('#modalSinDatos').modal({backdrop: 'static', keyboard: false});
				}
			},
			error : function(msg) {
				$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
			}
		});
	}else{
		marcaRojo($("#selectDealer"));
		$('#modalDatosObligatorios').modal({backdrop: 'static', keyboard: false});
	}
	
}