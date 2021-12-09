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
		
		<title>boardNotice</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
				$(function(){
					/*  제목 클릭시 상세 페이지로 이동 처리 이벤트 */
					$(".goDetail").click(function(){
						let n_no = $(this).parents("tr").attr("data-no");
						$("#n_no").val(n_no);
						console.log("글번호 : " + n_no);
					 	$("#detailForm").attr({
							"method":"get",
							"action":"/notice/noticeDetail"
						});
						$("#detailForm").submit(); 
					});
					
					/* 공지 등록 버튼 처리*/
					$("#goNoticeForm").click(function(){
						location.href="/notice/noticeForm";
					});
					// 조회수
					
					// 페이지 처리
					$(".paginate_button a").click(function(e){
						e.preventDefault();
						$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
						goPage();
					});
				});
				
				function goPage(){
					$("#f_search").attr({
						"method":"get",
						"action":"/notice/noticeList"
					});
					$("#f_search").submit();
				}
		</script>
	</head>
	<body>
		<div class="container">
			<form id="detailForm">
				<input type="hidden" id="n_no" name="n_no" />
			</form>
			<form id="f_search" name="f_search">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
				<div>
					
				</div>
			</form>
			<div class="table-height">
			<table summary="공지게시판 리스트" class="table table-striped">
				<thead>
					<tr>
						<th class="text-center">글번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">내용</th>
						<th class="text-center">작성일</th>
						<th class="text-center">조회수</th>
					</tr>
				</thead>
				<tbody class="table-striped">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty boardList}" >
							<c:forEach var="notice" items="${boardList}" varStatus="status">
								<tr class="text-center" data-no="${notice.n_no}">
									<td class="text-center">${count - status.index}</td>
									<td class="goDetail text-center">${notice.n_title }</td>
									<td class="text-center">${notice.n_content }</td>
									<td class="text-center">${notice.n_date}</td>
									<td class="text-center">${notice.n_cnt}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			</div>
			<div class="text-left d-grid gap-3">
				<input class="btn btn-default" type="button" id="goNoticeForm" value="공지등록" />
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