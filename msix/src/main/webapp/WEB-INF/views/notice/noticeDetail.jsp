<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->   	
		<meta charset="UTF-8">
		
		<title>noticeDetail</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				// 목록
				$("#goListBtn").click(function(){
					location.href="/notice/noticeList";
				});
				
				// 공지수정
				$("#reviseNoticeBtn").click(function(){
					goUrl = "/notice/noticeForm";
					$("#f_revise").attr("action",goUrl);
					$("#f_revise").submit();
				});
				
				// 공지삭제
				$("#noticeDeleteBtn").click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						goUrl = "/notice/noticeDelete";
						$("#f_data").attr("action",goUrl);
						$("#f_data").submit();
					}
				});
				
			});
		</script>		
	</head>
	<body>
		<div class="container">
			<form name="f_revise" id="f_revise" method="post">
				<input type="hidden" name="n_no" value="${detail.n_no}"/>
				<input type="hidden" name="n_title" value="${detail.n_title }" />
				<input type="hidden" name="n_content" value="${detail.n_content }" />
				<input type="hidden" name="n_date" value="reviseIndentity" />
			</form>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="n_no" value="${detail.n_no}"/>
			</form>
			
			<div class="d-grid gap-3">
				<div class="p-2 bg-light border">
					<table summary="공지게시판 상세페이지" class="table table-bordered">
						<tr>
							<td>글번호</td>
							<td colspan="3">${detail.n_no}</td>
						</tr>
						<tr>
							<td>공지 제목</td>
							<td colspan="3">${detail.n_title}</td>
						</tr>
						<tr class="table-height">
							<td>공지 내용</td>
							<td colspan="3">${detail.n_content}</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td colspan="3">${detail.n_date}</td>
						</tr>
					</table>
				</div>
				<div class="p-2 bg-light border">
					<input class="btn btn-default" type="button" id="goListBtn" value="목록" />
					<input class="btn btn-default" type="button" id="reviseNoticeBtn" value="공지 수정" />
					<input class="btn btn-default" type="button" id="noticeDeleteBtn" value="공지 삭제" />
				</div>
			</div>
		</div>
	</body>
</html>