<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
    	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	</head>
<header>
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/">메인화면</a></li>

			<c:choose>
				<c:when test="${user_id == null}">
					<li class="nav-item"><a class="nav-link active" href="/signup">회원가입</a>
					</li>
					<li class="nav-item"><a class="nav-link active" href="/login">로그인</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link active" href="/mypage">내 정보</a>
					</li>
					<li class="nav-item"><a class="nav-link active" href="/logout">로그아웃</a>
					</li>
				</c:otherwise>
			</c:choose>

		<li class="nav-item"><a class="nav-link active" href="/board/list">게시판</a>
			</li>
			<li class="nav-item"><a class="nav-link active" href="/scheduler">스케줄러</a>
			</li>
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-toggle="dropdown" 
				href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Action</a> 
					<a class="dropdown-item" href="#">Another action</a>
					<a class="dropdown-item" href="#">Something else here</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Separated link</a>
				</div>
			</li>
		</ul>
	
	</header>
	
	
	