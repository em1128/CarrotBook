<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
	integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
	integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
	crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>당근책 로그인</title>

<jsp:include page="${path}/static/include/header.jsp" />
<link rel="stylesheet" href="${path}/css/myCss.css">

</head>

	<script type="text/javascript">
	 $(document).ready(function(){
			// 돌아가기 눌렀을 때
			$("#cancle").on("click", function(){
				location.href = "${path}/";
			});
			
			$("#submit").on("click", function(){
				//아이디, 비밀번호 입력 안했을 때
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
				<form class="hjForm row g-3 mx-auto" action="${path}/member/loginPost"
					method="post">
					<h3>당근책 로그인</h3>
		
					<div class="col-md-6">
						<label for="memberId" class="form-label">아이디</label>
						<input type="text" class="form-control" id="memberId" name="memberId">
					</div>
		
					<div class="col-md-6">
						<label for="memberPw" class="form-label">비밀번호</label>
						<input type="password" class="form-control" id="memberPw" name="memberPw">
					</div>
					<div class="col-12">
						<label><input type="checkbox" name="useCookie"> 로그인
							유지 </label><br />
						<button type="submit" class="btn btn-secondary" id="submit">로그인</button>
						<button type="button" class="btn btn-secondary" id="cancle">돌아가기</button>
					</div>
					<div class="col-12">
						<a href="${path}/member/find_id">아이디 찾기</a>
						<a href="${path}/member/find_pw">비밀번호 찾기</a>
					</div>
				</form>
			</div>
	
			<script>
				var msg="${msg}";
				var msg_update="${msg_update}";
				var msg_delete="${msg_delete}";
				var msg_pw="${msg_pw}";
				if(msg == "ok"){
					alert("회원가입이 완료되었습니다. 로그인해주세요.");
				}else if(msg == "fail"){
					alert("입력한 정보를 확인해주세요");
				}else if(msg_update == "1"){
					alert("회원정보 수정이 완료되었습니다. 다시 로그인해주세요");
				}else if(msg_delete == "1"){
					alert("회원 탈퇴가 완료되었습니다.");
				}else if(msg_pw =="1"){
					alert("비밀번호가 변경되었습니다");
				}
			</script>
		</c:if>
	</body>
<jsp:include page="${path}/static/include/footer.jsp" />
</html>