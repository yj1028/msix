<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>

<c:set var="clientUri" value='${requestScope["javax.servlet.forward.request_uri"]}' />
<div class="col-sm-3 col-md-2 sidebar">
  <ul class="nav nav-sidebar">
    <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
    <li><a href="/member/memberList">회원관리</a></li>
    <li><a href="/orders/orderList">주문관리</a></li>
    <li><a href="/refund/refundList">환불관리</a></li>
  </ul>
  <ul class="nav nav-sidebar">
    <li><a href="/product/productList">상품관리</a></li>
    <li><a href="">재고관리</a></li>
  </ul>
  <ul class="nav nav-sidebar">
    <li><a href="">공지 및 자유게시판</a></li>
    <li><a href="">질의게시판</a></li>
  </ul>
</div>