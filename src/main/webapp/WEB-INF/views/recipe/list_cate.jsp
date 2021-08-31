<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		<title>레시피</title>
		
		<jsp:include page="${path}/static/include/header.jsp" />
		<link rel="stylesheet" href="${path}/css/myCss.css">
	
	</head>
	<body>
		<c:if test="${not empty login}">
			<div class="container hjForm">
				<div class="hjForm2">
					<div class="row">
						<div class="col"><a href="/recipe/list_cate?recipe_category=test1">test1</a></div>
						<div class="col"><a href="/recipe/list_cate?recipe_category=test2">test2</a></div>
						<div class="col"><a href="/recipe/list_cate?recipe_category=test3">test3</a></div>
						<div class="col"><a href="/recipe/list_cate?recipe_category=test4">test4</a></div>
						<br/>
						<br/>
					</div>
					<table class=hjForm2>
						<c:forEach items="${list_cate}" var="list_cate">
							<tr onClick="location.href='${path}/recipe/readView?recipe_bno=${list_cate.recipe_bno}';">
								<td><c:out value="${list_cate.recipe_category}" /></td>
								<td><img src="/imgs/recipe/${list_cate.recipe_title}.jpg"></td>
								<td><c:out value="${list_cate.recipe_title}" /></td>
							</tr>
						</c:forEach>	
					</table>
				</div>
			</div>
		</c:if>
	</body>
	<jsp:include page="${path}/static/include/footer.jsp" />
</html>