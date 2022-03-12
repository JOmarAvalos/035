<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
        /*ARRASTRA FILL BLANK*/
        .content-task-cust{
        margin:16px 0;
        }
        .content-task-cust ul {
        height: 3em;
        line-height: 3em;
        vertical-align: middle;
        margin-bottom: 10px;
        }
        .content-task-cust ul li {
        list-style-type: none;
        display: inline-block;
        min-height: 3em;
        min-width: 3em;
        text-align: center;
        margin-right: 4px;
        }

        .content-task-cust ul li span {
        display: inline-block;
        font-family: var(--fregular);
        color: var(--color-secondary);
        font-style: normal;
        font-size: .91em;
        font-weight: 600;
        }
        .content-task-cust ul li span[draggable=true] {
        cursor: grab !important;
        }
        .content-task-cust ul li span[draggable=true]:active {
        cursor: grabbing !important;
        }
        .content-task-cust ul li span.word-empty-cust {
        min-width: 0.5em;
        width: 100%;
        line-height: 1.5;
        font-weight: 100;
        font-style: normal;
        color: var(--color-secondarylt);
        padding: 0 3px;
        cursor:grabbing;
        }
        .usado{
        background: #eaeaea!important;
        color: rgb(73,80,86, .12)!important;
        border-color: #eaeaea!important;
        border-radius: 4px;
        }


        span.word-fill-cust{
        font-style: normal;
        border: 1px solid var(--color-graytrd);
        padding: 3px 10px 0 10px;
        line-height: 2.5;
        border-radius: 4px;
        text-align: center;
        transition:all ease-out .4s;
        font-weight: normal;
        height: 36px;
        background: #f8f9fa;
        min-width: 3em;
        }
        span.word-fill-cust:hover{
        background: var(--color-secondarylt);
        color: white;
        cursor: pointer;
        border-color: white;
        }
           .dropzone{
            background: #eaeaea;
            vertical-align: bottom;
            padding: 0px;
            min-height: 0;
            line-height: 0;
            height: 36px;
            min-width: 3em;
            border-radius: 4px;
          }
</style>

<script>
        /*FILL BLANK*/
        //click
        let wordFill = document.getElementsByClassName("word-fill-cust");
        let wordEmpty = document.getElementsByClassName("word-empty-cust");

        for (let i = 0; i < wordFill.length; i++) {
        wordFill[i].addEventListener("click", function() {
          for (let i = 0; i < wordEmpty.length; i++) {
            if (wordEmpty[i].innerText === "") {
              wordEmpty[i].innerText = this.innerText;
              this.classList.add('usado');
              wordEmpty[i].setAttribute("value", this.getAttribute("value"));
              wordEmpty[i].setAttribute("data", this.getAttribute("data"));

              break;
            }
          }
        });
        }
        for (let i = 0; i < wordEmpty.length; i++) {
        wordEmpty[i].addEventListener("click", function() {
          if (this.innerText !== "") {
            this.innerText = "";
            this.value = "";
            wordFill[this.getAttribute("data")].classList.remove('usado');
          }
        });
        }

        // drag and drop
        let dragged;
        document.addEventListener("dragstart", function(e) {
        dragged = e.target;
        e.dataTransfer.setData('text', null);
        }, false);
        document.addEventListener("dragover", function(e) {
        e.preventDefault();
        }, false);
        document.addEventListener("dragenter", function(e) {
        if (e.target.classList.contains('dropzone')) {
          e.target.style.border = '2px dashed #ccc'
        }
        }, false);
        document.addEventListener("dragleave", function(e) {
        if (e.target.classList.contains('dropzone')) {
          e.target.style.border = ''
        }
        }, false);
        document.addEventListener("drop", function(e) {
        e.preventDefault();
        if (e.target.classList.contains('dropzone')) {
          dragged.parentElement.removeChild(dragged);
          e.target.firstChild && e.target.removeChild(e.target.firstChild);
          e.target.appendChild(dragged);
          e.target.style.border = '';
        }
        }, false);
</script>
<script type="text/javascript">
	var inicioConteo,
	idTimeout;
	var cronometro = $('#cronometro');
	
	function zeroIzq(n){
	    return n.toString().replace(/^(\d)$/,'0$1');
	}
	
	function formatoSegundos(s){
	    return zeroIzq(Math.floor(s / 3600))+':'+zeroIzq(Math.floor(s%3600 / 60))+':'+zeroIzq(Math.floor((s%3600)%60));
	}
	
	function actualizar(){
	    var dif = Date.now() - inicioConteo;
	    dif = Math.round(dif / 1000);
	    $('#cronometro').html('<spring:message code="lms.carrera.actividad.examen.duracion.actual" />'+formatoSegundos(dif));
	    idTimeout = setTimeout(actualizar,1000);
	    
	}
	
	function iniciar(){
	    clearTimeout(idTimeout);
	    inicioConteo = Date.now();
	    actualizar();
	}
	
</script>
<script
	src="<c:url value='/resources/js/lms/carrera/carreraActividad.js' />"
	type="text/javascript"></script>

<main class="l-main">
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#"
				onclick="getMiCarreraMonitoreo();"><spring:message code="lms.carrera.title" /></a></li>
			<li class="breadcrumb-item"><a href="#"
				onclick="getMiPlanMonitoreo(${planId});">${planName}</a></li>
			<li class="breadcrumb-item"><a href="#"
				onclick="getMiCertificadoCursoMonitoreo(${actividadVO.idCurso}, '${planName}', '${certificadoName}', '${cursoName}', ${idInscripcion}, ${planId}, ${idCertificado});">${certificadoName}
					| ${cursoName}</a></li>
			<li class="breadcrumb-item"><spring:message code="lms.carrera.actividad.examen.title" /> ${actividadVO.orden}
			
				<c:if test="${not empty locale}">
				    <c:if test="${fn:contains(locale, 'es')}">
				        ${actividadVO.tipoActividad.nombre}
				    </c:if>
				    <c:if test="${fn:contains(locale, 'en')}">
				        <c:if test="${not empty actividadVO.tipoActividad.nombreEn}">
				            ${actividadVO.tipoActividad.nombreEn}
				        </c:if>
				        <c:if test="${ empty actividadVO.tipoActividad.nombreEn}">
				            ${actividadVO.tipoActividad.nombre}
				        </c:if>
				    </c:if>
				    <c:if test="${fn:contains(locale, 'fr')}">
				        <c:if test="${not empty actividadVO.tipoActividad.nombreFr}">
				            ${actividadVO.tipoActividad.nombreFr}
				        </c:if>
				        <c:if test="${ empty actividadVO.tipoActividad.nombreFr}">
				            ${actividadVO.tipoActividad.nombre}
				        </c:if>
				    </c:if>
				</c:if>
				<c:if test="${empty locale}">
				    ${actividadVO.tipoActividad.nombre}
				</c:if>
				
			</li>
		</ol>
	</nav>
	<div class="content-wrapper pt-3">
	<input type="hidden" id="idMonitoreoActividadActi" value="${idMonitoreoActividadActi}">
    <input type="hidden" id="idMonitoreoActividadCursoPadre" value="${idMonitoreoActividadCursoPadre}">
    <input type="hidden" id="idMonitoreoActividadPadre" value="${idMonitoreoActividadPadre}">
		<div class="row align-items-end mt-3">
			<div class="col">
				<h2 class="subtitle">
					<span>${certificadoName}</span> ${cursoName}
				</h2>
			</div>
		</div>
		<div class="row actividad align-items-center ">
			<div class="col-md-6">
			
				<c:if test="${not empty locale}">
			    	<c:if test="${fn:contains(locale, 'es')}">
						<h3><spring:message code="lms.carrera.actividad.examen.title" /> ${actividadVO.orden} | <span>${actividadVO.nombre}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.examen.descripcion" /> <span>${actividadVO.descripcion}</span></h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'en')}">
						<h3><spring:message code="lms.carrera.actividad.examen.title" /> ${actividadVO.orden} | <span>${actividadVO.nombreEn}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.examen.descripcion" /> <span>${actividadVO.descripcionEn}</span></h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'fr')}">
						<h3><spring:message code="lms.carrera.actividad.examen.title" /> ${actividadVO.orden} | <span>${actividadVO.nombreFr}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.examen.descripcion" /> <span>${actividadVO.descripcionFr}</span></h3>
			    	</c:if>
			    </c:if>
			    <c:if test="${empty locale}">
						<h3><spring:message code="lms.carrera.actividad.examen.title" /> ${actividadVO.orden} | <span>${actividadVO.nombre}</span></h3>
						<h3><spring:message code="lms.carrera.actividad.examen.descripcion" /> <span>${actividadVO.descripcion}</span></h3>
			    </c:if>
			</div>
			<div class="col-md-3" >
				<div style="font-size:30px;">
					<spring:message code="lms.carrera.actividad.examen.duracion" /> <br> ${actividadVO.tiempoEstimado} <spring:message code="lms.carrera.actividad.examen.duracion.minutos" />
				</div>
			</div>
			<div class="col-md-3">
				<div id="cronometro" style="font-size:30px;">
					<spring:message code="lms.carrera.actividad.examen.duracion.actual" /> 00:00:00
				</div>
			</div>
		</div>
		<div class="row actividad align-items-center ">
			<div class="col">
				<hr>
			</div>
		</div>
		<div class="row" id="startExamen">
			<div class="col">
				<input type="hidden" id="idConsultaActividad"> 
				<c:if test="${not empty locale}">
			    	<c:if test="${fn:contains(locale, 'es')}">
						<h3><spring:message code="lms.carrera.actividad.examen.inicio.msg1" /><span class="bold">"${actividadVO.nombre}"</span>
						<spring:message code="lms.carrera.actividad.examen.inicio.msg2" />
						</h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'en')}">
						<h3><spring:message code="lms.carrera.actividad.examen.inicio.msg1" /><span class="bold">"${actividadVO.nombreEn}"</span>
						<spring:message code="lms.carrera.actividad.examen.inicio.msg2" />
						</h3>
			    	</c:if>
			    	<c:if test="${fn:contains(locale, 'fr')}">
						<h3><spring:message code="lms.carrera.actividad.examen.inicio.msg1" /><span class="bold">"${actividadVO.nombreFr}"</span>
						<spring:message code="lms.carrera.actividad.examen.inicio.msg2" />
						</h3>
			    	</c:if>
			    </c:if>
			    <c:if test="${empty locale}">
						<h3><spring:message code="lms.carrera.actividad.examen.inicio.msg1" /><span class="bold">"${actividadVO.nombre}"</span>
						<spring:message code="lms.carrera.actividad.examen.inicio.msg2" />
						</h3>
			    </c:if>

				<button type="button"
					class="md-btn md-btn-secondary d-block mt-4 ml-0"
					onclick="startExamen('${actividadVO.id}', '${idInscripcion}');">
					<spring:message code="lms.carrera.actividad.examen.btn.comenzar" /> <i class="fas fa-rocket ml-2"></i>
				</button>
			</div>
		</div>

		<c:if test="${not empty actividadVO.actividadExamenVO.preguntas}">
			<c:set var="count" value="1" scope="page" />
			<c:forEach items="${actividadVO.actividadExamenVO.preguntas}"
				var="pregunta">
				<div id="pregunta${count}"
					style="display: none; background: #f7f7f7;"
					class="examen container-fluid">
					
					<div class="row bg-white">
						<div class="col">
							<c:if test="${not empty locale}">
						    	<c:if test="${fn:contains(locale, 'es')}">
									<h6 class="bold uppercase mt-2 mb-4">Pregunta ${count} de ${actividadVO.actividadExamenVO.preguntas.size()}</h6>
						    	</c:if>
						    	<c:if test="${fn:contains(locale, 'en')}">
									<h6 class="bold uppercase mt-2 mb-4">Question ${count} of ${actividadVO.actividadExamenVO.preguntas.size()}</h6>
						    	</c:if>
						    	<c:if test="${fn:contains(locale, 'fr')}">
									<h6 class="bold uppercase mt-2 mb-4">Question ${count} sur ${actividadVO.actividadExamenVO.preguntas.size()}</h6>
						    	</c:if>
						    </c:if>
						    <c:if test="${empty locale}">
									<h6 class="bold uppercase mt-2 mb-4">Pregunta ${count} de ${actividadVO.actividadExamenVO.preguntas.size()}</h6>
						    </c:if>
						</div>
					</div>
					<c:set var="countActual" value="${count}" scope="page" />
					<c:set var="count" value="${count + 1}" scope="page" />
					<c:if test="${not empty pregunta.imagen}">
						<div class="row">
							<div class="col-md-12 img-examen">
								<img class="" src="${pregunta.imagen}" alt="Taller">
							</div>
						</div>
					</c:if>
					<div class="row bg-white">
						<div class="col">
							<c:if test="${not empty locale}">
						    	<c:if test="${fn:contains(locale, 'es')}">
									<h6 class="bold uppercase mt-2 mb-4">${pregunta.nombre}</h6>
						    	</c:if>
						    	<c:if test="${fn:contains(locale, 'en')}">
									<h6 class="bold uppercase mt-2 mb-4">${pregunta.nombreEn}</h6>
						    	</c:if>
						    	<c:if test="${fn:contains(locale, 'fr')}">
									<h6 class="bold uppercase mt-2 mb-4">${pregunta.nombreFr}</h6>
						    	</c:if>
						    </c:if>
						    <c:if test="${empty locale}">
									<h6 class="bold uppercase mt-2 mb-4">${pregunta.nombre}</h6>
						    </c:if>
						</div>
					</div>
					<c:if test="${pregunta.idTipoPregunta == 6 || pregunta.idTipoPregunta == 10}">
						<div class="row bg-white">
								<div class="col">
									<h6 class="bold uppercase mt-2 mb-4"><spring:message code="lms.carrera.actividad.examen.arrrastrable.extra" /></h6>
								</div>
						</div>
					</c:if>
					<c:if test="${pregunta.idTipoPregunta == 1}">
						<div class="row">
							<div class="col" >
								<textarea rows="3" cols="10" id="ta${pregunta.id}"></textarea>
							</div>
						</div>
					</c:if>
					<c:if test="${pregunta.idTipoPregunta == 2 || pregunta.idTipoPregunta == 3}">
						<c:if test="${not empty pregunta.respuestas}">
							<c:forEach items="${pregunta.respuestas}" var="respuesta">
								<div class="row">
									<div class="col my-2">
										<c:if test="${not empty locale}">
									    	<c:if test="${fn:contains(locale, 'es')}">
												<label class="radio"> ${respuesta.nombre} <input
													type="radio" id="check${pregunta.id}"
													name="check${pregunta.id}" value="${respuesta.id}"> <span
													class="checkround"></span>
												</label>
									    	</c:if>
									    	<c:if test="${fn:contains(locale, 'en')}">
												<label class="radio"> ${respuesta.nombreEn} <input
													type="radio" id="check${pregunta.id}"
													name="check${pregunta.id}" value="${respuesta.id}"> <span
													class="checkround"></span>
												</label>
									    	</c:if>
									    	<c:if test="${fn:contains(locale, 'fr')}">
												<label class="radio"> ${respuesta.nombreFr} <input
													type="radio" id="check${pregunta.id}"
													name="check${pregunta.id}" value="${respuesta.id}"> <span
													class="checkround"></span>
												</label>
									    	</c:if>
									    </c:if>
									    <c:if test="${empty locale}">
												<label class="radio"> ${respuesta.nombre} <input
													type="radio" id="check${pregunta.id}"
													name="check${pregunta.id}" value="${respuesta.id}"> <span
													class="checkround"></span>
												</label>
									    </c:if>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</c:if>
					<c:if test="${pregunta.idTipoPregunta == 4 || pregunta.idTipoPregunta == 7}">
						<c:if test="${not empty pregunta.respuestas}">
							<c:forEach items="${pregunta.respuestas}" var="respuesta">
								<div class="row">
									<div class="col my-2">

										<div class="chiller_cb">
											<c:if test="${not empty locale}">
										    	<c:if test="${fn:contains(locale, 'es')}">
													<label> ${respuesta.nombre} <input type="checkbox"
														id="check${pregunta.id}" name="check${pregunta.id}"
														value="${respuesta.id}"> <span></span>
													</label>
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'en')}">
													<label> ${respuesta.nombreEn} <input type="checkbox"
														id="check${pregunta.id}" name="check${pregunta.id}"
														value="${respuesta.id}"> <span></span>
													</label>
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'fr')}">
													<label> ${respuesta.nombreFr} <input type="checkbox"
														id="check${pregunta.id}" name="check${pregunta.id}"
														value="${respuesta.id}"> <span></span>
													</label>
										    	</c:if>
										    </c:if>
										    <c:if test="${empty locale}">
													<label> ${respuesta.nombre} <input type="checkbox"
														id="check${pregunta.id}" name="check${pregunta.id}"
														value="${respuesta.id}"> <span></span>
													</label>
										    </c:if>
										</div>

									</div>
								</div>
							</c:forEach>
						</c:if>
					</c:if>
					<c:if test="${pregunta.idTipoPregunta == 5}">
						<c:if test="${not empty pregunta.respuestas}">
							<c:set var="countResp" value="0" scope="page" />
							<c:set var="countRespShow" value="1" scope="page" />
							<c:forEach items="${pregunta.respuestas}" var="respuesta">
								<div class="row">
									<div class="col-md-6" style="background: #f7f7f7;">


										<div class="row">
											<div class="col-sm-2">
												<input type="hidden"
													id="iptIzquierda${pregunta.id}${countResp}"
													value="${respuesta.id}"> <input
													class="my-2 form-control" type="number" placeholder="--"
													min="1" max="${pregunta.respuestas.size()}"
													id="iptRelacion${pregunta.id}${countResp}">
											</div>
											<c:if test="${not empty locale}">
										    	<c:if test="${fn:contains(locale, 'es')}">
													<label for="staticEmail" class="col-sm-8 col-form-label pl-0"
														style="line-height: 2.3;">${respuesta.nombre}</label>
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'en')}">
													<label for="staticEmail" class="col-sm-8 col-form-label pl-0"
														style="line-height: 2.3;">${respuesta.nombreEn}</label>
										    	</c:if>
										    	<c:if test="${fn:contains(locale, 'fr')}">
													<label for="staticEmail" class="col-sm-8 col-form-label pl-0"
														style="line-height: 2.3;">${respuesta.nombreFr}</label>
										    	</c:if>
										    </c:if>
										    <c:if test="${empty locale}">
													<label for="staticEmail" class="col-sm-8 col-form-label pl-0"
														style="line-height: 2.3;">${respuesta.nombre}</label>
										    </c:if>
										</div>



									</div>
									<div class="col-md-6" style="background: #eaeaea;">
										<c:if test="${not empty locale}">
									    	<c:if test="${fn:contains(locale, 'es')}">
												<input type="hidden"
													id="iptDerecha${pregunta.id}${countRespShow}"
													value="${respuesta.auxIdRespuestaCorrecta}"> <span
													class="my-2 d-inline-block"><span
													class="bold mr-1 txt-secondary">${countRespShow} -</span>
													${respuesta.nombre2} </span>
									    	</c:if>
									    	<c:if test="${fn:contains(locale, 'en')}">
												<input type="hidden"
													id="iptDerecha${pregunta.id}${countRespShow}"
													value="${respuesta.auxIdRespuestaCorrecta}"> <span
													class="my-2 d-inline-block"><span
													class="bold mr-1 txt-secondary">${countRespShow} -</span>
													${respuesta.nombre2En} </span>
									    	</c:if>
									    	<c:if test="${fn:contains(locale, 'fr')}">
												<input type="hidden"
													id="iptDerecha${pregunta.id}${countRespShow}"
													value="${respuesta.auxIdRespuestaCorrecta}"> <span
													class="my-2 d-inline-block"><span
													class="bold mr-1 txt-secondary">${countRespShow} -</span>
													${respuesta.nombre2Fr} </span>
									    	</c:if>
									    </c:if>
									    <c:if test="${empty locale}">
												<input type="hidden"
													id="iptDerecha${pregunta.id}${countRespShow}"
													value="${respuesta.auxIdRespuestaCorrecta}"> <span
													class="my-2 d-inline-block"><span
													class="bold mr-1 txt-secondary">${countRespShow} -</span>
													${respuesta.nombre2} </span>
									    </c:if>
									</div>
								</div>
								<c:set var="countResp" value="${countResp+1}" scope="page" />
								<c:set var="countRespShow" value="${countRespShow+1}"
									scope="page" />
							</c:forEach>
						</c:if>
					</c:if>
					<!-- Relleno de blancos -->
					<c:if test="${pregunta.idTipoPregunta == 6}">
						<div class="row">
							<!-- 
							<div class="col" >
								<textarea rows="3" cols="10" id="ta${pregunta.id}"></textarea>
							</div>
							 -->

							<div class="col-md-12 bg-light">
								<div class="content-task">
									<ul class="questions text-justify">
										<c:if test="${not empty pregunta.auxPregunta}">
											<c:set var="countResp" value="0" scope="page" />
											<c:set var="countRespShow" value="1" scope="page" />
											<c:forEach items="${pregunta.auxPregunta}" var="frase">
												<c:if test="${fn:contains(frase, '[{X}]')}">
													<li class="dropzone" id="liR${pregunta.id}${countRespShow}"></li>
													<c:set var="countResp" value="${countResp+1}" scope="page" />
													<c:set var="countRespShow" value="${countRespShow+1}" scope="page" />
												</c:if>
												<c:if test="${not fn:contains(frase, '[{X}]')}">
													<li><span>${frase}</span></li>
												</c:if>

											</c:forEach>
										</c:if>
									</ul>
									<ul class="answers">
										<c:if test="${not empty pregunta.respuestas}">
											<c:forEach items="${pregunta.respuestas}" var="respuesta">
												<c:if test="${not empty locale}">
											    	<c:if test="${fn:contains(locale, 'es')}">
														<li class="dropzone"><span class="word-fill-cust" data="${respuesta.orden}" draggable="true" value="${respuesta.nombre}">${respuesta.nombre}</span></li>
											    	</c:if>
											    	<c:if test="${fn:contains(locale, 'en')}">
														<li class="dropzone"><span class="word-fill-cust" data="${respuesta.orden}" draggable="true" value="${respuesta.nombreEn}">${respuesta.nombreEn}</span></li>
											    	</c:if>
											    	<c:if test="${fn:contains(locale, 'fr')}">
														<li class="dropzone"><span class="word-fill-cust" data="${respuesta.orden}" draggable="true" value="${respuesta.nombreFr}">${respuesta.nombreFr}</span></li>
											    	</c:if>
											    </c:if>
											    <c:if test="${empty locale}">
														<li class="dropzone"><span class="word-fill-cust" data="${respuesta.orden}" draggable="true" value="${respuesta.nombre}">${respuesta.nombre}</span></li>
											    </c:if>
											</c:forEach>
										</c:if>
									</ul>
								</div>
							</div>

						</div>
					</c:if>
					<!-- Opcion multiple con imagen unica -->
					<c:if test="${pregunta.idTipoPregunta == 9}">
						<c:if test="${not empty pregunta.respuestas}">
							<c:forEach items="${pregunta.respuestas}" var="respuesta">
								<div class="row">
									<div class="col my-2">
										<c:if test="${not empty locale}">
									    	<c:if test="${fn:contains(locale, 'es')}">
												<label class="radio"> ${respuesta.nombre} <input
													type="radio" id="check${pregunta.id}"
													name="check${pregunta.id}" value="${respuesta.id}"> <span
													class="checkround"></span>
												</label>
									    	</c:if>
									    	<c:if test="${fn:contains(locale, 'en')}">
												<label class="radio"> ${respuesta.nombreEn} <input
													type="radio" id="check${pregunta.id}"
													name="check${pregunta.id}" value="${respuesta.id}"> <span
													class="checkround"></span>
												</label>
									    	</c:if>
									    	<c:if test="${fn:contains(locale, 'fr')}">
												<label class="radio"> ${respuesta.nombreFr} <input
													type="radio" id="check${pregunta.id}"
													name="check${pregunta.id}" value="${respuesta.id}"> <span
													class="checkround"></span>
												</label>
									    	</c:if>
									    </c:if>
									    <c:if test="${empty locale}">
												<label class="radio"> ${respuesta.nombre} <input
													type="radio" id="check${pregunta.id}"
													name="check${pregunta.id}" value="${respuesta.id}"> <span
													class="checkround"></span>
												</label>
									    </c:if>
									</div>
									<div class="col my-2">
										<img src="${respuesta.imagen}" alt="Taller" width="250" >
									</div>
								</div>
							</c:forEach>
						</c:if>
					</c:if>
					<!-- Arrastrable -->
					<c:if test="${pregunta.idTipoPregunta == 10}">
						<div class="row">

							<div class="col-md-12 bg-light">
								<div draggable="true">
								</div>
								<div class="content-task-cust">
									<ul class="questions text-justify">
										<c:if test="${not empty pregunta.respuestas}">
										  <c:set var="countResp" value="0" scope="page" />
										  <c:set var="countRespShow" value="1" scope="page" />
										  <c:forEach items="${pregunta.respuestas}" var="respuesta">
										    <li class="dropzone" id="liR${pregunta.id}${countRespShow}"></li>
										    <c:set var="countResp" value="${countResp+1}" scope="page" />
											<c:set var="countRespShow" value="${countRespShow+1}" scope="page" />
										  </c:forEach>
										</c:if>
									</ul>
									<ul class="answers">
										<c:if test="${not empty pregunta.respuestas}">
										  <c:forEach items="${pregunta.respuestas}" var="respuesta">
												<c:if test="${not empty locale}">
											    	<c:if test="${fn:contains(locale, 'es')}">
											   			<li class="dropzone"><span class="word-fill-cust" data="${respuesta.orden}" draggable="true" value="${respuesta.nombre}">${respuesta.nombre}</span></li>
											    	</c:if>
											    	<c:if test="${fn:contains(locale, 'en')}">
											   			<li class="dropzone"><span class="word-fill-cust" data="${respuesta.orden}" draggable="true" value="${respuesta.nombreEn}">${respuesta.nombreEn}</span></li>
											    	</c:if>
											    	<c:if test="${fn:contains(locale, 'fr')}">
											   			<li class="dropzone"><span class="word-fill-cust" data="${respuesta.orden}" draggable="true" value="${respuesta.nombreFr}">${respuesta.nombreFr}</span></li>
											    	</c:if>
											    </c:if>
											    <c:if test="${empty locale}">
										   			<li class="dropzone"><span class="word-fill-cust" data="${respuesta.orden}" draggable="true" value="${respuesta.nombre}">${respuesta.nombre}</span></li>
											    </c:if>
										  </c:forEach>
										</c:if>
									</ul>
								</div>
							</div>

						</div>
					</c:if>
					<div class="row bg-white">
						<div class="col">
							<button type="button"
								class="md-btn md-btn-secondary ml-0 mt-4 mb-3"
								onclick="saveRespuesta('${countActual}','${count}','${pregunta.idTipoPregunta}', 
							'${actividadVO.actividadExamenVO.preguntas.size()}','${pregunta.id}','${pregunta.respuestas.size()}');">
								<spring:message code="lms.carrera.actividad.examen.btn.siguiente" /> <i class="fas fa-arrow-right ml-2"></i>
							</button>
						</div>

					</div>

				</div>
			</c:forEach>
		</c:if>
		<hr>
		<div id="endExamen" style="display: none;">
			<div class="row">
				<div class="col">
					<h5 class="regular my-4 txt-graytrd">
						<c:if test="${not empty locale}">
					    	<c:if test="${fn:contains(locale, 'es')}">
								<spring:message code="lms.carrera.actividad.examen.concluido.msg" /> <span
									class="bold italic txt-gray">"${actividadVO.nombre}"</span>
					    	</c:if>
					    	<c:if test="${fn:contains(locale, 'en')}">
								<spring:message code="lms.carrera.actividad.examen.concluido.msg" /> <span
									class="bold italic txt-gray">"${actividadVO.nombreEn}"</span>
					    	</c:if>
					    	<c:if test="${fn:contains(locale, 'fr')}">
								<spring:message code="lms.carrera.actividad.examen.concluido.msg" /> <span
									class="bold italic txt-gray">"${actividadVO.nombreFr}"</span>
					    	</c:if>
					    </c:if>
					    <c:if test="${empty locale}">
								<spring:message code="lms.carrera.actividad.examen.concluido.msg" /> <span
									class="bold italic txt-gray">"${actividadVO.nombre}"</span>
					    </c:if>
					</h5>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<button type="button" class="md-btn md-btn-main ml-0"
						onclick="calificaExamen();">
						<spring:message code="lms.carrera.actividad.examen.btn.calificar" />  <i class="fas fa-tasks ml-2"></i>
					</button>
					<hr>
				</div>
			</div>
		</div>

		<div id="divCalificacion" style="display: none;">
			<input type="hidden" id="iptCalificacionExamen"> <input
				type="hidden" id="iptIntentoExamen" value="1"> <input
				type="hidden" id="iptIntentosExamen"
				value="${actividadVO.numeroOportunidades}">
			<div class="row">
				<div class="col">
					<h5 class="bold my-4 txt-graytrd">
						<spring:message code="lms.carrera.actividad.examen.calificacion" /><span style="font-size: 1.2em;"
							class="txt-gray ml-2" id="spanCalifExamen"></span>
					</h5>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<button type="button" class="md-btn md-btn-main ml-0"
						onclick="getActividad(${actividadVO.id},'${planName}','${certificadoName}','${cursoName}','${idInscripcion}', '${planId}','${idCertificado}');"
						id="btnReinicia" style="display: none;">
						<spring:message code="lms.carrera.actividad.examen.intentar" /><i class="fas fa-check ml-2"></i>
					</button>
					<button type="button" class="md-btn md-btn-main ml-0"
						onclick="getMiCertificadoCurso(${actividadVO.idCurso}, '${planName}', '${certificadoName}', '${cursoName}', ${idInscripcion}, ${planId},'${idCertificado}');"
						id="btnTerminar">
						<spring:message code="lms.carrera.actividad.examen.btn.salir" /> <i class="fas fa-check ml-2"></i>
					</button>

					<hr>
				</div>
			</div>
		</div>

	</div>
</main>


<div class="modal fade" id="modalAdvertenciaExamen" tabindex="-1"
	role="dialog" aria-labelledby="modalAdvertenciaExamen"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content bg-glass-sknd">
			<div class="modal-header">
				<h4 class="modal-title txt-orange uppercase bold text-center">
					<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> <br>
					<spring:message code="lms.carrera.actividad.examen.advertencia" />
				</h4>
			</div>
			<div class="modal-body">
				<div class="row my-4">

					<div class="col">
					
						<c:if test="${not empty locale}">
						    <c:if test="${fn:contains(locale, 'es')}">
						        <p class="bold" id="pMsjAdvertenciaExamen"></p>
						    </c:if>
						    <c:if test="${fn:contains(locale, 'en')}">
						        <p class="bold" id="pMsjAdvertenciaExamenEn"></p>
						    </c:if>
						    <c:if test="${fn:contains(locale, 'fr')}">
						        <p class="bold" id="pMsjAdvertenciaExamenFr"></p>
						    </c:if>
						</c:if>
						<c:if test="${empty locale}">
						        <p class="bold" id="pMsjAdvertenciaExamen"></p>
						</c:if>

						
					</div>
				</div>
				<hr>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="md-btn md-btn-close "
					data-dismiss="modal"><spring:message code="lms.carrera.actividad.examen.btn.cerrar" /></button>
			</div>

		</div>
	</div>
</div>

<script>

$(document).ready(function() {
    function changeNumber() {
    	var idMonitoreoActividadActi=$("#idMonitoreoActividadActi").val();
    	if(idMonitoreoActividadActi > 0){
    	var urltxt=ctx+"/lms/carrera/updateMonitoreoActividad?id="+idMonitoreoActividadActi; 
    	$.ajax({
    		type : "POST",
    		url : urltxt,
    		contentType : "application/json",
    		beforeSend : function() {
    		},
    		complete : function() {
    		},
    		success : function(response) {
    			
    			if (response[0]) {				
    			} else {
    			}
    		},
    		error : function(msg) {
    		}
    	});
    }
    }
    setInterval(changeNumber, 30000);
});

</script>
