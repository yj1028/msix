<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>질의게시판</title>
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
				if($("#q_tag > option:selected").index()<1){
	                  alert("질의글 분류를 선택해주세요.");
	                  $("#q_tag> option:selected").focus();
	                  return;
	               }
				else if (!chkData("#q_title","제목을"))return;
				else if (!chkData("#q_content","작성할 내용을"))return;			
				else{
					$("#f_updateForm").attr({
						"method":"post",
						"action":"/qboard/qboardUpdate"
					});
					$("#f_updateForm").submit();
				}
			});
			
			
			 
			/* 리셋버튼 */
			$("#boardcancelBtn").click(function(){
				$("#f_updateForm").each(function(){
					this.reset();
				});
			});
			
			$("#boardListBtn").click(function(){
				location.href = "/qboard/qboardList";
			});
		});
		</script>
	</head>
	
	<body>		
		<div class="container">
			<div class="text-center"><h3>게시물 수정</h3></div>
			
			<div class="text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" name="q_no" id="q_no" value="${updateData.q_no}">
				<div class="form-group">
						<label>질의글 분류:</label>
						<label for="tag">
							<select id="q_tag" name="q_tag">
								<option>선택하세요</option>
								<option value="배송문의">베송문의</option>
								<option value="상품문의">상품문의</option>
							</select>
						</label>
					</div>
					
					<table class="table table-bordered">
						
						<tr>
							<td class="text-center">글번호</td>
							<td class="text-left">${updateData.q_no}</td>
							<td class="text-center">작성일</td>
							<td class="text-left">${updateData.q_date}</td>
						</tr>
						<tr>
							<td class="text-center">작성자</td>
							<td colspan="3" class="text-left">${updateData.m_name}</td>
						</tr>
						<tr>
							<td class="text-center">글제목</td>
							<td colspan="3"><input type="text" class="form-control" id="q_title" name="q_title" value="${updateData.q_title}"></td>
						<tr>
							<td class="text-center">내용</td>
							<td colspan="3"><textarea class="form-control" id="q_content" name="q_content" rows="8" style="resize: none;">${updateData.q_content}</textarea>
						</tr>
						
					
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