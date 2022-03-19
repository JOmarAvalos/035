logout = function(){
	$(".logout_form").submit();
}

marcaRojo = function(campoTexto){
	campoTexto.css({
		"border": "1px solid red",
		"background": "#FFCECE"
	});
}
eliminaMarcaRojo = function(campoTexto){
	campoTexto.css({
		"border": "",
		"background": ""			
	});
}

notNull = function(campoTexto){
	if($.trim(campoTexto.val()) == ''){
		marcaRojo(campoTexto);
		return false;
	} else {
		eliminaMarcaRojo(campoTexto);
	}
	return true;
}

function maskBody(div,message){
	var overlay, loadingImg;				
	overlay = '<div id=\"overlayId\" class=\"overlay\"></div>';
	if (message === undefined) {
		loadingImg = '<div id=\"loadingImgId\" class=\"loading-img\"></div>';
	}else{
		loadingImg = '<div id=\"loadingImgId\" class=\"loading-img text-center\">'+message+'</div>';
	}
	if (div === undefined) {
		$('body').append(overlay);
		$('body').append(loadingImg);
	}else{
		$('#'+div).append(overlay);
		$('#'+div).append(loadingImg);
	}
		
}

function unmaskBody(){
	var divOverlay = $("#overlayId");
	var divloadingImg = $("#loadingImgId");
	divOverlay.remove(); 
	divloadingImg.remove();
}
function maskDiv(div,message){
	var overlay, loadingImg;				
	overlay = '<div id=\"maskId\" class=\"overlay\"></div>';
	var ht = '<div id=\"maskId\" class="overlay dark ">'+
				'<div class="loading-img "></div>';
	if (message === undefined) {
		ht += '<div class="mesage-load"></div>';
	}else{
		ht += '<div class="mesage-load">'+message+'</div>';
	}
	ht += '</div>';
	if (div === undefined) {
		$('body').prepend(ht);
	}else{
		$('#'+div).prepend(ht);
	}
	
}

function unmaskDiv(){
	var divMask = $("#maskId");
//	var divloadingImg = $("#loadingImgId");
	divMask.remove(); 
//	divloadingImg.remove();
}


var displaySuccesMessageByObjectId = function (title,message,idModal) {
	var html = '<div id="divSuccessMessage" class="alert alert-success alert-dismissable flash">' + 
        	   	'<i class="fa fa-check"></i>' + 
        	   	'<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>' + 
        	   	'<b>'+title+'</b>'+ message + 
        	   '</div>' ;	
	$('#'+idModal+'').prepend(html);
	
	setTimeout(function() {
		$(".flash").fadeTo(500, 0).slideUp(500, function() {
			$(this).remove();
	    });
	}, 3000);
}

var displayErrorMessageByObjectId = function (title,message,idModal) {
	var html = '<div class="alert alert-danger alert-dismissable flash">' + 
	'<i class="fa fa-ban"></i>' + 
	'<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>' + 
	'<b>'+title+'</b>'+ message + 
	'</div>' ;	
	$('#'+idModal+'').prepend(html);
	
	setTimeout(function() {
		$(".flash").fadeTo(500, 0).slideUp(500, function() {
			$(this).remove();
		});
	}, 3000);
}

function validateNumberMinAndMax(evt,obj,minValue,maxValue) {
	  var theEvent = evt || window.event;
	  var actualValue = $(obj).val();
	  // Handle paste
	  if (theEvent.type === 'paste') {
	      key = event.clipboardData.getData('text/plain');	      
	      actualValue = '';
	  } else {
	  // Handle key press
	      var key = theEvent.keyCode || theEvent.which;
	      key = String.fromCharCode(key);
	  }
//	  var reg = "^\\d{1,"+length+"}$"
	  var regex = /\d/;
	  if( !regex.test(key) ) {
	    theEvent.returnValue = false;
	    if(theEvent.preventDefault) theEvent.preventDefault();
	  }else{
		  
		  var totalValue = actualValue+key;		  
		  var numberTotal = Number(totalValue);
		  if(numberTotal > maxValue){
			  theEvent.returnValue = false;
			  if(theEvent.preventDefault) theEvent.preventDefault();
			  $(obj).val('');
			  $(obj).val(maxValue);
		  }else
		  if(numberTotal < minValue){
			  theEvent.returnValue = false;
			  if(theEvent.preventDefault) theEvent.preventDefault();
			  $(obj).val('');
			  $(obj).val(minValue);
		  }else{
			  theEvent.returnValue = false;
			  if(theEvent.preventDefault) theEvent.preventDefault();
			  $(obj).val('');
			  $(obj).val(numberTotal);
		  }
	  }
}

isNumberKey = function (evt){
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if ((charCode < 48 || charCode > 57))
	return false;
	return true;
}  

isValidChar = function(evt){
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && (charCode != 241 && charCode != 209) && (charCode < 48 || charCode > 57) && (charCode != 32) && (charCode != 45) && (charCode != 95))
	return false;
	return true;
}


//isValidChar = function(evt){
//	var charCode = (evt.which) ? evt.which : evt.keyCode;
//	//if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && (charCode != 241 && charCode != 209) && (charCode >= 48 && charCode <= 57) && (charCode != 32))
//	if(!(charCode >= 65 && charCode <= 122) && (charCode != 32 && charCode != 0 && charCode != 241 && charCode != 209)
//			&& (charCode != 225 && charCode != 233 && charCode != 237 && charCode != 243 && charCode != 250) 
//			&& (charCode != 193 && charCode != 201 && charCode != 205 && charCode != 211 && charCode != 218) )
//	return false;
//	return true;
//}

function inUploadChange(element,text) {
//	var valueUpload = $(element).val();
//	$("#span2NameRegDatosSize").hide();
//	if(element.files[0].size > 52428800){
//	       //alert("File is too big!");
////		$("#span2NameRegDatosSize").show();
////	       $("#iptFotoPasaporteAdmin").val('');
////	       $('#lblIptPasaporte').text(text);
////	       $('#outPasaporte').attr('src', null);
////		   $('#outPasaporte').attr('alt', '');
////		   desActivaPasos();
//	}else{
//		if (valueUpload != null && valueUpload != '') {
//			if (element.files && element.files[0]) {
//			    var reader = new FileReader();
//			    reader.onload = function(e) {
//			      $('#outPasaporte').attr('src', e.target.result);
//			      $('#outPasaporte').attr('alt', element.files[0].name);
//			      $('#lblIptPasaporte').html('');
//			      $('#lblIptPasaporte').html(element.files[0].name);
//			      $('#divPhotoPasaporte').show();
//			    }
//			    activaPasoUno();
//			    reader.readAsDataURL(element.files[0]);
//			  }
//		} else {
//			$('#lblIptPasaporte').text(text);
//			$('#outPasaporte').attr('src', null);
//		    $('#outPasaporte').attr('alt', '');
//		    $('#divPhotoPasaporte').hide();
//		    desActivaPasos();
//		}
//	}
}

function showLogin(){
		$('#modalLogin').modal({backdrop: 'static', keyboard: false});
} 