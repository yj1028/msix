<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>Insert title here</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			table{
				margin-top:100px;
			}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#selectBtn").click(function(){
					location.href="/address/writeForm";
				});
				
				$(".addUpBtn").click(function(){
					let no = $(this).parents("tr").attr("data-no");
					location.href="/address/updateForm?a_no="+no;
				});
				
				$(".adddelBtn").click(function(){
					let no = $(this).parents("tr").attr("data-no");
					if(confirm("주소지를 삭제하겠습니까?")){
						$.ajax({
							url : "/address/addressDelete",
							type : "post",
							data : "a_no="+no,
							dataType : "text",
							error : function(){
								alert('시스템 오류. 관리자에게 문의 하세요');
							},
							success : function(result){
								if(result=="success"){
									if(confirm("주소지를 삭제하겠습니까?")){
										location.href = "/address/addressList";
									}
								}
							}
						});
					}
				});
			});
		</script>
	</head>
	<body>
		<h2>배송 주소록 관리</h2>
		<h4>자주 쓰는 배송지를 등록 관리하실 수 있습니다.</h4>
		<div id="addressList" class="table-height">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>주소록 고정</th>
							<th>배송지명</th>
							<th>주소</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty addressList}" > <!-- if문 -->
								<c:forEach var="address" items="${addressList}" varStatus="status"> <!-- 반복문 -->
									<tr class="text center" data-no="${address.a_no}">
										<td>고정</td>
										<td>${address.a_destn}</td>
										<td class="text-left">
											${address.a_addr}&nbsp; ${address.a_daddr}
										</td>
										<td class="text-center"><button type="button" class="btn btn-info addUpBtn">수정</button></td>
										<td class="text-center"><button type="button" class="btn btn-danger adddelBtn">삭제</button></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" class="tac text-center">등록된 주소정보가 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div>
					<button type="button" id="selectBtn" name="selectBtn" class="btn btn-info text-right">배송지 등록</button>
				</div>
				
				<table class="table table-bordered">
					<tr>
						<th>배송주소록 유의사항</th>
					</tr>
					<tr>
						<td>
							<ul>
								<li>1. 배송 주소록은 최대10까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
								<li>2. 자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.
							</ul>
						</td>
					</tr>
				</table>
			</div>
	</body>
</html>