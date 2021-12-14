<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      	<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->

		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		
		<title>주문내역조회</title>
	<script type="text/javascript">

	$(function(){
		$("#refundBtn").click(function(){
				let d_no = $(this).parents("tr").attr("data-num");
				$("#d_no").val(d_no);
				$("#refundForm").attr({
					method : "post",
					action : "/refund/refundInsertForm"
				});
				$("#refundForm").submit();
			});

		});
	</script>
	</head>
	<body>
		<form id="refundForm">
		<span>${login.m_id}님의 주문내역</span>
		<table class="table table-striped">
			<tr>
				<th>주문번호</th>
				<th>상품명</th>
				<th>결제일</th>
				<th>수량</th>
				<th>결제금액</th>
				<th>처리 상태</th>
				<th>환불 가능 여부</th>
				<th>환불 신청</th>
			</tr>
			<c:choose>
				<c:when test="${orderDetailList == null}">
			<tr style="text-align: center;"><td colspan="8"><h3>주문 내역이 없습니다.</h3></td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${orderDetailList}" var="orderdetail">
						<tr class="orderDetailList" data-num="${orderdetail.d_no}">
							<td>${orderdetail.d_no}</td>
							<td>${orderdetail.p_name}</td>
							<td>${orderdetail.o_date}</td>
							<td>${orderdetail.d_cnt}</td>
							<td>${orderdetail.d_price}</td>
							<td>${orderdetail.d_delivery}</td>
							<td>${orderdetail.d_refund }</td>
							<td><button class="btn btn-default disable" id="refundBtn">환불신청</button></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		</form>
	</body>
</html>