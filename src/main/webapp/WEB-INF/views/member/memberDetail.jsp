<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>memberDetail</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				
				/* 강제 탈퇴 버튼 클릭시 제어 */
				$("#memberDeleteBtn").click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						$("#f_data").attr({
							"method":"post",
							"action":"/member/memberDelete"
						});
						$("#f_data").submit();
					}
				});
				
				/* 목록 버튼 클릭시 제어 */
				$("#memberListBtn").click(function(){
					location.href="/member/memberList";
				});
			});
		</script>
	</head>
	<body>
		<div>
		<h2>게시판 상세화면</h2>
		<%-- 수정 및 삭제 시 글번호, 원본파일명, 썸네일파일명을 전달하는 폼 --%>
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="m_num" value="${detail.m_no}"/>
		</form>

		<div>
			<input type="button" value="강제탈퇴" id="memberDeleteBtn" /> 
			<input type="button" value="목록" id="memberListBtn" />
		</div>
			
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td>${detail.m_no}</td>
					<td>가입일</td>
					<td>${detail.m_date}</td>
					<td>수정일</td>
					<td>${detail.m_udate}</td>
				</tr>
				<tr>
					<td>회원 아이디</td>
					<td colspan="3">${detail.m_id}</td>
				</tr>
				<tr>
					<td>회원 이름</td>
					<td colspan="3">${detail.m_name}</td>
				</tr>
				<tr>
					<td>회원 연락처</td>
					<td colspan="3">${detail.m_tel}</td>
				</tr>
				<tr>
					<td>회원 이메일</td>
					<td colspan="3">${detail.m_email}</td>
				</tr>
				<tr>
					<td>탈퇴 여부</td>
					<td colspan="3">${detail.m_isdelete}</td>
				</tr>
			</table>
			
		</div>
	</body>
</html>