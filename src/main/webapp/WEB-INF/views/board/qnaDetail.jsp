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
		
		<style>
			textarea{resize: none; }
			#replyBtn{margin-top: 15px;}
			.delete_btn{margin-left: 10px;}
		</style>
		<script>
			let replyNum;
			
			$(function(){
				let q_no = ${detail.q_no};
				listAll(q_no);
				// 질의게시판 목록 이동
				$("#goList").click(function(){
					location.href = "/qna/qnaList";
				});
				
				// 질의글 삭제
				$("#deleteQNABtn").click(function(){
					if(confirm("질의 글을 삭제하시겠습니까?")){
						$("#sendQNO").attr({
							"method" : "post",
							"action" : "/qna/qnaDelete"
						});
						$("#sendQNO").submit();
					}
					
				});
				
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
					let currLi = $(this).parents("li");
					updateForm(currLi);
					
				});
				
				/* 수정화면에서 수정취소버튼(초기화) 클릭처리 */
				$(document).on("click",".reset_btn",function(){
					listAll(q_no);
					
				});
				/* 수정화면에서 수정완료 버튼 클릭 시 수정을 위한 ajax 연동 처리*/
				$(document).on("click",".update_btn",function(){
					let li = $(this).parents("li");
					let r_no = li.attr("data-no");
					let r_title = $("#title").val();
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
								r_title:r_title,
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
					if(data != ""){
						//<h3>관리자가 작성한 답글</h3>
						let reply_head = $("<h3>");
						reply_head.append("관리자가 작성한 답글");
						$("#reply_list").append(reply_head);
						
						$(data).each(function(){
							var r_no = this.r_no;
							var r_date = this.r_date;
							var r_title = this.r_title;
							var r_content = this.r_content;
							
							r_content = r_content.replace(/(\r\n|\r|\n)/g, "<br />");
							addNewReply(r_no, r_date, r_title, r_content);
						});
					}
				}).fail(function(){
					alert("답글을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
				});
			}
			
			
			/* 새 답글을 화면에 추가하기 위한 함수*/
			function addNewReply(r_no, r_date, r_title, r_content) {
				let new_ul = $("<ul>");
				new_ul.addClass("list-group");
				
				let new_li = $("<li>");
				new_li.attr("data-no", r_no);
				new_li.addClass("list-group-item");
				
				let writer_p = $("<p>");
				
				let name_span = $("<span>");
				
				let date_span = $("<span>");
				date_span.html(" [ "+ r_date + " ] ");
				
				let up_input = $("<input>");
				up_input.attr({"type" : "button", "value" : "수정하기"});
				up_input.addClass("update_form"); // 버튼 식별자로 사용할 클래스명
				up_input.addClass("btn btn-default");
				
				let del_input = $("<input>");
				del_input.attr({"type": "button", "value" : "삭제하기"});
				del_input.addClass("delete_btn");
				del_input.addClass("btn btn-default");
				
				//내용
				var title_p = $("<p>");
				title_p.html(r_title);
				title_p.addClass("p_title");
				
				var content_p = $("<p>");
				content_p.html(r_content);
				content_p.addClass("p_content");
				
				//조립하기
				writer_p.append(date_span).append(up_input).append(del_input)
				new_li.append(writer_p).append(title_p).append(content_p);
				new_ul.append(new_li);
				$("#reply_list").append(new_ul);
			}
			
			/** 수정 폼 화면 구현 함수 */
			function updateForm(currLi){
				// 답글제목 가져오기
				let titleArea = currLi.children().eq(1);
				let titleText = titleArea.html();	
				
				// 답글내용 가져오기
				let conArea = currLi.children().eq(2);
				let conText = conArea.html();			
				
				titleText = titleText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
				conText = conText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
				// 버튼(수정, 삭제하기) 숨기기 및 작성폼 초기화
				currLi.find("input[type='button']").hide();
				titleArea.html("");
				conArea.html("");
						
				// 제목 삽입
				let input_title = $("<input>");
				input_title.attr({"type" : "text", "name" : "title", "id" : "title", "maxlength" : "49"});
				input_title.addClass("form-control");
				input_title.val(titleText);
				
				// <textarea>태그에 내용 삽입 
				let textarea = $("<textarea>");
				textarea.attr({"name" : "content", "id" : "content", "rows": "10" , "maxlength" : "50"});
				textarea.addClass("form-control");
				textarea.html(conText);
					
				let update_btn = $("<input>");
				update_btn.attr({"type" : "button", "value" : "수정완료"});
				update_btn.addClass("update_btn");
				update_btn.addClass("btn btn-primary");
				
				let reset_btn = $("<input>");
				reset_btn.attr({"type" : "button", "value" : "수정취소"});
				reset_btn.addClass("reset_btn");
				reset_btn.addClass("btn btn-primary");
				
				titleArea.append(input_title);
				conArea.append(textarea).append(update_btn).append(reset_btn)
				
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
			<div class="d-grid gap-3">
				<div class="p-2 bg-light border">
				<form id="sendQNO" name="sendQNO">
					<input type="hidden" name="q_no" value="${detail.q_no}">
				</form>
					<h3>질의게시판 상세내용</h3>
					<table summary="질의게시판 상세페이지" class="table table-bordered">
						<tr data-no="${detail.q_no}">
							<td>글번호</td>
							<td>${detail.q_no}</td>
							<td>회원번호</td>
							<td>${detail.m_no}</td>
							
						</tr>
						<tr>
							<td>태그</td>
							<td>${detail.q_tag}</td>
							<td>등록일</td>
							<td>${detail.q_date }</td>
						</tr>
						<tr>
							<td>글제목</td>
							<td colspan="3">${detail.q_title}</td>
						</tr>
						<tr class="table-height">
							<td>글내용</td>
							<td colspan="3">${detail.q_content}</td>
						</tr>
					</table>
				</div>
				<div>
					<input class="btn btn-default" type="button" id="goList" value="목록" />
					<input class="btn btn-default" type="button" id="deleteQNABtn" value="삭제" />
				</div>
				<div class="p-2 bg-light border">
					<h3>관리자 답글 작성</h3>
					<form id="reply_write">
						<div class="mb-3">
						  	<label for="r_title" class="form-label">답글 제목</label>
						  	<input type="text" class="form-control" id="r_title" maxlength="49" />
						</div>
						<div class="mb-3">
						  	<label for="r_content" class="form-label">답글 내용</label>
						 	<textarea class="form-control" id="r_content" rows="8" maxlength="1300"></textarea>
						</div>
						<div class="mb-3">
							<input class="btn btn-default" type="button" id="replyBtn" value="답글 등록" />
						</div>
					</form>
				</div>
				<div class="p-2 bg-light border">
					<div id="reply_list">
						<!-- 동적 생성 요소 추가 -->
					</div>
				</div>
			</div>
		</div>
	</body>
</html>