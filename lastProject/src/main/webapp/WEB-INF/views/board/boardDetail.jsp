<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>boardDetail.jsp</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			let buttonCheck = 0;
			
			$(function(){
				$("#pwdChk").css("visibility", "hidden");
				
				/* 글수정 버튼 클릭시 제어 */
				$("#updateFormBtn").click(function(){
					$("#pwdChk").css("visibility", "visible");
					$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "#000099");
					buttonCheck = 1;
				});
				
				/* 글삭제 버튼 클릭시 제어 
				$("#boardDeleteBtn").click(function(){
					$("#pwdChk").css("visibility", "visible");
					$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "#000099");
					buttonCheck = 2;
				}); */
				
				/* 글삭제버튼 클릭 시 댓글개수 확인 후 처리 이벤트  */
				$("#boardDeleteBtn").click(function(){
					$.ajax({
						url : "/board/replyCnt",
						type : "post",
						data : "b_num="+$("#b_num").val(),
						dataType : "text",
						error : function(){
							alert("시스템 오류. 관리자에게 문의 하세요.");
						},
						success : function(resultData){
							if(resultData == 0){
								$("#pwdChk").css("visibility", "visible");
								$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "#000099");
								buttonCheck = 2;
							}else {
								alert("댓글 존재 시 게시물을 삭제할 수 없습니다.\n댓글 삭제 후 다시 확인해 주세요.");
								return;
							}
						}
					});
				});
				
				/* 비밀번호 확인 버튼 클릭 시 제어 */
				$("#pwdBtn").click(function(){
					boardPwdConfirm();
				});
				
				/* 글쓰기 버튼 클릭시 제어 */
				$("#insertFormBtn").click(function(){
					location.href="/board/writeForm";
				});
				
				/* 목록 버튼 클릭시 제어 */
				$("#boardListBtn").click(function(){
					location.href="/board/boardList";
				});
			
			});
			
			function boardPwdConfirm(){
				if(!formCheck($('#b_pwd'),$('#msg'),"비밀번호를")) return;
				else {
					$.ajax({
						url : "/board/pwdConfirm",      // 전송 url
						type : "post",					// 전송시 method 방식
						data : $("#f_pwd").serialize(), // 폼전체 데이터 전송
						dataType : "text",
						error : function(){             // 실행시 오류가 발생하였을 경우
							alert('시스템 오류 입니다. 관리자에게 문의 하세요');
						},
						success : function(resultData){ // 정상적으로 실행이 되었을 경우
							var goUrl = "";             // 이동할 경로를 저장할 변수
							if(resultData == "불일치"){	// 일치하지 않는 경우
								$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
								$("#b_pwd").select();
							} else if(resultData == "일치"){ // 일치할 경우
								$("#msg").text("");
								if(buttonCheck == 1){ // 수정버튼 클릭시
									goUrl = "/board/updateForm";
									$("#f_data").attr("action",goUrl);
									$("#f_data").submit();
								}else if(buttonCheck == 2){ // 삭제버튼 클릭시
									if(confirm("정말 삭제하시겠습니까?")){
										goUrl = "/board/boardDelete";
										$("#f_data").attr("action",goUrl);
										$("#f_data").submit();
									}
								}
							}
						}
					});
				}
			}
			
		</script>
	</head>
	<body>
		<div class="container">
			<h2>게시판 상세화면</h2>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="b_num" value="${detail.b_num}"/>
				<input type="hidden" name="b_file" value="${detail.b_file }" />
				<input type="hidden" name="b_thumb" value="${detail.b_thumb }" />
			</form>
			
			<div id="pwdChk">
				<form name="f_pwd" id="f_pwd">
					<input type="hidden" name="b_num" id="b_num" value="${detail.b_num}" />
					<label>비밀번호:</label>
					<input type="password" name="b_pwd" id="b_pwd"/>
					
					<input type="button" value="확인" id="pwdBtn"/>
					<span id="msg"></span>
				</form>
			</div>
			<div>
				<input type="button" value="글수정" id="updateFormBtn" />
				<input type="button" value="글삭제" id="boardDeleteBtn" /> 
				<input type="button" value="글쓰기" id="insertFormBtn" />
				<input type="button" value="목록" id="boardListBtn" />
			</div>
			<div>
				<table>
					<tr>
						<td>글번호</td>
						<td>${detail.b_num}</td>
						<td>작성일</td>
						<td>${detail.b_date}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="3">${detail.b_name}</td>
					</tr>
					<tr>
						<td>글제목</td>
						<td colspan="3">${detail.b_title}</td>
					</tr>
					<tr class="table-height">
						<td>글내용</td>
						<td colspan="3">${detail.b_content}</td>
					</tr>
					<c:if test="${not empty detail.b_file }">
						<td>이미지</td>
						<td><img src="/uploadStorage/board/${detail.b_file }"></td>
					</c:if>
				</table>
			</div>
			<%-- 상세 정보 보여주기 --%>
			<jsp:include page="reply.jsp" />
		</div>
	</body>
</html>