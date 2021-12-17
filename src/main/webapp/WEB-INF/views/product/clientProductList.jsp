<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
      	
		<meta charset="UTF-8">
		<title>productList_client</title>
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			.row{overflow: auto; }
			.rounded{ padding: 10px; margin: 10px; }
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="/resources/include/assets/js/ie-emulation-modes-warning.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<style type="text/css">
			.required{ color: blue; }
			@import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');
			
			button#MOVE_TOP_BTN {
				background-color:black;
			    position: fixed;
			    right: 10%;
			    bottom: 200px;
			    display: none;
			    z-index: 999;
			    width:150px;
			}
			
		</style>
		<script type="text/javascript">
			$(function(){
				/* 검색 후 검색 대상과 검색 단어 출력 */
				let word = "<c:out value='${data.keyword}' />";
				let value = "";
				if(word != ""){
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#search").val("<c:out value='${data.search}' />");
					
					if($("#search").val()!='p_name'){
						if($("#search").val() == 'p_price') value= "#list h5.findPrice";
						console.log($(value + ":contains('" + word + "')").html());
						
						$(value + ":contains('" + word + "')").each(function(){
							var regex = new RegExp(word,'gi');
							$(this).html($(this).html().replace(regex,"<span class='required'>" + word + "</span>"));
						});
					}
				}
				
				$("#search").change(function(){ 
					if($("#search").val()=="all"){
						$("#keyword").val("전체 데이터 조회합니다.");
					} else if ($("#search").val() != "all"){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				$("#searchData").click(function(){
					if($("#search").val() != "all"){
						if(!chkData("#keyword","검색어를")) return;
					}
					goPage();
				});
				
				
				// 이미지 클릭 시 상세페이지로 이동 
				$(".goDetail").click(function(){
					let p_no = $(this).parents("div").attr("data-num");
					$("#p_no").val(p_no);
					console.log("테스트 : "+	$("#p_no").val(p_no));
					
					$("#f_product").attr({
						"method" : "get",
						"action" : "/goods/productDetail"		
					});
					$("#f_product").submit();
				});
				
				//페이징
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					
					goPage();
				});
			});
			
			function goPage(){
				if($("#search").val() == "all"){
					$("#keyword").val("");
				}
				let p_type = $(".col-lg-4").attr("data-type");
				$("#p_type").val(p_type);
				$("#f_search").attr({
					"method":"get",
					"action":"/goods/clientProductList"
				});
				$("#f_search").submit();
			}
			
			$(function() {
		        $(window).scroll(function() {
		            if ($(this).scrollTop() > 500) {
		                $('#MOVE_TOP_BTN').fadeIn();
		            } else {
		                $('#MOVE_TOP_BTN').fadeOut();
		            }
		        });
		        
		        $("#MOVE_TOP_BTN").click(function() {
		            $('html, body').animate({
		                scrollTop : 0
		            }, 400);
		            return false;
		        });
		    });
		</script>
	</head>
	<body>
		<div class="container">
			<!-- 상세페이지에 보낼 상품번호 -->
			<form id="f_product" name="f_product">
				<input type="hidden" id="p_no" name="p_no" value="" />
			</form>
			
			<p class="text-center tatle">베스트 상품</p>
			
			<form id="f_search" name="f_search">
				<input type="hidden" name="p_type" id="p_type">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
				<br />
				<div class="text-right">
					<label id="a">검색조건</label>
					<select name="search" id="search">
						<option value="all">전체</option>
						<option value="p_name">상품명</option>
						<option value="p_price">상품가격(검색어 기준 하위 가격)</option>
					</select>
					<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
					<button type="button" id="searchData">검색</button>
				</div> 
			</form> 
			
			<button type="button" id="MOVE_TOP_BTN">TOP</button>
			<div id="list" class="row">
				<c:choose>
					<c:when test="${not empty productList}">
						<c:forEach var="product" items="${productList}" varStatus="status">
							<div class="col-lg-4"  data-num="${product.p_no}" data-type="${product.p_type}">
								<c:if test="${not empty product.i_thumb}">
									 <img class=" goDetail img" src="/uploadStorage/product/thumbnail/${product.i_thumb}" alt="msix" width="225" height="225">
								</c:if>
					          <p>${product.p_name }</p>
					          <h5 class="findPrice" >${product.p_price }</h5>
					        </div>
			        	</c:forEach>
					</c:when>
					<c:otherwise>
						<div>등록된 게시물이 존재하지 않습니다.</div>
					</c:otherwise> 
		     	</c:choose>     
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

			<br /><br /><br /><br /><br />
		</div>
	</body>
</html>