<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>Insert title here</title>
	<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
	
		
		$(function () { //c최상위 시작
			/*기본 댓글 불러오기*/
			let rv_no=${detail.rv_no};
			listAll(rv_no);	
			
			/*글입력을 위한 Ajax 연동 처리*/
			$("#insertBtn").click(function() {
				let insertUrl="/ccmnts/ccmntInsert"
				let value=JSON.stringify({
					rv_no:rv_no,
					c_comment:$("#c_comment").val()					
				});
				//console.log(value)
				$.ajax({
					url: insertUrl, //전송url
					type: "post",
					headers:{
						"Content-Type":"application/json"
						},
					dataType: "text",
					data : value,
					error:function(){
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},
					beforeSend:function(){
						if(!chkData("#c_comment","댓글내용을")) return false;
					},
					success:function(result){
						if(result=="SUCCESS"){
							alert("댓글이 등록이 완료되었습니다");
							dataReset();
							listAll(rv_no);
						}
					}
				});
			});
			/*수정하기 버튼 클릭시 수정폼 출력*/
			$(document).on("click",".update_form",function(){
				//$(".reset_btn").click();
				let currLi= $(this).parents("li");
				updateForm(currLi);
				replyNum=currLi.attr("data-num");
				btnKind="upBtn";
			});
			
			/*수정화면에서 수정취소 버튼 (초기화)*/
			$(document).on("click",".reset_btn",function(){
				btnKind="";
				
				var conText= $(this).parents("li").find("textarea").html();
				conText=conText.replace(/(\r\n|\r\n)/g,"<br/>");
				$(this).parents("li").find("input[type='button']").show();
				
				let conArea=$(this).parents("li").children().eq(1);
				conArea.html(conText);
			});
			/*수정화면에서 수정 완료 버튼 클릭시 수정을 위한 Ajax 연동처리*/
			$(document).on("click",".update_btn", function() {
				let c_no=$(this).parents("li").attr("data-num");
				let c_comment=$("#content").val();
				console.log("c_no"+c_no);
				console.log("c_comment"+c_comment);
				if(!chkData("#content","댓글 내용을")) return;
				else {
					$.ajax({
						url:'/ccmnts/'+c_no,
						type:'put',
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"PUT"
						},
						data:JSON.stringify({
							c_comment:c_comment}),
						dataType:'text',
						error: function () {
							alert("시스탬 오류입니다. 관리자에게 문의 하세요");
						},
						success: function(result){
							console.log("result"+result);
							if(result=="SUCCESS"){
								alert("수정이 완료되었습니다.");
								listAll(rv_no);
							}
						}
					});
				}
			});
			/*삭제하기 버튼 클릭 처리*/
			$(document).on("click",".delete_btn",function(){
				//$(".reset_btn").click();
				let currLi= $(this).parents("li");
				replyNum=currLi.attr("data-num");
				deleteBtn(rv_no);
				
			});
			
			
			
		}); // 최상위 종료
		
		/*글 삭제를위한 Ajax 연동 처리**/
		function deleteBtn(rv_no){
			if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
				$.ajax({
					url:'/ccmnts/'+replyNum,
					type:'delete',
					headers:{
						"X-HTTP-Method-Override":"DELETE"
					},
					dataType:'text',
					success: function(result) {
						console.log("result:"+result);
						if(result=='SUCCESS'){
							alert("삭제되었습니다");
							listAll(rv_no);
						}
					}
				});
			}
		}
		
		/** 수정 폼 화면 구현 함수 */
		function updateForm(currLi){
			let conArea = currLi.children().eq(1);
			let conText = conArea.html();
			conText = conText.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
			console.log("conText: " + conText);
							
			currLi.find("input[type='button']").hide();
			conArea.html("");
						
			let update_area = $("<span>");
			update_area.addClass("update_area");
						
			let textarea = $("<textarea maxlength='1000' style='resize: none;' rows='3' cols='100'>");
			textarea.attr({"name" : "content", "id" : "content"});
			textarea.html(conText);
			
			let update_btn = $("<input class='btn btn-default'>");
			update_btn.attr({"type" : "button", "value" : "수정완료"});
			update_btn.addClass("update_btn");
						
			let reset_btn = $("<input class='btn btn-default'>");
			reset_btn.attr({"type" : "button", "value" : "수정취소"});
			reset_btn.addClass("reset_btn");
						
			update_area.append(textarea).append(update_btn).append(reset_btn);
			conArea.html(update_area);
		}
		
		
		
		/**댓글 목록을 보여주는 함수*/
		function listAll(rv_no){
			$("#comment_list").html("");
			let url="/ccmnts/all/"+rv_no;
			
			$.getJSON(url, function(data){
				console.log("list count: " +data.length);
				replyCnt=data.length;
				$(data).each(function(){
					var c_no=this.c_no;
					var m_name=this.m_name;
					var c_comment=this.c_comment;
					var c_date=this.c_date;
					c_comment=c_comment.replace(/(\r\n|\r|\n)/g, "<br />");
					addNewItem(c_no,m_name,c_comment,c_date);
					
				});
			}).fail(function () {
				alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요");
			});
		}
		/**새로운 글을 화면에 추가하기(보여주기) 위한 함수*/		
		function addNewItem(c_no,m_name,c_comment,c_date) {
			
			//새로운 글이 추가될 li 갹채
			let new_li=$("<li>");
			new_li.attr("data-num",c_no);
			//new_li.addClass("commit_item");//css디자인 요소 부여
			
			//작성자 정보가 지정될 <p>태그
			let writer_p=$("<p>");
			// writer_p.addClass("writer")l
			
			//작성자 정보의 이름
			let name_span=$("<strong><span>");
			// name_span.addClass("name");
			name_span.html(m_name);
			
			//작성일시
			let date_span=$("<span>");
			date_span.html(" / "+c_date+" ");
			
			//수정하기 버튼
			let up_input=$("<input class='btn btn-default' >");
			up_input.attr({"type":"button","value":"수정하기"});
			up_input.addClass("update_form");// 버튼을 식별하기 위한 삭별자로써 사용할 class 명
			
			//삭제 하기 버튼
			let del_input=$("<input class='btn btn-default' >");
			del_input.attr({"type":"button","value":"삭제하기"})
			del_input.addClass("delete_btn");
			
			//내용
			var content_p=$("<p>");
			content_p.html(c_comment);
			
			//조립하기
			writer_p.append(name_span).append(date_span).append(up_input).append(del_input)
			new_li.append(writer_p).append(content_p);
			$("#comment_list").append(new_li);
		
		}	
		function dataReset() {		
			$("#c_comment").val("");
		}
		</script>
	</head>
	<body>
			<div id="cmmntContainer">
				<div id="comment_write">
					<form id="insertForm">
					<c:if test="${not empty login}">
						<table class="table table-striped">
							<tr>
								<th> <label>댓글내용</label> </th>
							</tr>
							<tr>
								<td> <textarea maxlength="2000" style="resize: none;" rows="3" cols="144" id="c_comment" name="c_comment"></textarea> </td>
							</tr>
							<tr>
								<td><label><button class="btn btn-default" type="button" id="insertBtn">저장하기</button></label></td> 
							</tr>						
						</table>
					</c:if>
					</form>	
				</div>
			<div>
				<fieldset>
					<table class="table table-striped" >
						<caption>리뷰 게시판 댓글</caption>
						<tr>
							<td class="text-left">
								<ol type="1" id="comment_list">
						<!--여기에 동작 생성 요소 추가-->
								</ol>
							</td> 
						</tr>
					</table>
				</fieldset>	
			</div>
		</div>
	</body>
</html>