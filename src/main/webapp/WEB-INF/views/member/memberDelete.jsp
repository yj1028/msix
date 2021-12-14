<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<script type="text/javascript">
			$(function(){
				let msg = "${msg}";
				if(msg != ""){
					alert(msg);
				}
				
				$("#delBtn").click(function(){
					if(!chkData("#m_pwd", "비밀번호를")) return;
					else if(!chkData("#m_pwd2", "비밀번호 확인을")) return;
					else{
						$("#delForm").attr({
							"method" : "POST",
							"action" : "/member/memberDelete"
						});
						$("#delForm").submit();
					}
				});
				
				$("#delCancel").click(function(){
					location.href="/login/myPageForm";
				});
			});
		</script>
	</head>
	<body>
	<h1>회원 탈퇴</h1>
		<div style="margin-top:80px;" class="container">
			<form id="delForm" name="delForm" action="POST">
					<!-- 비밀번호 -->
					<input type="hidden" name="m_no" value="${login.m_no}"/>
					<div class="form-group">
						<label for="m_pwd">비밀번호</label>
							<input type="password" class="form-control" id="m_pwd" name="m_pwd" placeholder="PASSWORD">
						<div class="check_font" id="pw_check"></div>
					</div>
					<!-- 비밀번호 재확인 -->
					<div class="form-group">
						<label for="m_pwd2">비밀번호 확인</label>
							<input type="password" class="form-control" id="m_pwd2" name="m_pwd2" placeholder="Confirm Password">
						<div class="check_font" id="pw2_check"></div>
					</div>
					<button type="button" class="btn btn-primary px-3" id="delBtn">
						<i class="fa fa-times-rectangle" aria-hidden="true"></i>회원 탈퇴
					</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-danger px-3" id="delCancel">
						<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소
					</button>
				</form>
			</div>
	</body>
</html>