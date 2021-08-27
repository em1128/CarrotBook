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

<title>당근책 회원 탈퇴</title>

<jsp:include page="${path}/static/include/header.jsp" />
<link rel="stylesheet" href="${path}/css/style.css">

</head>

<script type="text/javascript">
	 $(document).ready(function(){
			// 돌아가기 눌렀을 때
			$("#cancle").on("click", function(){
				location.href = "${path}/home";
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
				if(vo == null || !BCrypt.checkpw(loginDTO.getMemberPw(), vo.getMemberPw())){
					alert("아이디와 비밀번호를 확인해주세요.");
					return false;
				}
			});
		});
	</script>

	<body>
		<c:if test="${not empty login}">
			<div class="container">
				<form class="hjForm row g-3 mx-auto" action="${path}/member/delete_member"
					method="post">
					<h3>당근책 회원 탈퇴</h3>
		
					<div class="col-md-6">
						<label for="memberId" class="form-label">아이디</label>
						<input type="text" class="form-control" id="memberId" name="memberId">
					</div>
		
					<div class="col-md-6">
						<label for="memberPw" class="form-label">비밀번호</label>
						<input type="password" class="form-control" id="memberPw" name="memberPw">
					</div>
					<div class="col-12">
						<button type="submit" class="btn btn-secondary" id="submit">회원 탈퇴</button>
						<button type="button" class="btn btn-secondary" id="cancle">돌아가기</button>
					</div>
				</form>
			</div>
	
			<script>
				var msg_delete="${msg_delete}";
				if(msg_delete == "0"){
					alert("회원 탈퇴에 실패했습니다. 입력한 정보를 확인해주세요.");
				}
			</script>
		</c:if>
	</body>
<jsp:include page="${path}/static/include/footer.jsp" />
</html>