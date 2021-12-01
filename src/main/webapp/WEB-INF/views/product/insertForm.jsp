<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>insertForm.jsp</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
	
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<style type="text/css">
			#p_name {width:400px;}
			#p_type {width:110px;}
			#p_content {resize:none;}
			#p_price {width:100px;}
			#p_cnt {width:80px;}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				
				/* 등록 버튼 클릭 시 처리 이벤트 */
				$("#productInsertBtn").click(function(){
					console.log($("#p_type option:selected").val());
					// 입력값 체크
					if(!chkData("#p_name", "상품명을")) return;
					else if($("#p_type option").index($("#p_type option:selected"))==0){
						alert("상품분류를 선택해 주세요.");
						$("#p_type").focus();
						return;
					}else if(!chkData("#p_info", "상품정보를")) return;
					else if(!chkData("#p_price", "상품가격을")) return;
					else if($.isNumeric($("#p_price").val())==false){
						alert("가격은 숫자만 입력해 주세요.");
						$("#p_price").focus();
						return;
					}
					else if($("#p_price").val() < 0){
						alert("음수는 입력할 수 없습니다.");
						$("#p_price").focus();
						return;
					}
					else if(!chkData("#p_cnt", "수량을")) return;
					else if($("#p_cnt").val() <= 0 || $("#p_cnt").val() >= 100){
						alert("수량은 1~99까지의 숫자만 입력 가능합니다.");
						$("#p_cnt").val("");
						$("#p_cnt").focus();
					/* 이미지 파일 업로드 유효성체크 해야함 */	
					}else{
						$("#f_writeForm").attr({
							method:"post",
							/* enctype:"multipart/form-data",*/
							action:"/product/productInsert"
						});
						$("#f_writeForm").submit();
					}
				});
				
				/* 취소 버튼 클릭 시 처리 이벤트 */
				$("#productCancelBtn").click(function(){
					$("#f_writeForm").each(function(){
						this.reset();
					});
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#productListBtn").click(function(){
					location.href="/product/productList"
				});
			}); // 최상위 $종료
		</script>
	</head>
	<body>
		<div class="container">
			<form class="form-horizontal" id="f_writeForm">
				<input type="hidden" name="p_code" id="p_code /">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">상품이미지</label>
			    <div class="col-sm-10">
			      <input type="file" name="file" id="file" />
			    </div>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="p_name" class="col-sm-2 control-label">상품명</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="p_name" id="p_name" placeholder="상품명" maxlength="32"/>
			    </div>
			  </div>
			  <br />
			  <div class="form-group">
			   	<label for="p_type" class="col-sm-2 control-label text-left">상품분류</label>
			    <div class="col-sm-10">
			      	<select class="form-control" name="p_type" id="p_type">
			      		<option>---선택---</option>
						<option value="Gecko">Gecko</option>
						<option value="Lizard">Lizard</option>
						<option value="Turtle">Turtle</option>
						<option value="Amphibian">Amphibian</option> 
						<option value="Food">Food</option>
						<option value="Supplies">Supplies</option>                  	
					</select>
			   </div>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="passwd" class="col-sm-2 control-label">상품정보</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" name="p_info" id="p_info" rows="12" maxlength="1330"></textarea>
			    </div>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="file" class="col-sm-2 control-label">상품가격</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="p_price" id="p_price" placeholder="상품가격" maxlength="9" />
			    </div>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="file" class="col-sm-2 control-label">수량</label>
			    <div class="col-sm-10">
			      <input type="number" class="form-control" name="p_cnt" id="p_cnt" min="1" max="99" />
			    </div>
			  </div>
			  <br />
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10 text-left">
			      <button type="button" class="btn btn-default" id="productInsertBtn">등록</button>
			      <button type="button" class="btn btn-default" id="productCancelBtn">취소</button>
			      <button type="button" class="btn btn-default" id="productListBtn">목록</button>
			    </div>
			  </div>
			</form>
		</div>
	</body>
</html>