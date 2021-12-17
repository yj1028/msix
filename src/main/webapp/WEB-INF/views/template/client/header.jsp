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
	                  <a class="navbar-brand" href="/main/main"><!-- <img src="/resources/include/dist2/images/logo.png" alt=""> -->MSIXpet</a>
	                </div>
					 <%
					if (session.getAttribute("login") == null){
					%>
	                <!-- Collect the nav links, forms, and other content for toggling -->
	                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                  <ul class="nav navbar-nav navbar-right">
	                  	<li><a href="/main/main">메인화면</a></li>
	                    <li><a href="/login/loginForm">로그인</a></li>
	                    <li><a href="/member/memberJoinForm">회원가입</a></li>
	                    <li><a href="/login/loginForm">마이페이지</a></li>
	                    <li><a href="/nboard/nboardList">공지사항</a></li>
	                    <li><a href="/qboard/qboardList">질의게시판</a></li>
	                   	<li><a href="/rvboard/rvboardList">리뷰게시판</a></li> 
	                    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/cart')}">class="active"</c:if>>
			         	<a href="/login/loginForm">장바구니</a>
			         	</li>
	                  </ul>
	                </div><!-- /.navbar-collapse -->
	                <%}else{ %>
			        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                  <ul class="nav navbar-nav navbar-right">
	                  	<li><a href="/login/myPageForm">${login.m_id}님 환영합니다</a></li>
	                    <li><a href="/login/logout">로그아웃</a></li>
	                    <li><a href="/login/myPageForm">마이페이지</a></li>
	                    <li><a href="/nboard/nboardList">공지사항</a></li>
	                    <li><a href="/qboard/qboardList">질의게시판</a></li>
	                   	<li><a href="/rvboard/rvboardList">리뷰게시판</a> </li>
	                    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/cart')}">class="active"</c:if>>
			         	<a href="/cart/cartList">장바구니</a>
			         	</li>
	                  </ul>
	                </div><!-- /.navbar-collapse -->
	      			<%} %>
	              </div><!-- /.container -->
	            </nav> 
	        </div>          
    </header>
    
    
	            