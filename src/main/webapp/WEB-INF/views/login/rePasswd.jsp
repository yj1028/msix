<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
    <title>비밀번호 재설정</title>
	    <style>
	        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
		
			html {
				height: 100%;
			}
			
			body {
			    width:100%;
			    height:100%;
			    margin: 0;
		  		/* padding-top: 200px; */
		  		padding-bottom: 40px;
		  		/* font-family: "Nanum Gothic", arial, helvetica, sans-serif;
		  		background-repeat: no-repeat; */
			}
			
		    .card {
		        margin: 0 auto; /* Added */
		        float: none; /* Added */
		        margin-bottom: 10px; /* Added */
			}
		
		    #pwdBtn{
		        background-color: #83EF7F;
		        border: none;
		    }
			
		    .checkbox{
		        margin-right: 20px;
		        text-align: right;
		    }
		    .card-title{
		        margin-left: 30px;
		    }
		
		
		    a{ 
		    	color: #f58b34; text-decoration: none; 
		    }
		
		    .links{
		        text-align: center;
		        margin-bottom: 10px;
		    }
	    </style>
	    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			function passwordCheck(){
				if($("#m_pwd").val() != $("#m_pwd2").val()){
					alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
					$("#m_pwd").val("");
					$("#m_pwd").focus();
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
				let msg = "${errorMsg}";
				if(msg != ""){
					alert(msg);
				}
				/* 확인 버튼 클릭시 처리 이벤트 */
				$("#pwdBtn").click(function(){
					// 입력값 체크
					if(!chkData("#m_pwd", "비밀번호를")) return;
					else if(!idPwdCheck()) return;
					else if(!chkData("#m_pwd2", "비밀번호 재확인을")) return;
					else if(!passwordCheck()) return;
					else{
						$("#rePwFrm").attr({
							"method" : "POST",
							"action" : "/login/rePasswd"
						});
						$("#rePwFrm").submit();
					}
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
		  	<h1>비밀번호수정</h1>
			<div class="card align-middle" style="width:25rem;">
				<div class="card-title" style="margin-top:30px;">    
					<h2 class="card-title" style="color:#f58b34;"><img src=""/></h2>
				</div>
				
				<div class="card-body">
			    	<form id="rePwFrm" name="rePwFrm" class="form-signin">
			    		<input type="hidden" name="m_id" value="${mvo.m_id}"/>
			    		<p class="check" id="check">내 아이디 : ${mvo.m_id}</p><br/>
			    		<input type="password" name="m_pwd" id="m_pwd" class="form-control" placeholder="새 비밀번호"><BR>
			    		<input type="password" name="m_pwd2" id="m_pwd2" class="form-control" placeholder="새 비밀번호 재확인"><br>
			    		<br/>
			        	<button type="button" id="pwdBtn" name="pwdBtn" class="btn btn-lg btn-primary btn-block">비밀번호 재설정</button>
			    	</form>
				</div>
				
		        <div class="links">
		            <a href="/login/selectIdForm">아이디 찾기</a> | <a href="/login/loginForm">로그인</a> | <a href="/member/memberJoinForm">회원가입</a>
		        </div>
			</div>
		</div>
	</body>
</html>