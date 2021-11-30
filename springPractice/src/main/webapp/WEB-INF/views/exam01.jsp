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
		
		<title>나이, 이름 입력 예제</title>
	</head>
	<body>
		<div><h2>여기로 넘어오세용</h2></div>
		
		<form>
		<%-- 이름: ${dto.name } <br />
		나이: ${dto.age } --%>
		
		<div>
			<label>이름 </label> ${sampleDTO.name }<br/>
			<label>나이 </label> ${sampleDTO.age }
		</div>
		</form>
	</body>
</html>