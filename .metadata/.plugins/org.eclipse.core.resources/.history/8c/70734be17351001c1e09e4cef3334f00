<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>productList</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.min.css">
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
			<div class="table-height">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="text-center">상품번호</th>
							<th class="text-center">상품분류</th>
							<th class="text-center">상품이름</th>
							<th class="text-center">상품가격</th>
							<th class="text-center">재고량</th>
						</tr>
					</thead>
					<tbody id="list">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty productList}">
								<c:forEach var="product" items="${productList}" varStatus="status">
									<tr data-num="${product.p_no}">
										<%-- <td>${board.b_num}</td> --%>
										<td class="text-center">${product.p_no}</td>
										<td class="goDetail text-center">${product.p_type}</td>
										<td class="text-center">${product.p_name}</td>
										<td class="name text-center">${product.p_price}</td>
										<td class="text-center">${product.p_cnt}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>