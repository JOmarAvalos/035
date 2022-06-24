<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="<c:url value='/resources/js/035/home.js' />" type="text/javascript"></script>


<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">

		<c:if test="${usuario.idPerfil == 1}">
	        <!-- Small boxes (Stat box) -->
	        <div class="row">
	            <div class="col-lg-4 col-xs-6">
	                <!-- small box -->
	                <div class="small-box bg-aqua">
	                    <div class="inner">
	                        <h3>
	                            ${countCuestionarios}
	                        </h3>
	                        <p>
	                            Cuestionarios Contestados
	                        </p>
	                    </div>
	                    <div class="icon">
	                        <i class="ion ion-bag"></i>
	                    </div>
	                </div>
	            </div><!-- ./col -->
	            <div class="col-lg-4 col-xs-6">
	                <!-- small box -->
	                <div class="small-box bg-green">
	                    <div class="inner">
	                        <h3>
	                            ${countUsers}
	                        </h3>
	                        <p>
	                            Contratos registrados
	                        </p>
	                    </div>
	                    <div class="icon">
	                        <i class="ion ion-stats-bars"></i>
	                    </div>
	                </div>
	            </div><!-- ./col -->
	            <div class="col-lg-4 col-xs-6">
	                <!-- small box -->
	                <div class="small-box bg-yellow">
	                    <div class="inner">
	                        <h3>
	                            $${countVentas}
	                        </h3>
	                        <p>
	                            Ventas totales
	                        </p>
	                    </div>
	                    <div class="icon">
	                        <i class="ion ion-person-add"></i>
	                    </div>
	                </div>
	            </div><!-- ./col -->
	        </div><!-- /.row -->
	        <div class="row">
	        	<div class="box">
	                 <div class="box-header">
	                     <h1 class="box-title">Productos comprados(Pendientes de respuesta)</h1>
	                 </div><!-- /.box-header -->
	                 <div class="box-body table-responsive">
	                 	<c:if test="${not empty productosComprados}">
		                     <table id="tblProductosComprados" class="table table-bordered table-striped">
		                         <thead>
		                             <tr>
		                                 <th>Descargar/Cargar</th>
		                                 <th>Producto</th>
		                                 <th>Cuestionario</th>
										<th>Contrato</th>
										<th>Contacto</th>
		                                 <th>Precio</th>
		                                 <th>Estatus</th>
		                             </tr>
		                         </thead>
		                         <tbody>
								        <c:forEach items="${productosComprados}" var="producto" varStatus="loop">
				                             <tr>
				                                 <td>
				                                 	<a href="#" title="Descargar reporte" onclick="descargaCuestionarios();"><i class="fa fa-fw fa-download fa-4x"></i><br>Descargar base de datos</a>
				                                 	<a href="#" title="Subir respuesta" onclick="showCarga();"><i class="fa fa-fw fa-upload fa-4x"></i><br>Subir respuesta</a>
				                                 </td>
				                                 <td>${producto.productoVO.nombre}</td>
				                                 <td>${producto.productoVO.cuestionarioVO.nombre}</td>
												<td>${producto.usuario.usuario}</td>
												<td>${producto.usuario.email}</td>
				                                 <td>$${producto.productoVO.precio}</td>
				                                 <td>Comprado/Pendiene de respuesta</td>
				                             </tr>
								        </c:forEach>
		                         </tbody>
		                     </table>
	                 	</c:if>
	                 	<c:if test="${empty productosComprados}">
	                 		<h3 class="box-title">Sin productos pendientes de respuesta</h3>
	                 	</c:if>
	                 </div><!-- /.box-body -->
					<div class="box-footer">
					</div>
	                 
	             </div><!-- /.box -->
	        </div>
	        <div class="row">
	        	<div class="box">
	                 <div class="box-header">
	                     <h1 class="box-title">Productos respondidos</h1>
	                 </div><!-- /.box-header -->
	                 <div class="box-body table-responsive">
	                 	<c:if test="${not empty productosEntregados}">
		                     <table id="tblProductosRepondidos" class="table table-bordered table-striped">
		                         <thead>
		                             <tr>
		                                 <th>Descargar/Cargar</th>
		                                 <th>Producto</th>
		                                 <th>Cuestionario</th>
										<th>Contrato</th>
										<th>Contacto</th>
		                                 <th>Precio</th>
		                                 <th>Estatus</th>
		                             </tr>
		                         </thead>
		                         <tbody>
								        <c:forEach items="${productosEntregados}" var="producto" varStatus="loop">
				                             <tr>
				                                 <td>
				                                 	<a href="#" title="Descargar reporte" onclick="descargaCuestionarios();"><i class="fa fa-fw fa-download fa-4x"></i><br>Descargar base de datos</a>
				                                 	<a href="#" title="Subir respuesta" onclick="showCargarRespuesa(${producto.id});"><i class="fa fa-fw fa-upload fa-4x"></i><br>Actualizar respuesta</a>
				                                 </td>
				                                 <td>${producto.productoVO.nombre}</td>
				                                 <td>${producto.productoVO.cuestionarioVO.nombre}</td>
												<td>${producto.usuario.usuario}</td>
												<td>${producto.usuario.email}</td>
				                                 <td>$${producto.productoVO.precio}</td>
				                                 <td>
				                                 	<c:if test="${producto.idCompraEstatus == 4}">
				                                 		Descarga pendiente
				                                 	</c:if>
				                                 	<c:if test="${producto.idCompraEstatus == 5}">
				                                 		Descargado
				                                 	</c:if>
				                                 </td>
				                             </tr>
								        </c:forEach>
		                         </tbody>
		                     </table>
	                 	</c:if>
	                 	<c:if test="${empty productosEntregados}">
	                 		<h3 class="box-title">Sin productos Entregados</h3>
	                 	</c:if>
	                 </div><!-- /.box-body -->
					<div class="box-footer">
					</div>
	                 
	             </div><!-- /.box -->
	        </div>
	        <div class="row">
	        	<div class="box">
	                 <div class="box-header">
	                     <h1 class="box-title">Productos sin comprar</h1>
	                 </div><!-- /.box-header -->
	                 <div class="box-body table-responsive">
	                 	<c:if test="${not empty productosSinCompra}">
		                     <table id="tblProductosPend" class="table table-bordered table-striped">
		                         <thead>
		                             <tr>
		                                 <th>Descargar</th>
		                                 <th>Producto</th>
		                                 <th>Cuestionario</th>
										<th>Contrato</th>
										<th>Contacto</th>
		                                 <th>Precio</th>
		                                 <th>Estatus</th>
		                             </tr>
		                         </thead>
		                         <tbody>
								        <c:forEach items="${productosSinCompra}" var="producto" varStatus="loop">
				                             <tr>
				                                 <td>
                                          <a href="#" onclick="descargaCuestionarios()" title="Descargar cuestionarios">
                                            <i class="fa fa-fw fa-download fa-4x"></i>
                                            <br>Descargar base de datos
                                          </a>
				                                 </td>
				                                 <td>${producto.productoVO.nombre}</td>
				                                 <td>${producto.productoVO.cuestionarioVO.nombre}</td>
												<td>${producto.usuario.usuario}</td>
												<td>${producto.usuario.email}</td>
				                                 <td>$${producto.productoVO.precio}</td>
				                                 <td>Disponible</td>
				                             </tr>
								        </c:forEach>
		                         </tbody>
		                     </table>
	                 	</c:if>
	                 	<c:if test="${empty productosSinCompra}">
	                 		<h3 class="box-title">Sin productos</h3>
	                 	</c:if>
	                 </div><!-- /.box-body -->
					<div class="box-footer">
					</div>
	                 
	             </div><!-- /.box -->
	        </div>
		</c:if>

		<c:if test="${usuario.idPerfil == 2}">
	        <!-- Perfil row -->
	        <div id="divPerfil">
		        <div class="row">
		        	<!-- Inicio colummna perfil -->
		        	<div class="col-md-6">
		        		<div class="box box-primary">
							<div class="box-header">
								<h1 class="box-title">Perfil</h1>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form role="form" >
								<div class="box-body">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="iptUsernameHome">Contrato</label> 
												<input type="text" id="iptUsernameHome" readonly="readonly" class="form-control" placeholder="Usuario"  maxlength="30" value="${usuario.usuario}">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Email contacto</label> 
												<input type="text" readonly="readonly" id="iptEmailHome" class="form-control" placeholder="Email"  maxlength="30" value="${usuario.email}">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Nombre contacto</label> 
												<input type="text" readonly="readonly" id="iptNombreHome" class="form-control" placeholder="Nombre"  maxlength="100" value="${usuario.nombre}">
											</div>
										</div>
									</div>
								</div>
								<div class="box-footer">
									<div class="row" style="display:none;">
										<div class="col-md-3" id="btnActualizaPerfil" >
											<button type="button" class="btn btn-primary" onclick="actualizaUsuario();">Actualizar</button>
										</div>
									</div>
								</div>
								
							</form>
						</div>
		        	</div>
		        	<!-- Fin columna perfil -->
		        	<!-- Inicio columna cenro de trabajo -->
		        	<div class="col-md-6">
		        		<div class="box box-primary">
							<div class="box-header">
								<h1 class="box-title">Centro de trabajo</h1>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form role="form" >
								<input type="hidden" id="iptIdCentro" value="${centro.id}">
								<div class="box-body">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Alias</label> 
												<input type="text" id="iptNombreCentro" class="form-control" placeholder="Alias"  maxlength="30" value="${centro.nombre}">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Giro</label> 
												<select class="form-control" id="selectGiroCentro">
													<option value="0">Seleccione...</option>
													<c:if test="${not empty lstGiro}">
														<c:forEach items="${lstGiro}" var="giro">
															<c:if test="${not empty centro }">
																<c:if test="${giro.id == centro.idGiro}">
																	<option value="${giro.id}" selected="selected">${giro.nombre}</option>
																</c:if>
																<c:if test="${giro.id != centro.idGiro}">
																	<option value="${giro.id}">${giro.nombre}</option>
																</c:if>
															</c:if>
															<c:if test="${empty centro}">
																	<option value="${giro.id}">${giro.nombre}</option>
															</c:if>
														</c:forEach>
													</c:if>
		
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for=""># Empleados</label> 
												<input type="number" id="iptEmpleadosCentro" class="form-control"  placeholder="# Empleados" min="0" 
												<c:if test="${not empty centro}">
													readonly="readonly"
												</c:if>
												value="${centro.empleadoNumero}">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Estado</label> 
												<select required class="form-control" id="selectEstadoCentro" >
													<option value="0">Seleccione...</option>
													<c:if test="${not empty lstEstados}">
														<c:forEach items="${lstEstados}" var="estado">
															<c:if test="${not empty centro }">
																<c:if test="${estado.id == centro.idEstadoRepublica}">
																	<option value="${estado.id}" selected="selected">${estado.nombre}</option>
																</c:if>
																<c:if test="${estado.id != centro.idEstadoRepublica}">
																	<option value="${estado.id}">${estado.nombre}</option>
																</c:if>
															</c:if>
															<c:if test="${empty centro}">
																	<option value="${estado.id}">${estado.nombre}</option>
															</c:if>
														</c:forEach>
													</c:if>
												</select>
											</div>
										</div>
									</div>
									<!-- 
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Raz&oacute;n social</label> <input type="text" 
													class="form-control"  placeholder="Raz&oacute;n social"  maxlength="30">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">RFC</label> <input type="text" 
													class="form-control"  placeholder="RFC"  maxlength="30">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Pa&iacute;s</label> <input type="text" 
													class="form-control"  placeholder="Pa&iacute;s"  maxlength="30">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Estado</label> <input type="text" 
													class="form-control"  placeholder="Estado"  maxlength="30">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Municipio</label> <input type="text" 
													class="form-control"  placeholder="Municipio"  maxlength="30">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Colonia</label> <input type="text" 
													class="form-control"  placeholder="Colonia"  maxlength="30">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Calle</label> <input type="text" 
													class="form-control"  placeholder="Calle"  maxlength="30">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="">N&uacute;mero exterior</label> <input type="text" 
													class="form-control"  placeholder="N&uacute;mero exterior"  maxlength="30">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="">N&uacute;mero interior</label> <input type="text" 
													class="form-control"  placeholder="N&uacute;mero interior"  maxlength="30">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Codigo postal</label> <input type="text" 
													class="form-control"  placeholder="Codigo postal"  maxlength="30">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="">Telefono</label> <input type="text" 
													class="form-control"  placeholder="Telefono"  maxlength="30">
											</div>
										</div>
									</div> -->
								</div>
								<div class="box-footer">
									<div class="row" style="display:none;">
										<div class="col-md-3" id="btnActualizaPerfil" >
											<button type="button" class="btn btn-primary" onclick="actualizaCentro();">Actualizar</button>
										</div>
									</div>
								</div>
							</form>
						</div>
		        	</div>
		        	<!--  Fin columna cenro de trabajo-->
		        </div>
	        </div>
	        <!-- /.row (Perfil row) -->
	        
	        <!-- .row (Cuestionarios row) -->
	        <div id="divCuestionarios" >
		        <div class="row">
		        	<div class="box">
		                 <div class="box-header">
		                     <h1 class="box-title">Evaluaciones</h1>                                    
		                 </div><!-- /.box-header -->
		                 <div class="box-body table-responsive">
		                 	<c:if test="${not empty centro}">
			                 	<div class="row">
			                 		<div class="col-md-6">
			                 			<div class="input-group">
		                                    <input type="text" class="form-control" readonly="readonly" id="urlCuestionarios" value="http://localhost:8080/Admin035/cuestionarios?param=${centro.idCrypt}">
		                                    <span class="input-group-addon"><i title="Copiar" class="fa fa-copy" onclick="copyToClip('urlCuestionarios', 'copiado');"></i></span>
		                                </div>
			                 		</div>
			                 	</div>
			                 	<br>
			                     <table id="tblCuestionarios" class="table table-bordered table-striped">
			                         <thead>
			                             <tr>
			                                 <th>Descargar evaluaciones/cuestionarios</th>
			                                 <th>Nombre del cuestionario</th>
			                                 <th># cuesionarios respondidos</th>
			                             </tr>
			                         </thead>
			                         <tbody>
			                         	<c:if test="${not empty lstCuestionarios}">
			                         		<c:forEach items="${lstCuestionarios}" var="cuestionario" varStatus="loop">
					                             <tr>
					                                 <td>
					                                 	<a href="#" title="Descargar cuestionarios" onclick="descargaCuestionariosV2(${cuestionario.id},${centro.id});"><i class="fa fa-fw fa-download fa-4x"></i><br>Descargar cuestonarios</a>
					                                 </td>
					                                 <td>${cuestionario.nombre}</td>
					                                 <td>${cuestionario.resueltos}</td>
					                             </tr>
			                         		</c:forEach>
			                         	</c:if>
			                         </tbody>
			                     </table>
		                 	</c:if>
		                 	<c:if test="${empty centro}">
		                 		<h3 class="box-title">Para poder ver las evaluaciones desponibles es necesario actualizar la informaci&oacute;n de tu centro de trabajo</h3>
		                 	</c:if>
		                 </div><!-- /.box-body -->
		             </div><!-- /.box -->
		        </div>
	        </div>
	        <div class="row">
	        	<div class="box">
	                 <div class="box-header">
	                     <h1 class="box-title">Resultados de evaluaciones</h1>
	                 </div><!-- /.box-header -->
	                 <div class="box-body table-responsive">
	                 	<c:if test="${not empty centro}">
		                     <h3 class="box-title">Puedes comprar el resultado de las evaluaciones en cualquier momento</h3>                                    
		                     <table id="tblProductos" class="table table-bordered table-striped">
		                         <thead>
		                             <tr>
		                                 <th>Comprar/Descargar</th>
		                                 <th>Producto</th>
		                                 <th>Cuestionario</th>
		                                 <th>Precio</th>
		                                 <th>Estatus</th>
		                             </tr>
		                         </thead>
		                         <tbody>
							        <c:if test="${not empty lstProductos}">
								        <c:forEach items="${lstProductos}" var="producto" varStatus="loop">
				                             <tr>
				                                 <td>
				                                 	<c:if test="${producto.idCompraEstatus == 1 }">
					                                 	<a href="#" title="Agregar al carrito" onclick="agregaProducto(${producto.id});"><i class="fa fa-cart-plus fa-4x"></i><br>Agregar al carrito</a>
				                                 	</c:if>
				                                 	<c:if test="${producto.idCompraEstatus == 2 }">
					                                 	<a href="#" title="Quitar del carrito" onclick="quitaProducto(${producto.id});"><i class="fa fa-minus-circle fa-4x"></i><br>Quitar del carrito</a>
				                                 	</c:if>
				                                 	<c:if test="${producto.idCompraEstatus == 4 || producto.idCompraEstatus == 5 }">
					                                 	<a href="#" title="Descargar reporte" onclick="descargaResultados();"><i class="fa fa-file-text-o fa-4x"></i><br>Descargar reporte</a>
				                                 	</c:if>
				                                 </td>
				                                 <td>${producto.productoVO.nombre}</td>
				                                 <td>${producto.productoVO.cuestionarioVO.nombre}</td>
				                                 <td>$${producto.productoVO.precio}</td>
				                                 <td>
				                                 	<c:if test="${producto.idCompraEstatus == 1 }">
					                                 	Disponible
				                                 	</c:if>
				                                 	<c:if test="${producto.idCompraEstatus == 2 }">
					                                 	Pendiene de pago
				                                 	</c:if>
				                                 	<c:if test="${producto.idCompraEstatus == 3 }">
					                                 	En procesamiento por analistas  
				                                 	</c:if>
				                                 	<c:if test="${producto.idCompraEstatus == 4 || producto.idCompraEstatus == 5 }">
					                                 	Liso para descargar
				                                 	</c:if>
				                                 </td>
				                             </tr>
								        </c:forEach>
							        </c:if>
		                         </tbody>
		                     </table>
	                 	</c:if>
	                 	<c:if test="${empty centro}">
	                 		<h3 class="box-title">Para poder ver los resultados de las evaluaciones es necesario actualizar la informaci&oacute;n de tu centro de trabajo</h3>
	                 	</c:if>
	                 </div><!-- /.box-body -->
					<div class="box-footer">
	                 	<c:if test="${productosCarrito > 0}">
							<div class="row">
								<div class="col-md-3" id="btnActualizaPerfil" >
									<button type="button" class="btn btn-primary" onclick="openPago();">Pagar(${productosCarrito})</button>
								</div>
							</div>
						</c:if>
							<div class="row">
								<div class="col-md-12">
									Revisa el detalle de nuestra oferta <a href="https://035.com.mx/paso-2/" target="_blank">aqui</a>
								</div>
							</div>
					</div>
	                 
	             </div><!-- /.box -->
	        </div>
	        
		</c:if>


        
    </section><!-- /.content -->
</aside><!-- /.right-side -->

<div id="elementoCopiado" class="alert alert-success" role="alert" style="display: none;">
	<span id="successText"></span>
</div>

<div class="modal fade" id="modalDatosActualizados" tabindex="-1" role="dialog"
	aria-labelledby="modalDatosActualizados" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd box box-danger">
			<div class="modal-header bg-glass-sknd ">
				<h3 class="box-title" id="iptCursoTitulo">Datos actualizados</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<h4>Tu informaci&oacute;n se actualizo de forma correcta.</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn" onclick="location.reload();" data-dismiss="modal">Aceptar</button>
			</div>	
		</div>
	</div>
</div>

<div class="modal fade" id="modalAdvertenciaFormato" tabindex="-1"
	role="dialog" aria-labelledby="modalAdvertenciaFormato" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header bg-glass-sknd">
				<h3 class="box-title">Actualizar formato</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-white" style="color: grey;">
				<div class="box box-primary">
					<div class="box-header"></div>
					<!-- /.box-header -->
					<!-- form start -->
					<div class="box-body">
						<input type="hidden" id="iptIdFormatoA">
						<div class="row">
							<div class="col-md-12">
								<h4>Seleccione el documento a acargar</h4>
								<h4>Nota: El documento actual sera reemplazado por el nuevo </h4>
							</div>
						</div>
							<div class="row" id="divNuevoJustificante">
								<div class="col-md-12">
									<div class="form-group">
	                                         <label for="justifFile">Documento</label>
	                                         <input type="file" id="iptFileFormA" accept="application/pdf,image/*, .xls, .xlsx" onchange="validaSize(this);">
	                                   </div>
								</div>
							</div>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer mdl-footr-lt">
				<button type="button" class="btn" onclick="actualizaFormato()">Aceptar</button>
				<button type="button" class="btn" data-dismiss="modal" >Cerrar</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
            $(function() {
                
                $('#tblCuestionarios').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true,
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
                    }
                });
                
                $('#tblProductos').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true,
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
                    }
                });
                
                $('#tblProductosComprados').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": true,
                    "bAutoWidth": true,
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
                    }
                });

                $('#tblProductosRepondidos').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": true,
                    "bAutoWidth": true,
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
                    }
                });

                $('#tblProductosPend').dataTable({
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo": true,
                    "bAutoWidth": true,
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" 
                    }
                });
                
            });
        </script>


