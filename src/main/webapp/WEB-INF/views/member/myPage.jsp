<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
    <head>
    	<!-- 부트스트랩 -->  
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" 
    	rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" 
    	crossorigin="anonymous">
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" 
    	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" 
    	crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" 
    	integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" 
    	crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" 
		integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" 
		crossorigin="anonymous"></script>
    	
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">

		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
        <title>당근책 로그인</title>

		<jsp:include page="${path}/static/include/header.jsp"/>
		<link rel="stylesheet" href="${path}/css/myCss.css">
			
    </head>
    
    <script type="text/javascript">
		$(document).ready(function() {
			$("#change_pw").on("click", function() {
				location.href = "${path}/member/change_pw_form";
			});
			$("#update_member").on("click", function() {
				location.href = "${path}/member/update_member_form";
			});
			$("#delete_member").on("click", function() {
				location.href = "${path}/member/delete_member_form";
			});
		});
	</script>
	
    <body>
		<c:if test="${not empty login}">
			<div class="container hjForm row g-3 mx-auto">
				<div class="col-12">
					<h3>${login.memberId} 회원님 안녕하세요</h3>
					<br>
					<button type="button" class="btn btn-secondary" id="update_member">회원 정보 수정</button>
					<button type="button" class="btn btn-secondary" id="change_pw">비밀번호 변경</button>
					<button type="button" class="btn btn-secondary" id="delete_member">회원 탈퇴</button>
				</div>
			</div>
		</c:if>
    </body>
    <jsp:include page="${path}/static/include/footer.jsp"/>
</html>