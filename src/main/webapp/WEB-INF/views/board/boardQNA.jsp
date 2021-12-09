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
		
		<title>boardQNA</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			.required{ color: blue; }
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script>
			$(function(){
				/* 검색 후 검색 대상과 검색 단어 출력 */
				let word = "<c:out value='${data.keyword}' />";
				let value = "";
				if(word != ""){
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#search").val("<c:out value='${data.search}' />");
					
					if($("#search").val()!='q_content'){
						//:contains()는 특정 텍스트를 포함한 요소반환
						if($("#search").val() == 'q_title') value= "#list tr td.goDetail";
						else if($("#search").val() == 'q_tag') value= "#list tr td.tag";
						console.log($(value + ":contains('" + word + "')").html());
						
						$(value + ":contains('" + word + "')").each(function(){
							var regex = new RegExp(word,'gi');
							$(this).html($(this).html().replace(regex,"<span class='required'>" + word + "</span>"));
						});
					}
				}
				// 검색 대상이 변경될 때마다 처리하는 이벤트
				$("#search").change(function(){ 
					if($("#search").val()=="all"){
						$("#keyword").val("전체 데이터 조회합니다.");
					} else if ($("#search").val() != "all"){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				// 검색 버튼
				$("#searchData").click(function(){
					if($("#search").val() != "all"){
						if(!chkData("#keyword","검색어를")) return;
					}
					goPage();
				});
				
				// 페이지 처리
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
				/*  제목 클릭시 상세 페이지로 이동 처리 이벤트 */
				$(".goDetail").click(function(){
					let q_no = $(this).parents("tr").attr("data-no");
					$("#q_no").val(q_no);
					console.log("글번호 : " + q_no);
				 	$("#detailForm").attr({
						"method":"get",
						"action":"/qna/qnaDetail"
					});
					$("#detailForm").submit(); 
				});
			});
			
			function goPage(){
				if($("#search").val() == "all"){
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method":"get",
					"action":"/qna/qnaList"
				});
				$("#f_search").submit();
			}
		</script>
	</head>
	<body>
	<div class="container">
		<form id="detailForm">
			<input type="hidden" id="q_no" name="q_no" />
		</form>
		
		<form id="f_search" name="f_search">
			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
			<div class="text-right p-2 bg-light border">
				<label>검색조건</label>
				<select name="search" id="search">
					<option value="all">전체</option>
					<option value="q_tag">대분류</option>
					<option value="q_title">제목</option>
					<option value="q_content">내용</option>
				</select>
				<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" />
				<button type="button" id="searchData">검색</button>
			</div>
		</form>
		<div class="d-grid gap-3">
			<div class="p-2 bg-light border">
			 	<div class="table-height">
					<table summary="질의게시판 리스트" class="table table-striped">
						<thead>
							<tr>
								<th class="text-center">글번호</th>
								<th class="text-center">회원번호</th>
								<th class="text-center">대분류</th>
								<th class="text-center">질의글 제목</th>
								<th class="text-center">질의글 내용</th>
								<th class="text-center">작성일</th>
								<th class="text-center">조회수</th>
							</tr>
						</thead>
						<tbody id="list" class="table-striped">
							<!-- 데이터 출력 -->
							<c:choose>
								<c:when test="${not empty qnaList}" >
									<c:forEach var="board" items="${qnaList}" varStatus="status">
										<tr class="text-center" data-no="${board.q_no}">
											<td class="text-center">${count - status.index}</td>
											<td class="text-center">${board.m_no }</td>
											<td class="tag text-center">${board.q_tag }</td>
											<td class="goDetail text-center">${board.q_title }</td>
											<td class="text-center">${board.q_content }</td>
											<td class="text-center">${board.q_date }</td>
											<td class="text-center">${board.q_cnt }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="p-2 bg-light border">	
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
		</div>
 	</div> 
	</body>
</html>