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
		
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#confirm").click(function(){
					location.href="/main/main";
				});
				
			});
		</script>
		
		<title>주문 확인 페이지</title>
	</head>
	<body>
		<div class="container">
      <div class="text-center">
      <h2>${login.m_id}님 주문이 성공적으로 완료되었습니다 ! </h2> <br />
      <h4>${login.m_id}님의 소중한 주문으로 저희는 세 마리의 도마뱀에게 먹이를 제공해줄 수 있게 되었습니다. 감사합니다.</h4>
      <h4>주문내역은 마이페이지의 결제내역에서 확인하실 수 있습니다.</h4>
      </div>
      <div>
         <button type="button" id="confirm" class="btn btn-default text-right">확인</button>
      </div>
      
      <div class="container">
               <div class="row">
                   <div class="col-md-4  wow fadeInLeft animated">
                      <img src="/resources/images/MTL010.png">
                   </div>
                   <div class="col-md-4  wow fadeInRight animated">
                       <p class="about_us_p" id="a">수도 없이 들은 질문입니다.<br/>저희는 분양하는 동물과 용품을 직접 수입하고, 직접 생산합니다. <br /><br />작은 차이가 큰 변화를 만듭니다.</p>
                   </div>
                   <div class="col-md-4  wow fadeInRight animated">
                       <img src="/resources/images/prog005.png">
                   </div>
               </div>
           </div>
      
      
      </div>
	</body>
</html>