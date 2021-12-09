<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>productList.jsp</title>
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<style type="text/css">
			.required{ color:red; }
			.table-height{min-height: 407px;}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		
		<script type="text/javascript">
			$(function(){
				$("#type").css("visibility", "hidden");
				
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
						else if($("#search").val()=='p_udate') value="#list tr td.udate";
						else if($("#search").val()=='p_no') value="#list tr td.no";
						console.log($(value+":contains('"+word+"')").html());
						
						$(value+":contains('"+word+"')").each(function(){
							var regex = new RegExp(word, 'gi');  // / /gi
							$(this).html($(this).html().replace(regex, "<span class='required'>"+word+"</span>"));
						});
					}
				}
				/* 검색 대상이 변경될 때마다 처리 이벤트 */
				$("#search").change(function(){
					if($("#search").val() == "all"){
						$("#keyword").val("전체 데이터 조회합니다.");
					}else if($("#search").val() != "all"){
						$("#keyword").val("");
						$("#keyword").focus();
					}else if($("#search").val() == "p_type"){
						$("#type").css("visibility", "visible");
					}
				});
				
				/* 검색 버튼 클릭 시 처리 이벤트 */
				$("#searchData").click(function(){
					if($("#search").val() != "all"){
						if(!chkData("#keyword", "검색어를")) return;
					}
					goPage();
				});
				
				/* 상품명 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
				$(".goDetail").click(function(){
					let p_no = $(this).parents("tr").attr("data-num");
					$("#p_no").val(p_no);
					console.log("글번호 : " + p_no);
					// 상세 페이지로 이동하기 위해 form 추가(id : detailForm)
					$("#detailForm").attr({
						"method":"get",
						"action":"/product/productDetail"
					});
					$("#detailForm").submit();
				}); 
				
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
				/* $("#p_type").change(function(){
					$.ajax({
						url : "/product/",
						type : "post",
						data : "search="+$("#p_type option:selected").val();
						dataType : "text",
						error : function(){
							alert("시스템 오류. 관리자에게 문의 하세요.");
						},
						success : function(data){
							if(data=="success"){
								goPage();
							} else{
								alert("error");
								return;
							}
						}
					})
				}); */
				
			}); // 최상위 $종료
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage(){
				if($("#search").val() == "all"){
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method":"get",
					"action":"/product/productList"
				});
				$("#f_search").submit();
			}
		</script>
	</head>
	<body>
		<div class="container">
			<form id="detailForm">
				<input type="hidden" id="p_no" name="p_no">
			</form>
			<%-- =================== 검색기능 시작 =================== --%>
			<div id="productSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}" />
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}" />
					<div class="form-group">
						<strong>검색조건</strong>
						<select class="form-control" name="type" id="type">
				      		<option>---선택---</option>
							<option value="Gecko">Gecko</option>
							<option value="Lizard">Lizard</option>
							<option value="Turtle">Turtle</option>
							<option value="Amphibian">Amphibian</option> 
							<option value="Food">Food</option>
							<option value="Supplies">Supplies</option>                  	
						</select>
						<select class="form-control" name="search" id="search">
							<option value="all">전체</option>
							<option value="p_name">상품이름</option>
							<option value="p_type">상품분류</option>
							<option value="p_info">상품정보</option>
							<option value="p_udate">등록일</option>
							<option value="p_no">상품번호</option>		
						</select>
						<!-- 키워드 != null : 검색함.  키워드 == null : 검색안함 -->
						<input class="form-control" type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
						<button class="btn btn-default" type="button" id="searchData">검색</button>
					</div>
				</form>
			</div>
			<%-- =================== 검색기능 종료 =================== --%>
			<%-- =================== 리스트 시작 =================== --%>
			<div class="table-height">
				<table class="table table-bordered" style="margin-top:20px;">
					<thead>
						<tr>
							<th class="text-center">상품번호</th>
							<th class="text-center">상품분류</th>
							<th class="text-center">상품명</th>
							<th class="text-center">상품가격</th>
							<th class="text-center">재고</th>
							<th class="text-center">등록일</th> 
						</tr>
					</thead>
					<tbody id="list">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty productList}">
								<c:forEach var="product" items="${productList}" varStatus="status">
									<tr data-num="${product.p_no}">
										<td class="no text-center">${product.p_no}</td>
										<!-- 썸네일 넣어야함 -->
										<td class="type text-center">${product.p_type}</td>
										<td class="goDetail">${product.p_name}</td>
										<td class="text-center">${product.p_price}</td>
										<td class="text-center">${product.p_cnt}</td>
										<td class="udate text-center">${product.p_udate}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
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
			<%-- ========== 글쓰기 버튼 출력 시작 ========== --%>
			<div class="text-left">
				<input class="btn btn-default" type="button" value="상품등록" id="insertFormBtn" />
			</div>
			<%-- ========== 글쓰기 버튼 출력 종료 ========== --%>
		</div>
	</body>
</html>