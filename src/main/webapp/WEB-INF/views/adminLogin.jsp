<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>main.html</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.min.css">
		
		<!-- Custom styles for this template -->
   	    <link href="/resources/include/css/signin.css" rel="stylesheet">
				
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<style type="text/css">
			#m_pwd {margin-top : 10px;}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				/* 로그인 버튼 클릭 시 처리 이벤트(db) 
				$("#signinBtn").click(function(){
					// 입력값 체크
					if(!chkData("#m_id", "ID를")) return;
					else if(!chkData("#m_pwd", "비밀번호를")) return;
					else{
						$("#form-signin").attr({
							method : "post",
							action : "/signin/signin"
						});
						$("#form-signin").submit();
					}
				}); */
				
				/* 로그인 버튼 클릭 시 처리 이벤트(임시) */
				$("#signinBtn").click(function(){
					// 입력값 체크
					if(!chkData("#m_id", "ID를")) return;
					else if($("#m_id").val() != "admin"){
						alert("등록되지 않은 ID 입니다. ID를 다시 입력해 주세요.")
						$("#m_id").val("");
						$("#m_id").focus();
						return;
					}
					else if(!chkData("#m_pwd", "비밀번호를")) return;
					else if($("#m_pwd").val() != "admin1234"){
						alert("비밀번호가 틀렸습니다. 비밀번호를 다시 입력해 주세요.")
						$("#m_pwd").val("");
						$("#m_pwd").focus();
						return;
					}
					else{
						if($("#m_id").val() == "admin" && $("#m_pwd").val() == "admin1234"){
							location.href = "/admin/mainPage"
						}
					}
				});
			}); // 최상위$ 종료
		</script>
	</head>
	<body>
		<div class="container">

	      <form class="form-signin" id="form-signin">
	        <h3 class="form-signin-heading">MSIXPet Admin sign in</h3>
	        <label for="inputEmail" class="sr-only">ID</label>
	        <input type="text" name="m_id" id="m_id" class="form-control" placeholder="ID" required autofocus value="admin">
	        <label for="inputPassword" class="sr-only">Password</label>
	        <input type="password" name="m_pwd" id="m_pwd" class="form-control" placeholder="Password" required value="admin1234">
	        <div class="checkbox">
	          <label>
	            <input type="checkbox" value="remember-me"> Remember me
	          </label>
	        </div>
	        <button class="btn btn-lg btn-primary btn-block" type="button" name="signinBtn" id="signinBtn">Sign in</button>
	      </form>
   		</div> <!-- /container -->
	</body>
</html>