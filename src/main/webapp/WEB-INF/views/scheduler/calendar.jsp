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
 	// CalendarController의 schedule에 있는 일정을 list로 가져와서 달력에 추가하는 함수
 	
document.addEventListener('DOMContentLoaded', function() {	
  var calendarEl = document.getElementById('calendar');
  // calendar를 calendarEl이라는 이름으로 정의 */
  
  // 기본 설정 일정 (웹페이지에서 지워도 DB에 반영되지 않음, 새로고침시 다시 나타남)
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
    dayMaxEventRows: 3   // 하루 일정이 3개 이상이면 +more로 표시됨
    }
    },
    headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      selectable: true,   // 일정 드래그로 옮기기 | 적용할지 말지 생각해보기
      selectMirror: true,
      select: function(arg) {
    	  
		myModal.toggle();
        calendar.unselect()
     	// 캘린더 클릭시 일정 입력 모달창 열림
      },
      eventClick: function(arg) {
        if (confirm('일정을 삭제하시겠습니까?')) {
          location.href="${pageContext.request.contextPath}/scheduler/delete?bno=" + arg.event.groupId;
          arg.event.remove()
        }
      },
      // 선택한 groupId에 있는 일정(bno: 일정고유번호) 삭제
      editable: true,
      
    events : default_event
  });
  calendar.render();
});
</script>
<style> /* 이미 한 번 덮어씌운 css이기 때문에 외부로 빼서 적용하면 순서가 뒤로 밀려남 */
.fc-daygrid-more-link, .fc-daygrid-day-number, .fc-col-header-cell-cushion, .fc-daygrid-event {
	text-decoration: none;
	color : black;
}
.fc-daygrid-more-link:hover, .fc-daygrid-day-number:hover, .fc-col-header-cell-cushion:hover, .fc-daygrid-event:hover{
	color: black; 
}
/* 글씨 파란색, 링크 밑줄 없애줌(날짜에 hover시 밑줄 생기는 건 남아있음) */


#calendar{
   width:60%;
   margin:20px auto;
   padding: 0 20px;
   background-color:white;   
}
</style>
  </head>
  <body>
    <!-- 헤더 -->
<%@ include file="/static/include/header.jsp"%>
	<!-- 모달 -->
<%@ include file="/static/include/modal.jsp"%>
	<!-- 캘린더 -->
    <div id='calendar'></div>
	<!-- 푸터 -->
<%@ include file="/static/include/footer.jsp" %>
  </body>
</html>