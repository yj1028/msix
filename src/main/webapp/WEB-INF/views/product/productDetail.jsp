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
			.table-heigth{min-height: 500px;}
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
					$("#f_data").attr({
						method:"post",
						action:"/product/productDelete"
					});
					$("#f_data").submit();
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
			<div>
				<div id="pwdChk">
					<%-- 수정 및 삭제 시 글번호, 원본파일명, 썸네일파일명을 전달하는 폼--%>
					<form name="f_data" id="f_data" method="post"> 
						<input type="hidden" name="p_no" value="${detail.p_no}" />
						<%-- <input type="hidden" name="b_file" value="${detail.b_file}" />
						<input type="hidden" name="b_thumb" value="${detail.b_thumb}" /> --%>
					</form>
					<%-- ========== 비밀번호 확인 및 버튼 추가 시작 ========== 
					<form name="f_pwd" id="f_pwd"> 
						<input type="hidden" name="b_num" id="b_num" value="${detail.b_num}" />
						<label>비밀번호:</label>
						<input type="password" name="b_pwd" id="b_pwd" maxlength="12" />
						<input type="button" value="확인" id="pwdBtn" />
						<span id="msg"></span>
					</form> --%>
				</div>
			</div>
			<div>
				<img alt="" src="" class="img-thumbnail">
			</div>
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
				<tr class="table-heigth">
					<td>상품정보</td>
					<td colspan="5" class="text-left">${detail.p_info}</td>
				</tr>
				<%-- <c:if test="${not empty detail.b_file}">
					<td>이미지</td>
					<td colspan="3">
						<img src="/uploadStorage/board/${detail.b_file}" />	
					</td>
				</c:if> --%>
			</table>
			<div class="text-center">
					<input type="button" class="btn btn-default" value="상품수정" id="updateFormBtn" />			
					<input type="button" class="btn btn-default" value="상품삭제" id="productDeleteBtn" />
					<input type="button" class="btn btn-default" value="상품등록" id="insertFormBtn" />
					<input type="button" class="btn btn-default" value="목록" id="productListBtn" />
				</div>
		</div>
	</body>
</html>