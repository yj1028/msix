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
		<title>Insert title here</title>
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script>
			let replyNum, message = "작성시 입력한 비밀번호를 입력해 주세요.", btnKind="";
			
			$(function(){
				let b_num = ${detail.b_num};
				listAll(b_num);
				/* 글 입력을 위한 ajax 연동 처리*/
				$("#saveBtn").click(function(){
					let insertUrl = "/replies/replyInsert";
					
					let value= JSON.stringify({
						b_num : b_num,
						r_name : $("#r_name").val(),
						r_pwd : $("#r_pwd").val(),
						r_content : $("#r_content").val()
					});
					
					/* 글 저장을 위한 post 방식의 ajax 연동 처리*/
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
							if(!chkData("#r_name","작성자를")) return false;
							else if(!chkData("#r_content","댓글내용을")) return false;
							else if(!chkData("#r_pwd","비밀번호를")) return false;
						},
						success : function(result){
							if(result =="SUCCESS") {
								alert("댓글 등록이 완료되었습니다.");
								dataReset();
								listAll(b_num);
							}
						}
					});
				});
				
				/* 수정하기 버튼 시 수정폼 동적으로 출력 */
				$(document).on("click",".update_form",function(){
					$(".reset_btn").click();
					let currLi = $(this).parents("li");
					replyNum = currLi.attr("data-num");
					pwdReset(this);
					pwdView(currLi);
					btnKind="upBtn";
				});
				
				/* 수정화면에서 수정취소버튼(초기화) 클릭처리  */
				$(document).on("click",".reset_btn",function(){
					btnKin="";
					
					let context =$(this).parents("li").find("textarea").html();
					context = context.replace(/(\r\n|\r|\n)/g,"<br />");
					$(this).parents("li").find("input[type='button']").show();
					
					let conArea = $(this).parents("li").children().eq(1);
					conArea.html(context);
				});
				
				/* 수정화면에서 수정완료 버튼 클릭 시 수정을 위한 ajax 연동 처리*/
				$(document).on("click",".update_btn",function(){
					let r_num = $(this).parents("li").attr("data-num");
					let r_content = $("#content").val();
					
					if(!chkData("#content","댓글 내용을")) return;
					else {
						$.ajax({
							url : '/replies/'+r_num,
							type: "put",
							headers :{
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" :"PUT"
							},
							data: JSON.stringify({
								r_content:r_content
							}),
							dataType :'text',
							error: function(){
								alert("시스템 오류입니다. 관리자에게 문의하세요.");
							},
							success: function(result){
								console.log("result: "+result);
								if(result =="SUCCESS"){
									alert("수정이 완료되었습니다.");
									listAll(b_num);
								}
							}
						});
					}
				});
				
				/* 삭제하기 버튼 클릭 처리*/
				$(document).on("click",".delete_btn",function(){
					$(".reset_btn").click();	// 다른 작업 닫기
					let currLi = $(this).parents("li");
					replyNum = currLi.attr("data-num");
					pwdReset(this);
					pwdView(currLi);
					btnKind="delBtn";
				});
				
				
				/* 비밀번호 체크화면에서 취소버튼 클릭 처리*/
				$(document).on("focus",".pwdResetBut",function(){
					pwdReset(this);
				});
				
				/* 비밀번호 입력양식에 커서 주었을 때 이벤트*/
				$(document).on("focus",".passwd",function(){
					$(this).val("");
					let span = $(this).parents("form").find("span");
					span.removeClass("msg_error");
					span.addClass("msg_default");
					span.html(message);
				});
				
				/* 비밀번호 확인 버튼 클릭시 처리 이벤트*/
				$(document).on("focus",".pwdCheckBut", function(){
					let li = $(this).parents("li");
					let form =$(this).parents("form");
					let pwd = form.find(".passwd");
					let msg = form.find(".msg");
					let result = 0;
					
					if(!formCheck(pwd, msg, "비밀번호를")) return;
					else {
						$.ajax({
							url : "/replies/pwdConfirm",
							type : "post",
							data : "r_num="+replyNum+"&r_pwd="+pwd.val(),
							dataType : "text",
							error : function(){
								alert('시스템오류입니다. 관리자에게 문의하세요.');
							},
							success : function(resultData){
								console.log("resultData : "+ resultData);
								if(resultData == 0){
									msg.addClass("msg_error");
									msg.text("입력한 비밀번호가 일치하지 않습니다.");
								}else if(resultData == 1) {
									pwdReset(form);
									//console.log("비밀번호가 일치합니다.");
									console.log("btnKind : " + btnKind);
									if(btnKind =="upBtn"){
										updateForm(li);
									}else if(btnKind=="delBtn"){
										deleteBtn(b_num);
									}
									btnKind="";
								}
							}
						})
					}
					
				});
			});
			
			/** 수정 폼 화면 구현 함수 */
			function updateForm(currLi){
				let conArea = currLi.children().eq(1);	//두번째 p 태그
				let conText = conArea.html();			//댓글내용 가져오기
				conText = conText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
				console.log("conText: " + conText);
								
				currLi.find("input[type='button']").hide();
				conArea.html("");
							
				let update_area = $("<span>");
				update_area.addClass("update_area");
							
				let textarea = $("<textarea>");
				textarea.attr({"name" : "content", "id" : "content"});
				textarea.html(conText);
							
				let update_btn = $("<input>");
				update_btn.attr({"type" : "button", "value" : "수정완료"});
				update_btn.addClass("update_btn");
							
				let reset_btn = $("<input>");
				reset_btn.attr({"type" : "button", "value" : "수정취소"});
				reset_btn.addClass("reset_btn");
							
				update_area.append(textarea).append(update_btn).append(reset_btn);
				conArea.html(update_area);
			}
						
			/** 비밀번호 체크를 화면 구현 */ 
			function pwdView(area){
				let pwd_div = $("<div>");
				pwd_div.addClass("pwdArea");
							
				let pwd_form = $("<form>");
				pwd_form.attr("name", "f_pwd");
							
				let pwd_label = $("<label>");
				pwd_label.attr("for", "passwd");
				pwd_label.html("비밀번호 : ");
						
				let pwd_input = $("<input>");
				pwd_input.attr({"type" : "password", "name" : "passwd"});
				pwd_input.addClass("passwd");
				pwd_input.prop("autofocus", "autofocus");
							
				let pwd_check = $("<input>");
				pwd_check.attr({"type" : "button", "value" : "확인"});
				pwd_check.addClass("pwdCheckBut");
							
				let pwd_reset = $("<input>");
				pwd_reset.attr({"type" : "button", "value" : "취소"});
				pwd_reset.addClass("pwdResetBut");
							
				let pwd_span = $("<span>");
				pwd_span.addClass("msg");
				pwd_span.html(message);
							
				pwd_form.append(pwd_label).append(pwd_input).append(pwd_check).append(pwd_reset).append(pwd_span);
				pwd_div.append(pwd_form)
				area.append(pwd_div);
			}
			
			/* 비밀번호 체크 화면에서 "취소" 버튼 클릭 처리 */
			function pwdReset(target){
				$("li .pwdArea").not(this).html("");
				$(target).parents("li").find(".pwdArea").html("");
			}
			
			/* 글 삭제를 위한 ajax 연동 처리 */
			function deleteBtn(b_num) {
				if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
					$.ajax({
						url : '/replies/'+replyNum,
						type : "delete",
						headers : {
							"X-HTTP-Method-Override" : "DELETE"
						},
						dataType : "text",
						success : function(result) {
							console.log("result: "+result);
							if(result =="SUCCESS"){
								alert("삭제되었습니다.");
								listAll(b_num);
							}
						}
					});
				}
			}
			
			/* 댓글 목록을 보여주는 함수 */
			function listAll(b_num){
				$("#comment_list").html("");
				let url = "/replies/all/"+b_num;
				
				$.getJSON(url,function(data){
					console.log("list count : " + data.length);
					replyCnt = data.length;
					$(data).each(function(){
						var r_num = this.r_num;
						var r_name = this.r_name;
						var r_content =this.r_content;
						var r_date = this.r_date;
						//엔터 제어
						r_content = r_content.replace(/(\r\n|\r|\n)/g, "<br />");
						addNewItem(r_num, r_name, r_content, r_date);
					});
				}).fail(function(){
					alert("댓글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
				});
			}
			/* 새로운 글을 화면에 추가하기 위한 함수*/
			function addNewItem(r_num, r_name, r_content, r_date) {
				//<li> 태그 생성
				let new_li = $("<li>");
				new_li.attr("data-num", r_num);
				//new_li.addClass("comment_item");
				
				//<p> 태그 생성
				let writer_p = $("<p>");
				//new_li.addClass("writer");
				
				// <span> 태그 생성 및 [r_name + "님"] 삽입 
				let name_span = $("<span>");
				//new_li.addClass("name");
				name_span.html(r_name + "님");
				
				let date_span = $("<span>");
				date_span.html(" / "+ r_date + " ");
				
				let up_input = $("<input>");
				up_input.attr({"type" : "button", "value" : "수정하기"});
				up_input.addClass("update_form"); // 버튼 식별자로 사용할 클래스명
				
				let del_input = $("<input>");
				del_input.attr({"type": "button", "value" : "삭제하기"});
				del_input.addClass("delete_btn");
				
				//내용
				var content_p = $("<p>");
				content_p.html(r_content);
				
				//조립하기
				writer_p.append(name_span).append(date_span).append(up_input).append(del_input)
				new_li.append(writer_p).append(content_p);
				$("#comment_list").append(new_li);
			}
			
			function dataReset(){
				//$("#r_name").val("");
				//$("#r_content").val("");
				//$("#r_pwd").val("");
				$("#insertForm").each(function(){
					this.reset();
				}); 
			}
		</script>
	</head>
	<body>
		<label>댓글</label>
		<div id="replyContainer">
			<div id="comment_write">
				<form id="insertForm">
					<!-- 입력화면 구현 -->
					<div>
						<label>작성자</label>
						<input type="text" id="r_name" name="r_name" maxlength="5" />
						<label>비밀번호</label>
						<input type="password" id="r_pwd" name="r_pwd" maxlength="18" />
						<input type="button" value="저장하기" id="saveBtn" />
					</div>
					<div>
						<label>댓글 내용</label>
						<textarea cols="40" rows="2" id="r_content" name="r_content"></textarea>
					</div>
				</form>
			</div>
			<ul id="comment_list">
				<!-- 동적 생성 요소 추가 -->
			</ul>
		</div>
	</body>
</html>