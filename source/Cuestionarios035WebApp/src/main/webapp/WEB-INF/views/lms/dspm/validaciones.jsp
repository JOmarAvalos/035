<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value='/resources/js/admin/funcionariosLMS.js' />"
	type="text/javascript"></script>

<main class="l-main">
	<nav aria-label="breadcrumb" role="navigation">
	    <ol class="breadcrumb">
	        <li class="breadcrumb-item"><a href="#"><spring:message code="lms.validaciones.admin" /></a></li>
	        <li class="breadcrumb-item active"><spring:message code="lms.validaciones.title" /></li>
	    </ol>
	</nav>
	<div class="content-wrapper admin_wrap">
	    <h1><spring:message code="lms.validaciones.title" /></h1>
	
	    <!-- Filtros -->
	    <div class="row justify-content-end">
	        <div class="col-xl-4 col-lg-4 col-sm-9">
	            <div class="search_bar">
	                <input type="search" id="search_input_all" onkeyup="FilterkeyWord_all_table()" placeholder="Buscar">
	                <span></span>
	            </div>
	        </div>
	    </div>
	    <hr class="my-4">
	    <!-- tabla -->
	    <div class="row ">
	        <div class="col">
	            <div class="table-responsive-sm">
	                <table class="table table-striped table-class tables-report" id= "table-cu">
	                    <thead>
	                        <tr>
	                            <th class="text-left"><spring:message code="lms.validaciones.table.rfc" /></th>
	                            <th><spring:message code="lms.validaciones.table.nombre" /></th>
	                            <th><spring:message code="lms.validaciones.table.puesto" /></th>
	                            <th><spring:message code="lms.validaciones.table.dealer" /></th>
	                            <th><spring:message code="lms.validaciones.table.movimiento" /></th>
	                            <th><spring:message code="lms.validaciones.table.fecha" /></th>
	                            <th><spring:message code="lms.validaciones.table.acciones" /></th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:if test="${not empty lstMesa }">
	                    		<c:forEach items="${lstMesa}" var="mesa">
	                    			<tr>
									    <td>${mesa.rfc}</td>
									    <td>${mesa.nombre}</td>
									    <td>${mesa.puesto}</td>
									    <td>${mesa.dealer}</td>
									    <td>${mesa.accion}</td>
									    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${mesa.creacion}" /></td>
									    <td class="text-center">
									        <a href="#" onclick="showAcepta('${mesa.id}','${mesa.accion}','${mesa.nombre}');" title="Aceptar">
									            <i class="fas fa-check"></i>
									        </a>
									        &nbsp;
									        <a href="#" onclick="showRechaza('${mesa.id}','${mesa.accion}','${mesa.nombre}');" title="Rechazar">
									            <i class="fas fa-times"></i>
									        </a>
									    </td>
									</tr>
	                    		</c:forEach>
	                    	</c:if>
	                    </tbody>
	                </table>
	            </div>
	            <!--		Start Pagination -->
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-4">
	            <div class="num_rows">
	                <div class="form-group"> 	
	                    <select class="form-control" name="state" id="maxRows">
	                        <option value="10"><spring:message code="lms.validaciones.num.rows.op10" /></option>
	                        <option value="15"><spring:message code="lms.validaciones.num.rows.op15" /></option>
	                        <option value="20"><spring:message code="lms.validaciones.num.rows.op20" /></option>
	                        <option value="50"><spring:message code="lms.validaciones.num.rows.op50" /></option>
	                        <option value="70"><spring:message code="lms.validaciones.num.rows.op70" /></option>
	                        <option value="100"><spring:message code="lms.validaciones.num.rows.op100" /></option>
	                        <option value="5000"><spring:message code="lms.validaciones.num.rows.op5000" /></option>
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
	            <div class="rows_count"><spring:message code="lms.validaciones.rows.count" /></div>
	        </div>
	    </div> 
	    <!-- End Tabla -->
    </div>
</main>
	
<div class="modal fade" id="modalRechazoValida" tabindex="-1"
	role="dialog" aria-labelledby="modalRechazoValida" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd success-modal-content">
			<div class="modal-header ">
				<h3 class="txt-green text-center"><i class="fas fa-check-circle"></i></h3>
				<h5 class="modal-title txt-green uppercase bold text-center">
				Se rechazar&aacute; el siguiente cambio
				</h5>
			</div>
			
	        <div class="modal-body">
	        	<input type="hidden" id="iptIdMesaR">
	            <div class="row">
	            	<div class="col-md-12">
			            <p id="pCambioR"></p>
	            	</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12">
	            		<div class="form-group">
							<label>Observaciones</label>
							<textarea class="form-control" id="iptObservacionesR" rows="3" name="iptObservacionesR"
							placeholder="Observaciones" maxlength="300"></textarea> 
						</div>
	            	</div>
	            </div>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
            	<button type="button" class="md-btn md-btn-main " onclick="rechazaCambio();"><spring:message code="lms.funcionarioslms.baja.func.btn.aceptar" /></button>
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.response.baja.puesto.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="modalAceptaValida" tabindex="-1"
	role="dialog" aria-labelledby="modalAceptaValida" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd success-modal-content">
			<div class="modal-header ">
				<h3 class="txt-green text-center"><i class="fas fa-check-circle"></i></h3>
				<h5 class="modal-title txt-green uppercase bold text-center">
				Se validar&aacute; el cambio
				</h5>
			</div>
			
	        <div class="modal-body">
	        	<input type="hidden" id="iptIdMesaA">
	            <div class="row">
	            	<div class="col-md-12">
			            <p id="pCambioA"></p>
	            	</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12">
	            		<div class="form-group">
							<label>Observaciones</label>
							<textarea class="form-control" id="iptObservacionesA" rows="3" name="iptObservacionesA"
							placeholder="Observaciones" maxlength="300"></textarea> 
						</div>
	            	</div>
	            </div>
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
            	<button type="button" class="md-btn md-btn-main " onclick="aceptaCambio();"><spring:message code="lms.funcionarioslms.baja.func.btn.aceptar" /></button>
                <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><spring:message code="lms.funcionarioslms.response.baja.puesto.btn.cerrar" /></button>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="modalExitoValida" tabindex="-1"
	role="dialog" aria-labelledby="modalExitoValida" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd success-modal-content">
			<div class="modal-header ">
				<h3 class="txt-green text-center"><i class="fas fa-check-circle"></i></h3>
				<h5 class="modal-title txt-green uppercase bold text-center">
				&Eacute;xito
				</h5>
			</div>
			
	        <div class="modal-body">
	        </div>

        	<!-- Modal footer -->
            <div class="modal-footer">
            	<button type="button" class="md-btn md-btn-main " data-dismiss="modal" onclick="location.reload();"><spring:message code="lms.funcionarioslms.baja.func.btn.aceptar" /></button>
            </div>

        </div>
    </div>
</div>