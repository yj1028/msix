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
			#p_name {width: 400px;}
			#p_type {width: 120px;}
			#p_info {resize: none;}
			#p_price {width: 100px;}
			#p_cnt {width: 80px;}
			#i_img {
				position: relative;
				left: 21px;
			}
			input[type=file] {
				position: relative;
				left: 16px;
			}
			.m_img {margin-bottom: 8px}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				
				/* 등록 버튼 클릭 시 처리 이벤트 */
				$("#productInsertBtn").click(function(){
					let p_type = $("#p_type").val();
					let p_code = "";
					if(p_type == "Gecko"){
						p_code = "GK10";
					}else if(p_type == "Lizard"){
						p_code = "LZ20";
					}else if(p_type == "Turtle"){
						p_code = "TR30";
					}else if(p_type == "Amphibian"){
						p_code = "AB40";
					}else if(p_type == "Food"){
						p_code = "FD50";
					}else if(p_type == "Supplies"){
						p_code = "SP60";
					}
					$("#p_code").val(p_code);
					
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
						$("#p_price").val("");
						$("#p_price").focus();
						return;
					}
					else if($("#p_price").val() < 0){
						alert("음수는 입력할 수 없습니다.");
						$("#p_price").val("");
						$("#p_price").focus();
						return;
					}
					else if(!chkData("#p_cnt", "수량을")) return;
					else if($("#p_cnt").val() < 1 || $("#p_cnt").val() > 999){
						alert("수량은 1~999까지의 숫자만 입력 가능합니다.");
						$("#p_cnt").val("");
						$("#p_cnt").focus();
						return;
					}
					else if(!chkData("#file0", "썸네일을 생성할 이미지 파일을")) return;
					else if(!chkFile($("#file0"))) return; 
					else{
						if($("#file1").val() != ""){
							if(!chkFile($("#file1"))) return;
						}else if($("#file2").val() != ""){
							if(!chkFile($("#file2"))) return;
						} 
						$("#f_writeForm").attr({
							method:"post",
							enctype:"multipart/form-data",
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
				 <input type="hidden" name="p_code" id="p_code" />
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
			      <input type="number" class="form-control" name="p_cnt" id="p_cnt" min="1" max="999" />
			    </div>
			  </div>
			  <br />
			  <div class="form-group" id="i_img">
			    <div class="col-sm-10 m_img">
			      <label class="col-sm-2 control-label">메인이미지</label>
			      <input type="file" name="list[0].file" id="file0" />
			    </div>
			    <div class="col-sm-10 m_img">
			      <label class="col-sm-2 control-label">상세이미지1</label>
			      <input type="file" name="list[1].file" id="file1" />
			    </div>
			    <div class="col-sm-10 m_img">
			      <label class="col-sm-2 control-label">상세이미지2</label>
			      <input type="file" name="list[2].file" id="file2" />
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10 text-left">
			      <button type="button" class="btn btn-primary" id="productInsertBtn">등록</button>
			      <button type="button" class="btn btn-danger" id="productCancelBtn">취소</button>
			      <button type="button" class="btn btn-info" id="productListBtn">목록</button>
			    </div>
			  </div>
			</form>
		</div>
	</body>
</html>