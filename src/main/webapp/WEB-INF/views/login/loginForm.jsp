<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
    <title>로그인 폼</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	/* html {
		height: 100%;
	} */
	
	  body {
	    /* width:100%;
	    height:100%; */
	    margin: 50;
  		/* padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat; */
	}  
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
	}

    #loginBtn{
        background-color: #83EF7F;
        border: none;
    }
	
	/* .login .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	} */
     .card-title{
        margin-left: 30px;
    } 

    .links{
        text-align: center;
        margin-bottom: 10px;
    } 
    a{ 
    	color: #83EF7F; text-decoration: none; 
    }
    .check{
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
		
		$("#loginBtn").click(function(){
			if(!chkData("#m_id", "아이디를")) return;
			else if(!chkData("#m_pwd", "비밀번호를")) return;
			else{
				$("#loginForm").attr({
					"method":"post",
					"action":"/login/login"
				});
				$("#loginForm").submit();
				
			} 
		});
	});
	</script>
  </head>

  <body>
  	<div class="container">
		<h1>로그인</h1>
		<div class="card align-middle" style="width:25rem;">
			<div class="card-title" style="margin-top:100px;">
				<h2 class="card-title" style="color:#f58b34;"><img src=""/></h2>
			</div>
		    <form id="loginForm" class="loginForm">
				<div class="card-body">
			        <input type="text" name="m_id" id="m_id" class="form-control" placeholder="아이디" autofocus ><BR>
			        <input type="password" name="m_pwd" id="m_pwd" class="form-control" placeholder="비밀번호" ><br>
			        	<br/>
			        <button type="button" id="loginBtn" name="loginBtn" class="btn btn-lg btn-primary btn-block">로 그 인</button>
				</div>
			</form>
	    </div>
	        <div class="links">
	            <a href="/login/selectIdForm">아이디 찾기</a> | <a href="/login/selectPwdForm">비밀번호 찾기</a> | <a href="/member/memberJoinForm">회원가입</a>
	    	</div>
	  </div>
	</body>
</html>