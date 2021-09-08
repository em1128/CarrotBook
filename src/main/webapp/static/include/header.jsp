<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" >
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" ></script>
   
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" ></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" ></script>

</head>
<header>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">당근책</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
         <c:if test="${empty login}">
            <li class="nav-item"><a class="nav-link "
               href="${pageContext.request.contextPath}/member/register">회원가입</a></li>
            <li class="nav-item"><a class="nav-link"
               href="${pageContext.request.contextPath}/member/login">로그인</a></li>
            <li><a class="nav-link" onClick="alert('로그인이 필요합니다!');" 
            href="${pageContext.request.contextPath}/member/login">스케줄러</a>
              </li>      
         </c:if>
         <c:if test="${not empty login}">
            <li class="nav-item"><a class="nav-link "
               href="${pageContext.request.contextPath}/member/myPage">마이페이지</a></li>
            <li class="nav-item"><a class="nav-link"
               href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/scheduler/calendar">스케줄러</a>
                 </li>
         </c:if>
      
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/board/list">게시판</a>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/recipe/list">레시피</a>
        </li>
       
      </ul>
    </div>
  </div>
</nav>
</header>