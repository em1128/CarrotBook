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
			/* li {list-style: none; float: left; padding: 6px; font-size: 12pt;} */
		</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
	<body style="width:90%; height: 100px; margin: auto; ">
			<%@include file="header.jsp" %>

		<section id="container" class="col-sm-8">
				<form name="writeform" role="form" method="post" action="/board/write">
					
						
							<div class="form-group">
									<label for="title" class="col-sm-2 control-label" style="margin-top:30px;">제목</label>
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
							<div>					
									<button type="submit" onclick="registcheck()">작성</button>
							</div>				
				</form>
			</section>
		
		<!-- 널 값이면 다시 돌아가야하는데 전달이 되서 500 에러가 남... -->
		<script>
         function registcheck() {
            //작성자, 글제목, 내용에 공백을 확인하고 공백이 아니면 submit() 실행
            if(document.writeform.title.value == ""){
               alert("제목을 입력하세요.");
               return;
            }else if(document.writeform.content.value==""){
               alert("내용을 입력하세요.");
               return;
            }else if(document.writeform.writer.value==""){
                alert("작성자를 입력하세요.");
                return;
            }else if(confirm("게시글을 등록하시겠습니까?")){
               document.writeform.submit();
            }
         }
      </script>
      
      <%@include file="footer.jsp" %>
	</body>
</html>