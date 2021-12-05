<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>imageDetail.jsp</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<style type="text/css">
			table img {width:300px; height:300px;}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#file").css("display", "none");
				
				/* 상품목록 버튼 클릭 시 처리 이벤트 */
				$("#productListBtn").click(function(){
					location.href="/product/productList";
				});
				
				/* 수정 버튼 클릭 시 처리 이벤트 */
				$("#imageUpdateBtn").click(function){
					$("#file").css("display", "inline");
					let i_no = $(this).parents("tr").attr("data-num");
					$("#i_no").val(i_no);
				}
				
				/* 이미지수정 버튼 클릭 시 처리 이벤트 */
				$("#conUpdateBtn").click(function(){
					$("#f_data").attr({
						"method":"get",
						"action":"/product/imageUpdate"
					});
					$("#f_data").submit();
				});
				
				/* 이미지삭제 버튼 클릭 시 처리 이벤트 */
				$("#imageDeleteBtn").click(function(){
					let i_no = $(this).parents("tr").attr("data-num");
					$("#i_no").val(i_no);
					$("#f_data").attr({
						"method":"get",
						"action":"/product/imageDelete"
					});
					$("#f_data").submit();
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
			<div>
				<div id="pwdChk">
					<%-- 수정 및 삭제 시 이미지번호를 전달하는 폼--%>
					<form name="f_data" id="f_data" method="post">
						<input type="hidden" name="p_no" value="${image.p_no}" /> 
						<input type="hidden" name="i_no" value="" />
					</form>
				</div>
			</div>
			<table class="table table-bordered" id="detailTable" style="margin-left: auto; margin-right: auto;">
				<c:choose>
					<c:when test="${not empty imageDetail}">
						<c:forEach var="image" items="${imageDetail}" varStatus="status">
							<tr data-num="${image.i_no}">
								 <td class="view_img text-center">
									<c:if test="${not empty image.i_name}">
										<img src="/uploadStorage/product/${image.i_name}">
									</c:if>
								</td>
								<td>
									<input type="button" class="btn btn-default" value="수정" id="imageUpdateBtn" />	
									<input type="file" name="file" id="file">
									<input type="button" class="btn btn-default" value="삭제" id="imageDeleteBtn" />
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2">등록된 이미지가 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<div class="text-center">
				<input type="button" class="btn btn-default" value="수정확인" id="conUpdateBtn" />
				<input type="button" class="btn btn-default" value="상품목록" id="productListBtn" />
			</div>
		</div>
	</body>
</html>