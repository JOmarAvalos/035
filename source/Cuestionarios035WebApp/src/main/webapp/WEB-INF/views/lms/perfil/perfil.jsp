<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="<c:url value='/resources/js/lms/perfil/perfil.js' />" type="text/javascript"></script> 
		<c:if test="${not empty empresa}">
			<c:if test="${fn:contains(empresa, 'TOY')}">
				<style>
					main.l-main .perfil{
				        background-image: url('<c:url value='/resources/css/img/login-bg-TOY.jpg' />');
					    padding: 0;
					    position: relative;
				    }
			    </style>
		    </c:if>
		    <c:if test="${fn:contains(empresa, 'MIT')}">
				<style>
					main.l-main .perfil{
				        background-image: url('<c:url value='/resources/css/img/login-bg-MIT.jpg' />');
					    padding: 0;
					    position: relative;
			    }
			    </style>
		    </c:if>
		    <c:if test="${fn:contains(empresa, 'CMMDM')}">
				<style>
					main.l-main .perfil{
				        background-image: url('<c:url value='/resources/css/img/login-bg-CMMDM.jpg' />');
					    padding: 0;
					    position: relative;
			    }
			    </style>
		    </c:if>
		    <c:if test="${fn:contains(empresa, 'LMEX')}">
				<style>
					main.l-main .perfil{
				        background-image: url('<c:url value='/resources/css/img/login-bg-LMEX.jpg' />');
					    padding: 0;
					    position: relative;
				    }
			    </style>
		    </c:if>
		    <c:if test="${fn:contains(empresa, 'AA')}">
				<style>
					main.l-main .perfil{
				        background-image: url('<c:url value='/resources/css/img/login-bg-AA.jpg' />');
					    padding: 0;
					    position: relative;
				    }
			    </style>
		    </c:if>
		    <c:if test="${fn:contains(empresa, 'MN')}">
				<style>
					main.l-main .perfil{
				        background-image: url('<c:url value='/resources/css/img/login-bg-MN.jpg' />');
					    padding: 0;
					    position: relative;
				    }
			    </style>
		    </c:if>
	  	</c:if>
	  	<c:if test="${empty empresa}">
			<style>
				main.l-main .perfil{
				    background-image: url('<c:url value='/resources/css/img/bg-login-auto.jpg' />');
				    padding: 0;
				    position: relative;
				}
		    </style>
 		</c:if>
	    
</style>

<main class="l-main">
    <nav aria-label="breadcrumb" role="navigation">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><spring:message code="lms.perfil.inicio" /></a></li>
            <li class="breadcrumb-item active"><spring:message code="lms.perfil.title" /></li>
        </ol>
    </nav>
    <div class="content-wrapper perfil h-100">
        <div class="row justify-content-center h-100">
            <div class="col">
                <div class="perfil-wrapp">
               
                    <div class="info-perfil">
                                     
                    <div> <img src="<c:url value='/downloadImagePerfil'/>" alt="User"><i class="far fa-edit editPosit" onclick="editImage()"></i></div>
                    
                   
                   
                        <%-- <img src="<c:url value='/resources/css/img/avatar-user.svg' />" alt="User"> --%>
                        <h1>${currentUser.funcionarioVO.datosFuncionarioVO.nombres} ${currentUser.funcionarioVO.datosFuncionarioVO.apellidoUno} ${currentUser.funcionarioVO.datosFuncionarioVO.apellidoDos}</h1>
                        <h4><c:if test="${not empty currentUser.funcionarioVO.funcionarioPuestoVO}">${currentUser.funcionarioVO.funcionarioPuestoVO.auxPuesto.nombre}</c:if></h4>
                        <p>
                            <a href="#">${currentUser.funcionarioVO.datosFuncionarioVO.email}</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<div class="modal fade" id="editImgMenu" tabindex="-1" role="dialog"
	aria-labelledby="editImgMenu" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content border-0">
			<div class="modal-header bg-teknei text-white">
				<h5 class="modal-title" id=""><spring:message code="lms.perfil.editar.title" /></h5>
				<button type="button" class="close text-white" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body px-5">
				<div class="row">

					<div class="col-md-12 text-center mb-3">
						<img src="<c:url value='/downloadImagePerfil'/>"
							class="w-50 mb-3 cursor-pointer">
						<form method="POST" action="<c:url value='/upload' />"
							enctype="multipart/form-data">
							<p><spring:message code="lms.perfil.editar.foto" /></p>
							<div class="form-group">

								<input id="fileImg" type="file" name="file" accept="image/*"
									onchange="inUploadChange(this)" size="100" />
							</div>
							<div class="row ">
								<div class="col-md-12 col-12">
									<input class="md-btn md-btn-main" type="submit"
										id="btnUpdatePhotoPerfil" value="Guardar" />
								</div>
							</div>

						</form>
					</div>
				</div>


			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
