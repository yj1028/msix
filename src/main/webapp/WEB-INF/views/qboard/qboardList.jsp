<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>질의 게시판 목록</title>
	<!-- Bootstrap core CSS -->
    	<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
		$(function() {
			
			
			$("#insertFormBtn").click(function(){
				location.href="/qboard/writeForm";
			});
			$(".goDetail").click(function(){
				let q_no = $(this).parents("tr").attr("data-num");
				$("#q_no").val(q_no);
				console.log("글번호 : "+ q_no);
				// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
				$("#detailForm").attr({
					"method":"get",
					"action":"/qboard/qboardDetail"
				});
				$("#detailForm").submit();
			});
			
			/* 검색 대상이 변결될 때마다 처리 이벤트 */
			$("#search").change(function(){
				if($("#search").val()=="all"){
					$("#keyword").val("전체 데이터 조회합니다.");
				}else if($("#search").val()!="all"){
					$("#keyword").val("");
					$("#keyword").focus();
				}
			});
			
			/* 검색 버튼 클릭 시 처리 이벤트 */
			$("#searchData").click(function(){
				if($("#search").val()!="all"){
					if(!chkData("#keyword","검색어를")) return;
				}
				goPage();
			});
			 //페이징 처리 
			$(".paginate_button a").click(function(e){
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			});
		});
		/* 검색을 위한 실질적인 처리 함수 */
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"/qboard/qboardList"
			});
			$("#f_search").submit();
		}
		
		
		
		</script>
	
	</head>
	<body>
		
		<div class="contentContainer container">
			<h1>질의 게시판</h1> 
			<c:if test="${session.getAttribute('login') == null}">
			<form id="detailForm">
				<input type="hidden" id="q_no" name="q_no" />
			</form>
			</c:if>
			<!-- ====================검색시작 =====================  -->
			<div id="boardSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<div class="form-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-contorl">
							<option value="all">전체</option>
							<option value="q_title">제목</option>
							<option value="q_content">내용</option>
							<option value="m_name">작성자</option>
							
						</select>
						<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control"/>
						<button type="button" id="searchData" class="btn btn-primary">검색</button>
					</div>
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
			</form>
			<%-- ==================== 리스트 시작 ================ --%>
			<div id="nboardList" class="table-height">
				<table summary="게시판 리스트" class="table table-striped">
					<thead>
						<tr>
							<th>글번호</th>
							<th>글제목[게시물분류]</th>
							<th>작성일</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty qboardList }" > <!-- if문 -->
								<c:forEach var="qboard" items="${qboardList}" varStatus="status"> <!-- 반복문 -->
									<tr class="text center" data-num="${qboard.q_no}">
									<!--<td>${count - status.index}</td>-->
										<td class="text-left" >${qboard.q_no }</td>										
										<td class="goDetail text-left">
										${qboard.q_title}
										[${qboard.q_tag}]
										</td>
										<td class="text-left">${qboard.q_date}</td>
										<td class="text-left">${qboard.m_name}</td>
										<td class="text-left">${qboard.q_cnt}</td>										
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac text-center">등록된 게시물이 존재하지 않습니다/</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>	
			<%-- ==================== 리스트 종료 ================ --%>
			<%-- ==================== 글쓰기 버튼 출력 시작 ================ --%>
			<%
			if (session.getAttribute("login") == null){
			%>
				<div></div>
			<%}else{ %>
				<div>
					<input type="button" class="btn btn-default" value="글쓰기" id="insertFormBtn">
				</div>
			<%} %>
			<%-- ==================== 페이징 출력 시작============== --%>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a href="${pageMaker.endPage +1 }">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</body>
</html>