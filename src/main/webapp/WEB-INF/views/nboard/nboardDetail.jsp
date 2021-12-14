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
		$(function() {
			$("#nboardListBtn").click(function(){
				location.href = "/nboard/nboardList";
			});
		})
		</script>
	</head>
	<body>
		<div class="container">
			<h1>공지게시판 상세</h1> 
	
			<div class="text-center">
						<table class="table table-bordered">
							<tr>
								<td class="col-md-2">글번호</td>
								<td class="col-md-2 text-left">${detail.n_no}</td>
								<td class="col-md-2">작성일</td>
								<td class="col-md-2 text-left">${detail.n_date}</td>
								
								<td class="col-md-2 text-left">조회수 ${detail.n_cnt }</td>
							</tr>
							<tr>
								<td class="col-md-2">작성자</td>
								<td colspan="4" class="col-md-9 text-left">관리자</td>
							</tr>
							<tr>
								<td class="col-md-2">글제목</td>
								<td colspan="4" class="col-md-9 text-left">${detail.n_title}</td>
							</tr>
							<tr class="table-height">
								<td class="text-valign">글내용</td>
								<td colspan="4" class="text-left">${detail.n_content}</td>
							</tr>
						</table>
				</div>
				<div>
				<button type="button" class="btn btn-primary"id="nboardListBtn" name="nboardListBtn" >목록</button>
			</div>
		</div>>
	</body>
</html>