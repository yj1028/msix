<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>memberDetail</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				
				/* 강제 탈퇴 버튼 클릭시 제어 */
				$("#memberDeleteBtn").click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						$("#f_data").attr({
							"method":"post",
							"action":"/member/memberDormancy"
						});
						$("#f_data").submit();
						alert("회원 강제탈퇴 성공했습니다.")
					}
				});
				
				/* 목록 버튼 클릭시 제어 */
				$("#memberListBtn").click(function(){
					location.href="/member/memberList";
				});
			});
		</script>
	</head>
	<body>
		<div>
		<h2>회원 상세 정보</h2>
		<%-- 수정 및 삭제 시 글번호, 원본파일명, 썸네일파일명을 전달하는 폼 --%>
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="m_no" value="${detail.m_no}"/>
		</form>

		<div class="text-right">
			<button type="button" class="btn btn-danger" id="memberDeleteBtn">강제탈퇴</button>
			<button type="button" class="btn btn-default" id="memberListBtn">목록</button>
		</div>
		
		<div class="text-left">
			<form class="form-inline">
			  <div class="form-group">
			    <label for="exampleInputName2">회원번호</label>
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_no}" readonly>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputEmail2">수정일</label>
			    <input type="text" class="form-control" id="exampleInputEmail2" placeholder="${detail.m_udate}" readonly>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">가입일</label>
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_date}" readonly>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">회원 아이디</label>
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_id}" readonly>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">회원 이름</label>
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_name}" readonly>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">회원 연락처</label>
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_tel}" readonly>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">회원 이메일</label>
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_email}" readonly>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">탈퇴여부</label>
			    <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_isdelete}" readonly>
			  </div>
			</form>
		</div>
		
			<%-- <div>
				<table class="table">
					<tr>
						<td>회원번호</td>
						<td>${detail.m_no}</td>
					</tr>
					<tr>
						<td>수정일</td>
						<td>${detail.m_udate}</td>
					</tr>
					<tr>
						<td>가입일</td>
						<td>${detail.m_date}</td>
					</tr>
					<tr>
						<td>회원 아이디</td>
						<td>${detail.m_id}</td>
					</tr>
					<tr>
						<td>회원 이름</td>
						<td>${detail.m_name}</td>
					</tr>
					<tr>
						<td>회원 연락처</td>
						<td>${detail.m_tel}</td>
					</tr>
					<tr>
						<td>회원 이메일</td>
						<td>${detail.m_email}</td>
					</tr>
					<tr>
						<td>탈퇴 여부</td>
						<td>${detail.m_isdelete}</td>
					</tr>
				</table>
			</div> --%>
		</div>
	</body>
</html>