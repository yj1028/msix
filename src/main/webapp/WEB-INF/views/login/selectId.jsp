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
    <title>아이디 찾기</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
			/* html {
				height: 100%;
			}*/
			
			body {
			    left:20%;
			    height:1000%;
			     margin: 50; 
		  		/* padding-top: 200px; */
		  		padding-bottom: 40px;
			} 
			
		    .card {
		        margin: 0 auto; /* Added */
		        float: none; /* Added */
		        margin-bottom: 10px; /* Added */
			}
		
		    #selectBtn{
		        background-color: #83EF7F;
		        border: none;
		    }
			
			 .form-signin .form-control {
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
		    }
			 .links{
		        text-align: center;
		        margin-bottom: 10px;
		    } 
		
		    a{ 
		    	color: #f58b34; text-decoration: none; 
		    }
		    .text2{
		    	color : blue;
		    }
	</style>
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript">
		$(function(){
			
			/* 아이디 찾기 */
			$("#selectBtn").click(function(){
				if(!chkData("#m_name", "이름을")) return;
				else if(!chkData("#m_email", "이메일을")) return;
				else{
					$.ajax({
						url : "/login/selectId",
						type : "post",
						data : $("#idForm").serialize(),
						dataType : "text",
						error : function(){
							alert('시스템 오류 입니다. 관리자에게 문의 하세요');
						},
						success : function(result){
							var goUrl="";
							if(result=="없음"){
								$("#msg").text("입력하신정보는 없는 정보입니다.")
							}else{
								$("#msg").text("아이디는 : "+result+"  입니다.");
							}
						}
					});
				} 
			});
		});
  
  </script>
	</head>
	<body>
		<div class="container">
			<h1>아이디 찾기</h1><br/>
			<div class="card align-middle" style="width:25rem">
				<div class="card-title" style="margin-top:100px;"> 
					<h2 class="card-title" style="color:#f58b34;"><img src=""/></h2>
					<h4><span id="msg"></span><br /></h4>
				</div>
		        
				<div class="card-body">
					<form id="idForm" name="idForm" class="form-signin">
		        		<input type="text" name="m_name" id="m_name" class="form-control" placeholder="이름" autofocus><BR>
		        		<input type="email" name="m_email" id="m_email" class="form-control" placeholder="이메일" ><br>
						<button id="selectBtn" name="selectBtn" class="btn btn-lg btn-primary btn-block" type="button">아 이 디 찾 기</button>
		      		</form>
				</div>
				
		        <div class="links">
		            <a href="/login/selectPwdForm">비밀번호 찾기</a> | <a href="/login/loginForm">로그인</a> | <a href="/member/memberJoinForm">회원가입</a>
		        </div>
			</div>
		</div>
	</body>
</html>