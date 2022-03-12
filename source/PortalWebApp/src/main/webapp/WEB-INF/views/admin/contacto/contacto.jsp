<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value='/resources/js/admin/contacto/contacto.js' />"
	type="text/javascript"></script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<%-- <div class="pull-right box-tools">
			<button class="btn btn-default btn-sm" onclick="showNewMessage()">
				<i class="fa fa-plus-square"></i> <span><spring:message
						code="home.menu.contacto.bnt.new" /></span>
			</button>
		</div> --%>
		<h1>
			<spring:message code="home.menu.contacto.title" />
		</h1>

	</section>

	<!-- Main content -->
	<section class="content">
	
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<c:if test="${not empty lstEmpresa}">
					<c:forEach items="${lstEmpresa}" var="empresa">
						<c:if test="${not empty currentEmpresa}">
							<c:if test="${empresa.id == currentEmpresa.id}">
								<li class="active">
									<a href="#" onclick="window.location = ctx + 'contactoByEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
								</li>
							</c:if>
							<c:if test="${empresa.id != currentEmpresa.id}">
								<li>
									<a href="#" onclick="window.location = ctx + '/contactoByEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
								</li>
							</c:if>
						</c:if>
						<c:if test="${empty currentEmpresa}">
							<li>
								<a href="#" onclick="window.location = ctx + '/contactoByEmpresa?idEmpresa='+${empresa.id};" data-toggle="tab">${empresa.nombre}</a>
							</li>
						</c:if>
						
					</c:forEach>
				</c:if>
			</ul>
		</div>
		<c:if test="${not empty currentEmpresa}">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<c:if test="${activos == 1}">
						<li class="active">
							<a href="#" onclick="window.location = ctx + '/contactoByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Sin respuesta</a>
						</li>	
						<li>
							<a href="#" onclick="window.location = ctx + '/contactoLeidosByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Respondidos</a>
						</li>	
					</c:if>		
					<c:if test="${activos == 0}">
						<li >
							<a href="#" onclick="window.location = ctx + '/contactoByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Sin respuesta</a>
						</li>	
						<li class="active">
							<a href="#" onclick="window.location = ctx + '/contactoLeidosByEmpresa?idEmpresa='+${currentEmpresa.id};" data-toggle="tab">Respondidos</a>
						</li>	
					</c:if>		
				</ul>
			</div>
		</c:if>
		<div class="col-md-12 box box-solid " id="sectionNewHiloContacto"
			style="display: none">
			<div class="box-header">
				<h3 class="box-title">
					<spring:message code="home.menu.contacto.section.new.title" />
				</h3>
			</div>
			<form id="sectionNewHiloContactoForm" role="form"
				action="javascript:saveNewHiloContacto('sectionNewHiloContactoForm','');"
				method="POST" class="" data-parsley-validate="">
				<div class="box-body">
					<!-- text input -->
					<div class="form-group">
						<label><spring:message
								code="home.menu.contacto.section.new.titulo" /></label> <input
							type="text" class="form-control" required maxlength="100"
							placeholder="<spring:message
								code="home.menu.contacto.section.new.titulo" />"
							id="sectionNewHiloContactoTitulo">
					</div>
					<!-- textarea -->
					<div class="form-group">
						<label><spring:message
								code="home.menu.contacto.section.new.mensaje" /></label>
						<textarea id="sectionNewHiloContactoMensaje" class="form-control"
							rows="3" required maxlength="1000"
							placeholder="<spring:message
								code="home.menu.contacto.section.new.mensaje" />"></textarea>
					</div>

				</div>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">Enviar</button>
					<button type="button" class="btn" onclick="hideNewMessage()">Cancelar</button>
				</div>
			</form>
		</div>
		<%-- <div class="page-header">
			<div class="pull-right box-tools">
            	<button class="btn btn-default btn-sm" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse"><i class="fa fa-plus-square"></i> <span><spring:message code="home.menu.contacto.bnt.new"/></span></button>
            </div>
		</div> --%>
		<c:if test="${not empty lstHiloContacto}">
			<c:forEach items="${lstHiloContacto}" var="hiloContactoVO"
				varStatus="loop">
				<div class="row col-md-12">
					<div class="col-md-12 box box-solid callout callout-info">
						<div id="accordion" role="tablist" class="contact-accordion">
							<div class="ca-wrapp">
								<div class="card-header" role="tab" id="headingOne">
									<div data-toggle="collapse"
										data-target="#collapse${loop.index}" aria-expanded="true"
										aria-controls="collapseOne" class="clearfix">
										<c:if test="${not empty hiloContactoVO.lstHijos}">
											<div class="pull-right box-tools">
												<div class="up-accordion">
													<button class="btn btn-default btn-sm"
														data-widget="collapse" data-toggle="tooltip" title=""
														data-original-title="Collapse">
														<i class="fa fa-caret-down"></i>
													</button>
												</div>
											</div>
										</c:if>
										<div class="pull-right box-tools">
											<h6 class="user-contact ">
												${hiloContactoVO.funcionarioVO.datosFuncionarioVO.nombres}
												${hiloContactoVO.funcionarioVO.datosFuncionarioVO.apellidoUno}
												${hiloContactoVO.funcionarioVO.datosFuncionarioVO.apellidoDos}
												<span>&nbsp;&nbsp;<i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;&nbsp;</span>
												<span><fmt:formatDate pattern="dd-MM-yyyy | HH:mm"
														value="${hiloContactoVO.fchCreacion}" /></span><span>&nbsp;&nbsp;&nbsp;</span>
											</h6>
										</div>
										<h4>
											<b>${hiloContactoVO.titulo}</b>
										</h4>
									</div>
									<p class="first-comment-contact">${hiloContactoVO.mensaje}</p>
								</div>
								<br>
								<div id="collapse${loop.index}" class="collapse "
									role="tabpanel" aria-labelledby="headingOne"
									data-parent="#accordion">
									<c:if test="${not empty hiloContactoVO.lstHijos}">
										<c:forEach items="${hiloContactoVO.lstHijos}"
											var="hiloContactoHijoVO" varStatus="loop2">
											<div class="card-body callout callout-info">
												<div class="respuesta-container">
													<div class="pull-right box-tools">
														<h6 class="user-respuesta">
															${hiloContactoHijoVO.funcionarioVO.datosFuncionarioVO.nombres}
															${hiloContactoHijoVO.funcionarioVO.datosFuncionarioVO.apellidoUno}
															${hiloContactoHijoVO.funcionarioVO.datosFuncionarioVO.apellidoDos}
															<span>&nbsp;&nbsp;<i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;&nbsp;</span><span><fmt:formatDate
																	pattern="dd-MM-yyyy | HH:mm"
																	value="${hiloContactoHijoVO.fchCreacion}" /></span>
														</h6>
													</div>
													<p>${hiloContactoHijoVO.mensaje}</p>
												</div>
											</div>

										</c:forEach>
									</c:if>
									<!-- <form action="" method="" class="form">
									<div class="form-element form-textarea">
										<textarea id="" class="form-element-field" placeholder=" "></textarea>
										<div class="form-element-bar"></div>
										<label class="form-element-label"
											for="field-3naeph-0f3yuw-x153ph-dzmahy-qhkmgm">Tu
											respuesta </label>
									</div>
									<button onclick="location.href='index.html';" type="submit"
										class="md-btn md-btn-main mt-4">Responder</button>
								</form> -->
									<form id="sectionNewHiloContactoFormRespuesta${hiloContactoVO.id}" role="form"
										action="javascript:saveNewHiloContacto('sectionNewHiloContactoFormRespuesta${hiloContactoVO.id}','${hiloContactoVO.id}');"
										method="POST" class="" data-parsley-validate="">
										<!-- text input -->
										<!-- textarea -->
										<div class="form-group">
											<label><spring:message
													code="home.menu.contacto.section.new.mensaje" /></label>
											<textarea id="sectionNewHiloContactoMensajeRespuesta${hiloContactoVO.id}"
												class="form-control" rows="5" required maxlength="2000"
												placeholder="Respuesta"></textarea>
										</div>
										<button type="submit" class="btn btn-primary">Responder</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
			</c:forEach>
		</c:if>
	</section>
	<!-- /.content -->
</aside>
<!-- /.right-side -->
