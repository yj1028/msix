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
			
			
			$("#boardUpdateBtn").click(function(){				
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
					$("#f_updateForm").attr({
						"method":"post",
						"enctype":"multipart/form-data",
						"action":"/rvboard/rvboardUpdate"
					});
					$("#f_updateForm").submit();rv_image
				}
			});
			
			
			 
			/* 리셋버튼 */
			$("#boardcancelBtn").click(function(){
				$("#f_updateForm").each(function(){
					this.reset();
				});
			});
			
			$("#boardListBtn").click(function(){
				location.href = "/rvboard/rvboardList";
			});
		});
		</script>
	
	</head>
	<body>
		<body>		
		<div class="container">
			<div class="text-center"><h3>게시물 수정</h3></div>
			
			<div class="text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" name="rv_no" id="rv_no" value="${updateData.rv_no}">
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
					
					<table class="table table-bordered">
						
						<tr>
							<td class="text-center">글번호</td>
							<td class="text-left">${updateData.rv_no}</td>
							<td class="text-center">작성일</td>
							<td class="text-left">${updateData.rv_date}</td>
						</tr>
						<tr>
							<td class="text-center">작성자</td>
							<td colspan="3" class="text-left">${updateData.m_name}</td>
						</tr>
						<tr>
							<td class="text-center">글제목</td>
							<td colspan="3"><input type="text" class="form-control" id="rv_title" name="rv_title" value="${updateData.rv_title}"></td>
						<tr>
							<td class="text-center">내용</td>
							<td colspan="3"><textarea class="form-control" id="rv_content" name="rv_content" rows="8" style="resize: none;">${updateData.rv_content}</textarea>
						</tr>
						<tr>
							<td>파일첨부</td>
							<td colspan="3" class="text-left"><input  type="file" name="file" id="file" /></td>
						</tr>
						<!-- 이미지 존재x or 존재0 둘다 가능 -->
						<c:if test="${not empty updateData.rv_image}">
						<tr class="table-height">
							<td class="text-valign">이미지</td>
							<td colspan="3" class="col-md-9 text-left">
								<img src="/uploadStorage/rvboard/${updateData.rv_image}" />
							</td>
						</tr>
						</c:if>
					
					</table>
				</form>
			</div>
			
			<div class="text-right">
				<button type="button" id="boardUpdateBtn" class="btn btn-success">수정</button>
				<button type="button" id="boardcancelBtn" class="btn btn-success">취소</button>
				<button type="button" id="boardListBtn" class="btn btn-success">목록</button>
			</div>
		</div>
	</body>
</html>