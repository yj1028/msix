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
		
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
			$(function(){
				// 목록
				$("#goListBtn").click(function(){
					location.href="/notice/noticeList";
				});
				
				// 공지수정
				$("#reviseNoticeBtn").click(function(){
					/* 수정하기 버튼 시 수정폼 동적으로 출력 - 한 번만 출력되도록 설정*/
					let currTr = $(this).parents("tr");
					updateForm(currTr);
					$(this).hide();
				});
				
				/* 수정화면에서 수정취소버튼(초기화) 클릭처리  */
				$(document).on("click",".reset_btn",function(){
					// 제목 가져오기
					let titletext = $(this).find("input[name='title']").html();
					//titletext = titletext.replace(/(\r\n|\r|\n)/g,"<br />");
					
					// 내용 가져오기
					let context =$(this).find("input[name='content']").html();
					//context = context.replace(/(\r\n|\r|\n)/g,"<br />");
					
					// 버튼(수정, 삭제하기) 보여주기 
					$(this).find("input[type='button']").show();
					
					// 수정폼에 기존내용 보여주고, 공지수정버튼 되살리기.
					$("#input_reply").hide();
					$("#reviseNoticeBtn").show();
					
				});
				
				/* 수정화면에서 수정완료 버튼 클릭 시 수정을 위한 ajax 연동 처리*/
				$(document).on("click",".update_btn",function(){
					let n_no = ${detail.n_no};
					
					let n_title = $("#title").val();
					let n_content = $("#content").val();
					
					if(!chkData("#title","제목을")) return;
					else if(!chkData("#content","답글 내용을")) return;
					else {
						$.ajax({
							url : '/notice/'+n_no,
							type: "put",
							headers :{
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" :"PUT"
							},
							data: JSON.stringify({
								n_title:n_title,
								n_content:n_content
							}),
							dataType :'text',
							error: function(){
								alert("시스템 오류입니다. 관리자에게 문의하세요.");
							},
							success: function(result){
								console.log("result: "+result);
								if(result =="SUCCESS"){
									alert("수정이 완료되었습니다.");
									//수정 끝나면 리스트 화면으로 보내기
									location.href="/notice/noticeList";
								}
							}
						});
					}
				});
				
				// 공지삭제
				$("#noticeDeleteBtn").click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						goUrl = "/notice/noticeDelete";
						$("#f_data").attr("action",goUrl);
						$("#f_data").submit();
					}
				});
				
			}); // 최상위 끝.
			
			
			/** 수정 폼 화면 구현 함수 */
			function updateForm(currTr){
				/* 제목 가져오기 */
				let titleText = "${detail.n_title}";		
				/* 내용 가져오기 */
				let conText = "${detail.n_content}";			
				
				titleText = titleText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
				conText = conText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'); 
				
				// 버튼(수정, 삭제하기) 숨기기 및 작성폼 초기화
				currTr.find("input[type='button']").hide();
							
				let update_area = $("<span>");
				update_area.addClass("update_area");
				
				// 제목을 감싸는 <div>
				let div_deco = $("<div>");
				div_deco.addClass("input-group mb-3");
				
				// 제목 삽입
				let input_title = $("<input>");
				input_title.attr({"type" : "text", "name" : "title", "id" : "title", "maxlength" : "49"});
				input_title.addClass("form-control");
				input_title.val(titleText);
				
				// 내용을 감싸는 <div>
				let div_deco2 = $("<div>");
				div_deco2.addClass("input-group");
				// <textarea>태그에 내용 삽입 
				let textarea = $("<textarea>");
				textarea.attr({"name" : "content", "name" :"content", "id" : "content", "rows": "10"});
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
							
				update_area.append(div_deco).append(input_title).append(div_deco2).append(textarea).append(update_btn).append(reset_btn);
				$("#input_reply").append(update_area);
			}
		</script>		
	</head>
	<body>
		<div class="container">
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="n_no" value="${detail.n_no}"/>
			</form>
			
			<div class="d-grid gap-3">
				<div class="p-2 bg-light border">
					<table summary="공지게시판 상세페이지" class="table table-bordered">
						<tr data-no= "${detail.n_no}">
							<td>글번호</td>
							<td colspan="3">${detail.n_no}</td>
						</tr>
						<tr>
							<td>공지 제목</td>
							<td colspan="3" id="get_title">${detail.n_title}</td>
						</tr>
						<tr class="table-height">
							<td>공지 내용</td>
							<td colspan="3" id="get_content">${detail.n_content}</td>
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
				<br /><br />
				<div class="d-grid gap-3 m-5">
					<div class="p-2 bg-light border" id="input_reply">
						<!-- 동적 폼 입력 -->
					</div>
				</div>
			</div>
		</div>
	</body>
</html>