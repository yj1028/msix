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
		<style type="text/css">
			.aMemberDetail{ color : blue; padding :20px; 
							font-size: 20px; text-align: center;}
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				
				/* 강제 탈퇴 버튼 클릭시 제어 */
				$("#memberDeleteBtn").click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						$("#f_data").attr({
							"method":"post",
							"action":"/amember/memberDormancy"
						});
						$("#f_data").submit();
						alert("회원 강제탈퇴 성공했습니다.")
					}
				});
				
				/* 목록 버튼 클릭시 제어 */
				$("#memberListBtn").click(function(){
					location.href="/amember/memberList";
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
			    <p class="aMemberDetail">${detail.m_no}</p>
			    <%-- <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_no}" readonly> --%>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputEmail2">수정일</label>
			    <p class="aMemberDetail">${detail.m_update}</p>
			    <%-- <input type="text" class="form-control" id="exampleInputEmail2" placeholder="${detail.m_update}" readonly> --%>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">가입일</label>
			    <p class="aMemberDetail">${detail.m_date}</p>
			    <%-- <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_date}" readonly> --%>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">회원 아이디</label>
			    <p class="aMemberDetail">${detail.m_id}</p>
			   <%-- <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_id}" readonly> --%>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">회원 이름</label>
			    <p class="aMemberDetail">${detail.m_name}</p>
			    <%-- <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_name}" readonly> --%>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">회원 연락처</label>
			    <p class="aMemberDetail">${detail.m_tel}</p>
			    <%-- <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_tel}" readonly> --%>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">회원 이메일</label>
			    <p class="aMemberDetail">${detail.m_email}</p>
			    <%-- <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_email}" readonly> --%>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="exampleInputName2">탈퇴여부</label>
			    <p class="aMemberDetail">${detail.m_isdelete}</p>
			    <%-- <input type="text" class="form-control" id="exampleInputName2" placeholder="${detail.m_isdelete}" readonly> --%>
			  </div>
			</form>
		</div>
		</div>
	</body>
</html>