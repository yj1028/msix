<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>boardList.jsp</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			.required{ color: red; }
			.table-height{ min-height: 407px;}
			.contentBtn{ min-height: 100px; }
			.reply_count{ color: blue; }
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				
				/* 검색 후 검색 대상과 검색 단어 출력 */
				let word = "<c:out value='${data.keyword}' />";
				let value = "";
				if(word != ""){
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#search").val("<c:out value='${data.search}' />");
					
					if($("#search").val()!='b_content'){
						//:contains()는 특정 텍스트를 포함한 요소반환
						if($("#search").val() == 'b_title') value= "#list tr td.goDetail";
						else if($("#search").val() == 'b_name') value= "#list tr td.name";
						console.log($(value + ":contains('" + word + "')").html());
						
						$(value + ":contains('" + word + "')").each(function(){
							var regex = new RegExp(word,'gi');
							$(this).html($(this).html().replace(regex,"<span class='required'>" + word + "</span>"));
						});
					}
				}
				
				$("#search").change(function(){ // 검색 대상이 변경될 때마다 처리하는 이벤트
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
				
				$("#insertFormBtn").click(function(){
					location.href="/board/writeForm"; <%-- 입력 화면으로 이동 --%>
				});
				
				/* 제목 클릭시 상세 페이지로 이동 처리 이벤트 */
				$(".goDetail").click(function(){
					let b_num = $(this).parents("tr").attr("data-num"); <%-- "data-num"이 가리키는 값을 얻어온다. hidden 태그로 --%>
					$("#b_num").val(b_num);
					console.log("글번호 : " + b_num);
					// 상세 페이지로 이동하기 위해 form추가 (id : detailForm)
				 	$("#detailForm").attr({
						"method":"get",
						"action":"/board/boardDetail"
					});
					$("#detailForm").submit(); 
				});
				
				/* 페이지 처리 */
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
				$("#f_search").attr({
					"method":"get",
					"action":"/board/boardList"
				});
				$("#f_search").submit();
			}
		</script>
	</head>
	<body>
		<div>
			<form id="detailForm">
				<input type="hidden" id="b_num" name="b_num" />
			</form>
			<div>
				<form id="f_search" name="f_search">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div>
						<label>검색조건</label>
						<select name="search" id="search">
							<option value="all">전체</option>
							<option value="b_title">제목</option>
							<option value="b_content">내용</option>
							<option value="b_name">작성자</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
						<button type="button" id="searchData">검색</button>
					</div>
				</form>
			</div>
			<div id="boardList" class="table-height">
				<table summary="게시판 리스트" class="table table-striped">
					<thead>
						<tr>
							<th class="order text-center col-md-1">글번호</th>
							<th class="text-center col-md-4">글제목</th>
							<th class="order col-md-1">작성일</th>
							<th class="text-center col-md-2">작성자</th>
							<th class="text-center col-md-2">이미지</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty boardList}" >
								<c:forEach var="board" items="${boardList}" varStatus="status">
									<tr class="text-center" data-num="${board.b_num}">
										<td>${count - status.index}</td>
										<td class="goDetail text-left">
											${board.b_title}
											<c:if test="${board.r_cnt > 0 }">
												<span class="reply_count">[${board.r_cnt}]</span>
											</c:if>
										</td>
										<td class="text-left">${board.b_date}</td>
										<td class="name">${board.b_name}</td>
										<td>
											<c:if test="${not empty board.b_thumb }">
												<img src="/uploadStorage/board/thumbnail/${board.b_thumb }" />
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
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
			
			<div class="contentBtn text-right">
				<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success">
			</div>
			
		</div>
	</body>
</html>