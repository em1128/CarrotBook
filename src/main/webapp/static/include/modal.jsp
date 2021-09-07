<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>

<title>input schedule</title>
</head>
	<body>

<!-- Modal -->
<div class="modal fade" id="inputschedule" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">일정 입력</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<form action="${pageContext.request.contextPath}/scheduler/modalInsert" method="post">
		<table>
			<tr>
			<td><label for ="routine">일정</label></td>
			<td>
			<input type=text name=routine id=routine />
			</td>
			</tr>
			<tr>
				<td>날짜</td>
				<td><input type="date" id="schdate" name="schdate"></td>
			</tr>
			<tr>
			<tr>
				<td>시작</td>
				<td><input type="time" id="start_time" name="start_time"></td>
			</tr>
			<tr>
				<td>종료</td>
				<td><input type="time" id="end_time" name="end_time" >
				<input id="allday" type="checkbox" name="allday" value="a" />
				<label for="allday">하루 종일</label></td>
			</tr>
			<tr>
				<td>반복　</td>
				<td><input id="norpt" type="radio" name="norpt" value="norpt" /> <label
					for="norpt">반복 안 함</label><br>
					<input id="dayrpt" type="radio" name="dayrpt"
					value="dayrpt" /> <label for="dayrpt">매일</label><br>
					 <input id="weekrpt" type="radio" name="weekrpt"
					value="weekrpt" /> <label for="weekrpt">매주</label><br>
					 <input id="monthrpt" type="radio" name="monthrpt"
					value="monthrpt" /> <label for="monthrpt">매월</label><br>
					 <input id="yearrpt" type="radio" name="yearrpt"
					value="yearrpt" /> <label for="yearrpt">매년</label></td>
			</tr>
			<tr>			
			<tr>
			<td><label for="memo">메모</label></td>
			<td><textarea name="memo" id="memo"></textarea></td>
			</tr>
		</table>
		<br>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save</button>
      </div>
	</form>
      </div>
    </div>
  </div>
</div>
	</body>
</html>