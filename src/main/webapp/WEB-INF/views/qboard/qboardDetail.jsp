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
		let buttonCheck=0;
		
		$(function () {
			//수정폼 이동
			$("#updateFormBtn").click(function () {
				
				$("#f_data").attr({
					"method":"get",
					"action":"/qboard/updateForm"
				});
				$("#f_data").submit();
			});
				
			//리스트 이동
			$("#boardListBtn").click(function(){
				location.href = "/qboard/qboardList";
			});
			
			//삭제처리
			$("#boardDeleteBtn").click(function () {
				if(confirm("정말 삭제하시겠습니까?")){
						$("#f_data").attr({
					"method":"post",
					"action":"/qboard/qboardDelete"
				});
				$("#f_data").submit();
					
				}else{
					$("#f_data").attr({
						"method":"get",
						"action":"/qboard/qboardDetail"
					});
					$("#f_data").submit();
				}
			});
			
			
		});
		</script>
	
	</head>
	<body>
	<div class="container">
		<h1>게시판 상세</h1>
		<form name="f_data" id="f_data">
			<input type="hidden" name="q_no" id="q_no" value="${detail.q_no}">
		</form>
		
		<div class="text-right">
			<c:if test="${login.m_no == detail.m_no }">
				<button type="button" class="btn btn-primary" id="updateFormBtn" name="updateFormBtn">수정</button>
				<button type="button" class="btn btn-primary" id="boardDeleteBtn" name="boardDeleteBtn">삭제</button>
			</c:if>
				<button type="button" class="btn btn-primary" id="boardListBtn" name="boardListBtn">목록</button>
		</div>
		<div class="text-center">
				<table class="table table-bordered">
					<tr>
						<td class="col-md-2">글번호</td>
						<td class="col-md-2 text-left">${detail.q_no}</td>
						<td class="col-md-2">작성일</td>
						<td class="col-md-2 text-left">${detail.q_date}</td>
						<td class="col-md-2">조회수:${detail.q_cnt }</td>						
					</tr>
					<tr>
						<td class="col-md-3">작성자</td>
						<td colspan="4" class="col-md-9 text-left">${detail.m_name}</td>
					</tr>
					<tr>
						<td class="col-md-3">글제목[게시물분류]</td>
						<td colspan="4" class="col-md-9 text-left">${detail.q_title}[${detail.q_tag}]</td>
					</tr>
					<tr class="table-height">
						<td class="text-valign">글내용</td>
						<td colspan="4" class="text-left">${detail.q_content}</td>
					</tr>
				</table>
			<!-- 답글시작 -->
			<jsp:include page="rboard.jsp"></jsp:include>
			</div>
	</div>
	</body>
</html>