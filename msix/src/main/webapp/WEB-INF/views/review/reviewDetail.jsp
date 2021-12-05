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
		
		<title>reviewDetail</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script>
			let replyNum;
			
			$(function(){
				let rv_no = ${detail.rv_no};
				listAll(rv_no);
				
				/* 목록 이동 */
				$("#goList").click(function(){
					location.href="/review/reviewList";
				});
				
				
				/* 글삭제버튼 클릭 시 댓글개수 확인 후 처리*/
				$("#reviewDeleteBtn").click(function(){
					$.ajax({
						url : "/review/replyCnt",
						type : "post",
						data : "rv_no="+$("#rv_no").val(),
						dataType : "text",
						error : function(){
							alert("시스템 오류. 관리자에게 문의 하세요.");
						},
						success : function(resultData){
							var goUrl = "";   
							if(resultData == 0){
								// 게시글 삭제
								if(confirm("게시글을 삭제하시겠습니까?")){
									goUrl = "/review/reviewDelete";
									$("#f_data").attr("action",goUrl);
									$("#f_data").submit();
								}
							}else {
								// 댓글 삭제 후 게시물 삭제
								if(confirm("게시물을 삭제 시 댓글도 삭제됩니다.\n게시물을 삭제하시겠습니까?")){
									goUrl = "/review/reviewDelete";
									$("#f_data").attr("action",goUrl);
									$("#f_data").submit();
								}
							}
						}
					});
				});
				
				/* 댓글삭제하기 버튼 클릭 처리*/
				$(document).on("click",".delete_btn",function(){
					let replyNum = $(this).parents("li").attr("data-no");
					if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
						$.ajax({
							url : '/comments/'+replyNum,
							type : "delete",
							headers : {
								"X-HTTP-Method-Override" : "DELETE"
							},
							dataType : "text",
							success : function(result) {
								console.log("result: "+result);
								if(result =="SUCCESS"){
									alert("삭제되었습니다.");
									
								}
							}
						});
					}
					
				});
				
			}); //최상위 끝.
			
			/* 댓글 목록을 보여주는 함수 */
			function listAll(rv_no){
				$("#comment_list").html("");
				let url = "/comments/all/"+rv_no;
				
				$.getJSON(url,function(data){
					$(data).each(function(){
						var c_no = this.c_no;
						var c_comment = this.c_comment;
						var c_date = this.c_date;
						
						r_content = r_content.replace(/(\r\n|\r|\n)/g, "<br />");
						addNewItem(c_no, c_comment, c_date);
					});
				}).fail(function(){
					alert("댓글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
				});
			}
			
			/* 새로운 글을 화면에 추가하기 위한 함수 */
			function addNewItem(c_no, c_comment, c_date) {
				let new_li = $("<li>");
				new_li.attr("data-no", c_no);
				
				let writer_p = $("<p>");
				
				let date_span = $("<span>");
				date_span.html(" [ "+ c_date + " ] ");
				
				let del_input = $("<input>");
				del_input.attr({"type": "button", "value" : "삭제하기"});
				del_input.addClass("delete_btn");
				
				//내용
				var content_p = $("<p>");
				content_p.html(c_comment);
				
				//조립하기
				writer_p.append(date_span).append(del_input)
				new_li.append(writer_p).append(content_p);
				$("#comment_list").append(new_li);
			}
		</script>
	</head>
	<body>
		<div class="container">
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" id ="rv_no" name="rv_no" value="${detail.rv_no}"/>
			</form>
			
			<div>
				<table summary="리뷰게시판 상세페이지" class="table table-bordered">
					<tr>
						<td>글번호</td>
						<td colspan="3">${detail.rv_no}</td>
					</tr>
					<tr>
						<td>회원번호</td>
						<td colspan="3">${detail.m_no}</td>
					</tr>
					<tr>
						<td>대분류</td>
						<td colspan="3">${detail.rv_tag}</td>
					</tr>
					<tr>
						<td>리뷰글 제목</td>
						<td colspan="3">${detail.rv_title}</td>
					</tr>
					<tr class="table-height">
						<td>리뷰글 내용</td>
						<td colspan="3">${detail.rv_content}</td>
					</tr>
					<c:if test="${not empty detail.rv_image }">
						<td>이미지</td>
						<td><img src="/uploadStorage/${detail.rv_image }" class="rounded mx-auto d-block"></td>
					</c:if> 
					<tr>
						<td>작성일</td>
						<td colspan="3">${detail.rv_date}</td>
					</tr>
				</table>
			</div>
			<div>
				<input class="btn btn-default" type="button" id="goList" value="목록" />
				<input class="btn btn-default" type="button" id="reviewDeleteBtn" value="게시글 삭제" />
			</div>
			<div>
				<ul class="list-group" id="comment_list">
					<!-- 댓글 출력  -->
					
				</ul>
			</div>
			
		</div>
	</body>
</html>