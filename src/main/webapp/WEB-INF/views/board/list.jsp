<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" ></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	 	<title>게시판</title>
		 	<style type="text/css">
		 	
			/* li {list-style: none; float: left; padding: 6px; font-size: 12pt;} */
		</style>
	</head>
	
	<body style="width:90%; height: 100px; margin: auto; text-align: center;">

			<%@include file="/static/include/header.jsp" %>
<%-- 			 <div >
				<%@include file="nav.jsp" %>
			</div> --%>
			
			<section id="container" >
				<form role="form" method="get"> <!-- action="/board/write" -->
					<table class="table" style="width:70%; height: 100px; margin: auto; margin-top:30px; text-align: center;">
						<thead class="table-dark">
						<tr><td><strong>번호</strong></td><td><strong>제목</strong></td>
						<td><strong>작성자</strong></td><td><strong>등록일</strong></td></tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a href="/board/readView?bno=${list.bno}&
												page=${scri.page}&perPageNum=${scri.perPageNum}&
												searchType=${scri.searchType}&
												keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					
					<div class="col-md-4" style="float:none; margin:0 auto;">
						    <select name="searchType">
						      <%-- <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option> --%>
						      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						    </select>
						
						    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
						    <input id="searchBtn" type="submit" value="검색"  class="btn btn-default">						
							<input type="button" value="글작성"  class="btn btn-default" onclick="location.href='/board/writeView'" >						
						    <script>
						      $(function(){
						        $('#searchBtn').click(function() {
						          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
						        });
						      });   
						    </script>
						  </div>
					<div class="col-md-6" style="float: none; margin:0 auto;">
					  <ul class="pager">
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>
					</div>
				</form>
			</section>
			
			<%@include file="/static/include/footer.jsp" %>
	</body>
</html>