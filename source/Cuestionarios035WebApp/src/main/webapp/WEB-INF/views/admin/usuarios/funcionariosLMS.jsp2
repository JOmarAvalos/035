<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="now" class="java.util.Date" />

<script src="<c:url value='/resources/js/admin/funcionariosLMS.js' />"
	type="text/javascript"></script>
	
<style>
	.btn-new-func{
	    background:var(--color-green);
	    -webkit-box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.16);
	    box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.16);
	    border: 2px solid #04A013;
	    width: 47px;
	    height: 47px;
	    border-radius: 100%;
	    color: white;
	    margin: 0 auto;
	    position: relative;
	    -webkit-transition: all ease-out .4s;
	    transition: all ease-out .4s;
	}
	.btn-new-func i{
	    -webkit-transition: all ease-out .4s;
	    transition: all ease-out .4s;
	}
	.btn-new-func::after{
	   content: '<spring:message code="lms.funcionarioslms.new.funcionario.title" />';
	    font-size: 10px;
	    color: var(--color-graytrd);
	    position: absolute;
	    bottom: -20px;
	    left: -100%;
	    width: 300%;  
	    font-family: var(--fregular);
	    -webkit-transition: all ease-out .4s;
	    transition: all ease-out .4s;
	}
	.btn-new-func:hover i{
	    -webkit-transform: scale(1.1);
	    transform: scale(1.2);
	}
	.btn-new-func:hover{
	    -webkit-box-shadow: 0px 0px 6px rgba(0, 0, 0, 0.6);
	    box-shadow: 0px 0px 6px rgba(0, 0, 0, 0.6);
	    background-color: #04A013;
	}
	.btn-new-func:hover::after{
	    font-family: var(--fbold);
	}
	.btn-new-part{
	    background:var(--color-green);
	    -webkit-box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.16);
	    box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.16);
	    border: 2px solid #04A013;
	    width: 47px;
	    height: 47px;
	    border-radius: 100%;
	    color: white;
	    margin: 0 auto;
	    position: relative;
	    -webkit-transition: all ease-out .4s;
	    transition: all ease-out .4s;
	}
	.btn-new-part i{
	    -webkit-transition: all ease-out .4s;
	    transition: all ease-out .4s;
	}
	.btn-new-part::after{
	   content: '<spring:message code="lms.funcionarioslms.new.participante.title" />';
	    font-size: 10px;
	    color: var(--color-graytrd);
	    position: absolute;
	    bottom: -20px;
	    left: -100%;
	    width: 300%;  
	    font-family: var(--fregular);
	    -webkit-transition: all ease-out .4s;
	    transition: all ease-out .4s;
	}
	.btn-new-part:hover i{
	    -webkit-transform: scale(1.1);
	    transform: scale(1.2);
	}
	.btn-new-part:hover{
	    -webkit-box-shadow: 0px 0px 6px rgba(0, 0, 0, 0.6);
	    box-shadow: 0px 0px 6px rgba(0, 0, 0, 0.6);
	    background-color: #04A013;
	}
	.btn-new-part:hover::after{
	    font-family: var(--fbold);
	}
		
	.custom-file-tarea {
	  position: relative;
	  display: inline-block;
	  width: 100%;
	  height: calc(1.5em + 0.75rem + 2px);
	  margin-bottom: 0;
	}
	
	.custom-file-tarea-input {
	  position: relative;
	  z-index: 2;
	  width: 100%;
	  height: calc(1.5em + 0.75rem + 2px);
	  margin: 0;
	  opacity: 0;
	}
	
	.custom-file-tarea-input:focus ~ .custom-file-tarea-label {
	  border-color: #80bdff;
	  -webkit-box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
	  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
	}
	
	.custom-file-tarea-input[disabled] ~ .custom-file-tarea-label,
	.custom-file-tarea-input:disabled ~ .custom-file-tarea-label {
	  background-color: #e9ecef;
	}
	
	.custom-file-tarea-input:lang(en) ~ .custom-file-tarea-label::after {
	  content: "<spring:message code='lms.actividad.tarea.file' />";
	}
	
	.custom-file-tarea-input ~ .custom-file-tarea-label[data-browse]::after {
	  content: attr(data-browse);
	}
	
	.custom-file-tarea-label {
	  position: absolute;
	  top: 0;
	  right: 0;
	  left: 0;
	  z-index: 1;
	  height: calc(1.5em + 0.75rem + 2px);
	  padding: 0.375rem 0.75rem;
	  font-weight: 400;
	  line-height: 1.5;
	  color: #495057;
	  background-color: #fff;
	  border: 1px solid #ced4da;
	  border-radius: 0.25rem;
	}
	
	.custom-file-tarea-label::after {
	  position: absolute;
	  top: 0;
	  right: 0;
	  bottom: 0;
	  z-index: 3;
	  display: block;
	  height: calc(1.5em + 0.75rem);
	  padding: 0.375rem 0.75rem;
	  line-height: 1.5;
	  color: #495057;
	  content: "<spring:message code='lms.actividad.tarea.file' />";
	  background-color: #e9ecef;
	  border-left: inherit;
	  border-radius: 0 0.25rem 0.25rem 0;
	}
</style>
	
<main class="l-main">
    <nav aria-label="breadcrumb" role="navigation">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><spring:message code="lms.funcionarioslms.admin" /></a></li>
            <c:if test="${not empty empresa}">
			    <c:if test="${!fn:contains(empresa, 'TOY')}">
		            <li class="breadcrumb-item active"><spring:message code="lms.funcionarioslms.funcionarios.title" /></li>
			    </c:if>
			    <c:if test="${fn:contains(empresa, 'TOY')}">
		            <li class="breadcrumb-item active"><spring:message code="lms.funcionarioslms.participante.title" /></li>
			    </c:if>
		    </c:if>
        </ol>
    </nav>
    <div class="content-wrapper admin_wrap">
            <c:if test="${not empty empresa}">
			    <c:if test="${!fn:contains(empresa, 'TOY')}">
			        <h1><spring:message code="lms.funcionarioslms.funcionarios.title" /></h1>
			    </c:if>
			    <c:if test="${fn:contains(empresa, 'TOY')}">
			        <h1><spring:message code="lms.funcionarioslms.censo.title" /></h1>
			    </c:if>
		    </c:if>

        <div class="row justify-content-end align-items-center">
            <div class="col-sm-6 col-12 nfb">
            	<c:if test="${tieneGrupo}">
		            <c:if test="${not empty empresa}">
					    <c:if test="${!fn:contains(empresa, 'TOY')}">
			                <button class="btn-new-func" onclick="newFuncionario();">
			                    <i class="fas fa-user-plus" ></i>
			                </button>
					    </c:if>
					    <c:if test="${fn:contains(empresa, 'TOY')}">
			                <button class="btn-new-part" onclick="newFuncionario();">
			                    <i class="fas fa-user-plus" ></i>
			                </button>
					    </c:if>
				    </c:if>
            	</c:if>
            </div>
            <div class="col-sm-6 col-12 mb-2">
                <div class="search_bar">
                	<c:if test="${not empty empresa}">
					    <c:if test="${!fn:contains(empresa, 'TOY')}">
		                    <input type="search" id="search_input_all" onkeyup="FilterkeyWord_all_table()" placeholder="<spring:message code="lms.funcionarioslms.placeholder.buscar" />"><span></span>
					    </c:if>
					    <c:if test="${fn:contains(empresa, 'TOY')}">
		                    <input type="search" id="search_input_all" onkeyup="FilterkeyWord_all_table()" placeholder="<spring:message code="lms.funcionarioslms.placeholder.buscar.toy" />"><span></span>
					    </c:if>
				    </c:if>
                </div>
            </div>
        </div>
        
        <hr class="mb-3">
        <!-- tabla -->
        <div class="row ">
            <div class="col">
                <div class="table-responsive-sm">
                    <table class="table table-striped tabla-funcionarios" id= "table-cu">
                        <thead>
                            <tr>
                                <th class="text-left"><spring:message code="lms.funcionarioslms.table.nombre" /></th>
                                <th><spring:message code="lms.funcionarioslms.table.disribuidor" /></th>
                                <th><spring:message code="lms.funcionarioslms.table.puesto" /></th>
                                <th><spring:message code="lms.funcionarioslms.table.acciones" /></th>
                            </tr>
                        </thead>
                        <tbody>
							<c:if test="${not empty lstFuncionarios}">
								<c:forEach items="${lstFuncionarios}" var="funcionario">
		                            <tr>
		                                <td>${funcionario.datosFuncionarioVO.nombres} ${funcionario.datosFuncionarioVO.apellidoUno} ${funcionario.datosFuncionarioVO.apellidoDos}</td>
										<td>${funcionario.auxDealerPrincipal}</td>
										<td>${funcionario.auxPuestoPrincipal}</td>
		                                <td>
		                                    <a href="#" title="Editar" data-toggle="modal" onclick="getFuncionario('${funcionario.id}','${currentUser.funcionarioVO.id }', '${locale}');">
		                                        <i class="fas fa-user-edit"></i>
		                                    </a>
		                                </td>
		                            </tr>
								</c:forEach>
							</c:if>
                        	
                        <tbody>
                    </table>
                </div>


                <!--		Start Pagination -->
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-4 col-sm-6 col-8">
                <div class="num_rows">
                    <div class="form-group"> 	
                        <select class="form-control" name="state" id="maxRows">
                            <option value="10"><spring:message code="lms.funcionarioslms.num.rows.op10" /></option>
                            <option value="15"><spring:message code="lms.funcionarioslms.num.rows.op15" /></option>
                            <option value="20"><spring:message code="lms.funcionarioslms.num.rows.op20" /></option>
                            <option value="50"><spring:message code="lms.funcionarioslms.num.rows.op50" /></option>
                            <option value="70"><spring:message code="lms.funcionarioslms.num.rows.op70" /></option>
                            <option value="100"><spring:message code="lms.funcionarioslms.num.rows.op100" /></option>
                            <option value="5000"><spring:message code="lms.funcionarioslms.num.rows.optext" /></option>
                        </select>

                    </div>
                </div>
            </div>
            <div class="col-8">
                <div class='pagination-container'>
                    <nav>
                        <ul class="pagination">
                            <!--	Here the JS Function Will Add the Rows -->
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-12">
                <c:if test="${not empty locale}">
				    <c:if test="${fn:contains(locale, 'es')}">
				        <div class="rows_count"><spring:message code="lms.reportes.rows.count" /></div>
				    </c:if>
				    <c:if test="${fn:contains(locale, 'en')}">
				        <div class="rows_countEn"><spring:message code="lms.reportes.rows.count" /></div>
				    </c:if>
				    <c:if test="${fn:contains(locale, 'fr')}">
				        <div class="rows_countFr"><spring:message code="lms.reportes.rows.count" /></div>
				    </c:if>
				</c:if>
				<c:if test="${empty locale}">
				    <div class="rows_count"><spring:message code="lms.reportes.rows.count" /></div>
				</c:if>
            </div>
        </div> 
        <!-- End Tabla -->
    </div>
</main>

                <!-- Modal editar funcionario -->
<div class="modal fade edit-func" id="edit-funcionario">
	<div class="modal-dialog modal-dialog-centered modal-xl">
	    <div class="modal-content">
	
	        <!-- Modal Header -->
	        <div class="modal-header">
	            <h4 class="modal-title" id="h4Nombre"></h4>
	            <p id="pRFC"></p>
	            <button type="button" class="close" data-dismiss="modal">
	                <div class="leftright"></div>
	                <div class="rightleft"></div>
	                <label class="close-label"><spring:message code="lms.funcionarioslms.editar.label.cerrar" /></label>
	            </button>
	            <hr>
	        </div>
	
	        <!-- Modal body -->
	        <div class="modal-body">
	        	<div id="divInfoFuncionarioCard">
	         	<input type="hidden" id="iptFuncionarioEdit">
	             <div class="row">
	                 <div class="col-lg-4 col-sm-6 col-12">
	                     <p>
	                     	<span><spring:message code="lms.funcionarioslms.editar.puestos.table.dealer" />: </span>
	                     </p>
	                     <p id="pDistribuidor"></p>
	                 </div>
	                 <div class="col-lg-4 col-sm-6 col-12">
	                     <p>
	                     	<span><spring:message code="lms.funcionarioslms.editar.email" />:</span><div id="pEmail"></div>
	                     </p>
	                 </div>
	                 <div class="col-lg-4 col-sm-6 col-12">
	                     <p>
	                     	<span><spring:message code="lms.funcionarioslms.editar.puesto" />:</span><div id="pPuesto"></div>
	                     </p>
	                 </div>
	                 <div class="col-lg-4 col-sm-6 col-12">
	                     <p>
	                         <span><spring:message code="lms.funcionarioslms.editar.grupo" /></span>
	                         <div>
		                         <c:if test="${not empty grupoDealer}">
		                         	<input type="hidden" id="iptGrupoDealer" value="${grupoDealer.id}">
		                         	${grupoDealer.agrupacion}
		                         </c:if>
	                         </div>
	                     </p>
	                 </div>
	                 <div class="col-lg-4 col-sm-6 col-12">
	                     <p>
	                     	<span><spring:message code="lms.funcionarioslms.editar.telefono" />:</span><div id="pTelefono"></div>
	                     </p>
	                 </div>
	                 <div class="col-12"><hr></div>
	             </div>
	             <div class="row">
	              <div class="col">
	              	<ul class="nav nav-tabs  edit-func-modal" role="tablist">
	                      <li class="nav-item">
	                          <a class="nav-link active" id="inscribir-tab" data-toggle="tab" href="#inscribir-content" role="tab" aria-controls="inscribir-content" aria-selected="true">
	                              <i class="fas fa-user-plus"></i> <span><spring:message code="lms.funcionarioslms.editar.puestos.title" /></span>
	                          </a>
	                      </li>
	                      <li class="nav-item">
	                          <a class="nav-link" id="inscritos-tab" data-toggle="tab" href="#inscritos-content" role="tab" aria-controls="inscritos-content" aria-selected="false">
	                              <i class="fas fa-users"></i>
	                              <span><spring:message code="lms.funcionarioslms.editar.cursos.title" /></span> 
	                          </a>
	                      </li>
	                  </ul>
	                  
	                  <div class="tab-content">
	
	                                 <!-- ====TAB INSCRIBIR==== -->
	
	                                 <div class="tab-pane fade show active" id="inscribir-content" role="tabpanel" aria-labelledby="inscribir-tab">
	
	                                     <div class=""></div>
	                                     <!-- tabla -->
	                                     <div class="row">
	                                         <div class="col mt-3">
	                                             <div class="tables-modal table-responsive-sm">
	                                                 <table class="table table-striped table-sm table-borderless" id="table-adicionales">
	                                                     <thead>
	                                                         <tr>
	                                                             <th class="text-left"><spring:message code="lms.funcionarioslms.editar.puestos.table.dealer" /> </th>
	                                                             <th class="text-center"><spring:message code="lms.funcionarioslms.editar.puestos.table.puesto" /></th>
	                                                             <th class="text-center"><spring:message code="lms.funcionarioslms.editar.puestos.table.accion" /></th>
	                                                         </tr>
	                                                     </thead>
	                                                     
	                                                     
	                                                     <c:if test="${not empty locale}">
														    <c:if test="${fn:contains(locale, 'es')}">
														        <tbody id="tbodyPuestos"></tbody>
														    </c:if>
														    <c:if test="${fn:contains(locale, 'en')}">
														        <tbody id="tbodyPuestosEn"></tbody>
														    </c:if>
														    <c:if test="${fn:contains(locale, 'fr')}">
														        <tbody id="tbodyPuestosFr"></tbody>
														    </c:if>
														 </c:if>
														 <c:if test="${empty locale}">
														    <tbody id="tbodyPuestos"></tbody>
														 </c:if>

	                                                     
	                                                     
	                                                 </table>
	                                             </div>
	                                             <!--		Start Pagination -->
	                                         </div>
	                                     </div>
	                                     <div class="row justify-content-center">
	                                         <div class="col-6">
	                                         </div>
	                                         <div class=" col-6">
	                                             <div class='pagination-container'>
	                                                 <nav>
	                                                     <ul class="pagination">
	                                                         <!--	Here the JS Function Will Add the Rows -->
	                                                     </ul>
	                                                 </nav>
	                                             </div>
	                                         </div>
	
	                                     </div> 
	                                     <!-- End Tabla -->
	                                 </div>
	
	                                 <!-- ====TAB INSCRITOS==== -->
	
	                                 <div class="tab-pane fade" id="inscritos-content" role="tabpanel" aria-labelledby="inscritos-tab"> 
	                                     <!-- tabla -->
	                                     <div class="row">
	                                         <div class="col mt-3">
	                                             <div class="tables-modal table-responsive-sm">
	                                                 <table class="table table-striped table-sm table-borderless">
	                                                     <thead>
	                                                         <tr>
	                                                             <th class="text-left"><spring:message code="lms.funcionarioslms.editar.cursos.table.curso" /> </th>
	                                                             <th><spring:message code="lms.funcionarioslms.editar.cursos.table.fecha" /></th>
	                                                             <th><spring:message code="lms.funcionarioslms.editar.cursos.table.calificacion" /></th> 
	                                                         </tr>
	                                                     </thead>
	                                                     <c:if test="${not empty locale}">
														    <c:if test="${fn:contains(locale, 'es')}">
														        <tbody id="tbodyCursos"></tbody>
														    </c:if>
														    <c:if test="${fn:contains(locale, 'en')}">
														        <tbody id="tbodyCursosEn"></tbody>
														    </c:if>
														    <c:if test="${fn:contains(locale, 'fr')}">
														        <tbody id="tbodyCursosFr"></tbody>
														    </c:if>
														 </c:if>
														 <c:if test="${empty locale}">
														    <tbody id="tbodyCursos"></tbody>
														 </c:if>

	                                                 </table>
	                                             </div>
	                                             <!--		Start Pagination -->
	                                         </div>
	                                     </div>
	                                     <!-- End Tabla -->
	                                 </div>
	
	                             </div>
	              </div>
	             </div>
	             
	             <div id="divPuestoAdicional" style="display:none;">
	<hr>
	<div class="row">
		<div class="col-md-3">
			<div class="form-group">
				<label><spring:message code="lms.funcionarioslms.editar.puesto.adic.label.dealer" /></label> <select class="form-control"
	id="selecDealerAdicional" onchange="onChangeDealerAdiconal();">
	<option value="0"><spring:message code="lms.funcionarioslms.editar.puesto.adic.select" /></option>
	<c:if test="${not empty dealers}">
	<c:forEach items="${dealers}" var="dealer">
	<option value="${dealer.id}">${dealer.nombre}</option>
	</c:forEach>
	</c:if>	
			</select>
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label><spring:message code="lms.funcionarioslms.editar.puesto.adic.label.grupo" /></label> <select class="form-control"
	id="selecGrupoPuestoAdicional" onchange="getPuestosAdicional()" disabled="disabled">
	<option value="0"><spring:message code="lms.funcionarioslms.editar.puesto.adic.select" /></option>
	<c:if test="${not empty gruposPuesto}">
	<c:forEach items="${gruposPuesto}" var="grupoPuesto">
	<option value="${grupoPuesto.id}">${grupoPuesto.descripcion}</option>
	</c:forEach>
	</c:if>	
			</select>
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label><spring:message code="lms.funcionarioslms.editar.puesto.adic.label.puesto" /></label> 
			<select class="form-control" id="selecPuestoAdicional">
				<option value="0"><spring:message code="lms.funcionarioslms.editar.puesto.adic.select" /></option>
			</select>
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label for="iptIngresoPuesto"><spring:message code="lms.funcionarioslms.editar.puesto.adic.fecha" /></label> 
	<input type="date" class="form-control" id="iptIngresoPuestoAdicional" placeholder="<spring:message code="lms.funcionarioslms.editar.puesto.adic.fecha" />" min="${MIN_FECHA}" max="${MAX_FECHA}" value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>' onkeydown="return false">
			</div>
		</div>
	</div>	
	
	<div class="row">
		<div class="col">
			<button type="button"  class="md-btn md-btn-main" onclick="asignarPuestoAdicional();"><spring:message code="lms.funcionarioslms.editar.puesto.adic.btn.asignar" /></button>
	<button type="button"  class="md-btn md-btn-close" onclick="cancelaPuestoAdicional();"><spring:message code="lms.funcionarioslms.editar.puesto.adic.btn.cancelar" /></button>
			</div>
		</div>							
	</div>
	                        
	                        <hr>
	                   	</div>
	                   	<div id="divEditFuncionarioCard" style="display:none;">
	<div class="row">
		<div class="col-md-3">
			<div class="form-group">
				<label for="iptNombresFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.nombre" /></label> <input
	type="text" class="form-control" id="iptNombresFuncionarioEdit"
	placeholder="<spring:message code="lms.funcionarioslms.editar.label.nombre" />" value="" maxlength="50">
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label for="iptApellidoPaternoFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.app" />
	</label> <input type="text" class="form-control"
		id="iptApellidoPaternoFuncionarioEdit"
		placeholder="<spring:message code="lms.funcionarioslms.editar.label.app" />" value="" maxlength="50">
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label for="iptApellidoMaternoFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.apm" /></label> <input type="text" class="form-control"
	id="iptApellidoMaternoFuncionarioEdit"
	placeholder="<spring:message code="lms.funcionarioslms.editar.label.apm" />" value="" maxlength="50">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<div class="form-group">
				<label for="iptNacimientoFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.fecha" /></label> <input type="date" class="form-control"
	id="iptNacimientoFuncionarioEdit"
	placeholder="<spring:message code="lms.funcionarioslms.editar.label.fecha" />" value="" >
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label for="iptCurpFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.curp" /></label> <input
	type="text" class="form-control" id="iptCurpFuncionarioEdit"
	placeholder="<spring:message code="lms.funcionarioslms.editar.label.curp" />" value="" maxlength="18">
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label for="iptEmail1Funcionario"><spring:message code="lms.funcionarioslms.editar.label.email" /></label> <input
	type="text" class="form-control" id="iptEmail1FuncionarioEdit"
	placeholder="<spring:message code="lms.funcionarioslms.editar.label.email" />" value="" maxlength="50">
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label for="iptEmail2FuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.email.adic" /></label> <input
	type="text" class="form-control" id="iptEmail2FuncionarioEdit"
	placeholder="<spring:message code="lms.funcionarioslms.editar.label.email.adic" />" value="" maxlength="50">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<div class="form-group">
				<label for="iptNssFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.nss" /></label> <input type="text"
	onkeypress="return isNumberKey(event)" class="form-control"
	id="iptNssFuncionarioEdit" placeholder="<spring:message code="lms.funcionarioslms.editar.label.nss" />" maxlength="11" value="">
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label for="iptWorkidFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.work" /></label> <input
	type="text" onkeypress="return isNumberKey(event)"
	class="form-control" id="iptWorkidFuncionarioEdit"
	placeholder="<spring:message code="lms.funcionarioslms.editar.label.work" />" value="" maxlength="10" disabled="disabled">
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label for="iptTelefonoFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.tel" /></label> <input
	type="text" onkeypress="return isNumberKey(event)"
	class="form-control" id="iptTelefonoFuncionarioEdit"
	placeholder="<spring:message code="lms.funcionarioslms.editar.label.tel" />" value="" maxlength="10">
		</div>
	</div>
	<div class="col-md-1">
		<div class="form-group">
			<label for="iptExtensionFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.extension" /></label> <input
	type="text" onkeypress="return isNumberKey(event)"
	class="form-control" id="iptExtensionFuncionarioEdit"
	placeholder="<spring:message code="lms.funcionarioslms.editar.label.extension" />" value="" maxlength="5">
		</div>
	</div>
	<div class="col-md-2">
		<div class="form-group">
			<label for="iptMovilFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.movil" /></label> <input
	type="text" onkeypress="return isNumberKey(event)"
	class="form-control" id="iptMovilFuncionarioEdit"
	placeholder="<spring:message code="lms.funcionarioslms.editar.label.movil" />" value="" maxlength="10">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<div class="form-group">
				<label for="iptNoClinicaFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.no.clinica" /></label> <input type="text"
	onkeypress="return isNumberKey(event)" class="form-control"
	id="iptNoClinicaFuncionarioEdit" placeholder="<spring:message code="lms.funcionarioslms.editar.label.no.clinica" />" value="" maxlength="8">
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label for="iptClinicaFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.clinica" /></label> <input
	type="text" class="form-control" id="iptClinicaFuncionarioEdit"
	placeholder="<spring:message code="lms.funcionarioslms.editar.label.clinica" />" value="" maxlength="50">
		</div>
	</div>
	<div class="col-md-3">
		<div class="form-group">
			<label for="iptSexoFuncionarioEdit"><spring:message code="lms.funcionarioslms.editar.label.sexo" /> </label><br> 
	<input type="radio" name="hmEdit" id="iptSexoFuncionarioMEdit" value="M"> <spring:message code="lms.funcionarioslms.editar.label.mujer" /> 
	<input type="radio" name="hmEdit" id="iptSexoFuncionarioHEdit" value="H"> <spring:message code="lms.funcionarioslms.editar.label.hombre" />
			</div>
		</div>
		
	</div>
	<div class="row">
		<div class="col">
			<button class="md-btn md-btn-main" onclick="updateFuncionario();"><i class="fas fa-user-edit"></i> <spring:message code="lms.funcionarioslms.editar.btn.actualizar" /></button>
	<button class="md-btn md-btn-close" onclick="cancelaUpdate();"><i class="fas fa-times"></i> <spring:message code="lms.funcionarioslms.editar.btn.cancelar" /></button>
		</div>
	</div>
	<hr>
	                   	</div>
	                   	
	                   </div>
	
	                   <!-- Modal footer -->
	        <div class="modal-footer">
	        	<div class="container">
	        	
	        		<div class="row">
	                <div class="col-12">
	                    <div class= "actions-modal text-center">
	                        <button class="md-btn md-btn-main" onclick="showEditFuncionario();" id="btnEditFuncionario"><i class="fas fa-user-edit"></i> <spring:message code="lms.funcionarioslms.editar.btn.editar" /></button>
	                        <button class="md-btn md-btn-main" onclick="showPuestoAdicional();" id="btnNuevoPuesto"><i class="fas fa-briefcase"></i><spring:message code="lms.funcionarioslms.editar.btn.new.puesto" /></button>
	  	<c:if test="${not empty empresa}">
	<c:if test="${!fn:contains(empresa, 'TOY')}">
	                          <button class="md-btn md-btn-cancel" onclick="showBajaFuncionario();" id="btnBajaFuncionario"><i class="fas fa-user-alt-slash"></i><spring:message code="lms.funcionarioslms.editar.btn.baja" /></button>
	</c:if>
	<c:if test="${fn:contains(empresa, 'TOY')}">
	                          <button class="md-btn md-btn-cancel" onclick="showBajaFuncionario();" id="btnBajaFuncionario"><i class="fas fa-user-alt-slash"></i><spring:message code="lms.funcionarioslms.editar.btn.baja.toy" /></button>
	</c:if>
	</c:if>
	                    </div>
	                </div>
	                <div class="col-12 text-center mt-1">
	                	<button type="button" class="md-btn md-btn-close " data-dismiss="modal" id="btnCerrarFuncionario"><i class="fas fa-times"></i> <spring:message code="lms.funcionarioslms.editar.btn.cerrar" /></button>
	                    </div>
	                </div>
	            	</div>
	                
	            </div>
	
	        </div>
	    </div>
	</div>


<!-- MODAL NUEVO FUNCIONARIO -->
<div class="modal fade new-func" id="modalNewFuncionario" tabindex="-1"
	role="dialog" aria-labelledby="modalNewFuncionario" aria-hidden="true" style="overflow-y: scroll;">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header">
	            <c:if test="${not empty empresa}">
				    <c:if test="${!fn:contains(empresa, 'TOY')}">
						<h4 class="modal-title uppercase bold"><spring:message code="lms.funcionarioslms.new.funcionario.title" /></h4>
				    </c:if>
				    <c:if test="${fn:contains(empresa, 'TOY')}">
						<h4 class="modal-title uppercase bold"><spring:message code="lms.funcionarioslms.new.participante.title" /></h4>
				    </c:if>
			    </c:if>
				<button type="button" class="close" data-dismiss="modal" id="btnExitFuncionarioHeader">
                    <div class="leftright"></div>
                    <div class="rightleft"></div>
                    <label class="close-label"><spring:message code="lms.funcionarioslms.new.label.cerrar" /></label>
                </button>
			</div>
			<div class="modal-body">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<form role="form">
						<div class="box-body">
							<input type="hidden" id="iptIdFuncionarioNuevo">
							<div class="row">
								<div class="col-md-12">
									<p style="color:red;" ><spring:message code="lms.funcionarioslms.new.msg.recuerda" /></p>
									<p style="color:red;" class="bold"><spring:message code="lms.funcionarioslms.new.msg.part" /></p>
								</div>
							</div>
							<div class="row" id="rowSelectExtranjero">
								<div class="col-md-12">
									<div class="form-group">
							            <c:if test="${not empty empresa}">
										    <c:if test="${!fn:contains(empresa, 'TOY')}">
												<label><spring:message code="lms.funcionarioslms.new.label.origen" /></label> 
										    </c:if>
										    <c:if test="${fn:contains(empresa, 'TOY')}">
												<label><spring:message code="lms.funcionarioslms.new.label.origen.toy" /></label> 
										    </c:if>
									    </c:if>
										<select class="form-control" id="selectExtranjero" onchange="validateExtranjero();">	
											<option value=""><spring:message code="lms.funcionarioslms.new.select" /></option>
											<option value="0"><spring:message code="lms.funcionarioslms.new.op.nacional" /></option>
											<option value="1"><spring:message code="lms.funcionarioslms.new.op.ext" /></option>
										</select>
									</div>
								</div>
							</div>
							<div class="row" id="rowDocumentoExtranjero" style="display:none">
								<div class="col-md-12">
									<label for="extranjeroFile"><spring:message code="lms.funcionarioslms.new.label.documento" /></label>
								</div>
								<div class="col-md-12">
									<div class="custom-file-tarea">
										<br> <br> 
										<input type="file" class="custom-file-tarea-input"
											name="extranjeroFile"
											id="extranjeroFile" accept="application/pdf,image/jpeg,image/x-png" 
											onchange="inUploadChangePass(this)">
											
											<label class="custom-file-tarea-label" for="extranjeroFile" style="color:black !important;  text-align: left;line-height:30px;"
											    id="lblIptPasaporte"><spring:message code='lms.actividad.tarea.file' /></label>
										<p class="help-block">&nbsp;&nbsp;&nbsp;</p>
			
									</div>	
								</div>
							</div>
							<div class="row" id="rowIdDocumento" style="display:none">
								<div class="col-md-12">
									<div class="form-group">
										<label for="iptIdDocumento"><spring:message code="lms.funcionarioslms.new.label.id.documento" /></label> <input type="text"
											class="form-control" id="iptIdDocumento" placeholder="<spring:message code="lms.funcionarioslms.new.label.id.documento" />" maxlength="50">
									</div>
								</div>								
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptRfcFuncionario"><spring:message code="lms.funcionarioslms.new.label.rfc" /></label> <input type="text"
											class="form-control" id="iptRfcFuncionario" placeholder="<spring:message code="lms.funcionarioslms.new.label.rfc" />" onchange="validaRFC();" maxlength="13">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptNombresFuncionario"><spring:message code="lms.funcionarioslms.new.label.nombre" /></label> <input
											type="text" class="form-control" id="iptNombresFuncionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.nombre" />" maxlength="50">
									</div>
								</div>
							</div>
							<div class="row" id="rowDocumentoRFC" >
								<div class="col-md-12">
									<label for="rfcFile"><spring:message code="lms.funcionarioslms.new.label.doc.rfc" /></label>
								</div>
								<div class="col-md-12">
									<div class="custom-file-tarea">
										<br> <br> 
										<input type="file" class="custom-file-tarea-input"
											name="rfcFile"
											id="rfcFile" accept="application/pdf,image/jpeg,image/x-png" 
											onchange="inUploadChangeRFC(this)">
											
											<label class="custom-file-tarea-label" for="rfcFile" style="color:black !important;  text-align: left;line-height:30px;"
											    id="lblIptrfc"><spring:message code='lms.actividad.tarea.file' /></label>
										<p class="help-block">&nbsp;&nbsp;&nbsp;</p>
			
									</div>	
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptApellidoPaternoFuncionario"><spring:message code="lms.funcionarioslms.new.label.app" /></label> <input type="text" class="form-control"
											id="iptApellidoPaternoFuncionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.app" />" maxlength="50">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptApellidoMaternoFuncionario"><spring:message code="lms.funcionarioslms.new.label.apm" /></label> <input type="text" class="form-control"
											id="iptApellidoMaternoFuncionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.apm" />" maxlength="50">
									</div>
								</div>
							</div>
							<div id="divDatosAdicinalesF">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptNacimientoFuncionario"><spring:message code="lms.funcionarioslms.new.label.fecha" /></label> <input type="date" class="form-control"
											id="iptNacimientoFuncionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.fecha" />" >
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptSexoFuncionario"><spring:message code="lms.funcionarioslms.new.label.sexo" /> </label><br> <input
											type="radio" name="hm" id="iptSexoFuncionarioM" value="M"
											checked="checked"> <spring:message code="lms.funcionarioslms.new.label.mujer" /> <input type="radio"
											name="hm" id="iptSexoFuncionarioH" value="H"> <spring:message code="lms.funcionarioslms.new.label.hombre" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptEmail1Funcionario"><spring:message code="lms.funcionarioslms.new.label.email" /></label> <input
											type="text" class="form-control" id="iptEmail1Funcionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.email" />" maxlength="50">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptEmail2Funcionario"><spring:message code="lms.funcionarioslms.new.label.email.adic" /></label> <input
											type="text" class="form-control" id="iptEmail2Funcionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.email.adic" />" maxlength="50">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptCurpFuncionario"><spring:message code="lms.funcionarioslms.new.label.curp" /></label> <input
											type="text" class="form-control" id="iptCurpFuncionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.curp" />" maxlength="18">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptNssFuncionario"><spring:message code="lms.funcionarioslms.new.label.nss" /></label> <input type="text"
											onkeypress="return isNumberKey(event)" class="form-control"
											id="iptNssFuncionario" placeholder="<spring:message code="lms.funcionarioslms.new.label.nss" />" maxlength="11">
									</div>
								</div>
							</div>
							<div class="row" id="rowDocumentoCURP" >
								<div class="col-md-12">
	                                <label for="curpFile"><spring:message code="lms.funcionarioslms.new.label.doc.curp" /></label>
								</div>
								<div class="col-md-12">
									<div class="custom-file-tarea">
										<br> <br> 
										<input type="file" class="custom-file-tarea-input"
											name="curpFile"
											id="curpFile" accept="application/pdf,image/jpeg,image/x-png" 
											onchange="inUploadChangeCurp(this)">
											
											<label class="custom-file-tarea-label" for="curpFile" style="color:black !important;  text-align: left;line-height:30px;"
											    id="lblIptCurp"><spring:message code='lms.actividad.tarea.file' /></label>
										<p class="help-block">&nbsp;&nbsp;&nbsp;</p>
			
									</div>	
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptClinicaFuncionario"><spring:message code="lms.funcionarioslms.new.label.clinica" /></label> <input
											type="text" class="form-control" id="iptClinicaFuncionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.clinica" />" maxlength="50">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptNoClinicaFuncionario"><spring:message code="lms.funcionarioslms.new.label.no.clinica" /></label> <input type="text"
											onkeypress="return isNumberKey(event)" class="form-control"
											id="iptNoClinicaFuncionario" placeholder="<spring:message code="lms.funcionarioslms.new.label.no.clinica" />" maxlength="8">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptTelefonoFuncionario"><spring:message code="lms.funcionarioslms.new.label.tel" /></label> <input
											type="text" onkeypress="return isNumberKey(event)"
											class="form-control" id="iptTelefonoFuncionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.tel" />" maxlength="10">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label for="iptExtensionFuncionario"><spring:message code="lms.funcionarioslms.new.label.extension" /></label> <input
											type="text" onkeypress="return isNumberKey(event)"
											class="form-control" id="iptExtensionFuncionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.extension" />" maxlength="5">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label for="iptMovilFuncionario"><spring:message code="lms.funcionarioslms.new.label.movil" /></label> <input
											type="text" onkeypress="return isNumberKey(event)"
											class="form-control" id="iptMovilFuncionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.movil" />" maxlength="10">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="iptWorkidFuncionario"><spring:message code="lms.funcionarioslms.new.label.work" /></label> <input
											type="text" onkeypress="return isNumberKey(event)"
											class="form-control" id="iptWorkidFuncionario"
											placeholder="<spring:message code="lms.funcionarioslms.new.label.work" />" maxlength="10">
									</div>
								</div>
							</div>
							</div>
							
						</div>
					</form>
				</div>
				<!-- /.box -->
				<div class="box box-primary" id="divPuestosFuncionario" style="display:none">
					<div class="box-header">
						<h4><spring:message code="lms.funcionarioslms.new.puesto.principal.title" /></h4>
					</div>
					<div class="box-body">
						<div id="divNuevoPuesto">
						
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label><spring:message code="lms.funcionarioslms.new.puesto.principal.label.dealer" /></label> <select class="form-control"
												id="selecDealer">
												<option value="0"><spring:message code="lms.funcionarioslms.new.puesto.principal.select" /></option>
												<c:if test="${not empty dealers}">
													<c:forEach items="${dealers}" var="dealer">
														<option value="${dealer.id}">${dealer.nombre}</option>
													</c:forEach>
												</c:if>	
											</select>
										</div>
									</div>
								</div>	
						
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label><spring:message code="lms.funcionarioslms.new.puesto.principal.label.grupo" /></label> <select class="form-control"
												id="selecGrupoPuesto" onchange="getPuestos()">
												<option value="0"><spring:message code="lms.funcionarioslms.new.puesto.principal.select" /></option>
												<c:if test="${not empty gruposPuesto}">
													<c:forEach items="${gruposPuesto}" var="grupoPuesto">
														<option value="${grupoPuesto.id}">${grupoPuesto.descripcion}</option>
													</c:forEach>
												</c:if>	
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label><spring:message code="lms.funcionarioslms.new.puesto.principal.label.puesto" /></label> <select class="form-control"
												id="selecPuesto">
												<option value="0"><spring:message code="lms.funcionarioslms.new.puesto.principal.select" /></option>
	
											</select>
										</div>
									</div>
								</div>
	
	
								
								
								
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="iptIngresoPuesto"><spring:message code="lms.funcionarioslms.new.puesto.principal.label.fecha" /></label> 
											<input type="date" class="form-control" id="iptIngresoPuesto" placeholder="<spring:message code="lms.funcionarioslms.new.puesto.principal.label.fecha" />" min="${MIN_FECHA}" max="${MAX_FECHA}" value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>' onkeydown="return false">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
				                            <label for="iptCheckPuestoPrincipal"><spring:message code="lms.funcionarioslms.new.puesto.principal.label.principal" /></label>
				                            <input id="iptCheckPuestoPrincipal" type="checkbox" checked="checked" disabled="disabled">
				                        </div>
									</div>
								</div>	
								
								<div class="row">
									<div class="col-md-12 text-center" id="divBtnAsignaPuesto">
										<button type="button" class="md-btn md-btn-main" onclick="asignarPuesto();"><spring:message code="lms.funcionarioslms.new.puesto.principal.btn.asignar" /></button>
									</div>
								</div>							
							</div>
						
					</div>
				</div>
			</div>
			<div class="modal-footer">
			<div class="row w-100 text-center">
				<div class="col-12">
					<button type="button" class="md-btn md-btn-main" onclick="saveFuncionario();" id="btnSaveFuncionario"><spring:message code="lms.funcionarioslms.new.btn.aceptar" /></button>
				</div>
				<div class="col-12 mt-2">
					<button type="button" class="md-btn md-btn-close" data-dismiss="modal" id="btnExitFuncionarioFooter"><i class="fas fa-times"></i> <spring:message code="lms.funcionarioslms.new.btn.cancelar" /></button>
				</div>
			</div>
				
				
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalExitoFuncionario" tabindex="-1"
	role="dialog" aria-labelledby="modalNewFuncionario" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
			</div>
	        <div class="modal-body">
	            <div class="row my-4">
	
	                <div class="col">
			            <c:if test="${not empty empresa}">
						    <c:if test="${!fn:contains(empresa, 'TOY')}">
			                	<p><spring:message code="lms.funcionarioslms.response.save.msg" /></p>
						    </c:if>
						    <c:if test="${fn:contains(empresa, 'TOY')}">
	    		            	<p><spring:message code="lms.funcionarioslms.response.save.msg.toy" /></p>
						    </c:if>
					    </c:if>
	                </div>
	            </div>
	            <hr>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " onclick="$('#modalNewFuncionario').modal({backdrop: 'static', keyboard: false});"><spring:message code="lms.funcionarioslms.response.save.btn.continuar" /></button>
            </div>

        </div>
    </div>
</div>

<!-- MODAL ERROR DATOS OBLIGATORIOS-->
<div class="modal fade" id="modalDatosObligatorios" tabindex="-1"
	role="dialog" aria-labelledby="modalDatosObligatorios" aria-hidden="true" >
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd error-modal-content">
			<div class="modal-header">
				<h4 class="modal-title uppercase txt-red text-center">
				 	<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
				 	<br> <spring:message code="lms.funcionarioslms.response.error" />
				</h4>
			</div>
	        <div class="modal-body">
	            <div class="row">
	                <div class="col">
	                	<p class="bold"><spring:message code="lms.funcionarioslms.response.error.msg" /></p>
	                </div>
	            </div>
	            <hr>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.response.error.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>

<!-- MODAL COINCIDENCIAS -->
<div class="modal fade" id="modalCoincidencias" tabindex="-1"
	role="dialog" aria-labelledby="modalcoincidencias" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd alert-one-modal-content">
			<div class="modal-header">
				<h4 class="modal-title txt-orange uppercase bold text-center">  
				<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
				<br> <spring:message code="lms.funcionarioslms.coincid.advertencia" />
				</h4>
			</div>
			<div class="modal-body">
				<div id="divMensajesC" class="regular"></div>
			</div>
			<div class="modal-footer my-3">
				<button type="button" class="md-btn md-btn-main " onclick="showModalReingreso();" id="btnSolicitaReingreso" style="display:none;"><spring:message code="lms.funcionarioslms.coincid.btn.solicitar" /></button>
				<button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.coincid.btn.cerrar" /></button>
			</div>
		</div>
	</div>
</div>

<!-- MODAL ALTA PUESTO EXITOSO-->
<div class="modal fade" id="modalAdicionalAsignado" tabindex="-1"
	role="dialog" aria-labelledby="modalAdicionalAsignado" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd success-modal-content">
			<div class="modal-header ">
				<h3 class="txt-green text-center"><i class="fas fa-check-circle"></i></h3>
				<h5 class="modal-title txt-green uppercase bold text-center">
				<spring:message code="lms.funcionarioslms.response.asignado.msg" />
				</h5>
			</div>
	        <div class="modal-body">
	            <hr>
	        </div>
        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.response.asignado.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="modalPuestoAsignado" tabindex="-1"
	role="dialog" aria-labelledby="modalPuestoAsignado" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd success-modal-content">
			<div class="modal-header ">
				<h3 class="txt-green text-center"><i class="fas fa-check-circle"></i></h3>
				<h5 class="modal-title txt-green uppercase bold text-center">
				<spring:message code="lms.funcionarioslms.response.asignado.msg" />
				</h5>
			</div>
	        <div class="modal-body">
	            <hr>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " onclick="window.location = ctx + '/lms/funcionarios';"><spring:message code="lms.funcionarioslms.response.asignado.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="modalBajaUsuario" tabindex="-1"
	role="dialog" aria-labelledby="modalBajaUsuario" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd success-modal-content">
			<div class="modal-header ">
				<h3 class="txt-green text-center"><i class="fas fa-check-circle"></i></h3>
				<h6 class="modal-title txt-green uppercase bold text-center">
			            <c:if test="${not empty empresa}">
						    <c:if test="${!fn:contains(empresa, 'TOY')}">
								<spring:message code="lms.funcionarioslms.response.baja.save.msg" />
						    </c:if>
						    <c:if test="${fn:contains(empresa, 'TOY')}">
		    					<spring:message code="lms.funcionarioslms.response.baja.save.msg.toy" />
						    </c:if>
					    </c:if>
				</h6>
			</div>
	        <div class="modal-body">
	            <hr>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " onclick="window.location = ctx + '/lms/funcionarios';"><spring:message code="lms.funcionarioslms.response.baja.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="modalFuncionarioActualizado" tabindex="-1"
	role="dialog" aria-labelledby="modalFuncionarioActualizado" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd success-modal-content">
			<div class="modal-header ">
				<h3 class="txt-green text-center"><i class="fas fa-check-circle"></i></h3>
				<h6 class="modal-title txt-green uppercase bold text-center">
		            <c:if test="${not empty empresa}">
					    <c:if test="${!fn:contains(empresa, 'TOY')}">
							<spring:message code="lms.funcionarioslms.response.update.msg" />
					    </c:if>
					    <c:if test="${fn:contains(empresa, 'TOY')}">
							<spring:message code="lms.funcionarioslms.response.update.msg.toy" />
					    </c:if>
				    </c:if>
				</h6>
			</div>
	        <div class="modal-body">
	            <hr>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " onclick="window.location = ctx + '/lms/funcionarios';"><spring:message code="lms.funcionarioslms.response.update.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>
<!-- MODAL BAJA PUESTO -->
<div class="modal fade" id="modalBajaPuesto" tabindex="-1"
	role="dialog" aria-labelledby="modalBajaPuesto" aria-hidden="true" data-focus-on="input:first">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd alert-modal-content">
			<div class="modal-header bg-glass-sknd">
				<h4 class="modal-title txt-orange uppercase bold text-center">  
				<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
				<br> <spring:message code="lms.funcionarioslms.baja.puesto.advertencia" />
				</h4>
			</div>
	        <div class="modal-body">
	            <div class="row my-4">
	
	                <div class="col">
	                	<p><spring:message code="lms.funcionarioslms.baja.puesto.msg" /></p>
	                </div>
	            </div>
	            <hr>
   	            <div class="row">
					<div class="col-md-6">
						<input type="hidden" id="iptIdPuestoBaja">
						<div class="form-group">
							<label for="iptIngresoPuesto"><spring:message code="lms.funcionarioslms.baja.puesto.label.fecha" /></label> 
							<input type="date" class="form-control" id="iptEgresoPuesto" placeholder="<spring:message code="lms.funcionarioslms.baja.puesto.label.fecha" />" min="${MIN_FECHA}" max="${MAX_FECHA}" value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>' onkeydown="return false">
						</div>
					</div>
				</div>
	            
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-main " onclick="disabledPuesto();"><spring:message code="lms.funcionarioslms.baja.puesto.btn.aceptar" /></button>
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.baja.puesto.btn.cancelar" /></button>
            </div>

        </div>
    </div>
</div>
<!-- MODAL BAJA PUESTO -->
<div class="modal fade" id="modalCambioPrincipal" tabindex="-1"
	role="dialog" aria-labelledby="modalCambioPrincipal" aria-hidden="true" data-focus-on="input:first">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd alert-modal-content">
			<div class="modal-header bg-glass-sknd">
				<h4 class="modal-title txt-orange uppercase bold text-center">  
				<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
				<br> <spring:message code="lms.funcionarioslms.baja.puesto.advertencia" />
				</h4>
			</div>
	        <div class="modal-body">
	            <div class="row my-4">
	
	                <div class="col">
	                	<p><spring:message code="lms.funcionarioslms.cambio.puesto.msg" /></p>
	                </div>
	            </div>
	            <hr>
   	            <div class="row">
					<div class="col-md-6">
						<input type="hidden" id="iptIdPuestoCambio">
					</div>
				</div>
	            
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-main " onclick="cambiaPuesto();"><spring:message code="lms.funcionarioslms.baja.puesto.btn.aceptar" /></button>
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.baja.puesto.btn.cancelar" /></button>
            </div>

        </div>
    </div>
</div>
<!-- MODAL BAJA PUESTO EXITOSO-->
<div class="modal fade" id="modalBajaPuestoExito" tabindex="-1"
	role="dialog" aria-labelledby="modalBajaPuestoExito" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd success-modal-content">
			<div class="modal-header ">
				<h3 class="txt-green text-center"><i class="fas fa-check-circle"></i></h3>
				<h5 class="modal-title txt-green uppercase bold text-center">
				<spring:message code="lms.funcionarioslms.response.baja.puesto.save.msg" />
				</h5>
			</div>
			
	        <div class="modal-body">
	            <hr>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.response.baja.puesto.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>

<!-- MODAL CAMBIO PUESTO EXITOSO-->
<div class="modal fade" id="modalCambioPuestoExito" tabindex="-1"
	role="dialog" aria-labelledby="modalCambioPuestoExito" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd success-modal-content">
			<div class="modal-header ">
				<h3 class="txt-green text-center"><i class="fas fa-check-circle"></i></h3>
				<h5 class="modal-title txt-green uppercase bold text-center">
				<spring:message code="lms.funcionarioslms.response.asignado.msg" />
				</h5>
			</div>
			
	        <div class="modal-body">
	            <hr>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.response.baja.puesto.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>

<!-- MODAL BAJA FUNCIONARIO -->
<div class="modal fade" id="modalBajaFuncionario" tabindex="-1"
	role="dialog" aria-labelledby="modalBajaFuncionario" aria-hidden="true" data-focus-on="input:first">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd alert-modal-content">
			<div class="modal-header">
				<h4 class="modal-title txt-orange uppercase bold text-center">
				 <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
				 <br> <spring:message code="lms.funcionarioslms.baja.func.advertencia" />
				 </h4>
			</div>
	        <div class="modal-body">
	            <div class="row">
	                <div class="col">
		            <c:if test="${not empty empresa}">
					    <c:if test="${!fn:contains(empresa, 'TOY')}">
		                	<p class="bold"> <spring:message code="lms.funcionarioslms.baja.func.msg" /></p>
					    </c:if>
					    <c:if test="${fn:contains(empresa, 'TOY')}">
		                	<p class="bold"> <spring:message code="lms.funcionarioslms.baja.func.msg.toy" /></p>
					    </c:if>
				    </c:if>
	                </div>
	            </div>
	            <div class="row" id="divRowCursosPendientes" style="display:none;">
	                <div class="col">
		            <c:if test="${not empty empresa}">
					    <c:if test="${!fn:contains(empresa, 'TOY')}">
		                	<p class="bold"><spring:message code="lms.funcionarioslms.baja.func.cancelacion.msg1" /><br><spring:message code="lms.funcionarioslms.baja.func.cancelacion.msg2" /></p>
					    </c:if>
					    <c:if test="${fn:contains(empresa, 'TOY')}">
		                	<p class="bold"><spring:message code="lms.funcionarioslms.baja.func.cancelacion.msg1.toy" /><br><spring:message code="lms.funcionarioslms.baja.func.cancelacion.msg2" /></p>
					    </c:if>
				    </c:if>
	                </div>
	            </div>
	            <hr>
   	            <div class="row">
					<div class="col-md-6">
						<input type="hidden" id="iptIdPuestoBaja">
						<div class="form-group">
							<label for="iptIngresoPuesto"><spring:message code="lms.funcionarioslms.baja.func.label.fecha" /></label> 
							<input type="date" class="form-control" id="iptEgresoFuncionario" placeholder="<spring:message code="lms.funcionarioslms.baja.func.label.fecha" />" min="${MIN_FECHA}" max="${MAX_FECHA}" value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>' onkeydown="return false">
						</div>
					</div>
				</div>
	            
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer text-center">
                <button type="button" class="md-btn md-btn-main " onclick="bajaFuncionario();"><spring:message code="lms.funcionarioslms.baja.func.btn.aceptar" /></button>
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.baja.func.btn.cancelar" /></button>
            </div>

        </div>
    </div>
</div>

<!-- MODAL ERROR DE FORMATO -->
<div class="modal fade" id="modalErrorFormato" tabindex="-1"
	role="dialog" aria-labelledby="modalErrorFormato" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header">
				<h4 class="modal-title txt-orange uppercase bold text-center">
				 <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
				 <br> <spring:message code="lms.funcionarioslms.response.error.format.advertencia" />
				 </h4>
			</div>
	        <div class="modal-body">
	            <div class="row my-4">
	
	                <div class="col">
	                	<p class="bold"><spring:message code="lms.funcionarioslms.response.error.format.msg" /></p>
	                </div>
	            </div>
	            <hr>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.response.error.format.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>

<div class="modal fade new-func" id="modalReingreso" tabindex="-1"
	role="dialog" aria-labelledby="modalReingreso" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content bg-glass-sknd">
			<form role="form" id="formReingresoDocumento"
				action="javascript:solicitaReingreso();" method="POST"
				class="" data-parsley-validate="">
				<input type="hidden" id="iptIdFuncionarioReingreso" name="iptIdFuncionarioReingreso">
				
				<div class="modal-header">
					<h4 class="modal-title uppercase bold"><spring:message code="lms.funcionarioslms.reingreso.solicitar" /></h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-4">
		                	<p id="pRFCReingreso"></p>
						</div>
						<div class="col-md-4">
		                	<p id="pNombre"></p>
						</div>
						<div class="col-md-4">
		                	<p id="pGrupoDealer"></p>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label><spring:message code="lms.funcionarioslms.reingreso.label.grupo" /></label> <select class="form-control"
									id="selecGrupoPuestoReingreso" onchange="getPuestosR()">
									<option value="0"><spring:message code="lms.funcionarioslms.reingreso.select" /></option>
									<c:if test="${not empty gruposPuesto}">
										<c:forEach items="${gruposPuesto}" var="grupoPuesto">
											<option value="${grupoPuesto.id}">${grupoPuesto.descripcion}</option>
										</c:forEach>
									</c:if>	
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label><spring:message code="lms.funcionarioslms.reingreso.label.puesto" /></label> <select class="form-control"
									id="selecPuestoReingreso" name = "selecPuestoReingreso">
									<option value="0"><spring:message code="lms.funcionarioslms.reingreso.select" /></option>
	
								</select>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label><spring:message code="lms.funcionarioslms.reingreso.label.dealer" /></label> <select class="form-control"
									id="selecDealerReingreso" name="selecDealerReingreso">
									<option value="0"><spring:message code="lms.funcionarioslms.reingreso.select" /></option>
									<c:if test="${not empty dealers}">
										<c:forEach items="${dealers}" var="dealer">
											<option value="${dealer.id}">${dealer.nombre}</option>
										</c:forEach>
									</c:if>	
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="iptIngresoPuesto"><spring:message code="lms.funcionarioslms.reingreso.label.fecha" /></label> 
								<input type="date" class="form-control" id="iptReingresoPuesto" name="iptReingresoPuesto" placeholder="<spring:message code="lms.funcionarioslms.reingreso.label.fecha" />" min="${MIN_FECHA}" max="${MAX_FECHA}" value='<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd"/>' onkeydown="return false">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="row w-100 text-center">
						<div class="col-12">
							<button type="submit" class="md-btn md-btn-main "><spring:message code="lms.funcionarioslms.reingreso.btn.solicitar" /></button>
						</div>
						<div class="col-12 mt-2">
							<button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.reingreso.btn.cerrar" /></button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- MODAL BAJA PUESTO EXITOSO-->
<div class="modal fade" id="modalReingresoExito" tabindex="-1"
	role="dialog" aria-labelledby="modalReingresoExito" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd success-modal-content">
			<div class="modal-header ">
				<h3 class="txt-green text-center"><i class="fas fa-check-circle"></i></h3>
				<h5 class="modal-title txt-green uppercase bold text-center">
				<spring:message code="lms.funcionarioslms.response.reingreso" />
				</h5>
			</div>
			
	        <div class="modal-body">
	        	<div class="row my-4">
		
	                <div class="col">
	                	<p><spring:message code="lms.funcionarioslms.response.reingreso.msg" /></p>
	                </div>
	            </div>
	            <hr>
	            
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.response.reingreso.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>


<div class="modal fade" id="modalTamanioExedido" tabindex="-1"
	role="dialog" aria-labelledby="modalTamanioExedido" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd success-modal-content">
			<div class="modal-header ">
				<h3 class="txt-green text-center"><i class="fas fa-check-circle"></i></h3>
				<h5 class="modal-title txt-green uppercase bold text-center">
				<spring:message code="lms.funcionarioslms.response.error.size.alerta" />
				</h5>
			</div>
			
	        <div class="modal-body">
	        	<div class="row my-4">
		
	                <div class="col">
	                	<p><spring:message code="lms.funcionarioslms.response.error.size.msg" /></p>
	                </div>
	            </div>
	            <hr>
	            
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.response.error.size.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>

<script>
	function inUploadChangePass(element) {
		var valueUpload = $(element).val();
		if (valueUpload != null && valueUpload != '') {
			var fileName = valueUpload.substring(valueUpload.lastIndexOf("\\") + 1,valueUpload.length);
			$('#lblIptPasaporte').html('');
		    $('#lblIptPasaporte').html(element.files[0].name);
		}
	}
	function inUploadChangeRFC(element) {
		var valueUpload = $(element).val();
		if (valueUpload != null && valueUpload != '') {
			var fileName = valueUpload.substring(valueUpload.lastIndexOf("\\") + 1,valueUpload.length);
			$('#lblIptrfc').html('');
		    $('#lblIptrfc').html(element.files[0].name);
		}
	}
	function inUploadChangeCurp(element) {
		var valueUpload = $(element).val();
		if (valueUpload != null && valueUpload != '') {
			var fileName = valueUpload.substring(valueUpload.lastIndexOf("\\") + 1,valueUpload.length);
			$('#lblIptCurp').html('');
		    $('#lblIptCurp').html(element.files[0].name);
		}
	}
</script>

<script>
	getPuestosAdicional = function(){
		var grupoPuestoSelected = $('#selecGrupoPuestoAdicional').val();
		var idDealer = $('#selecDealerAdicional').val();
		var idFuncionario = $('#iptFuncionarioEdit').val();
		$('#selecPuestoAdicional').html('');
	
		if(grupoPuestoSelected > 0){
			var urltxt = ctx+"/lms/funcionarios/getPuestosAdic?idGrupoPuesto="+grupoPuestoSelected+'&idDealer='+idDealer+'&idFuncionario='+idFuncionario;
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
		                <c:if test="${not empty locale}">
						    <c:if test="${fn:contains(locale, 'es')}">
								var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
								var object = response[1];
								for (var i = 0; i < object.length; i++) {
									var element = object[i];
									htmlAdd += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
								}
								$('#selecPuestoAdicional').append(htmlAdd);
						    </c:if>
						    <c:if test="${fn:contains(locale, 'en')}">
								var htmlAdd = '<option value="0" selected="selected">Select...</option>';
								var object = response[1];
								for (var i = 0; i < object.length; i++) {
									var element = object[i];
									htmlAdd += '<option value="' + element.id+ '" >' + element.nombreEn + '</option>';
								}
							$('#selecPuestoAdicional').append(htmlAdd);
						    </c:if>
						    <c:if test="${fn:contains(locale, 'fr')}">
								var htmlAdd = '<option value="0" selected="selected">Sélectionnez...</option>';
								var object = response[1];
								for (var i = 0; i < object.length; i++) {
									var element = object[i];
									htmlAdd += '<option value="' + element.id+ '" >' + element.nombreFr + '</option>';
								}
								$('#selecPuestoAdicional').append(htmlAdd);
						    </c:if>
						</c:if>
						<c:if test="${empty locale}">
							var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
							var object = response[1];
							for (var i = 0; i < object.length; i++) {
								var element = object[i];
								htmlAdd += '<option value="' + element.id+ '" >' + element.nombre + '</option>';
							}
							$('#selecPuestoAdicional').append(htmlAdd);
						</c:if>
					} else {
		                <c:if test="${not empty locale}">
						    <c:if test="${fn:contains(locale, 'es')}">
								var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
								$('#selecPuestoAdicional').append(htmlAdd);
						    </c:if>
						    <c:if test="${fn:contains(locale, 'en')}">
								var htmlAdd = '<option value="0" selected="selected">Select...</option>';
								$('#selecPuestoAdicional').append(htmlAdd);
						    </c:if>
						    <c:if test="${fn:contains(locale, 'fr')}">
								var htmlAdd = '<option value="0" selected="selected">Sélectionnez...</option>';
								$('#selecPuestoAdicional').append(htmlAdd);
						    </c:if>
						</c:if>
						<c:if test="${empty locale}">
							var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
							$('#selecPuestoAdicional').append(htmlAdd);
						</c:if>
					}
				},
				error : function(msg) {
					$('#modalErrGenerico').modal({backdrop: 'static', keyboard: false});
				}
			});
		}else{
            <c:if test="${not empty locale}">
			    <c:if test="${fn:contains(locale, 'es')}">
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecPuestoAdicional').append(htmlAdd);
			    </c:if>
			    <c:if test="${fn:contains(locale, 'en')}">
					var htmlAdd = '<option value="0" selected="selected">Select...</option>';
					$('#selecPuestoAdicional').append(htmlAdd);
			    </c:if>
			    <c:if test="${fn:contains(locale, 'fr')}">
					var htmlAdd = '<option value="0" selected="selected">Sélectionnez...</option>';
					$('#selecPuestoAdicional').append(htmlAdd);
			    </c:if>
			</c:if>
			<c:if test="${empty locale}">
				var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
				$('#selecPuestoAdicional').append(htmlAdd);
			</c:if>
		}
	}
	
	onChangeDealerAdiconal = function(){
		if($('#selecDealerAdicional').val() == 0){
			$('#selecGrupoPuestoAdicional').val(0);
			$('#selecPuestoAdicional').html('');
            <c:if test="${not empty locale}">
			    <c:if test="${fn:contains(locale, 'es')}">
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecPuestoAdicional').append(htmlAdd);
			    </c:if>
			    <c:if test="${fn:contains(locale, 'en')}">
					var htmlAdd = '<option value="0" selected="selected">Select...</option>';
					$('#selecPuestoAdicional').append(htmlAdd);
			    </c:if>
			    <c:if test="${fn:contains(locale, 'fr')}">
					var htmlAdd = '<option value="0" selected="selected">Sélectionnez...</option>';
					$('#selecPuestoAdicional').append(htmlAdd);
			    </c:if>
			</c:if>
			<c:if test="${empty locale}">
				var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
				$('#selecPuestoAdicional').append(htmlAdd);
			</c:if>
			$('#selecGrupoPuestoAdicional').prop('disabled', true);
		}else{
			$('#selecGrupoPuestoAdicional').val(0);
			$('#selecPuestoAdicional').html('');
            <c:if test="${not empty locale}">
			    <c:if test="${fn:contains(locale, 'es')}">
					var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
					$('#selecPuestoAdicional').append(htmlAdd);
			    </c:if>
			    <c:if test="${fn:contains(locale, 'en')}">
					var htmlAdd = '<option value="0" selected="selected">Select...</option>';
					$('#selecPuestoAdicional').append(htmlAdd);
			    </c:if>
			    <c:if test="${fn:contains(locale, 'fr')}">
					var htmlAdd = '<option value="0" selected="selected">Sélectionnez...</option>';
					$('#selecPuestoAdicional').append(htmlAdd);
			    </c:if>
			</c:if>
			<c:if test="${empty locale}">
				var htmlAdd = '<option value="0" selected="selected">Seleccione...</option>';
				$('#selecPuestoAdicional').append(htmlAdd);
			</c:if>
			$('#selecGrupoPuestoAdicional').prop('disabled', false);
		}
	}
</script>