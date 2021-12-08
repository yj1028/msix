<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>orderDetail</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			.table{ min-height: 500px; }
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
			$(function(){
				/* 주문처리상태변경 버튼 클릭시 제어 */
				$("#changeBtn").click(function(){
					if(confirm("정말 주문 처리상태를 변경 하시겠습니까?")){
						let d_delivery = $("#orderSelect").val();
						$("#d_delivery").val(d_delivery);
						$("#f_order").attr({
							"method":"post",
							"action":"/orders/orderChange"
						});
						$("#f_order").submit();
						alert("주문 처리 상태가 변경 되었습니다.")
					}
				});
				
				/* 주문 취소 버튼 클릭시 제어 */
				$("#orderDeleteBtn").click(function(){
					if(confirm("정말 주문을 취소 하시겠습니까?")){
						$("#o_data").attr({
							"method":"post",
							"action":"/orders/orderCancel"
						});
						$("#o_data").submit();
						alert("주문이 취소 되었습니다.")
					}
				});
				
				/* 목록 버튼 클릭시 제어 */
				$("#orderListBtn").click(function(){
					location.href="/orders/orderList";
				});
			});
		</script>
	</head>
	<body>
		<div>
		<h2>주문 상세 정보</h2>
		<%-- 수정 및 삭제 시 가져가는 폼--%>
		<form name="o_data" id="o_data" method="post">
			<input type="hidden" name="o_no" value="${detail.o_no}"/>
			<input type="hidden" name="m_no" value="${detail.m_no}"/>
		</form>
		
		<div id="orderStatement" class="text-right">
			<form name="f_order" id="f_order" class="form-inline">
				<input type="hidden" name="d_delivery" id="d_delivery" />
				<input type="hidden" name="d_no" id="d_no" value="${detail.d_no}" />
				<input type="hidden" name="m_no" id="m_no" value="${detail.m_no}" />
				<input type="hidden" name="o_no" id="o_no" value="${detail.o_no}"/>
				<select name="orderSelect" id="orderSelect" class="form-control">
				  <option value="결제완료">결제완료</option>
				  <option value="배송준비중">배송준비중</option>
				  <option value="배송중">배송중</option>
				  <option value="배송완료">배송완료</option>
				</select>
				<button type="button" id="changeBtn" class="btn btn-success">주문처리상태변경</button>
				<button type="button" id="orderDeleteBtn" class="btn btn-danger">주문 취소</button>
				<button type="button" id="orderListBtn" class="btn btn-default">목록</button>
				<span id="msg"></span>
			</form>
		</div>
			
			<table class="table table-bordered" style="margin-top:20px;">
				<tr>
					<td>주문번호</td>
					<td>${detail.o_no}</td>
					<td>회원번호</td>
					<td>${detail.m_no}</td>
				</tr>
				<tr>
					<td>주문처리상태</td>
					<td colspan="3">${detail.d_delivery}</td>
				</tr>
				<tr>
					<td>상품번호</td>
					<td colspan="3">${detail.p_no}</td>
				</tr>
				<tr>
					<td>총 수량</td>
					<td>${detail.d_cnt}</td>
					<td>총 가격</td>
					<td>${detail.d_sum}</td>
				</tr>
				<tr>
					<td>주문일자</td>
					<td>${detail.o_date}</td>
					<td>우편번호</td>
					<td>${detail.o_pcode}</td>
				</tr>
				<tr>
					<td>기본주소</td>
					<td colspan="3">${detail.o_addr}</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td colspan="3">${detail.o_daddr}</td>
				</tr>
				<tr>
					<td>수령인</td>
					<td>${detail.o_recipient}</td>
					<td>수령인연락처</td>
					<td>${detail.o_rectel}</td>
				</tr>
				<tr>
					<td>결제수단</td>
					<td>${detail.d_payment}</td>
					<td>환불가능여부</td>
					<td>${detail.d_refund}</td>
				</tr>
				
			</table>
			
		</div>
	</body>
</html>