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
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>


	<!-- 당근책 CSS -->
	<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

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
      editable: true,
      selectable: true,
    events: [

        {
            title: '대흉근',
            start: '2021-08-03T13:00:00',
            constraint: 'businessHours'
          },
        {
            title: '전완근',
            start: '2021-08-03T13:00:00',
            constraint: 'businessHours'
          },
        {
            title: '광배근',
            start: '2021-08-03T13:00:00',
            constraint: 'businessHours'
          },
        {
            title: '대퇴근',
            start: '2021-08-03T13:00:00',
            constraint: 'businessHours'
          },
          {
              start: '2021-08-24',
              end: '2021-08-28',
              overlap: false,
              display: 'background',
              color: '#ff9f89'
          },
          {
              title: '하체',
              start: '2021-08-18',
              end: '2021-08-21'
            }
    ]
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
#back{
	background-color:white;	<!-- 배경색 -->
}
</style>
  </head>
  <body>
<%@ include file="/static/include/header.jsp"%>
  <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inputschedule">
  Input Schedule
</button>

<!-- Modal -->
<div class="modal fade" id="inputschedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">일정 입력</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<form>
		<table>
			<tr>
			<td><label for ="routine">일정</label></td>
			<td>
			<input type=text name=schedule id=schedule />
			</td>
			</tr>
			<tr>
				<td>시작</td>
				<td><input type="time" id="in_time" name="in_time"></td>
			</tr>
			<tr>
				<td>종료</td>
				<td><input type="time" id="in_time" name="in_time" >
				<input id="allday" type="checkbox" name="day" value="a" />
				<label for="allday">하루 종일</label></td>
			</tr>
			<tr>
				<td>반복　</td>
				<td><input id="norpt" type="radio" name="repeat" value="no" /> <label
					for="norepeat">반복 안 함</label><br> <input id="dayrpt" type="radio" name="repeat"
					value="day" /> <label for="everyday">매일</label><br>
					 <input id="weekrpt" type="radio" name="repeat"
					value="week" /> <label for="everyweek">매주</label><br>
					 <input id="monthrpt" type="radio" name="repeat"
					value="month" /> <label for="everymonth">매월</label><br>
					 <input id="yearrpt" type="radio" name="repeat"
					value="year" /> <label for="everyyear">매년</label></td>
			</tr>
			<tr>			
			<tr>
			<td><label for="memo">메모</label></td>
			<td><textarea></textarea></td>
			</tr>
		</table>
		<br>
	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>
  <div id='back'>
    <div id='calendar'></div>
  </div>
<%@ include file="/static/include/footer.jsp" %>
  </body>
</html>