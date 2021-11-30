<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>writeForm.jsp</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				<%-- 버튼 코딩할때 큰 틀로 버튼을 먼저 다 만들고 코딩하자 reply 응 그래--%>
				/* 저장 버튼 클릭 했을때 */
				$("#saveBtn").click(function(){
					if(!chkData("#b_name", "작성자를")) return;
					else if(!chkData("#b_title", "글 제목을")) return;
					else if(!chkData("#b_content", "글 내용을")) return;
					else if(!chkData("#b_pwd", "글 비밀번호를")) return;
					else {
						if($("#file").val()!= ""){
							if(!chkFile($("#file"))) return;
						}
						
						$("#f_writeForm").attr({
							"method":"post",
							"enctype" :"multipart/form-data",
							"action":"/board/boardInsert"
						});
						$("#f_writeForm").submit();
					}
				})
				
				/* 취소 버튼 클릭 했을때 */
				$("#cancelBtn").click(function(){
					$("#f_writeForm").each(function(){  <%-- 반복 문 --%>
						this.reset()                    <%-- reset 제이쿼리 처리 --%>
					});
				});
				
				/* 목록 버튼 클릭 했을때 */
				$("#returnBtn").click(function(){
					location.href="/board/boardList";
				});
			});
		</script>
	</head>
	<body>
		<div>
		<form id="f_writeForm">
			<h3>게시판 입력화면</h3>
				<div>
					<label>작 성 자</label>
					<div><input type="text" name="b_name" id="b_name" placeholder="작성자 입력" maxlength="5"/></div>
				</div>
				<div>
					<label>글 제 목</label>
					<div><input type="text" name="b_title" id="b_title" placeholder="글제목 입력" maxlength="333"/></div>
				</div>
				<div>
					<label>글 내 용</label>
					<div><textarea name="b_content" id="b_content" rows="8" maxlength="1333"/></textarea></div>
				</div>
				<div>
					<label>비밀번호</label>
					<div><input type="password" name="b_pwd" id="b_pwd" placeholder="비밀번호 입력" maxlength="6"/></div>
				</div>
				<div>
					<label>파일첨부</label>
					<input type="file" name="file" id="file" />
				</div>
				<div>
					<div><input type="button" value="저장" id="saveBtn"/></div>
					<div><input type="button" value="취소" id="cancelBtn"/></div>
					<div><input type="button" value="목록" id="returnBtn"/></div>
				</div>
		</form>
		</div>
	</body>
</html>