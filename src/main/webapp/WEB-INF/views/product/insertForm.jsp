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
		
		<script type="text/javascript" src="/resources/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				
			}); // 최상위 $종료
			
			
		</script>
	</head>
	<body>
		<div class="container">
			<form class="form-horizontal" id="f_writeForm">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">상품이미지</label>
			    <div class="col-sm-10">
			      <input type="file" name="file" id="file" />
			    </div>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="title" class="col-sm-2 control-label">상품명</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="p_name" id="p_name" placeholder="상품명" maxlength="32"/>
			    </div>
			  </div>
			  <br />
			  <div class="form-group">
			   	<label for="content" class="col-sm-2 control-label text-left">상품분류</label>
			    <div class="col-sm-10">
			      	<select class="form-control" name="p_type" id="p_type">
			      		<option>---선택---</option>
						<option>Gecko</option>
						<option>Lizard</option>
						<option>Snake</option>
						<option>Turtle</option>
						<option>Food</option>
						<option>Supplies</option>
						<option>Amphibian</option>                   	
					</select>
			   </div>
			  </div>
			  <br />
			  <div class="form-group">
			    <label for="passwd" class="col-sm-2 control-label">상품정보</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" name="p_content" id="p_content" rows="12" maxlength="1330"></textarea>
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