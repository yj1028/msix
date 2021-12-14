<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>

<c:set var="clientUri" value='${requestScope["javax.servlet.forward.request_uri"]}' />
<div class="col-sm-3 col-md-2 sidebar">
  <ul class="nav nav-sidebar">
    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/admin')}">class="active"</c:if>>
   		<a href="/admin/mainPage">메인페이지 <span class="sr-only">(current)</span></a>
    </li>
    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/member')}">class="active"</c:if>>
    	<a href="/amember/memberList">회원관리</a>
    </li>
    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/orders')}">class="active"</c:if>>
    	<a href="/aorders/orderList">주문관리</a>
    </li>
    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/refund')}">class="active"</c:if>>
    	<a href="/refund/refundList">환불관리</a>
    </li>
  </ul>
  <ul class="nav nav-sidebar">
    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/product')}">class="active"</c:if>>
    	<a href="/product/productList">상품관리</a>
    </li>
    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/stock')}">class="active"</c:if>>
    	<a href="/stock/stockList">재고관리</a>
    </li>
  </ul>
  <ul class="nav nav-sidebar">
    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/notice')}">class="active"</c:if>>
    	<a href="/notice/noticeList">공지 게시판</a>
    </li>
    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/review')}">class="active"</c:if>>
    	<a href="/review/reviewList">리뷰 게시판</a>
    </li>
    <li <c:if test="${fn:containsIgnoreCase(clientUri, '/qna')}">class="active"</c:if>>
    	<a href="/qna/qnaList">질의 게시판</a>
    </li>
  </ul>
</div>