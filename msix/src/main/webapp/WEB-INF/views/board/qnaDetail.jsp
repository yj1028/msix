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
		
		<title>qnaDetail</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<script>
			let replyNum;
			
			$(function(){
				// 질의게시판 목록 이동
				$("#goList").click(function(){
					location.href = "/qna/qnaList";
				});
				 
				let q_no = ${detail.q_no};
				listAll(q_no);
				/* 답글 입력을 위한 ajax 연동 처리*/
				$("#replyBtn").click(function(){
					let insertUrl = "/qnaReply/replyInsert";
					
					let value= JSON.stringify({
						q_no : q_no,
						r_title : $("#r_title").val(),
						r_content : $("#r_content").val()
					});
					
					$.ajax({
						url : insertUrl,
						type : "post",
						headers : {
							"Content-Type" : "application/json"
						},
						dataType : "text",
						data : value,
						error : function(){
							alert('시스템 오류입니다. 관리자에게 문의 하세요.');
						},
						beforesend : function(){
							// 유효성 검사 : 제목, 내용 빈문자 없는지
							if(!chkData("#r_title","답글 제목을")) return false;
							else if(!chkData("#r_content","답글 내용을")) return false;
						},
						success : function(result){
							if(result =="SUCCESS") {
								alert("답글 등록이 완료되었습니다.");
								dataReset();
								listAll(q_no);
							}
						}
					});
				}); 
					
				/* 답글 수정 */
				/* 수정하기 버튼 시 수정폼 동적으로 출력 */
				$(document).on("click",".update_form",function(){
					$(".reset_btn").click();
					let currLi = $(this).parents("li");
					replyNum = currLi.attr("data-no");
					
				});
				/* 수정화면에서 수정취소버튼(초기화) 클릭처리  */
				$(document).on("click",".reset_btn",function(){
					
					let titletext = $(this).parents("li").find("span").eq(1).html();
					titletext = titletext.replace(/(\r\n|\r|\n)/g,"<br />");
					
					let context =$(this).parents("li").find("textarea").html();
					context = context.replace(/(\r\n|\r|\n)/g,"<br />");
					
					$(this).parents("li").find("input[type='button']").show();
					
					let titleArea = $(this).parents("li").children().eq(1);
					let conArea = $(this).parents("li").children().eq(2);
					
					titleArea.html(titletext);
					conArea.html(context);
				});
				/* 수정화면에서 수정완료 버튼 클릭 시 수정을 위한 ajax 연동 처리*/
				$(document).on("click",".update_btn",function(){
					let li = $(this).parents("li");
					let r_no = li.attr("data-no");
					let r_content = $("#content").val();
					if(!chkData("#title","제목을")) return;
					else if(!chkData("#content","답글 내용을")) return;
					else {
						$.ajax({
							url : '/qnaReply/'+ r_no,
							type: "put",
							headers :{
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" :"PUT"
							},
							data: JSON.stringify({
								r_title : r_title,
								r_content:r_content
							}),
							dataType :'text',
							error: function(){
								alert("시스템 오류입니다. 관리자에게 문의하세요.");
							},
							success: function(result){
								console.log("result: "+result);
								if(result =="SUCCESS"){
									updateForm(li);
									alert("수정이 완료되었습니다.");
									listAll(q_no);
								}
							}
						});
					}
				});
				
				
				/* 답글 삭제 */	
				$(document).on("click",".delete_btn",function(){
	
					let currLi = $(this).parents("li");
					replyNum = currLi.attr("data-no");
					deleteBtn(q_no);
				});	
				
			});	//최상위 끝.
			
			/* reset */
			function dataReset(){
				$("#reply_write").each(function(){
					this.reset();
				})
			}
			/* 답글을 보여주는 함수 */
			function listAll(q_no){
				$("#reply_list").html("");
				let url = "/qnaReply/all/"+q_no;	
				
				$.getJSON(url,function(data){
					$(data).each(function(){
						var r_no = this.r_no;
						var r_date = this.r_date;
						var r_title = this.r_title;
						var r_content = this.r_content;
						
						r_content = r_content.replace(/(\r\n|\r|\n)/g, "<br />");
						addNewReply(r_no, r_date, r_title, r_content);
					});
				}).fail(function(){
					alert("답글을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
				});
			}
			
			
			/* 새 답글을 화면에 추가하기 위한 함수*/
			function addNewReply(r_no, r_date, r_title, r_content) {
				
				let new_li = $("<li>");
				new_li.attr("data-no", r_no);
				
				let writer_p = $("<p>");
				
				let name_span = $("<span>");
				
				let date_span = $("<span>");
				date_span.html(" [ "+ r_date + " ] ");
				
				let up_input = $("<input>");
				up_input.attr({"type" : "button", "value" : "수정하기"});
				up_input.addClass("update_form"); // 버튼 식별자로 사용할 클래스명
				
				let del_input = $("<input>");
				del_input.attr({"type": "button", "value" : "삭제하기"});
				del_input.addClass("delete_btn");
				
				//내용
				var title_p = $("<p>");
				title_p.html(r_title);
				var content_p = $("<p>");
				content_p.html(r_content);
				
				//조립하기
				writer_p.append(date_span).append(up_input).append(del_input)
				new_li.append(writer_p).append(title_p).append(content_p);
				$("#reply_list").append(new_li);
			}
			
			/** 수정 폼 화면 구현 함수 */
			function updateForm(currLi){
				let titleArea = currLi.children().eq(1);
				let titleText = titleArea.html();	// 답글제목 가져오기
				
				let conArea = currLi.children().eq(2);
				let conText = conArea.html();			//답글내용 가져오기
				
				titleText = titleText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
				conText = conText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
								
				currLi.find("input[type='button']").hide();
				titleArea.html(""); 
				conArea.html("");
							
				let update_area = $("<span>");
				update_area.addClass("update_area");
				
				let span_title = $("<span>");
				span_title.attr({"name" : "title", "id" : "title"});
				span_title.html(titleText);
							
				let textarea = $("<textarea>");
				textarea.attr({"name" : "content", "id" : "content"});
				textarea.html(conText);
							
				let update_btn = $("<input>");
				update_btn.attr({"type" : "button", "value" : "수정완료"});
				update_btn.addClass("update_btn");
							
				let reset_btn = $("<input>");
				reset_btn.attr({"type" : "button", "value" : "수정취소"});
				reset_btn.addClass("reset_btn");
							
				update_area.append(span_title).append(textarea).append(update_btn).append(reset_btn);
				conArea.html(update_area);
			}
			
			/* 글 삭제를 위한 ajax 연동 처리 */
			function deleteBtn(q_no) {
				if(confirm("선택하신 답글을 삭제하시겠습니까?")){
					$.ajax({
						url : '/qnaReply/'+replyNum,
						type : "delete",
						headers : {
							"X-HTTP-Method-Override" : "DELETE"
						},
						dataType : "text",
						success : function(result) {
							console.log("result: "+result);
							if(result =="SUCCESS"){
								alert("삭제되었습니다.");
								listAll(q_no);
							}
						}
					});
				}
			}
		</script>
	</head>
	<body>
		<div class="container">
			<div >
				<h3>질의게시판 상세내용</h3>
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
				</div>
			</div>
			<br /><br/>
			<div >
				<h3>관리자 답글 작성</h3>
				<form id="reply_write">
					<div class="mb-3">
					  	<label for="r_title" class="form-label">답글 제목</label>
					  	<input type="text" class="form-control" id="r_title" maxlength="49" />
					</div>
					<div class="mb-3">
					  	<label for="r_content" class="form-label">답글 내용</label>
					 	<textarea class="form-control" id="r_content" rows="3"></textarea>
					</div>
					<div>
						<input class="btn btn-default" type="button" id="replyBtn" value="답글 등록" />
					</div>
				</form>
			</div>
			<br /><br />
			<h3>관리자가 작성한 답글</h3>
			<div id="reply_list">
				<!-- 동적 생성 요소 추가 -->
			</div>
		</div>
	</body>
</html>