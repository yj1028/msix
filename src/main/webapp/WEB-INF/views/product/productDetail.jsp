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
			 #detailTable{width: 80%; margin-top: 20px;}
			.table-height{height: 500px;}
			img{width: 100px; height: 100px;}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#pwdChk").css("visibility", "hidden");
				
				/* 수정 버튼 클릭 시 처리 이벤트 */
				$("#updateFormBtn").click(function(){
					$("#f_data").attr({
						method:"post",
						action:"/product/updateForm"
					});
					$("#f_data").submit();
				});
				
				/* 삭제 버튼 클릭 시 처리 이벤트 */
				$("#productDeleteBtn").click(function(){
					if(confirm("등록된 상품을 삭제 하시겠습니까?")){
						$("#f_data").attr({
							method:"post",
							action:"/product/productDelete"
						});
						$("#f_data").submit();
					}
				});
				
				/* 상품등록 버튼 클릭 시 처리 이벤트 */
				$("#insertFormBtn").click(function(){
					location.href="/product/insertForm";
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
			<%-- 수정 및 삭제 시 상품번호를 전달하는 폼--%>
			<form name="f_data" id="f_data" method="post"> 
				<input type="hidden" name="p_no" value="${detail.p_no}" />
			</form>
			<div class="text-left">	
				<input type="button" class="btn btn-warning" value="상품수정" id="updateFormBtn" />			
				<input type="button" class="btn btn-danger" value="상품삭제" id="productDeleteBtn" />
				<input type="button" class="btn btn-primary" value="상품등록" id="insertFormBtn" />
				<input type="button" class="btn btn-info" value="목록" id="productListBtn" />
			</div>
			<%-- <c:forEach var="image" items="${detail.list}">
				<div class="row">
			    	<div class="col-xs-6 col-md-3">
	    				<strong>상품이미지</strong>
	    				<img src="/uploadStorage/product/${image.i_name}">
					</div>
				</div>
			</c:forEach> --%>
			<table class="table table-bordered" id="detailTable" style="margin-left: auto; margin-right: auto;">
				 <c:forEach var="image" items="${detail.list}">
		    		<tr>
		    			<td><strong>상품이미지</strong></td>
		    			<td colspan="5"><img src="/uploadStorage/product/${image.i_name}" /></td>
		    		</tr>
		    	</c:forEach>
				<tr>
					<td><strong>상품번호</strong></td>
					<td colspan="2">${detail.p_no}</td>
					<td><strong>상품명</strong></td>
					<td colspan="2">${detail.p_name}</td> 
				</tr> 
				<tr>
					<td><strong>등록일</strong></td>
					<td colspan="2">${detail.p_date}</td>
					<td><strong>수정일</strong></td>
					<td colspan="2">${detail.p_update}</td>
				</tr>
				<tr>
					<td><strong>카테고리</strong></td>
					<td>${detail.p_type}</td>
					<td><strong>판매가</strong></td>
					<td>${detail.p_price}원</td>
					<td><strong>수량</strong></td>
					<td>${detail.p_cnt}</td>
				</tr>
				<tr class="table-height">
					<td><strong>상품정보</strong></td>
					<td colspan="5" class="text-left">${detail.p_info}</td>
				</tr>
			</table>   
		</div>
	</body>
</html>