<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
      	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script src="/resources/js/jquery-1.12.4.min.js"></script>
		<script>
			$(function(){
				$("#btn").click(function(){
					$.ajax({
						url : "/sample/exam06",
						type : "post",
						data : $("form").serialize(),
						dataType : "text",		// 응답 데이터 타입: text, xml, json
						error : function(){
							alert("시스템 오류 입니다. 관리자에게 문의 하세요");
						},
						success : function(resultData){
							alert(resultData);
						}
					});
					
				});
			});
		</script>
	</head>
	<body>
		<h2>여러 폼 데이터를 하나의 요청 데이터로 보내기</h2>
		<div>
			<form id="example">
				<div>
					<label>번호</label>
					<input type="text" name="no" id="no" placeholder="번호 입력" />
				</div>
				<div>
					<label>이름</label>
					<input type="text" name="name" id="name" placeholder="이름 입력" />
				</div>
				<div>
					<label>핸드폰</label>
					<input type="text" name="phone" id="phone" placeholder="전화번호 입력" />
				</div>
			</form>
		
			<form id="ticket">
				<div>
					<label>번호</label>
					<input type="text" name="tno" id="tno" placeholder="번호 입력" />
				</div>
				<div>
					<label>소유자</label>
					<input type="text" name="owner" id="owner" placeholder="소유자 입력" />
				</div>
				<div>
					<label>등급</label>
					<input type="text" name="grade" id="grade" placeholder="등급 입력" />
				</div>
			</form>
		
			<input type="button" id="btn" value="확인" />
		</div>
	</body>
</html>