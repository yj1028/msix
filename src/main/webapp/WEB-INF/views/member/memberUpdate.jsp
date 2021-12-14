<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			function passwordCheck(){
				if($("#m_pwd").val() != $("#m_pwd2").val()){
					alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
					$("#m_passwdCheck").val("");
					$("#m_passwdCheck").focus();
					return false;
				} else{
					return true;
				}
			}
		
			//아이디에 비밀번호 포함 여부 확인
			function idPwdCheck(){
				var m_id = $("#m_id").val();
				var m_passwd = $("#m_pwd").val();
				if(m_passwd.indexOf(m_id) > -1){
					alert("비밀번호에 아이디를 포함할 수 없습니다.");
					$("#m_pwd").val("");
					$("#m_pwd").focus();
					return false;
				} else{
					return true;
				}
			}
			
			$(function(){
				let msg = "${msg}";
				if(msg != ""){
					alert(msg);
				}
				
				/* 확인 버튼 클릭시 처리 이벤트 */
				$("#upBtn").click(function(){
					// 입력값 체크
					if(!chkData("#m_email", "이메일을")) return;
					else if(!chkData("#m_tel", "핸드폰 번호를")) return;
					else{
						$("#m_email").val($("#m_email").val() + "@" + $("#emailDomain").val());
						$("#updateForm").attr({
							"method" : "POST",
							"action" : "/member/memberUpdate"
						});
						$("#updateForm").submit();
					}
				});
				
				/* 취소 버튼 클릭시 처리 이벤트 */
				$("#upCancel").click(function(){
					location.href="/login/myPageForm";
				});
				
				/* 비밀번호 수정 클릭시 처리 이벤트 */
				$("#upPwd").click(function(){
					if(!chkData("#m_pwd", "비밀번호를")) return;
					else if(!idPwdCheck()) return;
					else if(!chkData("#m_pwd2", "비밀번호 확인을")) return;
					else if(!passwordCheck()) return;
					else{
						$("#upPwdForm").attr({
							"method" : "POST",
							"action" : "/member/memberUpPwd"
						});
						$("#upPwdForm").submit();
					}
				});
				
				$("#upCancel2").click(function(){
					location.href="/login/myPageForm";
				});
			});
		</script>
	</head>
	<body>
		<h1>회원정보 수정</h1>
		<div style="margin-top:80px;" class="container">
			<form id="updateForm" name="updateForm" action="POST">
				<!-- 본인확인 이메일 -->
				<div class="form-group">
					<label for="m_email">이메일 : ${login.m_email}</label>
						<input type="text" class="form-control" name="m_email" id="m_email" placeholder="E-mail" maxlength="60">
						<!-- <input type="text" style="margin-top: 5px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
							<button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
								<i class="fa fa-envelope"></i>&nbsp;인증
							</button>&nbsp;
							<button type="button" class="btn btn-outline-info btn-sm px-3">
								<i class="fa fa-envelope"></i>&nbsp;확인
							</button>&nbsp; -->
							<div class="input_group">
								<select id="emailDomain">
									<option>직접입력</option>
									<option value="naver.com">네이버</option>
									<option value="daum.net">다음</option>
									<option value="nate.com">네이트</option>
								</select>
							</div>
				</div>
				<!-- 휴대전화 -->
				<div class="form-group">
					<label for="user_phone">휴대전화 ('-' 입력해주세요) : ${login.m_tel}</label>
					<input type="text" class="form-control" id="m_tel" name="m_tel" placeholder="Phone Number">
					<div class="check_font" id="phone_check"></div>
				</div>
				<div class="reg_button">
					<button type="button" class="btn btn-primary px-3" id="upBtn">
						<i class="fa fa-refresh" aria-hidden="true"></i>수정
					</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-danger px-3" id="upCancel">
						<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소
					</button>
				</div>
			</form>
			<form id="upPwdForm" name="upPwdForm" action="POST">
				<input type="hidden" name="m_no" value="${login.m_no}"/>
				<!-- 비밀번호 -->
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
				<button type="button" class="btn btn-primary px-3" id="upPwd">
					<i class="fa fa-refresh" aria-hidden="true"></i>비밀번호 수정
				</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-danger px-3" id="upCancel2">
					<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소
				</button>
			</form>
		</div>
	</body>
</html>