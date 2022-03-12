<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value='/resources/js/admin/calendario.js' />"
	type="text/javascript"></script>

<main class="l-main inscripciones">
<div class="content-wrapper admin_wrap">
	<div class="row">
		<div class="col-md-12">
			<div class="nav-tabs-custom">
				<div class="tab-content">
					<div class="row">
						<div class="col-md-2">
						</div>
						<div class="col-md-8">
							<div class="box box-primary">
								<div class="box-header"></div>
								<div class="box-body no-padding">
									<!-- THE CALENDAR -->
									<div id="calendario"></div>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /. box -->
						</div>
						<!-- /.col -->
						<div class="col-md-2"></div>

					</div>
					<!-- /.row -->
				</div>
				<!-- /.tab-content -->
			</div>
			<!-- nav-tabs-custom -->
		</div>
	</div>
</div>

</main>

<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/core/main.css' />"
	rel='stylesheet' />
<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/daygrid/main.css' />"
	rel='stylesheet' />
<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/timegrid/main.css' />"
	rel='stylesheet' />
<link
	href="<c:url value='/resources/plugins/fullcalendar/packages/list/main.css' />"
	rel='stylesheet' />
<script
	src="<c:url value='/resources/plugins/fullcalendar/vendor/rrule.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/core/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/interaction/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/daygrid/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/timegrid/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/list/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/rrule/main.js' />"></script>
<script
	src="<c:url value='/resources/plugins/fullcalendar/packages/core/locales-all.js' />"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendario');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'rrule' ],
      header: {
        left: 'prev,next ',
        center: 'title',
        right: 'today'
      },
      locale: 'es',
      editable: true,
      events: [
      	<c:if test="${not empty lstCalendario}">
			<c:forEach items="${lstCalendario}" var="calendario">
			{
                title: '${calendario.cursoVO.nombre}',
                start: new Date(${calendario.auxFechaInicio}),
                end: new Date(${calendario.auxFechaFin}),
                backgroundColor: "${calendario.color}", //Info (aqua)
                borderColor: "${calendario.color}", //Info (aqua)
                id:${calendario.id}
            },
			</c:forEach>
       	</c:if>
      ],
      eventClick: function(arg) {
        //alert(arg.event.id);
        var idEvento=arg.event.id;
        openEvento(idEvento);
      }
    });

    openEvento = function(id) {

    	var urltxt = ctx+"/lms/openEventoCalendario?id="+id; 
    	window.open(urltxt, '_blank');
		
	}
    
    calendar.render();
    
  });
  
  

</script>