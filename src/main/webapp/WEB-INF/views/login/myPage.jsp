<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/include/favicon.ico">

    <title>MyPage</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/include/dist/css/offcanvas.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <!-- <div class="row row-offcanvas row-offcanvas-right"> -->
		<%-- <input type="hidden" name="m_no" value="${login.m_no}"/> --%>
        <div class="col-xs-12 col-sm-9">
          <div class="jumbotron">
            <h1>안녕하세요, ${login.m_id}님!</h1>
          </div>
          <div class="row">
            <div class="col-xs-6 col-lg-4">
              <h2>회원 수정</h2>
              <p>${login.m_email}</p>
              <p>${login.m_tel}</p>
              <p><a class="btn btn-default" href="/member/memberUpdateForm" role="button">회원 수정 &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            <div class="col-xs-6 col-lg-4">
              <h2>장바구니</h2>
              <p>내가 담은 상품</p>
              <p><a class="btn btn-default" href="/cart/cartList" role="button">장바구니 &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            <div class="col-xs-6 col-lg-4">
              <h2>회원 탈퇴</h2>
              <p>회원 탈퇴</p>
              <p><a class="btn btn-default" href="/member/memberDeleteForm" role="button">회원 탈퇴 &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            <div class="col-xs-6 col-lg-4">
              <h2>결제내역</h2>
              <p>상품 결제 내역</p>
              <p><a class="btn btn-default" href="/orders/orderDetailList" role="button">내역보기 &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
            <div class="col-xs-6 col-lg-4">
              <h2>주소지 설정</h2>
              <p>집 이외에 거주지 설정</p>
              <p><a class="btn btn-default" href="/address/addressList" role="button">설정 &raquo;</a></p>
            </div><!--/.col-xs-6.col-lg-4-->
          </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->
      </div><!--/row--><!--/.container-->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/assets/js/ie10-viewport-bug-workaround.js"></script>

    <script src="/resources/include/assets/js/offcanvas.js"></script>
  </body>
</html>