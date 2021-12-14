<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>refundDetail</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
			$(function(){
				/* 환불처리 버튼 클릭시 제어 */
				$("#refundBtn").click(function(){
					if(confirm("정말 환불 처리를 하시겠습니까?")){
						if($("#d_refund").val() != 'N'){
							$("#rf_data").attr({
								"method":"post",
								"action":"/refund/refundUpdate"
							});
							$("#rf_data").submit();
							alert("환불 처리 되었습니다.")
						} else {
							alert("환불 처리에 실패 하였습니다. 이미 환불되었거나 환불 불가한 상품입니다.");
						}
					}
				});
				
				/* 환불 취소 버튼 클릭시 제어 */
				$("#refundDeleteBtn").click(function(){
					if(confirm("정말 환불을 취소 하시겠습니까?")){
						if($("#d_refund").val() != 'N'){
							$("#rf_data").attr({
								"method":"post",
								"action":"/refund/refundDelete"
							});
							$("#rf_data").submit();
							alert("환불이 취소 되었습니다.");
						} else {
							alert("환불 취소를 실패하였습니다. 이미 환불 처리가 되었습니다.");	
						}
					}
				});
				
				/* 목록 버튼 클릭시 제어 */
				$("#refundListBtn").click(function(){
					location.href="/refund/refundList";
				});
			});
		</script>
	</head>
	<body>
		<div>
		<h2>환불 상세 정보</h2>
		<%-- 수정 및 삭제 시 가져가는 폼--%>
		<form name="rf_data" id="rf_data" method="post">
			<input type="hidden" name="rf_no" id="rf_no" value="${detail.rf_no}"/>
			<input type="hidden" name="d_no" id="d_no" value="${detail.d_no}"/>
			<input type="hidden" name="d_refund" id="d_refund" value="${detail.d_refund}"/>
		</form>
		
		<div id="orderStatement" class="text-right">
			<form name="f_refund" id="f_refund" class="form-inline">
				<button type="button" id="refundBtn" class="btn btn-success">환불 처리</button>
				<button type="button" id="refundDeleteBtn" class="btn btn-danger">환불 취소</button>
				<button type="button" id="refundListBtn" class="btn btn-default">목록</button>
			</form>
		</div>
			
			<table class="table table-bordered" style="margin-top:20px;">
				<tr>
					<td>환불번호</td>
					<td>${detail.rf_no}</td>
					<td>주문상세번호</td>
					<td>${detail.d_no}</td>
				</tr>
				<tr>
					<td>상품번호</td>
					<td>${detail.p_no}</td>
					<td>회원번호</td>
					<td>${detail.m_no}</td>
				</tr>
				<tr>
					<td>환불글제목</td>
					<td colspan="3">${detail.rf_title}</td>
				</tr>
				<tr>
					<td>환불사유</td>
					<td colspan="3">${detail.rf_reason}</td>
				</tr>
				<tr>
					<td>환불접수일</td>
					<td>${detail.rf_date}</td>
					<td>총 환불액</td>
					<td>${detail.rf_total}</td>
				</tr>
				<tr>
					<td colspan="4">환불사유사진</td>
				</tr>
				<tr>
					<td colspan="4">${detail.rf_image}</td>
				</tr>
				<tr>
					<td colspan="4">환불처리여부</td>
				</tr>
				<tr>
					<td colspan="4">${detail.rf_isrefund}</td>
				</tr>
			</table>
			
		</div>
	</body>
</html>