<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
//유튜브 근육 검색
String youtube = "https://www.youtube.com/results?search_query=";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<title>당근책 메인</title>
	<!-- 당근책 메인 CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<%@ include file="/static/include/header.jsp" %>
	
	<section class="text-warning bg-light" align="center">
		<header>
			<h1>
				<strong>당</strong>신의
				<strong>근</strong>육을
				<strong>책</strong>임집니다
			</h1>
		</header>
		
		<div class="img_box container-fluid">
			<!-- 링크 범위는 /imgs/이미지맵.png 참조 -->
			<img class="body_link_img"
				src="./imgs/인체모형.jpg"
				alt="인체 모형" title="인체 모형"
				usemap="#bodymap" />
				<map id="bodymap" name="bodymap">
	
				<!-- HomeController에서 ${youtube}받아옴 -->
				<area shape="circle" title="어깨(숄더)" alt="삼각근" coords="267,108,17" href="<%=youtube%>삼각근 운동" target="_blank" />
				<area shape="circle" title="어깨(숄더)" alt="삼각근" coords="402,111,19" href="<%=youtube%>삼각근 운동" target="_blank" />
				<area shape="circle" title="어깨(숄더)" alt="삼각근" coords="516,117,20" href="<%=youtube%>삼각근 운동" target="_blank" />
				<area shape="circle" title="어깨(숄더)" alt="삼각근" coords="649,112,18" href="<%=youtube%>삼각근 운동" target="_blank" />
				<area shape="rect" title="이두(바이셉스)" alt="이두근" coords="632,133,656,186" href="<%=youtube%>이두근 운동" target="_blank" />
				<area shape="rect" title="이두(바이셉스)" alt="이두근" coords="506,140,530,187" href="<%=youtube%>이두근 운동" target="_blank" />
				<area shape="rect" title="삼두(트라이셉스)" alt="삼두근" coords="385,133,412,185" href="<%=youtube%>삼두근 운동" target="_blank" />
				<area shape="rect" title="삼두(트라이셉스)" alt="삼두근" coords="258,128,281,186" href="<%=youtube%>삼두근 운동" target="_blank" />
				<area shape="poly" title="전완(포럼)" alt="전완근" coords="278,188,261,252,254,253,265,186,265,186" href="<%=youtube%>전완근 운동" target="_blank" />
				<area shape="poly" title="전완(포럼)" alt="전완근" coords="397,188,410,182,418,251,414,251,414,251" href="<%=youtube%>전완근 운동" target="_blank" />
				<area shape="poly" title="전완(포럼)" alt="전완근" coords="516,196,502,251,494,252,502,184,502,186" href="<%=youtube%>전완근 운동" target="_blank" />
				<area shape="poly" title="전완(포럼)" alt="전완근" coords="659,175,643,191,653,248,662,249,662,249,662,249" href="<%=youtube%>전완근 운동" target="_blank" />
				<area shape="rect" title="가슴(체스트)" alt="대흉근" coords="540,104,629,156" href="<%=youtube%>대흉근 운동" target="_blank" />
				<area shape="poly" title="승모근(백)" alt="승모근" coords="295,91,383,88,348,181,326,180,326,179" href="<%=youtube%>승모근 운동" target="_blank" />
				<area shape="rect" title="복근(업도미널)" alt="복근" coords="562,158,606,251" href="<%=youtube%>복근 운동" target="_blank" />
				<area shape="poly" title="광배근(백)" alt="광배근" coords="292,100,320,177,309,214,297,212,297,212" href="<%=youtube%>광배근 운동" target="_blank" />
				<area shape="poly" title="광배근(백)" alt="광배근" coords="371,199,378,106,349,179,362,207,362,207" href="<%=youtube%>광배근 운동" target="_blank" />
				<area shape="rect" title="무릎 위 다리(레그)" alt="대퇴근" coords="284,295,330,386" href="<%=youtube%>대퇴근 운동" target="_blank" />
				<area shape="rect" title="무릎 위 다리(레그)" alt="대퇴근" coords="340,296,381,380" href="<%=youtube%>대퇴근 운동" target="_blank" />
				<area shape="rect" title="무릎 위 다리(레그)" alt="대퇴근" coords="533,254,577,356" href="<%=youtube%>대퇴근 운동" target="_blank" />
				<area shape="rect" title="무릎 위 다리(레그)" alt="대퇴근" coords="594,252,630,364" href="<%=youtube%>대퇴근 운동" target="_blank" />
				<area shape="rect" title="종아리(카프)" alt="종아리" coords="290,389,325,456" href="<%=youtube%>종아리 운동" target="" />
				<area shape="rect" title="종아리(카프)" alt="종아리" coords="344,388,374,447" href="<%=youtube%>종아리 운동" target="_blank" />
				<area shape="rect" title="종아리(카프)" alt="종아리" coords="593,416,604,485" href="<%=youtube%>종아리 운동" target="_blank" />
				<area shape="rect" title="종아리(카프)" alt="종아리" coords="566,410,581,468" href="<%=youtube%>종아리 운동" target="_blank" /><!-- Created by Online Image Map Editor (http://www.maschek.hu/imagemap/index) -->
				</map>
				
				</div>
	</section>
	
	<%@ include file="/static/include/footer.jsp" %>
	
</body>
</html>