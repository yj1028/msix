<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->   	
		<meta charset="UTF-8">
		
		<title>qnaDetail</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script>
			$(function(){
				// 질의게시판 목록 이동
				$("#goList").click(function(){
					location.href = "/qna/qnaList";
				});
				 
				let q_no = ${detail.q_no};
				listAll(q_no);
				
				/* 답글 입력을 위한 ajax 연동 처리*/
				$("#saveReplyBtn").click(function(){
					// 유효성 검사 : 제목, 내용 빈문자 없는지, r_title 50자.
					let insertUrl = "";	// ---------------------- 확인
					
					let value= JSON.stringify({
						q_no : q_no,
						r_title : $("#r_title").val(),
						r_content : $("#r_content").val(),
						r_cnt : "0"
					});
					
					/* 답글 저장을 위한 post 방식의 ajax 연동 처리*/
					
						
					
				}); 
				
					
				/* 답글 수정 */
				
				/* 답글 삭제 */	
					
				
			});	//최상위 끝.
			
			/* 답글을 보여주는 함수 */
			function listAll(q_no){
				$("#reply_form").html("");
				let url = ""	// ---------------------- 확인
				
				$.getJSON(url,function(data){
					replyCnt = data.length;
					$(data).each(function(){
						var r_title = this.r_title;
						var r_content = this.r_content;
						
						r_content = r_content.replace(/(\r\n|\r|\n)/g, "<br />");
						addNewReply(r_title, r_content);
					});
				}).fail(function(){
					alert("답글을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
				});
			}
			
			
			/* 새 답글을 화면에 추가하기 위한 함수*/
			function addNewReply(r_title, r_content) {
				//<div>태그 생성
				let new_div =  $("<div>");
				new_div.attr("data-no", r_no);	// ------ q_no 일 수도 있으니 확인
				
				//<label>태그 생성
				let new_label =  $("<label>");
				
				//<input>태그 생성
				let admin_input = $("<input>");
				admin_input.attr({"type" : "text", "value" : "답글제목", "maxlength" : "50"});
				admin_input.addClass("title");
				
				//<textarea>태그 생성
				let admin_textarea = $("<textarea>");
				admin_textarea.attr({"rows" : "3"});
				admin_textarea.addClass("content");
				
				
				// ---------------------- 확인
				admin_input.html(r_title);
				admin_textarea.html(r_content);
				
				//등록 버튼
				let up_input = $("<input>");
				up_input.attr({"type" : "button", "value" : "등록"});
				up_input.addClass("insert_form"); // 버튼 식별자로 사용할 클래스명
				
				//취소 버튼
				let del_input = $("<input>");
				del_input.attr({"type": "button", "value" : "취소"});
				del_input.addClass("delete_btn");
				
				let gathering = new_div.append(new_label).append(admin_input).append(new_div).append(new_label).append(admin_textarea)
				$("#reply_form").append(gathering);
			}
			
			/* reset */
			
		</script>
	</head>
	<body>
		<div class="container">
			<form id="replyForm">
				<input type="hidden" id="q_no" name="q_no" />
			</form>
			<div id="reply_write">
				<form id="insertForm">
					<table summary="질의게시판 상세페이지" class="table table-bordered">
						<tr>
							<td>글번호</td>
							<td>${detail.q_no}</td>
						</tr>
						<tr>	
							<td>회원번호</td>
							<td>${detail.m_no}</td>
						</tr>
						<tr>
							<td>태그</td>
							<td>${detail.q_tag}</td>
						</tr>
						<tr>
							<td>글제목</td>
							<td>${detail.q_title}</td>
						</tr>
						<tr class="table-height">
							<td>글내용</td>
							<td>${detail.q_content}</td>
						</tr>
						<tr>
							<td>등록일</td>
							<td>${detail.q_date }</td>
						</tr>
					</table>
					<div>
						<input class="btn btn-default" type="button" id="goList" value="목록" />
						<input class="btn btn-default" type="button" id="saveReplyBtn" value="답글 등록" />
					</div>
				</form>
				</div>
				<div id="reply_form" >
					<!--  동적 생성 요소 (답글 폼) 추가 -->
					<!-- 사용할 폼 
					<div class="mb-3">
					  	<label for="exampleFormControlInput1" class="form-label">Email address</label>
					  	<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
					</div>
					<div class="mb-3">
					  	<label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
					 	<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
					</div>
					-->
				</div>
		</div>
	</body>
</html>