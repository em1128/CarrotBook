<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${vo}<br>
일정: ${vo.routine }<br>
날짜: ${vo.schdate}<br>
시작시간 : ${vo.start_time }<br>
종료시간 : ${vo.end_time }<br>
메모 : ${vo.memo }

</body>
</html>