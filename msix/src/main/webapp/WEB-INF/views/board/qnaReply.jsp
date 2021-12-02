<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->   	
		<meta charset="UTF-8">
		
		<title>qnaReply</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script>
		
		</script>
	</head>
	<body>
		<div class="container">
			<div>
				<form id="replyForm">
					<div class="form-group">
						<label for="r_no">글번호</label>
					    <input class="form-control" id="r_no" type="text" placeholder="Disabled input here..." disabled>
				  	</div>
				  	<div class="form-group">
				  		<label for="exampleInputEmail1">회원번호</label>
					    <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled>
				  	</div>
				  	<div class="form-group">
				  		<label for="exampleInputEmail1">태그</label>
					    <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled>
				  	</div>
					
				 	<div class="form-group">
					    <label for="exampleInputEmail1">답글제목</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="이메일을 입력하세요">
				  	</div>
				    <div>
				    	<label for="exampleInputEmail1">답글내용</label>
				  	    <textarea class="form-control" rows="3"></textarea>
				    </div>		
				    <div class="form-group">		  
				    	<button type="button" class="btn btn-default" id="saveReply">답글등록</button>
					</div>
				</form>
			</div>
			
		</div>
	</body>
</html>