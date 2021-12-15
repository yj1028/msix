<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<style type="text/css">
			table{
				margin-top:200px;
			}
		</style>
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script>
			$(function(){
				// 카카오 주소 검색 api
	           	document.getElementById("a_address").addEventListener("click", function(){
	                 new daum.Postcode({
	                     oncomplete: function(data) {
	                     document.getElementById("a_pcode").value = data.zonecode;
	                         document.getElementById("a_addr").value = data.address;
	                         document.querySelector("input[name='a_daddr']").focus();
	                     }
	                 }).open();
	             }); 
				
	            $("#insertBtn").click(function(){				
					if (!chkData("#a_destn","배송지를"))return;
					else if (!chkData("#a_addr","기본주소를"))return;
					else if (!chkData("#a_daddr","상세주소를"))return;
					else{
						$("#infrm").attr({
							"method":"post",
							"action":"/address/addressInsert"
						});
						$("#infrm").submit();
					}
				});
				
	            $("#cancelBtn").click(function(){
					location.href = "/address/addressList";
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
			<div><h2>배송지 입력화면</h2></div>
			<%-- <input type="hidden" name="m_no" value="${login.m_no}"/> --%>
			<form name="infrm" id="infrm">
				<table class="table table-striped">
					<tr>
						<td><label>이름</label></td>
						<td><h5>${login.m_name}</h5></td>
					</tr>
					<tr>
						<td><label for="author">배송지명</label></td>
						<td><input type="text" id="a_destn" name="a_destn" maxlength="5"></td>
					</tr>
					<tr>
						<td><label for="title">우편번호 - </label></td>
						<td><input type="text" id="a_pcode" name="a_pcode" placeholder="우편번호" maxlength="5">
						<input type="button" id="a_address" value="우편번호 찾기" /><br /><br />
						<input type="text" maxlength="30" size="50" id="a_addr" name="a_addr" placeholder="기본주소"/><br /><br />
						<input type="text" maxlength="30" size="50" id="a_daddr" name="a_daddr" placeholder="상세주소"/></td>
					</tr>
					</table>
					<div class="text-right">
						<button type="button" class="btn btn-primary" id="insertBtn">저장</button>
						<button type="button" class="btn btn-primary" id="cancelBtn">취소</button>
					</div>
			</form>
		</div>
	</body>
</html>