<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>당근책 - 스케줄러</title>
	
    <link href='${pageContext.request.contextPath}/fullCalendar/lib/main.css' rel='stylesheet' />
	<script src='${pageContext.request.contextPath}/fullCalendar/lib/main.js'></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<!-- 	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>

 -->
 	<script type='text/javascript'>

 	function addMyEvent(default_event){
 		<c:forEach var="list" items="${schedule}">
 			default_event.push( {
 				  groupId: ${list.bno},
 		          title: '${list.routine}',
 		          start: '${list.schdate}T${list.start_time}', 
 		          end: '${list.schdate}T${list.end_time}'
 		      }); 			
 		</c:forEach>
 	}
 	
document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');
  
  var default_event = [

      {
          title: '${vo.routine}',
          start: '${vo.schdate}T${vo.start_time}', 
          end: '${vo.schdate}T${vo.end_time}'
      },
      {
          title: '전완근',
          start: '2021-09-03T13:00:00',
          constraint: 'businessHours'
        },
      {
          title: '광배근',
          start: '2021-09-03T13:00:00',
          constraint: 'businessHours'
        },
      {
          title: '대퇴근',
          start: '2021-09-03T13:00:00',
          constraint: 'businessHours'
        },
        {
            start: '2021-09-24',
            end: '2021-09-26',
            overlap: false,
            display: 'background',
            color: '#ff9f89'
        },
        {
            title: '하체',
            start: '2021-09-20',
            end: '2021-09-22'
          }
  ];
  
  addMyEvent(default_event);
  
  
	var myModal = new bootstrap.Modal(document.getElementById('inputschedule'),{
        keyboard: false
   });
  
  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyDz1GXbKyeqHAetRW9yp9WHwgFGj4o-c1w',
    dayMaxEventRows: true, // for all non-TimeGrid views
    views: {
    timeGrid: {
    dayMaxEventRows: 3 // adjust to 3 only for timeGridWeek/timeGridDay
    }
    },
    headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        /* var title = prompt('Event Title:'); */        
			myModal.toggle();
        if (title) {
          	calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          location.href="${pageContext.request.contextPath}/scheduler/delete?bno=" + arg.event.groupId;
          arg.event.remove()
        }
      },
      editable: true,
      
    events : default_event
  });
  calendar.render();
});
</script>
<style>
.fc-daygrid-more-link, .fc-daygrid-day-number, .fc-col-header-cell-cushion {
	text-decoration: none;
	color : black;
}

.fc-daygrid-event {
	color : black;
}

#calendar{
   width:60%;
   margin:20px auto;
   padding: 0 20px;
   background-color:white;
   
}
</style>
  </head>
  <body>
<%@ include file="/static/include/header.jsp"%>
<%@ include file="/static/include/modal.jsp"%>
    <div id='calendar'></div>
<%@ include file="/static/include/footer.jsp" %>
  </body>
</html>