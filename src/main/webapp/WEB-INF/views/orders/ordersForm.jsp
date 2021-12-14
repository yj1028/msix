<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      	<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<title>주문페이지</title>
		
<style type="text/css">
	#deliveryForm{
		width : 100%;
		margin: 0 auto;
		padding: 50px 50px;
		background-color: #fff; }

	#calculation{
		border: solid 1px;
		border-collapse: collapse;
		background-color: #f5f5f0;
		width: 100%;
		font-size: 10pt; }

	#calculation th {
		border: solid 1px;
		text-align: center; }
	
	#calculation td {
		border: solid 1px;
		text-align: center; }

	#price {
		font-size: 20pt;
		font-weight: bold; }
	#delivery{
		border: solid 1px gray;
		border-collapse: collapse;
		width: 100%;
		font-size: 12pt; }
	
	.deliverytd { font-size: 12pt; background-color: #f5f5f0;}

</style>

	<script type="text/javascript">
		$(function(){
			document.getElementById("postBtn").addEventListener("click", function(){
                new daum.Postcode({
                    oncomplete: function(data) {
                    document.getElementById("a_pcode").value = data.zonecode;
                        document.getElementById("a_addr").value = data.address;
                        document.querySelector("input[name='a_daddr']").focus();
                    }
                }).open();
            }); 
			
				/*$("#PayBtn").click(function () {
						let checkArr = new Array();
						
		                $(this).parents("tr").attr("data-num").each(function() {
		                    checkArr.push(parseInt($(this).attr("data-num")));
		                    console.log("checkArr : "+parseInt($(this).attr("data-num")));
		                });
		                
		         
						
		                $.ajax({
		                    url: "/cart/deleteCart",
		                    type: "post", 
							ContentType:"application/x-www-form-urlencoded; charset=UTF-8;",
		                    data: { checkArr : checkArr },
		                    dataType: "text", 
		                    success: function(result) {
		                       if(result=="success"){
		                    	   alert("삭제되었습니다.");
		                       }else if(result=="fail"){
		                    	   alert("삭제 실패하였습니다. 잠시 후에 다시 시도해주세요.");
		                       }
		                    },
		                    error: function (){
		                    	alert("시스템 오류입니다. 관리자에게 문의하세요.");
		                    }
		                });
		            });*/
			
			$("#PayBtn").click(function(){
				 let checkArr = new Array();
				let cartno = $(this).parents("tr").attr("data-num");
				
				 $("tr[class='cartNo']").each(function() {
	                    checkArr.push(parseInt($(this).attr("data-num")));
	                	
	                });
				 
					
				$("#cart").val(checkArr);
				console.log("cart No: "+$("#cart").val());
				$("#deliveryForm").attr({
					method : "post",
					action : "/orders/ordersInsert"
				});
				$("#deliveryForm").submit();

			}); 
			
			
			$("#BackBtn").click(function(){
				location.href="/cart/cartList";
				});
			
			
			<!-- 기존 배송지 선택 시 address 테이블에서 기존 주소 조회해옴 -->
			$("input[name='address']").change(function(){
				 if($("#memaddress").prop("checked")){
					 
				
				$.ajax({
					  url: "/address/address",
	                   type: "post",    
	                   dataType: "json", 
	                   error: function (){
	                    	alert("시스템 오류입니다. 관리자에게 문의하세요.");
	                    },
	                    success: function(result){
		                       
		                     $("#a_pcode").val(result.a_pcode);
		                     $("#a_addr").val(result.a_addr);
		                     $("#a_daddr").val(result.a_daddr);
		                     
		                }
					});
				 }else if($("#newaddress").prop("checked")){
					$("#deliveryForm").each(function(){
						this.reset();
					});
				} 
			});
		

			
		});	//최상위 종료
	</script>
</head>
	


<body>
	
	
	<form id="deliveryForm">
		<input type="hidden" name="cart" id="cart"/>
		<input type="hidden" name="cart_no" id="cart_no" value="0"/>
		<c:forEach items="${cartList}" var="cart" varStatus="status">
		<input type="hidden" name="p_no" value="${cart.p_no}" />
		<span>주문 정보</span>
		<table class="table table-striped">
			<tr>
				<th>상품명</th>
				<th>배송 방법</th>
				<th>배송비</th>
				<th>수량</th>
				<th>상품가격</th>
			</tr>
			<tr data-num = "${cart.cart_no}" class="cartNo">
				<td>${cart.p_name}</td>
				<td>${cart.cart_delivery}</td>
				<td>${cart.cart_pay}</td>
				<td>${cart.cart_cnt}</td>
				<td>${cart.cart_price}</td>
			</tr>
		</table>
		</c:forEach>
		
		
		<span>배송지 정보</span>
		<%-- <c:if test="${address not empty}"> --%>
		<table class="table table-striped" id="delivery">
				<tr>
					<td class="deliverytd">배송지 선택</td>
					<td>
						<input type="radio" name="address" id="memaddress" value="m_address" />
						<label>회원정보와 동일</label>
						<input type="radio" name="address" id="newaddress" value="new_address" checked />
						<label>새로 입력하기</label>
					</td>
				</tr>
				<tr>
					<td class="deliverytd">받으시는 분</td>
					<td><input type="text" id="o_recipient" name="o_recipient" value="${login.m_name }" /></td>
				</tr>
				<tr>
					<td class="deliverytd">주소</td>
					<td><input type="text" id="a_pcode" name="o_pcode" size="10" maxlength="6" value=""/>
					<button type="button" id="postBtn">우편번호 선택</button><br />
					<input type="text" id="a_addr" name="o_addr"size="50" value="" />
					<input type="text" id="a_daddr" name="o_daddr" size="50" value=""/>
					<!-- <button type="button" id="newDeliveryBtn">주소지 입력</button></td> -->
				</tr>
				<tr>
					<td class="deliverytd">휴대전화</td>
					<td><input type="text" size="13" name="o_rectel" value="${login.m_tel}"/> </td>
				</tr>
				<tr>
					<td class="deliverytd">이메일</td>
					<td><input type="text" id="email" value="${login.m_email}"/> &nbsp;
					</td>
				</tr>
				<tr>
					<td class="deliverytd">배송메시지</td>
					<td><textarea rows="3" cols="100" style="resize: none;"></textarea></td>
				</tr>
			</table>
			<br /><br />
			
		
			<c:forEach items="${cartList}" var="cart" varStatus="status">
			<table class="calculation table table-striped">
				<tr>
					<th>총 상품금액&nbsp;</th>
					<th>총 배송비&nbsp;</th>
					<th>결제예정금액</th>
				</tr>
		
				<tr>
					<td><span class="price">${cart.cart_price * cart.cart_cnt}</span></td>
					<td><span class="price">${cart.cart_pay}</span></td>
					<td><span class="price">${cart.cart_price * cart.cart_cnt + cart.cart_pay}</span></td>
				</tr>
			</table>
			</c:forEach>
			<br /><br />
		
			<div class="pay">
				<input type="radio" name="o_payment" value="cardPay" checked/><label>카드결제</label>&nbsp;
				<input type="radio" name="o_payment" value="cashPay" /><label>계좌이체</label>&nbsp;
			</div>
			
			<div class="text-right">
				<input type="button" id="PayBtn" value="결제하기">
				<input type="button" id="BackBtn" value="취소">
			</div>
			
			</form>
			
			<div style="border: solid 1px; padding: 10px 0; font-size:12pt; padding-left:10px;">무이자할부 안내</div>
			<div  style="border: solid 1px; font-size:12pt; padding-left:10px;">
				<span>-</span><span style="font-size: 10pt; color: gray;">무이자할부가 적용되지 않는 상품과 무이자할부가 가능한 상품을 동시에 구매할 수 없습니다.</span><br />
				<span>-</span><span style="font-size: 10pt; color: gray;">무이자할부 결제를 원하실 경우, 장바구니에서 무이자할부 상품만 선택하여 주문해주시기 바랍니다.</span>
			</div>
			<br />

	
	</body>
</html>