<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><tiles:getAsString name="title" /></title>
    <!-- Google Font -->
    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    
    <!-- left css -->
    <link rel="stylesheet" href="/resources/include/dist2/css/styles.css" type="text/css" />

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
			html {
			    position: relative;
			    min-height: 100%;
			}
			
			body {
			    height: 100%;
			}
			.footer {
			    position: absolute;
			    left: 0;
			    bottom: 0;
			    
			    width:100%;
			    height:80px;
				padding: 15px;
				text-align: center;
				color: black;
				margin-tap:150px;
			} 
			
			.image{height: 500px;}
			@import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');
			p{
				font-size: 120%;
				font-family: 'Gamja Flower', cursive;
			}
			p#a{ font-size: 150%;}
			
			#sidebar{
				margin-top:100px;
				width:15%;
			}
		</style>
	
</head>

	<body>
                
    <header id="HOME" style="background-position: 50% -125px;">
	        <div class="section_overlay">
	            <nav class="navbar navbar-default navbar-fixed-top">
	             <tiles:insertAttribute name="header" /> 
	            </nav> 
	        </div>          
    </header>
    <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
            <a href="/main/main" class="list-group-item active">메인페이지</a>
            <a href="/goods/clientProductList?p_type=Lizard" class="list-group-item">Lizard</a>
            <a href="/goods/clientProductList?p_type=Gecko" class="list-group-item">Gedco</a>
            <a href="/goods/clientProductList?p_type=Snake" class="list-group-item">Snake</a>
            <a href="/goods/clientProductList?p_type=Turtle" class="list-group-item">Turtle</a>
            <a href="/goods/clientProductList?p_type=Amphibian" class="list-group-item">양서류</a>
            <a href="/goods/clientProductList?p_type=Supplies" class="list-group-item">사육용품</a>
            <a href="/goods/clientProductList?p_type=Food" class="list-group-item">먹이</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
   
     <div class="container">
	      <div class="page-header">
	        <h1><tiles:getAsString name="title" /></h1>
	        
	      </div>
	     
	      <tiles:insertAttribute name="body"/>
	    </div>
	    
	   
   
	  <%-- <div class="container" id="left">
			<tiles:insertAttribute name="left"/>
		</div> --%>
	

	<footer class="footer">
	    <tiles:insertAttribute name="footer" />
	</footer>





<!-- =========================
     SCRIPTS 
============================== -->


    <script src="/resources/include/dist2/js/jquery.min.js"></script>
    <script src="/resources/include/dist2/js/bootstrap.min.js"></script>
    <script src="/resources/include/dist2/js/owl.carousel.js"></script>
    <script src="/resources/include/dist2/js/wow.js"></script>
    <script src="/resources/include/dist2/js/script.js"></script>




</body>

</html>