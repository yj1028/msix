<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>stockList.jsp</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<style type="text/css">
			.required{ color:red; }
			.table-height{min-height: 640px;}
			.view_img img {width: 70px; height: 70px;}
			#listTable th, td {text-align: center;}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		
		<script type="text/javascript">
			$(function(){
				$("#type").css("display", "none");
				
				/* 검색 후 검색 대상과 검색 단어 출력 */
				let word="<c:out value='${data.keyword}' />";
				let value="";
				if(word != ""){
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#search").val("<c:out value='${data.search}' />");
					
					if($("#search").val() != 'p_info'){
						//:contain()는 특정 텍스트를 포함한 요소반환
						if($("#search").val()=='p_name') value="#list tr td.goDetail";
						else if($("#search").val()=='p_type') value="#list tr td.type";
						else if($("#search").val()=='p_update') value="#list tr td.update";
						else if($("#search").val()=='p_no') value="#list tr td.no";
						console.log($(value+":contains('"+word+"')").html());
						
						$(value+":contains('"+word+"')").each(function(){
							var regex = new RegExp(word, 'gi');  // / /gi
							$(this).html($(this).html().replace(regex, "<span class='required'>"+word+"</span>"));
						});
					}
				}
				
				/* 카테고리 검색 후 처리 */
				if($("#search").val() == "p_type"){
					$("#type").css("display", "inline");
					$("#type").val($("#keyword").val()); 
				 }
				
				/* 검색 대상이 변경될 때마다 처리 이벤트 */
				$("#search").change(function(){
					if($("#search").val() == "p_type"){
						$("#type").css("display", "inline");
					}else if($("#search").val() != "p_type"){
						$("#type").css("display", "none");
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				/* 카테고리가 변경될 때마다 처리 이벤트 */
				$("#type").change(function(){
					$("#keyword").val($("#type").val());
				});
			
				/* 검색 버튼 클릭 시 처리 이벤트 */
				$("#searchData").click(function(){
					if($("#search option").index($("#search option:selected"))==0){
						alert("검색조건을 선택해 주세요.");
						$("#search").focus();
						return;
					}
					else if($("#search").val() != "p_type"){
						if(!chkData("#keyword", "검색어를")) return;
					}
					goPage();
				});
				
				/* 전체검색 버튼 클릭 시 처리 이벤트 */
				$("#searchDataAll").click(function(){
					location.href="/stock/stockList"
				});
				
				/* 재고수정 버튼 클릭 시 처리 이벤트 */
				$(".stockUpdateBtn").click(function(){
					let stock = $(this).parents("tr").find(".p_stock").val();
					$("#p_cnt").val(stock);
					let p_no = $(this).parents("tr").attr("data-num");
					$("#p_no").val(p_no);
					let o_stock = $(this).parents("tr").attr("data-stock");
					if(stock < 0 || stock >= 1000){
						alert("수량은 0~999까지의 숫자만 입력 가능합니다.");
						$(this).parents("tr").find(".p_stock").val(o_stock);
						$(this).parents("tr").find(".p_stock").focus;
					}else{
						$("#stockUpdateForm").attr({
							method : "post",
							action : "/stock/stockUpdate"
						});
						$("#stockUpdateForm").submit();
						alert("수정이 완료되었습니다.");
					}
				});
				
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
			}); // 최상위 $종료
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage(){
				if($("#search").val() != "p_type"){
					$("#type").val("");
				}
				$("#f_search").attr({
					"method":"get",
					"action":"/stock/stockList"
				});
				$("#f_search").submit();
			}
		</script>
	</head>
	<body>
		<div class="container">
			<%-- 재고 수정을 위한 폼 --%>
			<form id="stockUpdateForm">
				<input type="hidden" id="p_no" name="p_no">
				<input type="hidden" id="p_cnt" name="p_cnt">
			</form>
			<%-- =================== 검색기능 시작 =================== --%>
			<div id="productSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}" />
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}" />
					<div class="form-group">
						<strong>검색조건</strong>
						<select class="form-control" name="search" id="search">
							<option>--검색조건--</option>
							<option value="p_name">상품명</option>
							<option value="p_type">카테고리</option>
							<option value="p_info">상품정보</option>
							<option value="p_update">등록일</option>
							<option value="p_no">상품번호</option>		
						</select>
						<select class="form-control" name="type" id="type">
				      		<option>---선택---</option>
							<option value="Gecko">Gecko</option>
							<option value="Lizard">Lizard</option>
							<option value="Turtle">Turtle</option>
							<option value="Amphibian">Amphibian</option> 
							<option value="Food">Food</option>
							<option value="Supplies">Supplies</option>                  	
						</select>
						<!-- 키워드 != null : 검색함.  키워드 == null : 검색안함 -->
						<input class="form-control" type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" />
						<button class="btn btn-info" type="button" id="searchData">검색</button>
						<button class="btn btn-success" type="button" id="searchDataAll">전체검색</button>
					</div>
				</form>
			</div>
			<%-- =================== 검색기능 종료 =================== --%>
			<%-- =================== 리스트 시작 =================== --%>
			<form>
				<div class="table-height">
					<table class="table table-hover" style="margin-top:20px;" id="listTable">
						<thead>
							<tr>
								<th class="text-center">상품번호</th>
								<th class="text-center">상품명</th>
								<th class="text-center">상품이미지</th>
								<th class="text-center">카테고리</th>
								<th class="text-center">판매가</th>
								<th class="text-center">재고</th>
								<th class="text-center">등록일</th>
								<th class="text-center">관리</th> 
							</tr>
						</thead>
						<tbody id="list">
							<!-- 데이터 출력 -->
							<c:choose>
								<c:when test="${not empty stockList}">
									<c:forEach var="stock" items="${stockList}" varStatus="status">
										<tr data-num="${stock.p_no}" data-stock="${stock.p_cnt}" data-index="${status.index}">
											<td class="no text-center">${stock.p_no}</td>
											<td class="goDetail">${stock.p_name}</td>
											 <td class="view_img text-center">
												<c:if test="${not empty stock.i_thumb}">
													<img src="/uploadStorage/product/thumbnail/${stock.i_thumb}">
												</c:if>
											</td>  
											<td class="type text-center">${stock.p_type}</td>
											<td class="text-center">${stock.p_price}</td>
											<td class="text-center sto">
												<input type="number" class="p_stock" min="0" max="999" value="${stock.p_cnt}">
											</td>
											<td class="update text-center">${stock.p_update}</td>
											<td>
												<input class="btn btn-warning stockUpdateBtn" type="button" value="재고수정" />
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8">등록된 상품이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</form>
			<%-- =================== 리스트 종료 =================== --%>
			<%-- ========== 페이징 출력 시작 ========== --%>
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
			<%-- ========== 페이징 출력 종료 ========== --%>	
		</div>
	</body>
</html>