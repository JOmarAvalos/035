<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script>
	var ctx = "${pageContext.request.contextPath}"
</script>

  <script type="text/javascript"
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script type="text/javascript"
        src="https://openpay.s3.amazonaws.com/openpay.v1.min.js"></script>
<script type='text/javascript'
  src="https://openpay.s3.amazonaws.com/openpay-data.v1.min.js"></script>

<script type="text/javascript">
        $(document).ready(function() {

            OpenPay.setId('ms7xebg9txnc6i3bbw4p');
            OpenPay.setApiKey('pk_75a5c2f38a1447fda54e04a28cd546db');
            OpenPay.setSandboxMode(true);
            //Se genera el id de dispositivo
            var deviceSessionId = OpenPay.deviceData.setup("payment-form", "deviceIdHiddenFieldName");

            $('#pay-button').on('click', function(event) {
                event.preventDefault();
                $("#pay-button").prop( "disabled", true);
                OpenPay.token.extractFormAndCreate('payment-form', sucess_callbak, error_callbak);
            });

            var sucess_callbak = function(response) {
              var token_id = response.data.id;
              $('#token_id').val(token_id);
              $('#payment-form').submit();
            };

            var error_callbak = function(response) {
                var desc = response.data.description != undefined ? response.data.description : response.message;
                alert("ERROR [" + response.status + "] " + desc);
                $("#pay-button").prop("disabled", false);
            };

        });
        
        $(document).bind("contextmenu",function(e){
        	  return false;
        	    });
    </script>
<script type="text/javascript">
goHome = function(){
	window.location = ctx+'/';
}
realizaPago = function(){
	
	$('#divPago').hide();
	
	urltxt = ctx+'/carrito/pagoSimulado';
	
	$.ajax({
		type : "POST",
		url : urltxt,
		contentType : false,
		processData : false,
		data : new FormData(document.getElementById("payment-form")),
		async:false,
		beforeSend : function() {
			$("#wait").css("display", "block");
		},
		complete : function() {
			$("#wait").css("display", "none");
		},
		success : function(response) {
			result = response[0];
			referencia = response[1];
			if (result) {
				$('#textPagoExitoRef').html('');
				$('#textPagoExitoRef').append('Numero de referencia: '+referencia);
				$('#divPagoResumen').show();
			} else {
				// no es valido(repetido)
				$('#textPagoErrorRef').html('');
				$('#textPagoErrorRef').append(referencia);
				$('#divPagoError').show();
			}
		},
		error : function(msg) {
			$('#textPagoErrorRef').html('');
			$('#textPagoErrorRef').append('Error en el llamado al banco');
			$('#divPagoError').show();
		}
	});
}
</script>
<style>
@charset "US-ASCII";
@import "http://fonts.googleapis.com/css?family=Lato:300,400,700";
* {
    color: #444;
    font-family: Lato;
    font-size: 16px;
    font-weight: 300;
}
::-webkit-input-placeholder {
   font-style: italic;
}
:-moz-placeholder {
   font-style: italic;
}
::-moz-placeholder {
   font-style: italic;
}
:-ms-input-placeholder {
   font-style: italic;
}

body {
    float: left;
    margin: 0;
    padding: 0;
    width: 100%;
}
strong {
	font-weight: 700;
}
a {
    cursor: pointer;
    display: block;
    text-decoration: none;
}
a.button {
    border-radius: 5px 5px 5px 5px;
    -webkit-border-radius: 5px 5px 5px 5px;
    -moz-border-radius: 5px 5px 5px 5px;
    text-align: center;
    font-size: 21px;
    font-weight: 400;
    padding: 12px 0;
    width: 100%;
    display: table;
    background: #E51F04;
    background: -moz-linear-gradient(top,  #E51F04 0%, #A60000 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#E51F04), color-stop(100%,#A60000));
    background: -webkit-linear-gradient(top,  #E51F04 0%,#A60000 100%);
    background: -o-linear-gradient(top,  #E51F04 0%,#A60000 100%);
    background: -ms-linear-gradient(top,  #E51F04 0%,#A60000 100%);
    background: linear-gradient(top,  #E51F04 0%,#A60000 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#E51F04', endColorstr='#A60000',GradientType=0 );
}
a.button i {
    margin-right: 10px;
}
a.button.disabled {
    background: none repeat scroll 0 0 #ccc;
    cursor: default;
}
.bkng-tb-cntnt {
    float: left;
    width: 800px;
}
.bkng-tb-cntnt a.button {
    color: #fff;
    float: right;
    font-size: 18px;
    padding: 5px 20px;
    width: auto;
}
.bkng-tb-cntnt a.button.o {
    background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
    color: #e51f04;
    border: 1px solid #e51f04;
}
.bkng-tb-cntnt a.button i {
    color: #fff;
}
.bkng-tb-cntnt a.button.o i {
    color: #e51f04;
}
.bkng-tb-cntnt a.button.right i {
    float: right;
    margin: 2px 0 0 10px;
}
.bkng-tb-cntnt a.button.left {
    float: left;
}
.bkng-tb-cntnt a.button.disabled.o {
    border-color: #ccc;
    color: #ccc;
}
.bkng-tb-cntnt a.button.disabled.o i {
    color: #ccc;
}
.pymnts {
    float: left;
    width: 800px;
}
.pymnts * {
    float: left;
}

.sctn-row {
    margin-bottom: 35px;
    width: 800px;
}
.sctn-col {
    width: 375px;
}
.sctn-col.l {
    width: 425px;
}
.sctn-col input {
    border: 1px solid #ccc;
    font-size: 18px;
    line-height: 24px;
    padding: 10px 12px;
    width: 333px;
}
.sctn-col label {
    font-size: 24px;
    line-height: 24px;
    margin-bottom: 10px;
    width: 100%;
}
.sctn-col.x3 {
    width: 300px;
}
.sctn-col.x3.last {
    width: 200px;
}
.sctn-col.x3 input {
    width: 210px;
}
.sctn-col.x3 a {
    float: right;
}
.pymnts-sctn {
    width: 800px;
}
.pymnt-itm {
    margin: 0 0 3px;
    width: 800px;
}
.pymnt-itm h2 {
    background-color: #e9e9e9;
    font-size: 24px;
    line-height: 24px;
    margin: 0;
    padding: 28px 0 28px 20px;
    width: 780px;
}
.pymnt-itm.active h2 {
    background-color: #e51f04;
    color: #fff;
    cursor: default;
}
.pymnt-itm div.pymnt-cntnt {
    display: none;
}
.pymnt-itm.active div.pymnt-cntnt {
    background-color: #f7f7f7;
    display: block;
    padding: 0 0 30px;
    width: 100%;
}

.pymnt-cntnt div.sctn-row {
    margin: 20px 30px 0;
    width: 740px;
}
.pymnt-cntnt div.sctn-row div.sctn-col {
    width: 345px;
}
.pymnt-cntnt div.sctn-row div.sctn-col.l {
    width: 395px;
}
.pymnt-cntnt div.sctn-row div.sctn-col input {
    width: 303px;
}
.pymnt-cntnt div.sctn-row div.sctn-col.half {
    width: 155px;
}
.pymnt-cntnt div.sctn-row div.sctn-col.half.l {
    float: left;
    width: 190px;
}
.pymnt-cntnt div.sctn-row div.sctn-col.half input {
    width: 113px;
}
.pymnt-cntnt div.sctn-row div.sctn-col.cvv {
    background-image: url("https://035.com.mx/wp-content/uploads/app035/images/cvv.png");
    background-position: 156px center;
    background-repeat: no-repeat;
    padding-bottom: 30px;
}
.pymnt-cntnt div.sctn-row div.sctn-col.cvv div.sctn-col.half input {
    width: 110px;
}
.openpay {
    float: right;
    height: 60px;
    margin: 10px 30px 0 0;
    width: 435px;
}
.openpay div.logo {
    background-image: url("https://035.com.mx/wp-content/uploads/app035/images/openpay.png");
    background-position: left bottom;
    background-repeat: no-repeat;
    border-right: 1px solid #ccc;
    font-size: 12px;
    font-weight: 400;
    height: 45px;
    padding: 15px 20px 0 0;
}
.openpay div.shield {
    background-image: url("https://035.com.mx/wp-content/uploads/app035/images/security.png");
    background-position: left bottom;
    background-repeat: no-repeat;
    font-size: 12px;
    font-weight: 400;
    margin-left: 20px;
    padding: 20px 0 0 40px;
    width: 200px;
}
.card-expl {
    float: left;
    height: 80px;
    margin: 20px 0;
    width: 800px;
}
.card-expl div {
    background-position: left 45px;
    background-repeat: no-repeat;
    height: 70px;
    padding-top: 10px;
}
.card-expl div.debit {
    background-image: url("https://035.com.mx/wp-content/uploads/app035/images/cards2.png");
    margin-left: 20px;
    width: 540px;
}
.card-expl div.credit {
    background-image: url("https://035.com.mx/wp-content/uploads/app035/images/cards1.png");
    border-right: 1px solid #ccc;
    margin-left: 30px;
    width: 209px;
}
.card-expl h4 {
    font-weight: 400;
    margin: 0;
}

.card-expl div.resumeTranns {
    margin-left: 30px;
}


.trans-expl {
    float: left;
    height: 200px;
    margin: 20px 0;
    width: 800px;
}
.trans-expl div {
    background-position: left 45px;
    background-repeat: no-repeat;
    height: 70px;
    padding-top: 10px;
}
.trans-expl div.debit {
    background-image: url("https://035.com.mx/wp-content/uploads/app035/images/cards2.png");
    margin-left: 20px;
    width: 540px;
}
.trans-expl div.credit {
    background-image: url("https://035.com.mx/wp-content/uploads/app035/images/cards1.png");
    border-right: 1px solid #ccc;
    margin-left: 30px;
    width: 209px;
}
.trans-expl h4 {
    font-weight: 400;
    margin: 0;
}

.trans-expl div.resumeTranns {
    margin-left: 30px;
}

</style>
</head>
<body>
 <div class="row" id="divPago" >
    <div class="bkng-tb-cntnt">
        <div class="pymnts">
            <form action="javascript:realizaPago();" method="POST" id="payment-form">
                <input type="hidden" name="token_id" id="token_id">
                <input type="hidden" name="monto" id="monto" value="${totalCarrito}">
                <div class="pymnt-itm card active">
                    <h2>Resumen de la transacci&oacute;n</h2>
                    <div class="pymnt-cntnt">
                      <div class="trans-expl">
                          <div class="resumeTranns"><h4>Concepto: </h4>
                            <br>Compra de servicio NOM035
                            <br><h4>Importe: </h4>
                            <br>$ ${totalCarrito}.00
                            <br><h4>Productos: </h4>
                            <c:if test="${not empty lstCarrito}">
                            	<c:forEach items="${lstCarrito}" var="producto" varStatus="loop">
		                            <br>${producto.productoVO.nombre}
                            	</c:forEach>
                            </c:if>
                        </div>
                      </div>
                    </div>
                </div>
                
                <div class="pymnt-itm card active">
                    <h2>Tarjeta de crédito o débito</h2>
                    <div class="pymnt-cntnt">
                        <div class="card-expl">
                            <div class="credit"><h4>Tarjetas de crédito</h4></div>
                            <div class="debit"><h4>Tarjetas de débito</h4></div>
                        </div>
                        <div class="sctn-row">
                            <div class="sctn-col l">
                                <label>Nombre del titular</label><input type="text" placeholder="Como aparece en la tarjeta" autocomplete="off" data-openpay-card="holder_name" name="holder_name">
                            </div>
                            <div class="sctn-col">
                                <label>Número de tarjeta</label><input type="text" autocomplete="off" data-openpay-card="card_number" name="card_number"></div>
                            </div>
                            <div class="sctn-row">
                                <div class="sctn-col l">
                                    <label>Fecha de expiración</label>
                                    <div class="sctn-col half l"><input type="text" placeholder="Mes" data-openpay-card="expiration_month" name="expiration_month"></div>
                                    <div class="sctn-col half l"><input type="text" placeholder="Año" data-openpay-card="expiration_year" name="expiration_year"></div>
                                </div>
                                <div class="sctn-col cvv"><label>Código de seguridad</label>
                                    <div class="sctn-col half l"><input type="text" placeholder="3 dígitos" autocomplete="off" data-openpay-card="cvv2" name="cvv2"></div>
                                </div>
                            </div>
                            <div class="openpay"><div class="logo">Transacciones realizadas vía:</div>
                            <div class="shield">Tus pagos se realizan de forma segura con encriptación de 256 bits</div>
                        </div>
                        <div class="sctn-row">
                                <a class="button rght" id="pay-button">Pagar</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    </div>
    
    <div class="row" id="divPagoResumen" style="display:none;">
    	<h4>Tu pago fue realizado con &eacute;xito</h4>
		<h4 id="textPagoExitoRef"></h4>
		<h4>Tu pago fue realizado con &eacute;xito, en un plazo maximo de 3 d&iacute;as habiles recibiras los resultados comprados.</h4>
		
		<div class="pymnt-cntnt">
            <div class="sctn-row">
                    <a class="button rght" onclick="goHome();">Continuar</a>
            </div>
        </div>
		
    </div>
    
    <div class="row" id="divPagoError" style="display:none;">
    	<h4>Ocurrio un error al realizar el pago error:</h4>
		<h4 id="textPagoErrorRef"></h4>
		
		<div class="pymnt-cntnt">
            <div class="sctn-row">
                    <a class="button rght" onclick="goHome();">Aceptar</a>
            </div>
        </div>
		
    </div>
</body>
</html>
