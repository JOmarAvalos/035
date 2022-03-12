<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="json" uri="http://www.teknei.com/jsp/json"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="<c:url value='/resources/js/admin/email.js' />" type="text/javascript"></script>
<script src="<c:url value='/resources/plugins/ckeditor/ckeditor.js' />" type="text/javascript"></script>
<script type="text/javascript">
var selDiv = "";
var storedFiles = [];
var forwardNameFiles = [];
var doGetMessages = 0;
</script>
<%-- <link href="<c:url value='/resources/css/AdminLTE.css' />" /> --%>
<aside class="right-side" id="contentEmailJSP">
	<!-- Content Header (Page header) -->

<input type="hidden" id="idFolderEmail" value="${idFolder}">
	<section class="content-header" id="sectionHeaderEmail">
		<div class="pull-right box-tools">
			<c:if test="${not empty lstCuentas}">
				<div id="idSectionDropdown" class="dropdown user user-menu">
					<!-- <a href="#" class="btn-refresh" title="Actualizar Mail" onclick="refreshEmail(false)"> -->
					<a id="idbtnRefresh" href="#" class="btn btn-info" onclick="refreshEmail(false)">
						<i class="glyphicon glyphicon-refresh"></i>
					</a>
					<a class="dropdown-toggle btn btn-info" data-toggle="dropdown">
						<i class="glyphicon glyphicon-user"></i>
						&nbsp;&nbsp;
						<span>
							<c:forEach items="${lstCuentas}" var="usuarioEmailVO"
								varStatus="loop">
								<c:if test="${usuarioEmailVO.banPredeterminado == 1}">
									${usuarioEmailVO.alias}&nbsp;&nbsp;(${usuarioEmailVO.usuario})
									<input type="hidden" id="idUsuarioEmailPredeterminado"
										value="${usuarioEmailVO.id}">
									<input type="hidden" id="idUsuarioPredeterminado"
										value="${usuarioEmailVO.idUsuario}">
									<c:set var="emailPredeterminado" scope="session"
										value="${usuarioEmailVO}" />
								</c:if>
							</c:forEach>
							&nbsp;&nbsp;
							<i class="caret"></i>
						</span>
					</a>
					<a href="#" class="btn btn-info"
						onclick="settingsEmail('${emailPredeterminado.id}','${emailPredeterminado.usuario}','${emailPredeterminado.contrasenia}','${emailPredeterminado.alias}','${emailPredeterminado.servidorEntrada}','${emailPredeterminado.puertoEntrada}','${emailPredeterminado.servidorSalida}','${emailPredeterminado.puertoSalida}')">
						<i class="fa fa-cogs"></i>
					</a>
					<ul class="dropdown-menu">
						<!-- Menu Body -->
						<li class="user-body">
							<c:forEach items="${lstCuentas}" var="usuarioEmailVO"
								varStatus="loop">
								<c:if test="${usuarioEmailVO.banPredeterminado == 0}">
									<div class="col-xs-12 text-center callout callout-info"
										onclick="changeAccount('${usuarioEmailVO.id}')"
										style="cursor: pointer">
										&nbsp;
										<a href="#">${usuarioEmailVO.usuario}</a>
										&nbsp;
									</div>
								</c:if>
							</c:forEach>
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="col-xs-12">
								<button class="btn btn-default btn-sm"
									onclick="showAddEmailAccount()">
									<i class="fa fa-plus-square"></i>
									<span>
										<spring:message code="email.label.button.add_account" />
									</span>
								</button>
							</div>
						</li>
					</ul>
				</div>
			</c:if>
			<c:if test="${empty lstCuentas}">
				<button class="btn btn-default btn-sm"
					onclick="showAddEmailAccount()">
					<i class="fa fa-plus-square"></i>
					<span>
						<spring:message code="email.label.button.add_account" />
					</span>
				</button>
			</c:if>
		</div>
		<h1>Email</h1>
	</section>
	<!-- Main content -->
	<section class="content" style="background: #ffffff !important;">
		<div class="row">
			<div class="col-md-2">
				<div class="row">
					<div class="col-md-12">
						<button type="button" class="btn btn-newmail"
							onclick="newCorreo();">
							<span>
								<i class="fa fa-plus-circle" aria-hidden="true"></i> 
								<spring:message code="email.title.button.nuevo.mensaje" />
							</span>
						</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="">
							<ul class="menuEmail ">
								<c:choose>
									<c:when test="${idFolder == 1 }">
										<c:set var="classAux" scope="session" value="active" />
									</c:when>
									<c:otherwise>
										<c:set var="classAux" scope="session" value="comEmail" />
									</c:otherwise>
								</c:choose>
								<li style="cursor: pointer;" class="<c:out value="${classAux}"></c:out>" onclick="getMensajesEmail('INBOX');">
									<a >
									<i class="fa fa-inbox" aria-hidden="true"></i>
										<span>
											<spring:message code="email.label.bandeja" />
										</span>
									</a>
								</li>
								<c:choose>
									<c:when test="${idFolder == 2 }">
										
										<c:set var="classAux" scope="session" value="active" />
									</c:when>
									<c:otherwise>
										
										<c:set var="classAux" scope="session" value="comEmail" />
									</c:otherwise>
								</c:choose>
								<li style="cursor: pointer;" class="<c:out value="${classAux}"></c:out>" onclick="getMensajesEmail('INBOX.Sent');">
									<a >
									<i class="fa fa-paper-plane" aria-hidden="true"></i>
										<span>
											<spring:message code="email.label.enviados" />
										</span>
									</a>
								</li>
								<!-- Se quita la parte de borradores -->
								<%-- <c:choose>
									<c:when test="${idFolder == 3 }">
										<c:set var="classAux" scope="session" value="active" />
									</c:when>
									<c:otherwise>
										<c:set var="classAux" scope="session" value="comEmail" />
									</c:otherwise>
								</c:choose>
								<li class="<c:out value="${classAux}"></c:out>">
									<a onclick="getMensajesEmail('Drafts');">
										<span>
											<spring:message code="email.label.borradores" />
										</span>
									</a>
								</li> --%>

							</ul>
						</div>
					</div>

				</div>
			</div>
			<div id="div1" class="col-md-4">

				<div id="tablaEmail" class="row col-md-12">
					<table id="example1" class="tableEmail">
						<thead>
							<tr>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty emailPredeterminado}">
								<c:if test="${not empty emailPredeterminado.lstEmailVO}">
									<c:forEach items="${emailPredeterminado.lstEmailVO}"
										var="mensajes" varStatus="loop">
										<tr style="cursor: pointer;"
											onclick="getContenidoEmail(${loop.index},${mensajes.id},${idFolder});">
											<td>
												<div class="row">
													<c:choose>
														<c:when test="${idFolder == 1 }">
															<div class="col-sm-10 m-From">${mensajes.from}</div>
														</c:when>
														<c:when test="${idFolder == 2 }">
															<div class="col-sm-10 m-From">${mensajes.to}</div>
														</c:when>
														<c:otherwise>
															<div class="col-sm-10 m-From">${mensajes.to}</div>
														</c:otherwise>
													</c:choose>
													
												</div>
												<div class="row">
													<c:set var="arrayEstatus"
														value="${fn:split(mensajes.estatus, ';')}" />
													<c:if test="${not empty arrayEstatus}">
														<c:set var="styleAux" value="novisto"></c:set>
														<c:forEach items="${arrayEstatus}" var="estatusAux"
															varStatus="loopEstatus">
															<c:if test="${estatusAux == 'SEEN'}">
																<c:set var="styleAux" value="visto"></c:set>
															</c:if>
														</c:forEach>
														<div id="loop_email_subject_${loop.index}"
															class="col-sm-10 ${styleAux}">${mensajes.subject}
														</div>
													</c:if>
												</div>
											</td>
											<td class="text-center m-Date">
												<div class="row">
													<c:set var="arrayEstatus"
														value="${fn:split(mensajes.estatus, ';')}" />
													<c:if test="${not empty arrayEstatus}">
														<c:set var="styleAux"
															value="style=\"color: #017DAD; font-weight: bold;\""></c:set>
														<c:forEach items="${arrayEstatus}" var="estatusAux"
															varStatus="loopDate">
															<c:if test="${estatusAux == 'SEEN'}">
																<c:set var="styleAux" value=""></c:set>
															</c:if>
														</c:forEach>
														<div id="loop_email_received_${loop.index}" class=""
															${styleAux}>
															<fmt:formatDate pattern="yyyy-MM-dd"
																value="${mensajes.receivedDate}" />
														</div>
													</c:if>
												</div>
											</td>
											<%-- <td style="display: none;">
													<div id="mail_content_${loop.index}">
														<input type="hidden" id="email_id_${loop.index}"
															value="${mensajes.id}">
														<div class="row">
															<div class="col-md-2">
																<div class="user-panel">
																	<div class="pull-left image">
																		<img
																			src="<c:url value='/resources/css/img/imagen_usuario.png' />"
																			class="img-circle" alt="User Image"
																			style="width: 60px; height: 60px; border: 0px;" />
																	</div>
																</div>
															</div>
															<div class="col-md-10">
																<div class="row">
																	<div class="col-sm-10" id="fech${loop.index}">
																		<fmt:formatDate pattern="dd/MM/yyyy hh:mm:ss"
																			value="${mensajes.receivedDate}" />
																	</div>
																	<div style="display: none;">
																		<input type="text" id="receive${loop.index}"
																			name="receive${loop.index}"
																			value="${mensajes.receivedDate}">
																	</div>
																</div>
																<div class="row">
																	<div class="col-sm-10">${mensajes.from}</div>
																	<div style="display: none;">
																		<input type="text" id="from${loop.index}"
																			name="from${loop.index}"
																			value="${fn:replace(mensajes.from, "\"", "")}">
																		<input type="text" id="fromReplyAll${loop.index}"
																			name="fromReplyAll${loop.index}"
																			value="${fn:replace(mensajes.responderAll, "\"", "")}">
																	</div>
																</div>
																<div class="row">
																	<div id="subject${loop.index}" class="col-sm-10">${mensajes.subject}</div>
																</div>
															</div>
														</div>
														<c:if test="${not empty mensajes.to}">
															<div class="row">
																<div class="col-sm-1">
																	<span>To: </span>
																</div>
																<div class="col-sm-11">${mensajes.to}</div>
																<div style="display: none;">
																	<input type="text" id="to${loop.index}"
																		name="to${loop.index}"
																		value="${fn:replace(mensajes.to, "\"", "")}">
																</div>
															</div>
														</c:if>
														<c:if test="${not empty mensajes.cc}">
															<div class="row">
																<div class="col-sm-1">
																	<span>CC: </span>
																</div>
																<div class="col-sm-11">${mensajes.cc}</div>
																<div style="display: none;">
																	<input type="text" id="cc${loop.index}"
																		name="cc${loop.index}"
																		value="${fn:replace(mensajes.cc, "\"", "")}">
																	<input type="text" id="ccReplyAll${loop.index}"
																		name="ccReplyAll${loop.index}"
																		value="${fn:replace(mensajes.responderAllCC, "\"", "")}">
																</div>
															</div>
														</c:if>
														<br>
														<div class="row " style="border-bottom: 1px solid #ddd;">
															<button type="button" class="btn btn-cont"
																onclick="responderCorreo(${loop.index});">
																<span role="link" class="ams bkH">Responder</span>
															</button>
															<button type="button" class="btn btn-cont"
																onclick="responderTdsCorreo(${loop.index});">
																<span role="link" class="ams bkI">Responder a
																	todos</span>
															</button>
															<button type="button" class="btn btn-cont"
																onclick="reenviarCorreo(${loop.index});">
																<span role="link" class="ams bkG">Reenviar</span>
															</button>
														</div>
														<c:if test="${not empty mensajes.lstFilesNames}">
															<div class="row " style="border-bottom: 1px solid #ddd;">
																<ul class="menuEmail ">
																	<c:forEach items="${mensajes.lstFilesNames}"
																		var="listFileAttach" varStatus="loopFile">
																		<li class="active">
																			<a
																				href="<c:url value='/email/downloadFile?idUser=${emailPredeterminado.idUsuario}&name=${listFileAttach}&idEmail=${mensajes.idMessage}'/>"
																				target="_blank" class="text-center">${listFileAttach}</a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</c:if>
														<c:if test="${not empty mensajes.message}">
															<div class="row">
																<div id="conten${loop.index}" class="col-sm-10">
																	${mensajes.message}</div>
															</div>
														</c:if>
													</div>
												</td> --%>
										</tr>
									</c:forEach>
								</c:if>
							</c:if>
						</tbody>
					</table>

				</div>

			</div>
			<div class="col-md-6">
				<!-- <div id="contenidoEmail" class="contenidoEmail"></div> -->
				<iframe id="frameContent" class="contenidoEmail" width="100%" title="Contenido Email" ></iframe>
			</div>

		</div>

	</section>
	<!-- /.content -->
</aside>

<div class="modal fade" id="modalNewCorreo"  role="dialog"
	aria-labelledby="modalNewCorreo" aria-hidden="true">
	<div class="modal-dialog modal-large modal-newmail">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header">
				<h4><i class="fa fa-envelope" aria-hidden="true"></i>
				  Nuevo Correo</h4>
				<button type="button" class="btn btn-info btn-close-modal" data-dismiss="modal"
					style="border-color: #00c0ef;">
					<i class="glyphicon glyphicon-remove" aria-hidden="true"
						title="Cerrar"></i>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<!-- form start -->
				<form id="infoForm" enctype='multipart/form-data' method="post">
				<input type="hidden" id="idUsuarioEmailNew" name="idUsuarioEmailNew" value="${emailPredeterminado.id}">
					<div class="box-email">
						<div class="box-body-email">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-11">
										<div id="mensajeErrorRemitente" style="color: #FF0000;"></div>
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
											<input type="email" class="form-control" id="iptPara"
												name="iptPara" style="height: 25px !important;"
												onchange="changeStyle('iptPara','mensajeError','mensajeErrorRemitente')"
												multiple maxlength="500" required="required">
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
											<input type="email" class="form-control" id="iptCc"
												name="iptCc" style="height: 25px !important;"
												onchange="changeStyle('iptCc','mensajeError','mensajeErrorRemitente')"
												multiple="multiple" maxlength="500">
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
											<input type="text" class="form-control" id="iptAsunto"
												name="iptAsunto" style="height: 25px !important;"
												placeholder="" maxlength="500">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="box-email" style="margin-top:-10px;">
						<div class="box-body-email">
							<div class="col-md-12">
								<div class="row fileupload-buttonbar">
									<div class="col-lg-12">
					 					<span class="btn btn-cont fileinput-button" style="border: 0px; box-shadow: none;">
											<i class="glyphicon glyphicon-paperclip"></i>
											<input type="file" class="glyphicon glyphicon-paperclip"
												id="files" name="files[]"
												
												multiple="multiple">
										</span>
										<!-- <span id="nameFile"></span> -->
										<div id="fileListNewCorreo"></div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="box-email">
						<div class="box-body-email">
							<div class="col-md-12">
								<textarea id="iptMensaje" name="iptMensaje" ></textarea>
							</div>
						</div>
					</div>
				</form>

				<!-- /.box -->
			</div>
			<div class="modal-footer">
				<div id="mensajeError"></div>
				<button type="button" class="btn btn-info" onclick="sendEmail(event);">
					<span>Enviar <i class="fa fa-paper-plane" aria-hidden="true"></i>
					</span>
				</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalNewEmailAccount" tabindex="-1"
	role="dialog" data-keyboard="false" data-backdrop="static"
	aria-labelledby="modalNewEmailAccount" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<!-- form start -->
			<form role="form" id="emailForm"
				action="javascript:saveNewEmailAccount(this);" method="POST"
				class="" data-parsley-validate="">

				<div class="modal-header bg-glass-sknd">
					<h3 class="box-title">
						<spring:message code="email.label.modal_new.title" />
					</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" style="color: white;">&times;</span>
					</button>
				</div>
				<div class="modal-body text-white" style="color: grey;">
					<div class="box box-primary">
						<div class="box-header"></div>
						<div class="box-body">
							<input type="hidden" class="form-control" id="idEmailAccount"
								name="idEmailAccount">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="usuarioEmailAccount">
											<spring:message code="email.label.modal_new.usuario" />
										</label>
										<input type="text" class="form-control" maxlength="100"
											id="usuarioEmailAccount" name="usuarioEmailAccount"
											placeholder="<spring:message code="email.label.modal_new.usuario_holder" />"
											>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="passwordEmailAccount">
											<spring:message code="email.label.modal_new.password" />
										</label>
										<input type="password" class="form-control" maxlength="30"
											id="passwordEmailAccount" name="passwordEmailAccount"
											placeholder="<spring:message code="email.label.modal_new.password" />"
											>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="aliasEmailAccount">
											<spring:message code="email.label.modal_new.alias" />
										</label>
										<input type="text" class="form-control" id="aliasEmailAccount"
											name="aliasEmailAccount" maxlength="20"
											placeholder="<spring:message code="email.label.modal_new.alias" />">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<label for="serverInEmailAccount">
										<spring:message code="email.label.modal_new.servidor_in" />
									</label>
								</div>
								<div class="col-md-6 form-group">
									<input type="url" class="form-control"
										id="serverInEmailAccount" name="serverInEmailAccount"
										placeholder="<spring:message code="email.label.modal_new.servidor_in" />"
										 maxlength="100">
								</div>
								<div class="col-md-6 form-group">
									<input type="number" class="form-control"
										id="portInEmailAccount" name="portInEmailAccount"
										maxlength="5" min="10"
										placeholder="<spring:message code="email.label.modal_new.port_in" />"
										>
								</div>
							</div>
							<div class="row ">
								<div class="col-md-12">
									<label for="serverOutEmailAccount">
										<spring:message code="email.label.modal_new.servidor_out" />
									</label>
								</div>
								<div class="col-md-6 form-group">
									<input type="url" class="form-control"
										id="serverOutEmailAccount" name="serverOutEmailAccount"
										placeholder="<spring:message code="email.label.modal_new.servidor_out" />"
										 maxlength="100">
								</div>
								<div class="col-md-6 form-group">
									<input type="number" class="form-control"
										id="portOutEmailAccount" name="portOutEmailAccount"
										maxlength="5" min="10"
										placeholder="<spring:message code="email.label.modal_new.port_out" />"
										>
								</div>
							</div>

							<div class="row" id="rowPredeterminadaModal">
								<div class="col-md-12">
									<label for="defaultEmailAccount">
										<spring:message code="email.label.modal_new.predeterminada" />
									</label>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<div class="form-group">
											<label class="">
												<div class="icheckbox_flat-red" aria-checked="false"
													aria-disabled="false" style="position: relative;">
													<input id="defaultEmailAccount" name="defaultEmailAccount"
														type="checkbox" class="flat-red"
														style="position: absolute; opacity: 0;">
													<ins class="iCheck-helper"
														style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
												</div>
											</label>
											<%-- <label><spring:message code="email.label.modal_new.predeterminada_desc" /></label> --%>
										</div>
									</div>
								</div>
							</div>

							<!-- /.box -->
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn">
						<spring:message code="email.label.modal_new.btn_accept" />
					</button>
					<button type="button" class="btn" data-dismiss="modal">
						<spring:message code="email.label.modal_new.btn_cancel" />
					</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {

		CKEDITOR.replace( 'iptMensaje');

		/* CKEDITOR.on('iptMensaje', function (e) {    
		    var dialog = e.data.definition.dialog;
		    dialog.on('show', function () {    
		          var element = this.getElement();
		          var labelledby = element.getAttribute('aria-labelledby');          
		          var nativeElement = document.querySelector("[aria-labelledby='" + labelledby + "']");          
		          nativeElement.onclick = function (evt) {
		             if ((evt.target.tagName == "INPUT" || evt.target.tagName == "SELECT" || evt.target.tagName == "TEXTAREA") &&
		                  -1 != evt.target.className.indexOf("cke_dialog_ui_input")) {
		                  evt.target.focus();    
		             };
		          }  
		    });   
		}); */
		
		$("#files").on("change", handleFileSelect);
		
		selDiv = $("#fileListNewCorreo"); 
		$("#myForm").on("submit", handleForm);
		
		$("#modalNewCorreo").on("click", ".selFile", removeFile);
		
    	
    	
    	<c:if test="${emailPredeterminado.banActivo == 0}">
    		maskDiv("contentEmailJSP",'Espera mientras se descargan los mensajes. Esto puede tardar varios minutos....');
    		if(doGetMessages == 0){
    			console.log("ACTUAIZANDO CORREOS CUENTA INACTIVA......");
    			refreshEmail(true);
    		}else{
    			console.log("YA SE ENCUENTRA UN METODO ACTIVO - CORREOS CUENTA INACTIVA......");
        		}
		</c:if>
		<c:if test="${emailPredeterminado.banActivo == 1}">
			if(doGetMessages == 0){
				refreshEmail(false);
				console.log("-----INTERVALO REGISTRADO-----");
			}
		    setInterval(function(){
		    	
		    	if(doGetMessages == 0){
		    		console.log("ACTUALIZANDO CORREOS INTERVAL......");
		    		refreshEmail(false);
		    	}else{
		    		console.log("YA SE ENCUENTRA UN METODO ACTIVO INTERVAL......");
				    }
		    },${intervalo},"JavaScript");
		</c:if>

		<c:if test="${not empty grupo}">
		console.log("-----Nuevo correo de grupo-----");
			newCorreo();
			
			<c:if test="${not empty motivoVO}">
				getDataMotivo(${motivoVO.id});
			</c:if>

			<c:if test="${not empty grupo.funcionarios}">
			<c:forEach items="${grupo.funcionarios}" var="funcionario">
                putDataTo('${funcionario.datosFuncionarioVO.email}','${funcionario.datosFuncionarioVO.emailAdicional}');
          	</c:forEach>
			</c:if>
		</c:if>
    });
</script>

