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
		
        <title>아이디 찾기</title>
			
		<jsp:include page="${path}/static/include/header.jsp"/>
		
		<link rel="stylesheet" href="${path}/css/style.css">
		
    </head>
    
	 <script type="text/javascript">
	 $(document).ready(function(){
			// 취소
			$("#cancle").on("click", function(){
				location.href = "${path}/home";
			});
		
			$("#submit").on("click", function(){
				if($("#memberName").val()==""){
					alert("이름을 입력해주세요.");
					$("#memberName").focus();
					return false;
				}
				if($("#phone").val()==""){
					alert("휴대폰 번호를 입력해주세요.");
					$("#phone").focus();
					return false;
				}
			});
		});
	</script>

    <body>
    	 <div class="container">
			<form class="hjForm row g-3 mx-auto" action="${path}/member/find_id" method="post">
				<h3>아이디 찾기</h3>
				<c:if test="${member == null}">
					<div class="col-md-6">
						<label for="memberName" class="form-label">이름</label>
						<input type="text" class="form-control" id="memberName" name="memberName">
					</div>
					<div class="col-md-6">
						<label for="phone" class="form-label">휴대폰 번호</label>
						<input type="text" class="form-control" id="phone" name="phone">
					</div>
					<div class="col-12">
						<button type="submit" class="btn btn-secondary" id="submit">아이디 찾기</button>
						<button type="button" class="btn btn-secondary" id="cancle">돌아가기</button>
					</div>
				</c:if>
				<c:if test="${member != null}">
					${member.memberId}님 반갑습니다
				</c:if>
				<!-- 휴대폰번호와 이름이 일치하지 않을 때! -->
				<c:if test="${msg == false}">
					alert("이름과 휴대폰 번호를 확인해주세요");
				</c:if>						
			</form>
		</div>
    </body>
    <jsp:include page="${path}/static/include/footer.jsp"/>
</html>