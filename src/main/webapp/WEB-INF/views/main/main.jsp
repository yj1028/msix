<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BRANDY</title>
    <!-- Google Font -->
    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

     <!-- Preloader -->
    <link rel="stylesheet" href="/resources/include/dist2/css/preloader.css" type="text/css" media="screen, print"/>

    <!-- Icon Font-->
    <link rel="stylesheet" href="/resources/include/dist2/css/style.css">
    <link rel="stylesheet" href="/resources/include/dist2/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/include/dist2/css/owl.theme.default.css">
    <!-- Animate CSS-->
    <link rel="stylesheet" href="/resources/include/dist2/css/animate.css">
	<link href="/resources/include/dist/css/carousel.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="/resources/include/dist2/css/bootstrap.min.css" rel="stylesheet">

	
    <!-- Style -->
    <link href="/resources/include/dist2/style.css" rel="stylesheet">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
    <!-- Responsive CSS -->
    <link href="/resources/include/dist2/css/responsive.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/lte-ie7.js"></script>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<style type="text/css">
		.image{height: 500px;}
		@import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');
		p{
			font-size: 120%;
			font-family: 'Gamja Flower', cursive;
		}
		p#a{ font-size: 150%;}
		
		button#MOVE_TOP_BTN {
				background-color:black;
			    position: fixed;
			    right: 10%;
			    bottom: 200px;
			    display: none;
			    z-index: 999;
			    width:150px;
			}
	</style>
	
	<script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript">
		$(function(){
			let msg = "${errorMsg}";
			if(msg != ""){
				alert(msg);
			}
		});
		
		$(function() {
	        $(window).scroll(function() {
	            if ($(this).scrollTop() > 500) {
	                $('#MOVE_TOP_BTN').fadeIn();
	            } else {
	                $('#MOVE_TOP_BTN').fadeOut();
	            }
	        });
	        
	        $("#MOVE_TOP_BTN").click(function() {
	            $('html, body').animate({
	                scrollTop : 0
	            }, 400);
	            return false;
	        });
	    });
		
	</script>
</head>

<body>
               
    <!-- 메인 슬라이드 배너 -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
      </ol>
    	<div class="carousel-inner" role="listbox">
	        <div class="item active">
	          <img class="image" src='//app-storage-edge-004.cafe24.com/bannermanage2/ehddud3/2020/05/18/924f172093425fb54f8b1bbe4b122bbc.png' />
	        </div>
	        <div class="item">
	          <img src='//app-storage-edge-004.cafe24.com/bannermanage2/ehddud3/2019/07/03/61b41e92e69933018322b7de78446025.png' />
	        </div>
	        <div class="item">
	           <img src='//app-storage-edge-004.cafe24.com/bannermanage2/ehddud3/2019/07/02/809f532beabc6dec908093ed40052c5b.png' />
	        </div>
	        <div class="item">
	            <img src='//app-storage-edge-004.cafe24.com/bannermanage2/ehddud3/2020/05/18/1c583bd662ff4b1618772b6eb6668f39.png' />
	        </div>
      	</div>
      <!-- <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a> -->
    </div><!-- /.carousel -->
    <button type="button" id="MOVE_TOP_BTN">TOP</button>
    <section class="services" id="SERVICE">
        <div class="container">
            <div class="row">
                <div class="col-md-3 text-center">
                    <div class="single_service wow fadeInUp" data-wow-delay="1s">
                        <img src="/resources/images/frog.png" />
                       <h2><a href="/goods/clientProductList">베스트상품</a></h2>
	                   <p>반려동물을 직접 느껴보세요</p>
                    </div>
                </div>
                <div class="col-md-3 text-center">
                    <div class="single_service wow fadeInUp" data-wow-delay="2s">
                        <img src="/resources/images/snake.png" />
                         <h2><a href="/">신상품소개</a></h2>
	                     <p>'색'다른 친구를 원한다면</p>
                    </div>
                </div>
                <div class="col-md-3 text-center">
                    <div class="single_service wow fadeInUp" data-wow-delay="3s">
                        <img src="/resources/images/turtle.png" />
                        <h2><a href="/">운영자추천</a></h2>
	                    <p>누구나 쉽게 새 가족을 맞이할 수 있도록 구성했습니다</p>
                    </div>
                </div>
                <div class="col-md-3 text-center">
                    <div class="single_service wow fadeInUp" data-wow-delay="4s">
                        <i class="icon-magnifying-glass"></i><hr /><hr />
                       <h2><a href="/nboard/nboardList">공지사항</a></h2>
	                   <p>홈페이지 공지사항</p>
                    </div>
                </div>
            </div>            
        </div>
    </section>
   <section class="about_us_area" id="ABOUT">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-12 text-center">
	                    <div class="about_title">
	                        <h2>왜 더 저렴한가요?</h2>
	                        <img src="images/shape.png" alt="">
	                    </div>
	                </div>
	            </div>
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
	    </section>
    

    <section class="testimonial text-center wow fadeInUp animated" id="TESTIMONIAL">
        <div class="container">
            <div class="icon">
                <i class="icon-quote"></i>
            </div>
            <div class="owl-carousel">
                <div class="single_testimonial text-center wow fadeInUp animated">
                    <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores<br/> eos qui ratione voluptatem sequi nesciunt.</p>
                    <h4>-JOHN DOE</h4>
                </div>
                <div class="single_testimonial text-center">
                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius<br/> modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>
                    <h4>-JOHN SMITH</h4>
                </div>
            </div>            
        </div>
    </section>


	            <div class="container" style="margin-bottom:50px">
	                <div class="row">
	                    <div class="col-md-6 wow fadeInLeft animated">
	                        <div class="row">
	                            <iframe width="650" height="350" src="https://www.youtube.com/embed/FYaxto6Jrw0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	                       	
	                        </div>
	                    </div>
	                    <div class="col-md-5 col-md-offset-1 wow fadeInRight animated">
	                    	  <h3>희귀반려동물 시장을 선도하는</h3>
	                          <p>어디서도 볼 수 없었던 희귀반려동물과 관련 용품을 직수입 판매합니다.</p>
	                          <br/><br/>
	                    </div>
	                </div>
	            </div>            










<!-- =========================
     SCRIPTS 
============================== -->


    <script src="/resources/include/dist2/js/jquery.min.js"></script>
    <script src="/resources/include/dist2/js/bootstrap.min.js"></script>
    <script src="/resources/include/dist2/js/owl.carousel.js"></script>
    <script src="/resources/include/dist2/js/wow.js"></script>
    <script src="/resources/include/dist2/js/script.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>


</body>

</html>