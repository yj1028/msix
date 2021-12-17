<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>refundList</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
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
				}
				
				$("#search").change(function(){ // 검색 대상이 변경될 때마다 처리하는 이벤트
					if($("#search").val()=="refundAll"){
						$("#keyword").val("전체 데이터 조회합니다.");
					} else if ($("#search").val() != "refundAll"){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				$("#rf_searchData").click(function(){
					if($("#search").val() != "refundAll"){
						if(!chkData("#keyword","검색어를")) return;
					}
					goPage();
				});
				
				/* 제목 클릭시 상세 페이지로 이동 처리 이벤트 */
				$(".goDetail").click(function(){
					let p_no = $(this).parents("tr").attr("data-num"); <%-- "data-num"이 가리키는 값을 얻어온다. hidden 태그로 --%>
					$("#p_no").val(p_no);
					let m_no = $(this).parents("tr").attr("data-id");
					$("#m_no").val(m_no);
					let d_no = $(this).parents("tr").attr("data-dnum");
					$("#d_no").val(d_no);
					let rf_no = $(this).parents("tr").attr("data-rfnum");
					$("#rf_no").val(rf_no);
					console.log("주문상세번호 : " + d_no);
					// 상세 페이지로 이동하기 위해 form추가 (id : rf_detailForm)
				 	$("#rf_detailForm").attr({
						"method":"get",
						"action":"/arefund/refundDetail"
					});
					$("#rf_detailForm").submit();
				});
				
				/* 페이지 처리 */
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#rf_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
			});
			
			function goPage(){
				if($("#search").val() == "refundAll"){
					$("#keyword").val("");
				}
				$("#rf_search").attr({
					"method":"get",
					"action":"/arefund/refundList"
				});
				$("#rf_search").submit();
			}
		</script>
	</head>
	<body>
		<div class="container">
			<form id="rf_detailForm">
				<input type="hidden" id="p_no" name="p_no" />
				<input type="hidden" id="m_no" name="m_no" />
				<input type="hidden" id="d_no" name="d_no" />
				<input type="hidden" id="rf_no" name="rf_no" />
			</form>
			<div class="text-right">
				<form id="rf_search" name="rf_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group">
						<label>검색조건</label>
						<select name="search" id="search" class="form-control">
							<option value="refundAll">전체</option>
							<option value="rf_date">환불 접수일</option>
							<option value="m_no">회원 번호</option>
							<option value="p_no">상품 번호</option>
							<option value="rf_isrefund">환불처리여부</option>
						</select>
						<input type="text" name="keyword" class="form-control" id="keyword" value="검색어를 입력하세요" />
						<button type="button" class="btn btn-default" id="rf_searchData">검색</button>
					</div>
				</form>
			</div>
			
			<div id="refundList" class="table-height">
				<table class="table table-bordered" style="margin-top:20px;">
					<thead>
						<tr>
							<th class="order text-center col-md-1">환불번호</th>
							<th class="order text-center col-md-1">상품번호</th>
							<th class="order col-md-1">회원번호</th>
							<th class="text-center col-md-3">환불 글제목</th>
							<th class="order col-md-2">환불 접수일</th>
							<th class="text-center col-md-1">총 환불액</th>
							<th class="text-center col-md-1">환불처리여부</th>
						</tr>
					</thead>
					<tbody id="rf_list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty refundList}" >
								<c:forEach var="refund" items="${refundList}" varStatus="status">
									<tr class="text-center" data-num="${refund.p_no}" data-id="${refund.m_no}" 
										data-dnum="${refund.d_no}" data-rfnum="${refund.rf_no}"> <%--data뒤에 임의로 값을 설정해 줄 수 있다. --%>
										<td class="refundNum">${refund.rf_no}</td>
										<td>${refund.p_no}</td>
										<td>${refund.m_no}</td>
										<td class="goDetail">${refund.rf_title}</td>
										<td>${refund.rf_date}</td>
										<td>${refund.rf_total}</td>
										<td>${refund.rf_isrefund}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" class="text-center">등록된 환불이 존재하지 않습니다.</td>
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