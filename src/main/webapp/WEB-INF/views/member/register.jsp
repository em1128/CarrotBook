<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" language="java" %>
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
		
        <title>당근책 회원가입</title>

		<jsp:include page="${path}/static/include/header.jsp"/>
		
		<link rel="stylesheet" href="${path}/css/myCss.css">
		
    </head>
    
    <script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$("#cancle").on("click", function(){
				location.href = "${path}/";
			});
		
			$("#submit").on("click", function(){
				if($("#memberId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#memberId").focus();
					return false;
				}
				if($("#memberPw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#memberPw").focus();
					return false;
				}
				if($("#memberPw").val()!=$("#memberPw2").val()){
					alert("비밀번호를 확인해주세요.");
					$("#memberPw").focus();
					return false;
				}
				if($("#memberName").val()==""){
					alert("성명을 입력해주세요.");
					$("#memberName").focus();
					return false;
				}
				if($("#phone").val()==""){
					alert("핸드폰 번호를 입력해주세요.");
					$("#phone").focus();
					return false;
				}
			});
		});
	</script>
    
    <body>
		<c:if test="${not empty login}">
			<script>
				self.location = "/member/myPage";	
			</script>
		</c:if>
		<c:if test="${empty login}">   
		    <div class="container">
				<form class="hjForm row g-3 mx-auto" action="${path}/member/register" method="post">
					<h3>당근책 회원가입</h3>
					<c:if test="${member == null}">
						<div class="col-md-12">
							<label for="memberId" class="form-label">아이디</label>
							<input type="text" class="form-control" id="memberId" name="memberId" placeholder="15자 이내의 영어, 숫자만 입력 가능합니다.">
						</div>
					  
						<div class="col-md-6">
							<label for="memberPw" class="form-label">비밀번호</label>
							<input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="비밀번호">
						</div>
						
						<div class="col-md-6">
							<label for="memberPw2" class="form-label">비밀번호 확인</label>
							<input type="password" class="form-control" id="memberPw2" name="memberPw2" placeholder="비밀번호 확인">
						</div>
						
						  
						<div class="col-md-12">
							<label for="memberName" class="form-label">이름</label>
							<input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름을 입력해주세요">
						</div>
						  
						<div class="col-md-12">
							<label for="phone" class="form-label">휴대폰 번호</label>
							<input type="text" class="form-control" id="phone" name="phone" placeholder="휴대폰 번호('-'없이 번호만 입력해주세요)">
						</div>
						
						<div class="col-md-12">
							<label for="birthday" class="form-label">생년월일</label>
							<input type="text" class="form-control" id="birthday" name="birthday" placeholder="ex) 19920315">
						</div>
						
						<div class="col-md-12">
							<label for="gender">성별</label>
								<label class="radio-inline">
									<input type="radio" id="gender" name="gender" value="M"> 남성
								</label>
								<label class="radio-inline">
									<input type="radio" id="gender" name="gender" value="F"> 여성
								</label>
						</div>
						
						<div class="col-md-12">
							<label for="sms">SMS 수신 여부</label>
								<label class="radio-inline">
									<input type="radio" id="AgreeSms" name="sms" value="Y"> 동의합니다
								</label>
								<label class="radio-inline">
									<input type="radio" id="AgreeSms" name="sms" value="N"> 동의하지 않습니다
								</label>
						</div>
					
						<div class="col-12">
							<button type="submit" class="btn btn-secondary" id="submit">회원 가입</button>
							<button class="btn btn-secondary" type="button" id="cancle">돌아가기</button>
						</div>
					</c:if>
				</form>
			</div>
		</c:if>
    </body>
	<jsp:include page="${path}/static/include/footer.jsp"/>   
</html>