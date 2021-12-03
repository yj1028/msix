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
		
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<style type="text/css">
			#p_name {width:300px;}
			#p_price {width:100px;}
			#p_type {width:120px;}
			#detailTable{width:80%;}
			.table-height{min-height: 500px;}
			.img img{width: 100px; height: 100px;}
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			
			$(function(){
				
				$("#p_type").val("${updateData.p_type}").prop("selected", true);
				
				/* 수정 버튼 클릭 시 처리 이벤트 */
				$("#productUpdateBtn").click(function(){
					//입력값 체크
					if(!chkData("#p_name", "상품명을")) return;
					else if(!chkData("#p_info", "상품정보를")) return;
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
					else{
						if($("#file").val() != ""){
							if(!chkFile($("#file"))) return;
						}
						$("#f_updateForm").attr({
							method : "post",
							enctype : "multipart/form-data",
							action : "/product/productUpdate"
						});
						$("#f_updateForm").submit();
					}
				});
				
				/* 취소 버튼 클릭 시 처리 이벤트 */
				$("#productCancelBtn").click(function(){
					$("#f_updateForm").each(function(){
						this.reset();
					});
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#productListBtn").click(function(){
					location.href="/product/productList";
				});
			}); // 최상위 $종료	
		</script>
	</head>
	<body>
		<div class="container">
			<form id="f_updateForm" name="updateForm">
				<input type="hidden" name="p_no" id="p_no" value="${updateData.p_no}">
				<input type="hidden" name="p_file" id="p_file" value="${ updateData.p_file }" />
				<input type="hidden" name="p_thumb" id="p_thumb" value="${ updateData.p_thumb }" />
				<div class="form-group">
				    <label class="col-sm-2 control-label">상품이미지</label>
				    <div class="select_img text-left">
				    	<img src="/uploadStorage/product/${updateData.p_file}" />
				    </div>    
				</div>
				<table class="table table-bordered" id="detailTable" style="margin-left: auto; margin-right: auto;">
					<tr>
						<td>상품번호</td>
						<td>${updateData.p_no}</td>
						<td>상품명</td>
						<td><input type="text" name="p_name" id="p_name" value="${updateData.p_name}" class="form-control" /></td>
					</tr> 
					<tr>
						<td>상품분류</td>
						<td>
							<select class="form-control" name="p_type" id="p_type">
								<option value="Gecko">Gecko</option>
								<option value="Lizard">Lizard</option>
								<option value="Turtle">Turtle</option>
								<option value="Amphibian">Amphibian</option> 
								<option value="Food">Food</option>
								<option value="Supplies">Supplies</option>                  	
							</select>
						</td>
						<td>상품가격</td>
						<td><input type="text" name="p_price" id="p_price" value="${updateData.p_price}" class="form-control text-left"
							maxlength="9" /></td>
						<td>재고</td>
						<td>${updateData.p_cnt}</td>
					</tr>
					<tr class="table-height">
						<td>상품정보</td>
						<td colspan="5" class="text-left">
							<textarea name="p_info" id="p_info" rows="8" class="form-control table-height">${ updateData.p_info }</textarea>
						</td>
					</tr>
				</table>
				<div class="form-group">
				    <label class="col-sm-2 control-label">상품이미지 수정</label>
				    <div class="col-sm-10">
				      <input type="file" name="file" id="file" />
				    </div>
				    <div class="select_img text-left"><img src=""></div>
				    
				    <script type="text/javascript">
					    $("#file").change(function(){
							if(this.files && this.files[0]){
								var reader = new FileReader;
								reader.onload = function(data){
									$(".select_img img").attr("src", data.target.result).width(300);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
				    </script>
			 	 </div>
			</form>
			<div class="text-center">
				<input type="button" class="btn btn-default" value="수정" id="productUpdateBtn" />			
				<input type="button" class="btn btn-default" value="취소" id="productCancelBtn" />
				<input type="button" class="btn btn-default" value="목록" id="productListBtn" />
			</div>
		</div>
	</body>
</html>