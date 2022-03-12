<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value='/resources/js/admin/contacto/contacto.js' />"
	type="text/javascript"></script>


<main class="l-main inscripciones">
            <nav aria-label="breadcrumb" role="navigation">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#"><spring:message code="lms.contacto.title" /></a></li>
                </ol>
            </nav>
            <div class="content-wrapper admin_wrap">
                <h1><spring:message code="lms.contacto.title" /></h1>


				<div class="row">
					<button class="btn btn-default btn-sm" onclick="showNewMessage()">
						<i class="fa fa-plus-square"></i> <span><spring:message
								code="lms.contacto.bnt.new" /></span>
					</button>
				</div>
				
				<div class="row">
					<div class="col-md-12 box box-solid " id="sectionNewHiloContacto"
						style="display: none">
						<div class="box-header">
							<h3 class="box-title">
								<spring:message code="lms.contacto.section.new.title" />
							</h3>
						</div>
						<form id="sectionNewHiloContactoForm" role="form"
							action="javascript:saveNewHiloContacto('sectionNewHiloContactoForm','');"
							method="POST" class="" data-parsley-validate="">
							<div class="box-body">
								<!-- text input -->
								<div class="form-group">
									<label><spring:message
											code="lms.contacto.section.new.titulo" /></label> <input
										type="text" class="form-control" required maxlength="100"
										placeholder="<spring:message
											code="lms.contacto.section.new.titulo" />"
										id="sectionNewHiloContactoTitulo">
								</div>
								<!-- textarea -->
								<div class="form-group">
									<label><spring:message
											code="lms.contacto.section.new.mensaje" /></label>
									<textarea id="sectionNewHiloContactoMensaje" class="form-control"
										rows="3" required maxlength="1000"
										placeholder="<spring:message
											code="lms.contacto.section.new.mensaje" />"></textarea>
								</div>
			
							</div>
							<div class="box-footer">
								<button type="submit" class="md-btn md-btn-main mt-4"><spring:message
											code="lms.contacto.section.new.btn.enviar" /></button>
								<button type="button" class="md-btn md-btn-main mt-4" onclick="hideNewMessage()"><spring:message
											code="lms.contacto.section.new.btn.cancelar" /></button>
							</div>
						</form>
					</div>
				</div>
				
				<c:if test="${not empty lstHiloContacto}">
					<c:forEach items="${lstHiloContacto}" var="hiloContactoVO" varStatus="loop">
						<div class="row">
		                    <div class="col">
		                        <div id="accordion" role="tablist" class="contact-accordion">
		                            <div class="ca-wrapp">
		                                <div class="card-header" role="tab" id="headingOne">
		                                    <div data-toggle="collapse" data-target="#collapse${loop.index}" aria-expanded="true" aria-controls="collapseOne" class="clearfix">
		                                        <p class="user-contact ">${hiloContactoVO.titulo}
		                                            
		                                            <span>${hiloContactoVO.funcionarioVO.datosFuncionarioVO.nombres}
													${hiloContactoVO.funcionarioVO.datosFuncionarioVO.apellidoUno}
													${hiloContactoVO.funcionarioVO.datosFuncionarioVO.apellidoDos} <fmt:formatDate pattern="dd-MM-yyyy | HH:mm"
														value="${hiloContactoVO.fchCreacion}" /></span>
		                                        </p>
		                                        <div class="up-accordion">
		                                            <i class="fa" aria-hidden="true"></i>
		                                        </div>
		                                    </div>
		                                    <p class="first-comment-contact"><b>${hiloContactoVO.mensaje}</b></p>
		                                </div>
		                                <div id="collapse${loop.index}" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
		                                	<div class="card-body">
		                                	<c:if test="${not empty hiloContactoVO.lstHijos}">
												<c:forEach items="${hiloContactoVO.lstHijos}" var="hiloContactoHijoVO" varStatus="loop2">
														
														<c:if test="${hiloContactoHijoVO.funcionarioVO.idEmpresa == 1}">
															<div class="respuesta-admin-container">
					                                            <p class="admin-respuesta">
					                                                <span>${hiloContactoHijoVO.funcionarioVO.datosFuncionarioVO.nombres} 
																		${hiloContactoHijoVO.funcionarioVO.datosFuncionarioVO.apellidoUno} 
																		${hiloContactoHijoVO.funcionarioVO.datosFuncionarioVO.apellidoDos} 
																		<fmt:formatDate pattern="dd-MM-yyyy | HH:mm" value="${hiloContactoHijoVO.fchCreacion}" />
																	</span>
					                                            </p>
					                                            <p>
					                                                <b>${hiloContactoHijoVO.mensaje}</b></p>
					                                        </div>
														</c:if>
														<c:if test="${hiloContactoHijoVO.funcionarioVO.idEmpresa != 1}">
															<div class="respuesta-container">
					                                            <p class="user-respuesta">
					                                                <span>${hiloContactoHijoVO.funcionarioVO.datosFuncionarioVO.nombres} 
																		${hiloContactoHijoVO.funcionarioVO.datosFuncionarioVO.apellidoUno} 
																		${hiloContactoHijoVO.funcionarioVO.datosFuncionarioVO.apellidoDos} 
																		<fmt:formatDate pattern="dd-MM-yyyy | HH:mm" value="${hiloContactoHijoVO.fchCreacion}" />
																	</span>
					                                            </p>
					                                            <p>
					                                                <b>${hiloContactoHijoVO.mensaje}</b></p>
					                                        </div>
														</c:if>
				                                    											
		                                    </c:forEach>
											</c:if>
												<form id="sectionNewHiloContactoFormRespuesta${hiloContactoVO.id}" role="form"
													action="javascript:saveNewHiloContacto('sectionNewHiloContactoFormRespuesta${hiloContactoVO.id}','${hiloContactoVO.id}');"
													method="POST" class="" data-parsley-validate="">
		                                            <div class="form-element form-textarea">
		                                                <textarea id="sectionNewHiloContactoMensajeRespuesta${hiloContactoVO.id}" rows="3" required maxlength="1000" class="form-element-field" placeholder=" "></textarea>
		                                                <div class="form-element-bar"></div>
		                                                <label class="form-element-label" for="field-3naeph-0f3yuw-x153ph-dzmahy-qhkmgm"><spring:message
											code="lms.contacto.section.hilo.label.respuesta" /> </label>
		                                            </div>
		                                            <button type="submit" class="md-btn md-btn-main mt-4"><spring:message
											code="lms.contacto.section.hilo.btn.responder" /></button>
		                                        </form>
											</div>	
		                                </div>
		                            </div>
		                        </div>
		
		                    </div>
		                </div>
					</c:forEach>
				</c:if>

            </div>
        </main>