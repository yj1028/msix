<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>error page</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<style type="text/css">
			#xbtn{
				position: relative;
				left: 1000px;
				bottom: 20px;
			}
		</style>
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">

		</script>
	</head>
	<body>
		<div class="container">
	
	      <!-- Main component for a primary marketing message or call to action -->
	      <div class="jumbotron">
	      	<a class="btn btn-lg btn-primary" href="/main/main" id="xbtn" role="button">X</a>
	        <h2>예상하지 못한 오류가 발생하였습니다.</h2>
	        <p>일시적인 현상이거나 네트워크 문제일 수 있으니, 잠시후 다시 시도해 주세요.<br/>계속 발생하는 경우 홈페이지를 통해 문의해 주세요.</p>
	        <p>감사합니다.</p>
	        <p>
	          <a class="btn btn-lg btn-primary" href="/main/main" role="button">홈으로 &raquo;</a>
	        </p>
	      </div>
	
	    </div> <!-- /container -->
	</body>
</html>