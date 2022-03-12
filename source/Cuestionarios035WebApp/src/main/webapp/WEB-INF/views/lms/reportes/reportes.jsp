<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script
	src="<c:url value='/resources/js/lms/reportes/reportesLMS.js' />"
	type="text/javascript"></script>



<main class="l-main">
	<nav aria-label="breadcrumb" role="navigation">
	    <ol class="breadcrumb">
	        <li class="breadcrumb-item"><a href="#"><spring:message code="lms.reportes.admin" /></a></li>
	        <li class="breadcrumb-item active"><spring:message code="lms.reportes.title" /></li>
	    </ol>
	</nav>
	<div class="content-wrapper admin_wrap">
	    <h1><spring:message code="lms.reportes.title" /></h1>
	
	    <!-- Filtros -->
	    <div class="row justify-content-end">
	        <div class="col-xl-4 col-lg-4 col-sm-9">
	            <div class="search_bar">
	                <input type="search" id="search_input_all" onkeyup="FilterkeyWord_all_table()" placeholder="<spring:message code="lms.reportes.buscar" />">
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
	                            <th class="text-left"><spring:message code="lms.reportes.table.nombre" /></th>
	                            <th><spring:message code="lms.reportes.table.descargar" /></th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:if test="${not empty reportes}">
	                    		<c:forEach items="${reportes}" var="reporte">
		                    		<tr>
			                            <td>
			                            	<c:if test="${not empty locale}">
										    	<c:if test="${fn:contains(locale, 'es')}">
													${reporte.nombre}
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'en')}">
										    		<c:if test="${not empty reporte.nombreEn}">
														${reporte.nombreEn}
										    		</c:if>
										    		<c:if test="${ empty reporte.nombreEn}">
														${reporte.nombre}
										    		</c:if>
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'fr')}">
										    		<c:if test="${not empty reporte.nombreFr}">
														${reporte.nombreFr}
										    		</c:if>
										    		<c:if test="${ empty reporte.nombreFr}">
														${reporte.nombre}
										    		</c:if>
						
										    	</c:if>
										    </c:if>
										    <c:if test="${empty locale}">
												${reporte.nombre}
										    </c:if>
			                            </td>
			                            <td class="text-center">
			                            	<c:if test="${reporte.id == 1}">
				                                <a href="#" onclick="descargaFuncionariosTodos();">
				                                    <i class="fas fa-download"></i>
				                                </a>
			                            	</c:if>
			                            	<c:if test="${reporte.id == 2}">
				                                <a href="#" onclick="descargaFuncionariosPrincipal();">
				                                    <i class="fas fa-download"></i>
				                                </a>
			                            	</c:if>
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
	                        <option value="10"><spring:message code="lms.reportes.num.rows.op10" /></option>
	                        <option value="15"><spring:message code="lms.reportes.num.rows.op15" /></option>
	                        <option value="20"><spring:message code="lms.reportes.num.rows.op20" /></option>
	                        <option value="50"><spring:message code="lms.reportes.num.rows.op50" /></option>
	                        <option value="70"><spring:message code="lms.reportes.num.rows.op70" /></option>
	                        <option value="100"><spring:message code="lms.reportes.num.rows.op100" /></option>
	                        <option value="5000"><spring:message code="lms.reportes.num.rows.optext" /></option>
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
	    
	</main>