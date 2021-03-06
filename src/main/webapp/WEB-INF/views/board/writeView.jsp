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
	
	 	<title>글 작성</title>
	 	
 	 <style type="text/css">
	 	.form-group {
	 		margin-top: 20px;
	 	}
	 </style>	
	</head>

	<body>
			<%@include file="/static/include/header.jsp" %>

		<section id="container" class="mx-auto" style="width:1000px;">
				<form name="writeform" role="form" method="post" action="/board/write" enctype="multipart/form-data">
					
						
							<div class="form-group">
									<label for="title" class="col-sm-2 control-label" >제목</label>
									<input type="text" id="title" name="title" class="form-control"/>
							</div>
							<div class="form-group">
									<label for="content" class="col-sm-2 control-label">내용</label>
									<textarea id="content" name="content" class="form-control"></textarea>
							</div>
							<div class="form-group" >
									<label for="writer" class="col-sm-2 control-label">작성자</label>
									<input type="text" id="writer" name="writer" class="form-control" />
							</div>
							<div class="form-group" >
									<input type="file" name="file" class="form-control" />
							</div>
							<div>					
									<button type="button" onclick="registcheck()" style="margin-top:20px;">작성</button>
							</div>				
				</form>
			</section>
		
		<!-- 널 값이면 다시 돌아가야하는데 전달이 되서 500 에러가 남... -->
		<script>
         function registcheck() {
            //작성자, 글제목, 내용에 공백을 확인하고 공백이 아니면 submit() 실행
            if(document.writeform.title.value == "") {
               alert("제목을 입력하세요.");
               return;
            }else if(document.writeform.content.value=="") {
               alert("내용을 입력하세요.");
               return;
            }else if(document.writeform.writer.value=="") {
                alert("작성자를 입력하세요.");
                return;
            }else if(confirm("게시글을 등록하시겠습니까?")) {
                document.writeform.submit();
            }
         }
      </script>
      
      <%@include file="/static/include/footer.jsp" %>
	</body>
</html>