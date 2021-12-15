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
	
		$(function () {
			/*기본 댓글 불러오기*/
			let q_no=${detail.q_no};
			listAll(q_no);
		});
		/**댓글 목록을 보여주는 함수*/
		function listAll(q_no){
			$("#comment_list").html("");
			let url="/rboards/all/"+q_no;
			
			$.getJSON(url, function(data){
				console.log("list count: " +data.length);
				replyCnt=data.length;
				$(data).each(function(){
					var r_no=this.r_no;
					var r_title=this.r_title;
					var r_content=this.r_content;
					var r_date=this.r_date;
					r_content=r_content.replace(/(\r\n|\r|\n)/g, "<br />");
					addNewItem(r_no,r_title,r_content,r_date);
					
				});
			}).fail(function () {
				alert("답글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요");
			});
		}
		/**새로운 글을 화면에 추가하기(보여주기) 위한 함수*/		
		function addNewItem(r_no,r_title,r_content,r_date) {
			
		//새로운 글이 추가될 li 갹채
		let new_li=$("<li>");
		new_li.attr("data-num",r_no);
		//new_li.addClass("commit_item");//css디자인 요소 부여
		
		//작성자 정보가 지정될 <p>태그
		let writer_p=$("<p>");
		// writer_p.addClass("writer")l
		
		//작성자 정보의 이름
		let name_span=$("<span>");
		// name_span.addClass("name");
		name_span.html(r_title+"");
		
		//작성일시
		let date_span=$("<span>");
		date_span.html(" / "+r_date+" ");
		
		//수정하기 버튼
		//let up_input=$("<input>");
		//up_input.attr({"type":"button","value":"수정하기"});
		//up_input.addClass("update_form");// 버튼을 식별하기 위한 삭별자로써 사용할 class 명
		
		//삭제 하기 버튼
		//let del_input=$("<input>");
		//del_input.attr({"type":"button","value":"삭제하기"})
		//del_input.addClass("delete_btn");
		
		//내용
		var content_p=$("<p>");
		content_p.html(r_content);
		
		//조립하기
		writer_p.append(name_span).append(date_span)//.append(up_input).append(del_input)
		new_li.append(writer_p).append(content_p);
		$("#comment_list").append(new_li);
	}
		</script>
	
	</head>
	<body>
		<div>
		<fieldset>
			
			<table class="table table-bordered" >
				<caption>질의사항 답글</caption>
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
	</body>
</html>