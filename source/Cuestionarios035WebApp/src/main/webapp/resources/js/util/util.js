logout = function(){
	//$(".logout_form").submit();
	window.location = ctx+'/logout';
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

function maskBody(){
    var overlay, loadingImg;                
    overlay = '<div id=\"overlayId\" class=\"overlay\"></div>';
    loadingImg = '<div id=\"loadingImgId\" class=\"loading-img\"></div>';
    $('body').append(overlay);
    $('body').append(loadingImg);    
}

function unmaskBody(){
    var divOverlay = $("#overlayId");
    var divloadingImg = $("#loadingImgId");
    divOverlay.remove(); 
    divloadingImg.remove();
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
	if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && (charCode != 241 && charCode != 209) && (charCode < 48 || charCode > 57) && (charCode != 32))
	return false;
	return true;
}