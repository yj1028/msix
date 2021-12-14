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
    <title>비밀번호 찾기</title>
    	<style>
	        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
		
			/* html {
				height: 100%;
			}*/
			
			body {
			    /* width:100%;
			    height:100%; */
			    margin: 0;
		  		/* padding-top: 200px; */
		  		padding-bottom: 40px;
		  		/* font-family: "Nanum Gothic", arial, helvetica, sans-serif; */
		  		/* background-repeat: no-repeat; */
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
			
			/* .form-signin .form-control {
		  		position: relative;
		  		height: auto;
		  		-webkit-box-sizing: border-box;
		     	-moz-box-sizing: border-box;
		        	 box-sizing: border-box;
		  		padding: 10px;
		  		font-size: 16px;
			}
		 
		    .card-title{
		        margin-left: 30px;
		    } */
		
		
		    a{ 
		    	color: #f58b34; text-decoration: none; 
		    }
		
		    .links{
		        text-align: center;
		        margin-bottom: 10px;
		    }
		    
		    .checks{
		    	color : red;
		    }
	    </style>
	    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
	    <script type="text/javascript">
		    $(function(){
		    	let msg = "${errorMsg}";
				if(msg != ""){
					alert(msg);
				}
				
				$("#pwdBtn").click(function(){
					if(!chkData("#m_id", "아이디를")) return;
					else if(!chkData("#m_name", "이름을")) return;
					else if(!chkData("#m_email", "이메일을")) return;
					else{
						$("#frmPwd").attr({
							"method":"post",
							"action":"/login/selectPwd"
						});
						$("#frmPwd").submit();
					} 
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
			<h1>비밀번호 찾기</h1>
			<div class="card align-middle" style="width:25rem;">
				<div class="card-title" style="margin-top:30px;">
					<h2 class="card-title" style="color:#f58b34;"><img src=""/></h2>
				</div>
	        
				<div class="card-body">
			    <form id="frmPwd" name="frmPwd" class="form-signin" method="POST">
				    <input type="text" name="m_id" id="m_id" class="form-control" placeholder="아이디" required><br>
				    <input type="text" name="m_name" id="m_name" class="form-control" placeholder="이름" required><BR>
				    <input type="email" name="m_email" id="m_email" class="form-control" placeholder="이메일" required><br>
				    <br/>
				    <button id="pwdBtn" class="btn btn-lg btn-primary btn-block" type="button">비밀번호 찾기</button>
			    </form>
		      
				</div>
	        	<div class="links">
	           		<a href="/login/selectIdForm">아이디 찾기</a> | <a href="/login/loginForm">로그인</a> | <a href="/member/memberJoinForm">회원가입</a>
	
	        	</div>
			</div>
		</div>
	</body>
</html>