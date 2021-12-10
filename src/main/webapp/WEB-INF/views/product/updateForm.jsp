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
			#p_name {width: 300px;}
			#p_price {width: 100px;}
			#p_type {width: 120px;}
			#p_cnt {width: 80px;}
			#p_info {resize: none;}
			#detailTable{width: 100%; margin-top: 50px;}
			.table-height{min-height: 500px;}
			img{width: 100px; height: 100px;}
			#imageInsertBtn {margin-right: 20px;}
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#p_type").val("${updateData.p_type}").prop("selected", true);
				$("#i_file").css("display", "none");
				$("#confirmInsertBtn").css("display", "none");
				
				/* 썸네일이 생성되는 메인이미지는 삭제할 수 없게 제어 */
				if($(".tr").length == 1){
					$(".imageDeleteBtn").css("display", "none");
				}
				
				/* 이미지등록 버튼 클릭 시 처리 이벤트 */
				$("#imageInsertBtn").click(function(){
					if($(".tr").length == 3){
						alert("상품이미지는 최대 3개까지 등록할 수 있습니다.");
						return;
					}
					$("#i_file").css("display", "inline");
					$("#confirmInsertBtn").css("display", "inline");
				});
				
				/* 이미지등록 확인 버튼 클릭 시 처리 이벤트 */
				$("#confirmInsertBtn").click(function(){
					$("#f_imgInsert").ajaxForm({
					url : "/product/imageInsert", 
					type : "post",               
					enctype : "multipart/form-data",
					dataType : "text",
					error : function(){     
						alert('시스템 오류 입니다. 관리자에게 문의해 주세요.');
					},                        
					success : function(value){ 
						console.log(value);
						if(value == "success"){
							location.href="/product/updateForm?p_no="+$("#p_no").val();
							alert("이미지가 등록되었습니다.")
						}
					}
					});
						$("#f_imgInsert").submit();
						$("#i_file").css("display", "none");
						$("#confirmInsertBtn").css("display", "none");
				});
				
				/* 이미지수정 버튼 클릭 시 처리 이벤트 */
				$(".imageUpdateBtn").click(function(){
					
					let i_no1 = $(this).parents("tr").attr("data-num");
					
					$("#i_no1").val(i_no1==""?0:i_no1);
					$("#i_name1").val($(this).parents("tr").attr("data-name"))
					$("#i_thumb1").val($(this).parents("tr").attr("data-thumb"))
					console.log($("#i_no1").val());
					console.log($("#i_name1").val());
					console.log($("#i_thumb1").val());
				
					$("#f_updateForm").ajaxForm({
						url : "/product/imageUpdate", 
						type : "post",               
						enctype : "multipart/form-data",
						dataType : "text",
						error : function(){     
							alert('시스템 오류 입니다. 관리자에게 문의해 주세요.');
						},                        
						success : function(value){ 
							console.log(value);
							if(value == "success"){
								location.href="/product/updateForm?p_no="+$("#p_no").val();
								alert("이미지가 수정되었습니다.")
							}
						}
					});
					$("#f_updateForm").submit(); 
				});
				
				/* 이미지삭제 버튼 클릭 시 처리 이벤트 */
				$(".imageDeleteBtn").click(function(){
					if(confirm("등록된 이미지를 삭제 하시겠습니까?")){
						let i_no = $(this).parents("tr").attr("data-num");
						$("#i_no").val(i_no);
						$("#i_name").val($(this).parents("tr").attr("data-name"))
						$("#i_thumb").val($(this).parents("tr").attr("data-thumb"))
						console.log($("#i_no").val());
						console.log($("#i_name").val());
						console.log($("#i_thumb").val());
						 $.ajax({
							url : "/product/imageDelete",
							type : "post",
							data : $("#f_update").serialize(),
							dataType : "text",
							error : function(){
								alert("시스템 오류 입니다. 관리자에게 문의 하세요.");
							},
							success : function(value){
								if(value == "success"){
									location.href="/product/updateForm?p_no="+$("#p_no").val();
									alert("이미지가 삭제되었습니다.")
								}
							}
						}); 
					}
				});
				
				/* 수정 버튼 클릭 시 처리 이벤트 */
				$("#productUpdateBtn").click(function(){
					//입력값 체크
					if(!chkData("#p_name", "상품명을")) return;
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
					else if(!chkData("#p_info", "상품정보를")) return;
					else{
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
					$("#p_type").val("${updateData.p_type}").prop("selected", true);
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
			<div class="text-left">
				<input type="button" class="btn btn-primary" value="이미지등록" id="imageInsertBtn" style='float: left;' />
				<%-- 이미지 등록 처리에 사용되는 폼 --%>	
				<form id="f_imgInsert">
					<input type="file" name="file" id="i_file" style='float: left;' />
					<input type="hidden" name="p_no" id="p_no2" value="${updateData.p_no}">
				</form>
				<input type="button" class="btn btn-info" value="등록" id="confirmInsertBtn" style='float: left;' />	
			</div>
			<%-- 이미지 삭제 처리에 사용되는 폼 --%>
			<form id="f_update">
				<input type="hidden" name="p_no" id="p_no" value="${updateData.p_no}">
				<input type="hidden" name="i_no" id="i_no" value="">
				<input type="hidden" name="i_name" id="i_name" value="">
				<input type="hidden" name="i_thumb" id="i_thumb" value="">
			</form>
			<%-- 이미지 수정 처리에 사용되는 폼 --%>
			<form id="f_updateForm">
				<input type="hidden" name="p_no" id="p_no1" value="${updateData.p_no}">
				<input type="hidden" name="i_no" id="i_no1" value="">
				<input type="hidden" name="i_name" id="i_name1" value="">
				<input type="hidden" name="i_thumb" id="i_thumb1" value="">
				
				<table class="table table-bordered" id="detailTable" style="margin-left: auto; margin-right: auto;">
					 <%-- <tr data-num="${updateData.list[0].i_no}" data-name="${updateData.list[0].i_name}" data-thumb="${updateData.list[0].i_thumb}">
						<td>
							상품이미지1
							 <input type="file" name="file" id="file1" />
						</td>
						<td colspan="4">
							<img src="/uploadStorage/product/${updateData.list[0].i_name}" />
						</td>
						<td>
		    				<input type="button" class="btn btn-default imageUpdateBtn" value="수정" />
							<input type="button" class="btn btn-default imageDeleteBtn" value="삭제" />
			    		</td>
					</tr>
					<tr data-num="${updateData.list[1].i_no}" data-name="${updateData.list[1].i_name}" data-thumb="${updateData.list[1].i_thumb}">
						<td>
							상품이미지2
							 <input type="file" name="file" id="file2" />
						</td>
						<td colspan="4">
							<img src="/uploadStorage/product/${updateData.list[1].i_name}" />
						</td>
						<td>
		    				<input type="button" class="btn btn-default imageUpdateBtn" value="수정" />
							<input type="button" class="btn btn-default imageDeleteBtn" value="삭제" />
			    		</td>
					</tr>
					<tr data-num="${updateData.list[2].i_no}" data-name="${updateData.list[2].i_name}" data-thumb="${updateData.list[2].i_thumb}">
						<td>
							상품이미지3
							 <input type="file" name="file" id="file3" />
						</td>
						<td colspan="4">
							<img src="/uploadStorage/product/${updateData.list[2].i_name}" />
						</td>
						<td>
		    				<input type="button" class="btn btn-default imageUpdateBtn" value="수정" />
							<input type="button" class="btn btn-default imageDeleteBtn" value="삭제" />
			    		</td>
					</tr>  --%>
					<c:forEach var="image" items="${updateData.list}" varStatus="status">
			    		<tr data-num="${image.i_no}" data-name="${image.i_name}" data-thumb="${image.i_thumb}" data-index="${status.index}" class="tr">
			    			<td>
			    				상품이미지
			   					<input type="file" name="file" class="file" />
			    			</td>
			    			<td colspan="4"><img src="/uploadStorage/product/${image.i_name}" /></td>
			    			<td>
			    				<input type="button" class="btn btn-default imageUpdateBtn" value="이미지수정" />
								<input type="button" class="btn btn-default imageDeleteBtn" value="이미지삭제" />
			    			</td> 
			    		</tr>
		    		</c:forEach>
					<tr>
						<td><strong>상품번호</strong></td>
						<td colspan="2">${updateData.p_no}</td>
						<td><strong>상품명</strong></td>
						<td colspan="2"><input type="text" name="p_name" id="p_name" value="${updateData.p_name}" class="form-control" 
							maxlength="32"/>
						</td>
					</tr> 
					<tr>
						<td><strong>카테고리</strong></td>
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
						<td><strong>판매가</strong></td>
						<td><input type="text" name="p_price" id="p_price" value="${updateData.p_price}" class="form-control text-left"
							maxlength="9" /></td>
						<td><strong>수량</strong></td>
						<td>${updateData.p_cnt}</td>
					</tr>
					<tr class="table-height">
						<td><strong>상품정보</strong></td>
						<td colspan="5" class="text-left">
							<textarea name="p_info" id="p_info" rows="8" class="form-control table-height">${ updateData.p_info }</textarea>
						</td>
					</tr>
				</table>
			</form>
			<div class="text-center">
				<input type="button" class="btn btn-warning" value="수정" id="productUpdateBtn" />			
				<input type="button" class="btn btn-danger" value="취소" id="productCancelBtn" />
				<input type="button" class="btn btn-info" value="목록" id="productListBtn" />
			</div>
		</div>
	</body>
</html>