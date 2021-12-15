<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>Insert title here</title>
	<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
	$(function () {
			
			
			$("#insertBtn").click(function(){				
				if($("#rv_tag > option:selected").index()<1){
	                  alert("질의글 분류를 선택해주세요.");
	                  $("#rv_tag> option:selected").focus();
	                  return;
	               }
				else if (!chkData("#rv_title","제목을"))return;
				else if (!chkData("#rv_content","작성할 내용을"))return;			
				else{
					if($("#file").val() != ""){
						if (!chkFile($("#file"))) return;
					}
					$("#infrm").attr({
						"method":"post",
						"enctype":"multipart/form-data",
						"action":"/rvboard/rvboardInsert"
					});
					$("#infrm").submit();
				}
			});
			
			
			
			/* 리셋버튼 */
			$("#cancelBtn").click(function(){
				$("#infrm").each(function(){
					this.reset();
				})
			});
			
			$("#listBtn").click(function(){
				location.href = "/rvboard/rvboardList";
			});
		});
		
		</script>
	</head>
	<body>
	<div class="container">
			<div class="text-center"><h3>게시판 입력화면</h3></div>
				<form name="infrm" id="infrm">
					
					<div class="form-group">
						<label>질의글 분류:</label>
						<label for="tag">
							<select id="rv_tag" name="rv_tag">
								<option>선택하세요</option>
								<option value="상품리뷰">상품리뷰</option>
								<option value="커뮤니티">커뮤니티</option>
							</select>
						</label>
					</div>
					<div class="form-group">
						<label for="title">글 제 목</label>
						<input type="text" class="form-control" id="rv_title" name="rv_title" placeholder="글 제 목" maxlength="300">	
					</div>				
					<div class="form-group">
						<label for="content">글 내 용</label>
						<textarea class="form-control" rows="8" maxlength="2000" style="resize: none;" id="rv_content" name="rv_content"></textarea>
					</div>
					<div class="form-group">
						<input  type="file" name="file" id="file" />
					</div>
					
					
					<div class="text-right">
						<button type="button" class="btn btn-primary" id="insertBtn">저장</button>
						<button type="button" class="btn btn-primary" id="cancelBtn">취소</button>
						<button type="button" class="btn btn-primary" id="listBtn">목록</button>
					</div>
				</form>
		</div>
	</body>
</html>