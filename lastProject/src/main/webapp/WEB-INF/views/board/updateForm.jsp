<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>수정화면</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#boardUpdate").click(function(){
					if(!chkData("#b_title", "글 제목을")) return;
					else if(!chkData("#b_content", "글 내용을")) return;
					else {
						if($("#file").val()!= ""){
							if(!chkFile($("#file"))) return;
						}
						
						$("#f_updateform").attr({
							"method":"post",
							"enctype" : "multipart/form-data",
							"action":"/board/boardUpdate"
						});
						$("#f_updateform").submit();
					}
				});
				
				$("#boardCancelBtn").click(function(){
					$("#f_updateform").each(function(){  <%-- 반복 문 --%>
						this.reset()					<%-- reset 제이쿼리 처리 --%>
					});
				});
				
				$("#boardListBtn").click(function(){
					location.href="/board/boardList";
				});
			});
		</script>
	</head>
	<body>
		<div>
		<h3>글 수정</h3>
		<form id="f_updateform">
			<input type="hidden" name="b_num" id="b_num" value="${updateData.b_num}" />
			<input type="hidden" id="b_file" name="b_file" value="${updateData.b_file }" />
			<input type="hidden" id="b_thumb" name="b_thumb" value="${updateData.b_thumb }" />
			<table border="1">
				<tr>
					<td>글번호</td>
					<td>${updateData.b_num}</td>
					<td>작성일</td>
					<td>${updateData.b_date}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="3">${updateData.b_name}</td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3"><input type="text" name="b_title" id="b_title" value="${updateData.b_title}" /></td>
				</tr>
				<tr class="table-height">
					<td>글내용</td>
					<td colspan="3"><textarea name="b_content" id="b_content" rows="8" maxlength="1333">${updateData.b_content}</textarea></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td colspan="3"><input type="password" name="b_pwd" id="b_pwd" placeholder="기존 비밀번호가 아니라 수정할 비밀번호를 입력해 주세요."/></td>
				</tr>
				<tr>
					<td>파일첨부</td>
					<td colspan="3"><input type="file" name="file" id="file" /></td>
				</tr>
				<tr>
					<c:if test="${not empty updateData.b_file }">
						<td>이미지</td>
						<td><img src="/uploadStorage/board/${detail.b_file }"></td>
					</c:if>
				</tr>
			</table>
		</form>
			<div>
				<input type="button" id="boardUpdate" value="수정" />
				<input type="button" id="boardCancelBtn" value="취소" />
				<input type="button" id="boardListBtn" value="목록" />
			</div>
		</div>
	</body>
</html>