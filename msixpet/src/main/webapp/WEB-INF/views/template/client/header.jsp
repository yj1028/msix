<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>


<c:set var="clientUri" value='${requestScope["javax.servlet.forward.request_uri"]}' />  


                <!-- Preloader -->
                <div id="preloader">
                    <div id="status">&nbsp;</div>
                </div>

    <header id="HOME" style="background-position: 50% -125px;">
	        <div class="section_overlay">
	            <nav class="navbar navbar-default navbar-fixed-top">
	              <div class="container">
	                <!-- Brand and toggle get grouped for better mobile display -->
	                <div class="navbar-header">
	                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                  </button>
	                  <a class="navbar-brand" href="/"><img src="/resources/include/dist2/images/logo.png" alt="">MSIXpet</a>
	                </div>

	                <!-- Collect the nav links, forms, and other content for toggling -->
	                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                  <ul class="nav navbar-nav navbar-right">
	                  	<li<c:if test="${fn:containsIgnoreCase(clientUri, '/main')}">class="active"</c:if>>
	                  	<a href="/main/mainPage">메인화면</a></li>
	                    <li><a href="/login/loginForm">로그인</a></li>
	                    <li><a href="/member/memberJoin">회원가입</a></li>
	                    <li><a href="/">마이페이지</a></li>
	                    <li><a href="/">공지사항</a></li> 
	                    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/cart')}">class="active"</c:if>>
			         	<a href="/cart/cartList">장바구니</a>
			         	</li>
	      
	                  </ul>
	                </div><!-- /.navbar-collapse -->
	              </div><!-- /.container -->
	            </nav> 

	        </div>          
    </header>
    
	            