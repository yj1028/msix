<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>memberList</title>
		
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
					
					if($("#search").val()!='b_content'){
						//:contains()는 특정 텍스트를 포함한 요소반환
						if($("#search").val() == 'm_id') value= "#list tr td.goDetail";
						else if($("#search").val() == 'm_name') value= "#list tr td.name";
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
				
				/* 제목 클릭시 상세 페이지로 이동 처리 이벤트 */
				$(".goDetail").click(function(){
					let m_no = $(this).parents("tr").attr("data-num"); <%-- "data-num"이 가리키는 값을 얻어온다. hidden 태그로 --%>
					$("#m_no").val(m_no);
					console.log("회원번호 : " + m_no);
					// 상세 페이지로 이동하기 위해 form추가 (id : m_detailForm)
				 	$("#m_detailForm").attr({
						"method":"get",
						"action":"/member/memberDetail"
					});
					$("#m_detailForm").submit(); 
				});
				
				/* 페이지 처리 */
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
				/* let masking = $(".goDetail").parents("tr").attr("data-name").replace(/(?<=.{1})./,"*");
				$(".name").val(masking); */
			});
			
			function goPage(){
				if($("#search").val() == "all"){
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method":"get",
					"action":"/member/memberList"
				});
				$("#f_search").submit();
			}
		</script>
	</head>
	<body>
		<div class="container">
			<form id="m_detailForm">
				<input type="hidden" id="m_no" name="m_no" />
			</form>
			<div class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group">
						<label>검색조건</label>
						<select name="search" id="search" class="form-control">
							<option value="all">전체</option>
							<option value="m_id">회원 아이디</option>
							<option value="m_name">회원 이름</option>
						</select>
						<input type="text" name="keyword" class="form-control" id="keyword" value="검색어를 입력하세요" />
						<button type="button" class="btn btn-default" id="searchData">검색</button>
					</div>
				</form>
			</div>
			
			<div id="memberList" class="table-height">
				<table summary="회원 리스트" class="table" style="margin-top:20px;">
					<thead>
						<tr>
							<th class="order text-center col-md-1">회원번호</th>
							<th class="text-center col-md-4">회원 아이디</th>
							<th class="order col-md-1">가입일</th>
							<th class="text-center col-md-2">회원 이름</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty memberList}" >
								<c:forEach var="member" items="${memberList}" varStatus="status">
									<tr class="text-center" data-num="${member.m_no}" data-name="${member.m_name}">
										<td>${member.m_no}</td>
										<td class="goDetail text-center">${member.m_id}</td>
										<td class="text-left">${member.m_date}</td>
										<td class="name">${member.m_name}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="text-center">등록된 회원이 존재하지 않습니다.</td>
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