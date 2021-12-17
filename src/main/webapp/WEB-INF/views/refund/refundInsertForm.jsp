<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>refundInsert</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#refundInsertBtn").click(function(){
					if(!chkData("#rf_title","글 제목을")) return;
					else if(!chkData("#rf_reason","환불 사유를")) return;
					else if(!chkData("#file","상품 이미지를")) return;
					else {
						if($("#file").val() != ""){
							if (!chkFile($("#file"))) return;
						}
						$("#rf_writeForm").attr({
							"method":"post",
							"enctype":"multipart/form-data",
							"action":"/refund/refundInsert"
						});
						$("#rf_writeForm").submit();
					}
				});
				
				$("#returnBtn").click(function(){
					location.href="/orders/orderDetailList";
				});
			});
		</script>
	</head>
	<body>
		
		<div>
			<form id="rf_writeForm">
				<input type="hidden" name="d_no" id="d_no" value="${detail.d_no}"/>
				<input type="hidden" name="rf_total" id="rf_total" value="${detail.d_price}"/>
				<h3>환불 신청</h3>
					<div>
						<label>환불 글 제목</label>
						<div>
						<input type="text" class="form-control" name="rf_title" id="rf_title" placeholder="환불 글 제목을 입력해주세요." maxlength="150"/>
						</div>
					</div>
					<div>
						<label>환불 사유</label>
						<div>
						<textarea class="form-control" name="rf_reason" id="rf_reason" placeholder="환불 사유를 입력해주세요." maxlength="5000" rows="8"></textarea>
						</div>
					</div>
					<div>
						<label>환불 이미지 파일첨부</label>
						<div><input type="file" name="file" id="file" /></div>
					</div>
					<div>
						<div><input type="button" value="저장" id="refundInsertBtn"/></div>
						<div><input type="button" value="목록" id="returnBtn"/></div>
					</div>
			</form>
		</div>
		
	</body>
</html>