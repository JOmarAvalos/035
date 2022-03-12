<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="json" uri="http://www.teknei.com/jsp/json"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="UTF-8">
<!-- bootstrap 3.0.2 -->
<link href="<c:url value='/resources/css/bootstrap.min.css' />"
	rel="stylesheet" type="text/css" />
<!-- font Awesome 4.7-->
<link href="<c:url value='/resources/css/font-awesome.css' />"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="<c:url value='/resources/css/AdminLTE.css' />"
	rel="stylesheet" type="text/css" />
<script>
	var ctx = "${pageContext.request.contextPath}"
</script>
<!-- jQuery 2.0.2 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- jQuery UI 1.10.3 -->
<script src="<c:url value='/resources/js/jquery-ui-1.10.3.min.js' />"
	type="text/javascript"></script>
<!-- Bootstrap -->
<script src="<c:url value='/resources/js/bootstrap.min.js' />"
	type="text/javascript"></script>
<script src="<c:url value='/resources/js/admin/email.js' />"
	type="text/javascript"></script>
	
<script src="<c:url value='/resources/plugins/ckeditor/ckeditor.js' />" type="text/javascript"></script>
<script src="<c:url value='/resources/js/util/util.js' />" type="text/javascript"></script>
<%-- <link href="<c:url value='/resources/css/AdminLTE.css' />" /> --%>
<script type="text/javascript">
var selDiv = "";
var storedFiles = [];
var forwardNameFiles = [];
</script>

<div id="mail_content_${loopIndex}" class="col-md-12">
	<input type="hidden" id="email_id_${loopIndex}" value="${mensajeVO.id}">
	<div class="row info-mail">
		<div class="col-xs-2">
			<div class="user-panel">
				<div class="pull-left image">
					<img src="<c:url value='/resources/css/img/imagen_usuario.png' />"
						class="img-circle" alt="User Image"
						style="width: 60px; height: 60px; border: 0px;" />
				</div>
			</div>
		</div>
		<div class="col-xs-8">
			<div class="row">
				<div class="col-sm-12" id="fech${loopIndex}">
					<span>Fecha: </span>
					<fmt:formatDate pattern="dd/MM/yyyy | HH:mm:ss"
						value="${mensajeVO.receivedDate}" />
				</div>
				<div style="display: none;">
					<input type="text" id="receive${loopIndex}"
						name="receive${loopIndex}" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss"
						value="${mensajeVO.receivedDate}" />">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<span>De: </span>
					${mensajeVO.from}
				</div>
				<div style="display: none;">
					<input type="text" id="from${loopIndex}" name="from${loopIndex}"
						value="${fn:replace(mensajeVO.from, "\"", "")}">
					<input type="text" id="fromReplyAll${loopIndex}"
						name="fromReplyAll${loopIndex}"
						value="${fn:replace(mensajeVO.responderAll, "\"", "")}">
				</div>
			</div>
			<div class="row">
				<div id="subject${loopIndex}" class="col-sm-12 sbjctMail">${mensajeVO.subject}</div>
			</div>
		
	<c:if test="${not empty mensajeVO.to}">
		<div class="row">
			<div class="col-sm-12">
			<span>Para: </span>
			${mensajeVO.to}
			</div>
			<div style="display: none;">
				<input type="text" id="to${loopIndex}" name="to${loopIndex}"
					value="${fn:replace(mensajeVO.to, "\"", "")}">
			</div>
		</div>
	</c:if>
	<c:if test="${not empty mensajeVO.cc}">
		<div class="row">
			<div class="col-sm-12">
			<span>CC: </span>
			${mensajeVO.cc}
			</div>
			<div style="display: none;">
				<input type="text" id="cc${loopIndex}" name="cc${loopIndex}"
					value="${fn:replace(mensajeVO.cc, "\"", "")}">
				<input type="text" id="ccReplyAll${loopIndex}"
					name="ccReplyAll${loopIndex}"
					value="${fn:replace(mensajeVO.responderAllCC, "\"", "")}">
			</div>
		</div>
	</c:if>
	</div>
	</div>
	<div class="row col-md-10 actions-mail">
		<button type="button" class="btn btn-cont"
			onclick="responderCorreo(${loopIndex});">
			<span role="link" class="ams bkH">Responder</span>
		</button>
		<button type="button" class="btn btn-cont"
			onclick="responderTdsCorreo(${loopIndex});">
			<span role="link" class="ams bkI">Responder a todos</span>
		</button>
		<button type="button" class="btn btn-cont"
			onclick="reenviarCorreo(${loopIndex});">
			<span role="link" class="ams bkG">Reenviar</span>
		</button>
	</div>
	<c:if test="${not empty mensajeVO.lstFilesNames}">
		<div class="row " style="border-bottom: 1px solid #ddd;">
			<ul id="adjuntosUl" class="menuEmail ">
				<c:forEach items="${mensajeVO.lstFilesNames}" var="listFileAttach"
					varStatus="loopFile">
					<li class="active">
						<c:url value="/email/downloadFile" var="myURL">
						    <c:param name="idUser" value="${idUsuairo}"/>
						    <c:param name="name" value="${listFileAttach}"/>
						    <c:param name="idEmail" value="${mensajeVO.idMessage}"/>
						    <c:param name="idFolder" value="${mensajeVO.idFolder}"/>
						</c:url>
						<a
							href="${myURL}"
							target="_blank" class="text-center">${listFileAttach}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	<c:if test="${not empty mensajeVO.message}">
		<div class="row">
			<div id="conten${loopIndex}" class="col-sm-10">
				${mensajeVO.message}</div>
		</div>
	</c:if>
</div>


<div class="modal fade" id="modalResponder" role="dialog"
	aria-labelledby="modalResponder" aria-hidden="true">
	<div class="modal-dialog modal-newmail" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header">
				<h4 id="titleMailAction"><i class="fa fa-envelope" aria-hidden="true"></i>
				  Correo Electrónico </h4>
				<button type="button" class="btn btn-info btn-close-modal" data-dismiss="modal"
					style="border-color: #00c0ef;">
					<i class="glyphicon glyphicon-remove" aria-hidden="true"
						title="Cerrar"></i>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<!-- form start -->
				<form id="infoResponderForm" enctype='multipart/form-data'
					method="post">
					<input type="hidden" id="idUsuarioEmailResp" name="idUsuarioEmailResp" value="${idUsuarioEmail}">
					<input type="hidden" id="idFolderResp" name="idFolderResp" value="${idFolder}">
					<input type="hidden" id="idMensajeVO" name="idMensajeVO" value="${mensajeVO.id}">
					<div class="box-email">
						<div class="box-body-email">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-11">
										<div id="mensajeErrorRemR" style="color: #FF0000;"></div>
									</div>
								</div>
							</div>

							<div class="col-md-12">
								<div class="row">

									<div class="col-md-1">
										<div class="form-group">Para:</div>
									</div>
									<div class="col-md-11">
										<div class="form-group">
											<input type="email" class="form-control" id="iptRespPara"
												name="iptRespPara"
												onchange="changeStyle('iptRespPara','mensajeReplyError','mensajeErrorRemR')"
												style="height: 25px !important;" maxlength="500">
											<p style="font-size: 10px">
												<spring:message
													code="email.modal.instructions.multiple_email" />
											</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-1">
										<div class="form-group">CC:</div>
									</div>
									<div class="col-md-11">
										<div class="form-group">
											<input type="email" class="form-control" id="iptRespCc"
												name="iptRespCc"
												onchange="changeStyle('iptRespCc','mensajeReplyError','mensajeErrorRemR')"
												style="height: 25px !important;" maxlength="500">
											<p style="font-size: 10px">
												<spring:message
													code="email.modal.instructions.multiple_email" />
											</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-1">
										<div class="form-group">Asunto:</div>
									</div>
									<div class="col-md-11">
										<div class="form-group">
											<input type="text" class="form-control" id="iptRespAsunto"
												name="iptRespAsunto" style="height: 25px !important;"
												maxlength="500">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="box-email">
						<div class="box-body-email">
							<div class="col-md-12">
								<div class="row fileupload-buttonbar">
									<div class="col-lg-2">

										<span class="btn btn-cont fileinput-button">
											<i class="glyphicon glyphicon-paperclip"></i>
											<input type="file" class="glyphicon glyphicon-paperclip"
												id="files" name="files[]"
												
												multiple="multiple">
											<!-- 	</span> <span id="nameFile"> -->

										</span>
										<div id="fileListNewCorreo">
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="box-email">
						<div class="box-body-email">
							<div class="col-md-12">
								<!-- <div id="iptMensajeContenidoRes"
									class="form-control contenidoModal" contenteditable="true"
									style="height: 100%;">
									<div id="iptRespMensaje" hidefocus="true"
										aria-label="Cuerpo del mensaje" g_editable="true"
										role="textbox" aria-multiline="true" contenteditable="true"
										style="direction: ltr; min-height: 20px;"
										itacorner="6,7:1,1,0,0" spellcheck="true"></div>
									<blockquote type="cite" style="border-left: 1px solid #0b9dcc;">
										<div id="iptContenidoRes" style="opacity: .5;"></div>
									</blockquote>
								</div> -->
								<textarea id="iptMensajeContenidoRes" name="iptMensajeContenidoRes" rows="10" cols=""
									style="width: 100%;">
									
									</textarea>
							</div>
						</div>
					</div>
					<div style="display: none;">
						<input type="text" id="fecha" name="fecha">
					</div>
				</form>

				<!-- /.box -->
			</div>
			<div class="modal-footer" style="text-align: left;">
				<div id="mensajeReplyError"></div>
				<button id="btnFormResp" type="button" class="btn btn-info"
					
					>
					<span>Enviar</span>
				</button>
			</div>
		</div>
	</div>
</div>
<%-- 
<div class="modal fade" id="modalResponderTodos" tabindex="-1"
	role="dialog" aria-labelledby="modalResponderTodos" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="floating-header">
				<button type="button" class="btn btn-info" data-dismiss="modal"
					style="border-color: #00c0ef;">
					<i class="glyphicon glyphicon-remove" aria-hidden="true"
						title="Close"></i>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<!-- form start -->
				<form id="infoResponderAllForm" enctype='multipart/form-data'
					method="post">
					<input type="hidden" id="idUsuarioEmailRespAll" name="idUsuarioEmailRespAll" value="${idUsuarioEmail}">
					<div class="box-email">
						<div class="box-body-email">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-11">
										<div id="mensajeErrorRemRAll" style="color: #FF0000;"></div>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="row">

									<div class="col-md-1">
										<div class="form-group">Para:</div>
									</div>
									<div class="col-md-11">
										<div class="form-group">
											<input type="email" class="form-control" id="iptRespTPara"
												name="iptRespTPara"
												onchange="changeStyle('iptRespTPara','mensajeReplyAllError','mensajeErrorRemRAll')"
												style="height: 25px !important;" maxlength="500">
											<p style="font-size: 10px">
												<spring:message
													code="email.modal.instructions.multiple_email" />
											</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-1">
										<div class="form-group">CC:</div>
									</div>
									<div class="col-md-11">
										<div class="form-group">
											<input type="email" class="form-control" id="iptRespTCc"
												name="iptRespTCc"
												onchange="changeStyle('iptRespTCc','mensajeReplyAllError','mensajeErrorRemRAll')"
												style="height: 25px !important;" maxlength="500">
											<p style="font-size: 10px">
												<spring:message
													code="email.modal.instructions.multiple_email" />
											</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-1">
										<div class="form-group">Asunto:</div>
									</div>
									<div class="col-md-11">
										<div class="form-group">
											<input type="text" class="form-control" id="iptRespTAsunto"
												name="iptRespTAsunto" style="height: 25px !important;"
												maxlength="500">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="box-email">
						<div class="box-body-email">
							<div class="col-md-12">
								<div class="row fileupload-buttonbar">
									<div class="col-lg-2">

										<span class="btn btn-cont fileinput-button">
											<i class="glyphicon glyphicon-paperclip"></i>
											<input type="file" class="glyphicon glyphicon-paperclip"
												id="files" name="files[]"
												onchange="infoFile(this.files,'fileListRespT');"
												multiple="multiple">
											<!-- </span> <span id="nameFile"> -->
										</span>
										<div id="fileListRespT"></div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="box-email">
						<div class="box-body-email">
							<div class="col-md-12">
								<!-- <div id="iptMensajeContenidoResT"
									class="form-control contenidoModal" contenteditable="true"
									style="height: 100%;">
									<div id="iptRespTMensaje" hidefocus="true"
										aria-label="Cuerpo del mensaje" g_editable="true"
										role="textbox" aria-multiline="true" contenteditable="true"
										style="direction: ltr; min-height: 20px;"
										itacorner="6,7:1,1,0,0" spellcheck="true"></div>
									<blockquote type="cite" style="border-left: 1px solid #0b9dcc;">
										<div id="iptContenidoResT" style="opacity: .5;"></div>
									</blockquote>
								</div> -->
								<textarea id="iptMensajeContenidoResT" name="iptMensajeContenidoResT" rows="10" cols=""
									style="width: 100%;"></textarea>
							</div>
						</div>
					</div>
					<div style="display: none;">
						<input type="text" id="fechaTds" name="fechaTds">
					</div>
				</form>

				<!-- /.box -->
			</div>
			<div class="modal-footer" style="text-align: left;">
				<div id="mensajeReplyAllError"></div>
				<button type="button" class="btn btn-info"
					onclick="sendReplyAllEmail();">
					<span>Enviar</span>
				</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalReenviar" tabindex="-1" role="dialog"
	aria-labelledby="modalReenviar" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="floating-header">
				<button type="button" class="btn btn-info" data-dismiss="modal"
					style="border-color: #00c0ef;">
					<i class="glyphicon glyphicon-remove" aria-hidden="true"
						title="Close"></i>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<!-- form start -->
				<form id="infoReenviarForm" enctype='multipart/form-data'
					method="post">
					<input type="hidden" id="idUsuarioEmailRee" name="idUsuarioEmailRee" value="${idUsuarioEmail}">
					<div class="box-email">
						<div class="box-body-email">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-11">
										<div id="mensajeErrorRemRenvi" style="color: #FF0000;"></div>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="row">

									<div class="col-md-1">
										<div class="form-group">Para:</div>
									</div>
									<div class="col-md-11">
										<div class="form-group">
											<input type="email" class="form-control" id="iptReenviarPara"
												name="iptReenviarPara" style="height: 25px !important;"
												onchange="changeStyle('iptReenviarPara','mensajeReenviarError','mensajeErrorRemRenvi')"
												maxlength="500">
											<p style="font-size: 10px">
												<spring:message
													code="email.modal.instructions.multiple_email" />
											</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-1">
										<div class="form-group">CC:</div>
									</div>
									<div class="col-md-11">
										<div class="form-group">
											<input type="email" class="form-control" id="iptReenviarCc"
												name="iptReenviarCc"
												onchange="changeStyle('iptReenviarCc','mensajeReenviarError','mensajeErrorRemRenvi')"
												style="height: 25px !important;" maxlength="500">
											<p style="font-size: 10px">
												<spring:message
													code="email.modal.instructions.multiple_email" />
											</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-1">
										<div class="form-group">Asunto:</div>
									</div>
									<div class="col-md-11">
										<div class="form-group">
											<input type="text" class="form-control"
												id="iptReenviarAsunto" name="iptReenviarAsunto"
												style="height: 25px !important;" maxlength="500">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="box-email">
						<div class="box-body-email">
							<div class="col-md-12">
								<div class="row fileupload-buttonbar">
									<div class="col-lg-2">

										<span class="btn btn-cont fileinput-button">
											<i class="glyphicon glyphicon-paperclip"></i>
											<input type="file" class="glyphicon glyphicon-paperclip"
												id="files" name="files[]"
												onchange="infoFile(this.files,'fileListReenv');"
												multiple="multiple">
										</span>
										<!-- <span id="nameFile"></span> -->
										<div id="fileListReenv"></div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="box-email">
						<div class="box-body-email">
							<div class="col-md-12">
								<!-- <div id="iptMensajeContenidoReenviar" 
									class="form-control contenidoModal" contenteditable="true" 
									style="height: 100%;">
									<div id="iptReenviarMensaje" hidefocus="true"
										aria-label="Cuerpo del mensaje" g_editable="true"
										role="textbox" aria-multiline="true" contenteditable="true"
										style="direction: ltr; min-height: 20px;"
										itacorner="6,7:1,1,0,0" spellcheck="true"></div>
									<blockquote type="cite" style="border-left: 1px solid #0b9dcc;">
										<div id="iptContenidoReenviar" style="opacity: .5;"></div>
									</blockquote>
								</div> -->
								<textarea id="iptMensajeContenidoReenviar" name="iptMensajeContenidoReenviar" rows="10" cols=""
									style="width: 100%;"></textarea>
							</div>
						</div>
					</div>
					<div style="display: none;">
						<input type="text" id="fechaReenvio" name="fechaReenvio">

					</div>
				</form>

				<!-- /.box -->
			</div>
			<div class="modal-footer" style="text-align: left;">
				<div id="mensajeReenviarError"></div>
				<button type="button" class="btn btn-info"
					onclick="sendReenviarEmail();">
					<span>Enviar</span>
				</button>
			</div>
		</div>
	</div>
</div> --%>


<script type="text/javascript">
    $(function() {
		$("#files").on("change", handleFileSelect);
		
		selDiv = $("#fileListNewCorreo"); 
		$("#myForm").on("submit", handleForm);
		
		$("#modalNewCorreo").on("click", ".selFile", removeFile);
    	//var iptMensajeContenidoRes = document.getElementById('iptMensajeContenidoRes');
    	//CKEDITOR.replaceAll();
    	CKEDITOR.replace( 'iptMensajeContenidoRes', {
    	    
    	});
/*     	//CKEDITOR.add
    	//var iptMensajeContenidoResT = document.getElementById('iptMensajeContenidoResT');
    	CKEDITOR.replace( 'iptMensajeContenidoResT', {
    	    language: 'es'
    	});
    	//CKEDITOR.add
    	//var iptMensajeContenidoReenviar = document.getElementById('iptMensajeContenidoReenviar');
    	CKEDITOR.replace( 'iptMensajeContenidoReenviar', {
    	    language: 'es'
    	});
    	//CKEDITOR.add */
    });
</script>