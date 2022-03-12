<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<script src="<c:url value='/resources/js/admin/grupos.js' />" type="text/javascript"></script> 
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>

<aside class="right-side">
	<section class="content-header">
		<input type="hidden" id="iptIdGrupo" value="${grupo.id}">
		<div class="row">
			<div class="col-md-4">
			    <h1>
			       Grupo: ${grupo.nombre}
			    </h1>
			</div>
			<div class="col-md-4">
			    <h1>
			       Empresa: ${grupo.auxEmpresa}
			    </h1>
			</div>
		</div>
		<ol class="breadcrumb">
            <li><a href="#" onclick="window.history.back();" class="active"><i class="fa fa-arrow-circle-o-left"></i>Atras</a></li>
        </ol>
	</section>   
	  
	 <section class="content">
	 	<div id="divFuncionariosActivos">
	    	<div>
				<button class="btn btn-primary" onclick="showAddFuncionario();">Agregar Funcionario</button>  
				<button class="btn btn-primary" onclick="showSendNotificacion();">Enviar notificaci&oacute;n</button>
				<button class="btn btn-primary" onclick="showSendEmail(${grupo.id});">Enviar email</button>
			</div>
		 	
			<br>
			<div class="box mb-5">
			    <div class="box-header">
			    
			    </div><!-- /.box-header -->
			    <div class="box-body table-responsive">
			        <table id="tableFuncionarios" class="table table-bordered table-striped">
			            <thead>
			                <tr>
			                    <th>RFC</th>
			                    <th>Nombre</th>
			                    <th>Email</th>
			                    <th>Telefono</th>
			                    <th>Dealer</th>
			                    <th>Puesto</th>
			                    <th><input type="checkbox" id="checkRemoveFAll"></th>
			                </tr>
			            </thead>
			            <tbody>
	
		            		<c:if test="${not empty grupo.funcionarios}">
								<c:forEach items="${grupo.funcionarios}" var="funcionario">
					                <tr>
					                	<td>${funcionario.rfc}</td>
					                    <td>
					                    	${funcionario.datosFuncionarioVO.nombres} ${funcionario.datosFuncionarioVO.apellidoUno} ${funcionario.datosFuncionarioVO.apellidoDos}  
										</td>				                    
					                    <td>${funcionario.datosFuncionarioVO.email}</td>
					                    <td>${funcionario.datosFuncionarioVO.telefono}</td>
					                    <td>${funcionario.auxDealerPrincipal}</td>
					                    <td>${funcionario.auxPuestoPrincipal}</td>
					                    <td><input type="checkbox" name="checkRemoveF" value="${funcionario.idUsuario}" id="${funcionario.idUsuario}"></td>
					                </tr>
					          	</c:forEach>
							</c:if>
	
			            </tbody>
			        </table>
			    </div><!-- /.box-body -->
			    
			</div><!-- /.box -->
			<div>
				<button class="btn btn-primary" onclick="eliminaFuncionarios();">Eliminar</button>  
			</div>
	 	</div>
	 	
	 	<div id="divFuncionariosNoActivos" style="display:none">
	    	<div>
				<button class="btn btn-primary" onclick="hideAddFuncionario();">Cancelar</button>  
			</div>
		 	
			<br>
			<div class="box mb-5">
			    <div class="box-header">
			    
			    </div><!-- /.box-header -->
			    <div class="box-body table-responsive">
			        <table id="tableFuncionariosNo" class="table table-bordered table-striped">
			            <thead>
			                <tr>
			                    <th>RFC</th>
			                    <th>Nombre</th>
			                    <th>Email</th>
			                    <th>Telefono</th>
			                    <th>Dealer</th>
			                    <th>Puesto</th>
			                    <th><input type="checkbox" id="checkAddFAll"></th>
			                </tr>
			            </thead>
			            <tbody>
	
		            		<c:if test="${not empty grupo.funcionariosNO}">
								<c:forEach items="${grupo.funcionariosNO}" var="funcionarioNo">
					                <tr>
					                	<td>${funcionarioNo.rfc}</td>
					                    <td>
					                    	${funcionarioNo.datosFuncionarioVO.nombres} ${funcionarioNo.datosFuncionarioVO.apellidoUno} ${funcionarioNo.datosFuncionarioVO.apellidoDos}  
										</td>				                    
					                    <td>${funcionarioNo.datosFuncionarioVO.email}</td>
					                    <td>${funcionarioNo.datosFuncionarioVO.telefono}</td>
					                    <td>${funcionarioNo.auxDealerPrincipal}</td>
					                    <td>${funcionarioNo.auxPuestoPrincipal}</td>
					                    <td><input type="checkbox" name="checkAddF" value="${funcionarioNo.idUsuario}" id="${funcionarioNo.idUsuario}"></td>
					                </tr>
					          	</c:forEach>
							</c:if>
	
			            </tbody>
			        </table>
			    </div><!-- /.box-body -->
			</div><!-- /.box -->
			<div>
				<button class="btn btn-primary" onclick="addFuncionarios();">Agregar</button>  
			</div>
	 	</div>

	</section><!-- /.content -->
</aside><!-- /.right-side -->  

<div class="modal fade" id="modalExitoUsuario" tabindex="-1" role="dialog"
	aria-labelledby="modalExitoUsuario" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd box box-danger">
			<div class="modal-header bg-glass-sknd ">
				<h3 class="box-title" id="iptCursoTitulo">&Eacute;xito</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h4 id="h4MsgExitoGrupoF"></h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="window.location = ctx+'/grupo?idGrupo=${grupo.id}'">Aceptar</button>
			</div>	
		</div>
	</div>
</div>

<div class="modal fade" id="modalExitoNotificacion" tabindex="-1" role="dialog"
	aria-labelledby="modalExitoNotificacion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd box box-danger">
			<div class="modal-header bg-glass-sknd ">
				<h3 class="box-title" id="iptCursoTitulo">&Eacute;xito</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h4 id="h4MsgExitoGrupoF">Notificaci&oacute;n enviada</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Aceptar</button>
			</div>	
		</div>
	</div>
</div>

<div class="modal fade" id="modalNewNotificacion" tabindex="-1" role="dialog"
	aria-labelledby="modalNewNotificacion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Notificaci&oacute;n</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
	                <div class="box-header">
	                    
	                </div><!-- /.box-header -->
	               <!-- form start -->
	                <form role="form">
	                    <div class="box-body">
	                    	<div class="row">
	                    		<div class="col-md-12">
									<div class="form-group">
										<label>Prioridad</label>
										<select class="form-control" id="selectPrioridad">
										    <option value="1" selected="selected">Normal</option>
										    <option value="2">Urgente</option>
										</select>
									</div>	 
		                   		</div>
	                    	</div>
	                    	<div class="row">
	                    		<div class="col-md-12">
			                        <div class="form-group">
			                            <label for="iptClaveGrupoPuesto">Titulo</label>
			                            <input type="text" class="form-control" id="iptTituloNotificacion" placeholder="Titulo">
			                        </div>
		                   		</div>
	                    	</div>
	                    	
	                    	<div class="row">
	                    		<div class="col-md-12">
			                        <div class="form-group">
			                            <label for="taMensaje">Mensaje</label>
			                            <textarea class="form-control" rows="3" max-rows="3" id="taMensaje" placeholder="Mensaje..."></textarea>
			                        </div>
	                    		</div>
	                    	</div>
	                    </div>
	                </form>
	            </div><!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn"
					onclick="sendNotificacionGrupo();">Notificar</button>
				<button type="button" class="btn"
					data-dismiss="modal">Cancelar</button>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalNewEmail" tabindex="-1" role="dialog"
	aria-labelledby="modalNewNotificacion" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Env&#237;o de email</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div id="modalBodyEmailGrupo" class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
	                <div class="box-header">
	                    
	                </div><!-- /.box-header -->
	               <!-- form start -->
	                <form role="form">
	                    <div class="box-body">
	                    	<div class="row">
	                    		<div class="col-md-12">
									<div class="form-group">
										<label>Selecciona un motivo de contacto</label>
										<select class="form-control" id="selectMotivo">
											<option value="">Sin motivo</option>
											<c:if test="${not empty lstmotivos}">
												<c:forEach items="${lstmotivos}" var="motivoVO" varStatus="loop">
										   			<option value="${motivoVO.id}" >${motivoVO.motivoContacto}</option>
										    	<<!-- option value="2">Urgente</option> -->
										    	</c:forEach>
											</c:if>
										</select>
									</div>	 
		                   		</div>
	                    	</div>
	                    	<!-- <div class="row">
	                    		<div class="col-md-12">
			                        <div class="form-group">
			                            <label for="iptClaveGrupoPuesto">Titulo</label>
			                            <input type="text" class="form-control" id="iptTituloNotificacion" placeholder="Titulo">
			                        </div>
		                   		</div>
	                    	</div>
	                    	
	                    	<div class="row">
	                    		<div class="col-md-12">
			                        <div class="form-group">
			                            <label for="taMensaje">Mensaje</label>
			                            <textarea class="form-control" rows="3" max-rows="3" id="taMensaje" placeholder="Mensaje..."></textarea>
			                        </div>
	                    		</div>
	                    	</div> -->
	                    </div>
	                </form>
	            </div><!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn"
					onclick="sendEmailGrupo(${grupo.id});">Preparar</button>
				<button type="button" class="btn"
					data-dismiss="modal">Cancelar</button>

			</div>
		</div>
	</div>
</div>


        <script type="text/javascript">
            $(function() {
                $('#tableFuncionarios').dataTable({
                	"pageLength": 30 ,
                    "bPaginate": true,
                    "bLengthChange": true,
                    "bFilter": true,
                    "bSort": false,
                    "bInfo": true,
                    "bAutoWidth": true,
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
                    }
                });
                $('#tableFuncionariosNo').dataTable({
                	"pageLength": 30 ,
                    "bPaginate": true,
                    "bLengthChange": true,
                    "bFilter": true,
                    "bSort": false,
                    "bInfo": true,
                    "bAutoWidth": true,
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
                    }
                });
                
            });
            
            
            $('#checkRemoveFAll').on('ifChecked', function(event){
            	checkAllCheckElimina();
        	});
    	    $('#checkRemoveFAll').on('ifUnchecked', function(event){
    	    	unCheckAllCheckElimina();
        	});
    	    
    	    $('#checkAddFAll').on('ifChecked', function(event){
            	checkAllCheckAdd();
        	});
    	    $('#checkAddFAll').on('ifUnchecked', function(event){
    	    	unCheckAllCheckAdd();
        	});
    	    
    	    
        </script>
