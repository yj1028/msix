<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      	<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<title>여러 폼 데이터를 하나의 요청 데이터로 보내기</title>
		
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.min.css" />
		
		<script type="text/javascript" src="/resources/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#btn").click(function(){
					$.ajax({
						url: "/sample/exam06",//전송 url
						type: "post",
						/* 매핑이름이 같아도 메서드 방식이 다르다면 식별이 가능하다.
						  화면 보여주는 것은 Get방식, 로직처리는 Post방식. */
						data: $("form").serialize(),//폼 두개의 데이터를 모두 전송하겠음.
						dataType: "text",
						//요청에 의해 전달받은 결과값의 타입. text/xml/json만 올 수 있음.
						error: function(){
							//실행시 오류가 발생하였을 경우, 사용자에게 보여줄 화면.
							alert('시스템 오류입니다. 관리자에게 문의 하세요');
						},
						success: function(resultData){
							/* 실행에 성공하면 로직처리하여 결과값을 반환해주는데, 
							받아오는 데이터의 타입은 단순 text임. */
							alert(resultData);
						}
					});
				});
			});
		</script>
	</head>
	
	<body>
		<div class="container">
		<h3>여러 폼 데이터를 하나의 요청 데이터로 보내기</h3><br />
			<form id="VOForm">
		 		<div class="form-group">
		 			<label>번호 <input type="text" placeholder="번호 입력" name="no" id="no" class="form-control" /></label>
		 			<label>이름 <input type="text" placeholder="이름 입력" name="name" id="name" class="form-control"/></label>
		 			<label>핸드폰 <input type="text" placeholder="핸드폰 번호 입력" name="phone" id="phone" class="form-control"/></label>
		 		</div>
			 </form>
		 
		 	<form id="TicketForm">
		 		<div class="form-group">
		 			<label>번호 <input type="text" placeholder="번호 입력" name="tno" id="tno" class="form-control" /></label>
		 			<label>소유자 <input type="text" placeholder="소유자 입력" name="owner" id="owner" class="form-control"/></label>
		 			<label>등급 <input type="text" placeholder="등급 입력" name="grade" id="grade" class="form-control"/></label>
		 		</div>
		 	</form>
		 	
		 	<div class="form-group">
		 		<button type="button" id="btn" class="btn btn-primary">확인</button>
		 	</div>
		</div>
	</body>
</html>