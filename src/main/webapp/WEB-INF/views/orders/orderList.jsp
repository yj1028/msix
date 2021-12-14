<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>orderList</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			.table-height{ min-height: 500px; }
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				/* 검색 후 검색 대상과 검색 단어 출력 */
				let word = "<c:out value='${data.keyword}' />";
				let value = "";
				if(word != ""){
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#search").val("<c:out value='${data.search}' />");
					
					/*if($("#search").val()!='b_content'){
						//:contains()는 특정 텍스트를 포함한 요소반환
						if($("#search").val() == 'm_no') value= "#o_list tr td.goDetail";
						else if($("#search").val() == 'o_no') value= "#o_list tr td.orderNum";
						else if($("#search").val() == 'o_date') value= "#o_list tr td.oDate";
						console.log($(value + ":contains('" + word + "')").html());
						
						$(value + ":contains('" + word + "')").each(function(){
							var regex = new RegExp(word,'gi');
							$(this).html($(this).html().replace(regex,"<span class='required'>" + word + "</span>"));
						});
					}*/
				}
				
				$("#search").change(function(){ // 검색 대상이 변경될 때마다 처리하는 이벤트
					if($("#search").val()=="orderAll"){
						$("#keyword").val("전체 데이터 조회합니다.");
					} else if ($("#search").val() != "orderAll"){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				$("#o_searchData").click(function(){
					if($("#search").val() != "orderAll"){
						if(!chkData("#keyword","검색어를")) return;
					}
					goPage();
				});
				
				/* 제목 클릭시 상세 페이지로 이동 처리 이벤트 */
				$(".goDetail").click(function(){
					let o_no = $(this).parents("tr").attr("data-num"); <%-- "data-num"이 가리키는 값을 얻어온다. hidden 태그로 --%>
					$("#o_no").val(o_no);
					let m_no = $(this).parents("tr").attr("data-id");
					$("#m_no").val(m_no);
					console.log("주문번호 : " + o_no);
					// 상세 페이지로 이동하기 위해 form추가 (id : o_detailForm)
				 	$("#o_detailForm").attr({
						"method":"get",
						"action":"/orders/orderDetail"
					});
					$("#o_detailForm").submit(); 
				});
				
				/* 페이지 처리 */
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#o_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
			});
			
			function goPage(){
				if($("#search").val() == "orderAll"){
					$("#keyword").val("");
				}
				$("#o_search").attr({
					"method":"get",
					"action":"/orders/orderList"
				});
				$("#o_search").submit();
			}
		</script>
	</head>
	<body>
		<div class="container">
			<form id="o_detailForm">
				<input type="hidden" id="o_no" name="o_no" />
				<input type="hidden" id="m_no" name="m_no" />
			</form>
			<div class="text-right">
				<form id="o_search" name="o_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group">
						<label>검색조건</label>
						<select name="search" id="search" class="form-control">
							<option value="orderAll">전체</option>
							<option value="o_date">주문 일자</option>
							<option value="m_no">회원 번호</option>
							<option value="o_no">주문 번호</option>
						</select>
						<input type="text" name="keyword" class="form-control" id="keyword" value="검색어를 입력하세요" />
						<button type="button" class="btn btn-default" id="o_searchData">검색</button>
					</div>
				</form>
			</div>
			
			<div id="ordersList" class="table-height">
				<table class="table table-bordered" style="margin-top:20px;">
					<thead>
						<tr>
							<th class="order text-center col-md-1">주문번호</th>
							<th class="order text-center col-md-1">회원번호</th>
							<th class="order col-md-1">주문일자</th>
							<th class="order col-md-1">우편번호</th>
							<th class="text-center col-md-3">기본 주소</th>
							<th class="order col-md-2">상세 주소</th>
							<th class="order col-md-1">수령인</th>
							<th class="text-center col-md-1">수령인 연락처</th>
						</tr>
					</thead>
					<tbody id="o_list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty orderList}" >
								<c:forEach var="orders" items="${orderList}" varStatus="status">
									<tr class="text-center" data-num="${orders.o_no}" data-id="${orders.m_no}"> <%--data뒤에 임의로 값을 설정해 줄 수 있다. --%>
										<td class="orderNum">${orders.o_no}</td>
										<td>${orders.m_no}</td>
										<td class="oDate text-left">${orders.o_date}</td>
										<td class="pcode">${orders.o_pcode}</td>
										<td class="goDetail">${orders.o_addr}</td>
										<td class="daddr">${orders.o_daddr}</td>
										<td class="rep">${orders.o_recipient}</td>
										<td class="reptel">${orders.o_rectel}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8" class="text-center">등록된 주문이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage - 1}">Previous</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a href="${pageMaker.endPage + 1}">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</body>
</html>