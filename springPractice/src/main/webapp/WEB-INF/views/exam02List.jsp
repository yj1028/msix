<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		<title>ArrayList에 담은 값 출력해보기.</title>
	</head>
	<body>
	
		<div>
			<h3>내가 배운 언어들</h3>
			<ul>
				<c:forEach var="lang" items="${language }">
				<!-- ArrayList 출력할때는 items속성 사용. -->
					<li>${lang}</li>
				</c:forEach>
			</ul>
		</div>
	</body>
</html>