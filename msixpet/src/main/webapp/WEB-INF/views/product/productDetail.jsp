<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>main.html</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<style type="text/css">
			#detailTable{width:80%;}
			.table-height{height: 500px;}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				
				/* 주문 버튼 클릭 시 처리 이벤트 */
				$("#orderBtn").click(function(){
					$("#f_data").attr({
						method:"post",
						action:"/product/orderForm"
					});
					$("#f_data").submit();
				});
				
				/* 장바구니 담기 버튼 클릭 시 처리 이벤트 */
				$("#addCartBtn").click(function(){
					alert("장바구니에 담겼습니다.");
					$("#f_cart").attr({
						method:"post",
						action:"/cart/addCart"
					});
					$("#f_cart").submit();
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#productListBtn").click(function(){
					location.href="/product/productList";
				});
			}); // 최상위 $종료
		</script>
	</head>
	<body>
		<div class="container">
			<form id="f_cart">
				<input type="hidden" id="p_no" name="p_no" value="${detail.p_no}"/>
			</form>
			
			<table class="table table-bordered" id="detailTable" style="margin-left: auto; margin-right: auto;">
				<tr>
					<td>상품번호</td>
					<td>${detail.p_no}</td>
					<td>상품명</td>
					<td>${detail.p_name}</td>
				</tr> 
				<tr>
					<td>등록일</td>
					<td>${detail.p_date}</td>
					<td>수정일</td>
					<td>${detail.p_udate}</td>
				</tr>
				<tr>
					<td>상품분류</td>
					<td>${detail.p_type}</td>
					<td>상품가격</td>
					<td>${detail.p_price}</td>
					<td>재고</td>
					<td>${detail.p_cnt}</td>
				</tr>
				<tr class="table-height">
					<td>상품정보</td>
					<td colspan="5" class="text-left">${detail.p_info}</td>
				</tr>
			</table>
			<div class="text-center">
					<input type="button" class="btn btn-default" value="상품주문" id="orderBtn" />			
					<input type="button" class="btn btn-default" value="장바구니담기" id="addCartBtn" />
					<input type="button" class="btn btn-default" value="목록" id="productListBtn" />
				</div>
		</div>
	</body>
</html>