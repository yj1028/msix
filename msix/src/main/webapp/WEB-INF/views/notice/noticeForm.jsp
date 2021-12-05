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
		
		<title>noticeForm</title>
		
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
				$("#goList").click(function(){
					location.href="/notice/noticeList";
				});
				
				// 공지 등록
				$("#saveNoticeBtn").click(function(){
					let n_date = ${NoticeVO.n_date};
					
					if(!chkData("#n_title", "공지 제목을")) return;
					else if(!chkData("#n_content", "공지 내용을")) return;
					else {
						if(n_date=='reviseIndentity'){
							"method":"post",
							"enctype" :"multipart/form-data",
							"action":"/notice/noticeUpdate"
						}else {
							$("#notice_write").attr({
								"method":"post",
								"enctype" :"multipart/form-data",
								"action":"/notice/noticeInsert"
							});
							$("#notice_write").submit();
						}
						
					}
				});
				
			}); 	
		</script>
		<style type="text/css">
			textarea{resize:none; }
		</style>
	</head>
	<body>
		<div class="container">
			
			<div class="d-grid gap-3">
				<div class="p-2 bg-light border">
					<h3>관리자 공지 등록</h3>
					<form id="notice_write">
						<div class="mb-3">
						  	<label for="n_title" class="form-label">공지 제목</label>
						  	<input type="text" class="form-control" id="n_title" maxlength="49" value="${noticeVO.n_title }" />
						</div>
						<div class="mb-3">
						  	<label for="n_content" class="form-label">공지 내용</label>
						 	<textarea class="form-control" id="n_content" rows="20">${NoticeVO.n_content }</textarea>
						</div>
						<div class="mb-3">
							<input class="btn btn-default" type="button" id="goList" value="목록" />
							<input class="btn btn-default" type="button" id="saveNoticeBtn" value="공지 등록" />
						</div>
					</form>
				</div>
			</div>
			
		</div>
	</body>
</html>