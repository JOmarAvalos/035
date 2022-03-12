<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="<c:url value='/resources/js/lms/documentos/documentos.js' />"
	type="text/javascript"></script>


<main class="l-main">
<nav aria-label="breadcrumb" role="navigation">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#"><spring:message code="lms.documentos.admin" /></a></li>
		<li class="breadcrumb-item active"><spring:message code="lms.documentos.title" /></li>
	</ol>
</nav>
<div class="content-wrapper admin_wrap">
	<h1><spring:message code="lms.documentos.repositorio" /></h1>

	<div id="accordion" role="tablist">
		<!-- ====FOLDER 1 HEADER==== -->
		<div class="accordion-repo">
			<c:if test="${not empty lstDocumentos}">
				<c:forEach items="${lstDocumentos}" var="documentos"
					varStatus="loop">
					<div id="${documentos.carpetaRepositorioVO.nombre}${documentos.id}"
						class="head-accordion-repo">
								<div class="title-head-accordion collapsed" onclick="subCarpetasDocumentos(${documentos.carpetaRepositorioVO.id});"
											class="btn toggle-accordion" data-toggle="collapse"
											data-target="#collapse${documentos.carpetaRepositorioVO.id}" aria-expanded="true"
											aria-controls="collapse${documentos.carpetaRepositorioVO.id}">
									<h5 class="sb-header">
										${documentos.carpetaRepositorioVO.nombre}
									</h5>
									<div class="toggle-accordion">
											<i class="fa" aria-hidden="true"></i>
									</div>
								</div>
								<div class="button-head-accordion">
									<button onclick="descargarZip(${documentos.carpetaRepositorioVO.id});" class="md-btn btn-small down-folder">
										<spring:message code="lms.documentos.btn.descargar" /><i class="fas fa-file-archive ml-2"></i>
									</button>
										
								</div>
						<!-- </div> -->

					</div>

					<!-- ====FOLDER 1 BODY==== -->
				<div id="collapse${documentos.carpetaRepositorioVO.id}" class="collapse"
						role="tabpanel" aria-labelledby="FolderHeadingOne"
						data-parent="#collapse${documentos.carpetaRepositorioVO.id}">
				</div>  
				</c:forEach>
			</c:if>


		</div>

	</div>
</div>
</main>

<div class="modal fade" id="modalRespuesta" tabindex="-1" role="dialog"
	aria-labelledby="modalRespuesta" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">

			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title"><spring:message code="lms.documentos.repositorio" /></h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<div class="box-body">
						<h4 id="modalTxtRespuesta" style=" color: black;"></h4>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal"><spring:message code="lms.documentos.btn.aceptar" /></button>
			</div>

		</div>
	</div>
</div>
