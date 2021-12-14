<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>리뷰 게시판 상세페이지</title>
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
			//수정폼 이동
			$("#updateFormBtn").click(function () {
				
				$("#f_data").attr({
					"method":"get",
					"action":"/rvboard/updateForm"
				});
				$("#f_data").submit();
			});
				
			//리스트 이동
			$("#boardListBtn").click(function(){
				location.href = "/rvboard/rvboardList";
			});
			
			//삭제처리
			$("#boardDeleteBtn").click(function () {
				if(confirm("정말 삭제하시겠습니까?")){
						$("#f_data").attr({
					"method":"post",
					"action":"/rvboard/rvboardDelete"
				});
				$("#f_data").submit();
					
				}else{
					$("#f_data").attr({
						"method":"get",
						"action":"/rvboard/rvboardDetail"
					});
					$("#f_data").submit();
				}
			});
		});
		</script>
	</head>
	<body>
		<div class="container">
			<div class="text-center"><h3>리뷰게시판 상세화면</h3></div>
			<%-- 수정 및 삭제 시 글번호, 원본파일명, 썸네일파일명을 전달하는 폼 --%>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="rv_no" value="${detail.rv_no}"/>
				<!--  <input type="hidden" name="rv_image" value="${detail.rv_image}"/>	-->		
			</form>
				<div class="text-right">
					<c:if test="${not empty login}">
						<button type="button" class="btn btn-primary" id="updateFormBtn" name="updateFormBtn">수정</button>
						<button type="button" class="btn btn-primary" id="boardDeleteBtn" name="boardDeleteBtn">삭제</button>
					</c:if>
						<button type="button" class="btn btn-primary" id="boardListBtn" name="boardListBtn">목록</button>
					</div>
			<div class="text-center">
				<table class="table table-bordered">
					<tr>
						<td class="col-md-2">글번호</td>
						<td class="col-md-2 text-left">${detail.rv_no}</td>
						<td class="col-md-2">작성일</td>
						<td class="col-md-2 text-left">${detail.rv_date}</td>
						<td class="col-md-2">조회수:${detail.rv_cnt }</td>	
					</tr>
					<tr>
						<td class="col-md-2">작성자</td>
						<td colspan="4" class="col-md-9 text-left">${detail.m_name}</td>
					</tr>
					<tr>
						<td class="col-md-2">글제목[게시물분류]</td>
						<td colspan="4" class="col-md-9 text-left">${detail.rv_title}[${detail.rv_tag}]</td>
					</tr>
					<tr class="table-height" >
						<td class="text-valign">글내용</td>
						<td colspan="4" class="text-left">${detail.rv_content}</td>
					</tr>
					<!-- 이미지 존재x or 존재0 둘다 가능 -->
					<c:if test="${not empty detail.rv_image}">
					<tr class="table-height">
						<td class="text-valign">이미지</td>
						<td colspan="4" class="col-md-9 text-left">
							<img src="/uploadStorage/rvboard/${detail.rv_image}" />
						</td>
					</tr>
					</c:if>
				</table>
			</div>
			 <jsp:include page="ccmnt.jsp"></jsp:include> 		
		</div>	
	</body>
</html>