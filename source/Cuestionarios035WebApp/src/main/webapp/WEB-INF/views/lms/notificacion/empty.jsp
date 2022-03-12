<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value='/resources/js/admin/contacto/contacto.js' />"
	type="text/javascript"></script>


<main class="l-main">
            <nav aria-label="breadcrumb" role="navigation">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Admin</a></li>
                    <li class="breadcrumb-item active">Reportes adicionales</li>
                </ol>
            </nav>
            <div class="content-wrapper admin_wrap">
                <h1>Reportes adicionales</h1>

                <div class="row justify-content-end align-items-center">
                    <div class="col-xl-3 col-lg-2 col-sm-6 col-12 nfb">
                        <button class="btn-new-func" data-toggle="modal" data-target="#edit-funcionario">
                            <i class="fas fa-user-plus"></i>
                        </button>
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
                                        <th class="text-left">Tipo de reporte</th>
                                        <th>Fecha de envio</th>
                                        <th>Nombre documento</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Reporte de ingresos</td>
                                        <td>15-07-2020</td>
                                        <td>Ingresos_Julio_2020_dalton.xls</td>
                                    </tr>
                                    <tr>
                                        <td>Reporte de egresos</td>
                                        <td>15-07-2020</td>
                                        <td>Egresos_Julio_2020_dalton.xls</td>
                                    </tr>
                                <tbody>
                            </table>
                        </div>

                        <!-- Modal editar funcionario -->
                        <div class="modal fade edit-func" id="edit-funcionario">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">Subir reporte</h4>
                                        <button type="button" class="close" data-dismiss="modal">
                                            <div class="leftright"></div>
                                            <div class="rightleft"></div>
                                            <label class="close-label">Cerrar</label>
                                        </button>
                                        <hr>
                                    </div>

                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                            	<div class="form-Group">
						                            <div class="input-group mb-3">
						                                <select id="internal-select-picker" class="form-control selectpicker" data-live-search="true"  title="Tipo de reporte">
						                                    <option value="">Reporte de ingresos</option>
						                                    <option value="">Reporte de egresos</option>
						                                    <option value="">Reporte de reportes</option>
						                                </select>
						                            </div>
						                        </div>
                                            </div>
                                            <div class="col-md-4">
                                            	<div class="form-Group">
						                            <input type="file"
														name="iptActividadDocumentoFile"
														id="iptActividadDocumentoFile" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
						                        </div>
                                            </div>
                                        </div>
                                        <hr>
                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                    	<button class="md-btn md-btn-main"><i class="fas fa-user-edit"></i> Enviar</button>
                                        <button type="button" class="md-btn md-btn-close " data-dismiss="modal"><i class="fas fa-times"></i> Cancelar</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!--		Start Pagination -->
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-sm-6 col-8">
                        <div class="num_rows">
                            <div class="form-group"> 	
                                <select class="form-control" name="state" id="maxRows">
                                    <option value="10">10</option>
                                    <option value="15">15</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="70">70</option>
                                    <option value="100">100</option>
                                    <option value="5000">Mostrar todos</option>
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
                        <div class="rows_count">Mostrando 11 to 20 of 91 entries</div>
                    </div>
                </div> 
                <!-- End Tabla -->

            </div>
        </main>