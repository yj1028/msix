<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                      
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
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		
		<title>장바구니 화면</title>
		
		<style type="text/css">
			.cart-page{margin : 0 auto; }
		</style>
		
		<script type="text/javascript">
		let Buttoncheck=0;
		
		$(function(){
			
			<!-- 쇼핑 계속하기 버튼 이벤트 처리 -->
			$("#mainBtn").click(function(){
				location.href="/main/main";
			});
			
			<!-- 주문하기 버튼 이벤트 처리 -->
			$("#orderBtn").click(function(){
				location.href="/orders/ordersForm";
			});
			
			<!-- 카트 화면 시작했을 때 자동 상품 체크 -->
			var cart = "${cart}";
            if (cart == 'false') {
                $("#allCheck").prop("checked", false);
            } else {
                $("#allCheck").prop("checked", true);
                $(".chkbox").prop("checked", true);
                itemSum();
            }
            
            <!-- 삭제버튼 클릭 시 이벤트 -->
			$("#selectDelete_btn").click(function () {
	            var confirm_val = confirm("정말 삭제하시겠습니까?");
	
	            if (confirm_val) {
	                let checkArr = new Array();
					//let checkArr =""
	                $("input[class='chkbox']:checked").each(function() {
	                    checkArr.push(parseInt($(this).attr("data-Num")));
	                	//checkArr = checkArr + $(this).attr("data-Num") +" ";
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
	                    	  location.href="/cart/cartList";
	                       }else if(result=="fail"){
	                    	   alert("삭제 실패하였습니다. 잠시 후에 다시 시도해주세요.");
	                       }
	                    },
	                    error: function (){
	                    	alert("시스템 오류입니다. 관리자에게 문의하세요.");
	                    }
	                });
	            }
	        });
			
			<!-- 상품 전체선택  -->
			 $("#allCheck").click(function () {
                var chk = $("#allCheck").prop("checked");
                if (chk) {
                    $(".chkbox").prop("checked", true);
                    itemSum();
                } else {
                    $(".chkbox").prop("checked", false);
                    itemSum();
                }
            });
            
			 
			 <!-- 초기화면 상품 전체선택이지만 하나라도 체크박스 해제할 경우 이벤트  -->
             $(".chkbox").click(function () {
                 $("#allCheck").prop("checked", false);
             });
             
            
               
               <!-- 장바구니 수량 변경버튼 클릭시 처리 이벤트 -->
               $(".c_cntBtn").click(function(){
            	  let c_cnt = $(this).parents("td").find($("#c_cnt"));           
            	$("#f_data").find("input[name='cart_cnt']").val(c_cnt.val());
            	
            	let cart_no = $(this).parents("tr").find("input").attr("data-Num");
				$("#cart_no").val(cart_no);
				
				let price = $(this).parents("tr").attr("data-price");
				$("#p_price").val(price);
				
            	   
            	   $.ajax({
	                    url: "/cart/updateCart",
	                    type: "post", 
	                    data: $("#f_data").serialize(),
	                    dataType: "text", 
	                    error: function (){
	                    	alert("시스템 오류입니다. 관리자에게 문의하세요.");
	                    },
	                    success: function(result){
	                       if(result=="success"){
	                    	   alert("수량이 변경 되었습니다.");
	                    	  location.href="/cart/cartList";
	                       }else if(result=="fail"){
	                    	   alert("변경에 실패하였습니다. 잠시 후에 다시 시도해주세요.");
	                       }
	                    }
	                    
	                   
	                });
               });
		
        <!-- 금액 총 합계  -->
		  function itemSum() {
              var str = "";
              var sum = 0;
              var count = $(".chkbox").length;
              for (var i = 0; i < count; i++) {
                  if ($(".chkbox")[i].checked == true) {
                      sum += parseInt($(".chkbox")[i].value);
                  }
              }
              $("#total_sum").html(sum + " 원");
              $("#amount").val(sum);
          }
		  
		 
		  });
		
	    <!-- + - 버튼을 클릭했을때 수량변경 함수 -->
		  function changeCnt(type, ths) {
			var $input = $(ths).parents("td").find("input[name='c_cnt']");
		    var tCount = parseInt($input.val());
		    if(type=='p'){
		        if(tCount < 100) $input.val(Number(tCount)+1);
		    }else{
		        if(tCount >0) $input.val(Number(tCount)-1);    
		        }
		  }
		  
	</script>
	</head>

	<body>
		<section class="page-add cart-page-add">
            <div class="container">
                <div class="col-lg-6">
	                <div class="page-breadcrumb">
	                	<h2>장바구니</h2>
	                </div>
	                <form id="f_data">
						<input type="hidden" id="cart_no" name="cart_no" />
						<input type="hidden" id="cart_cnt" name="cart_cnt" />
						<input type="hidden" id="p_price" name="p_price" />
					</form>
                </div>  
            </div>
        </section>
        
         <!-- Cart Page Section Begin -->
        <div class="cart-page">
            <div class="container">
                <div class="cart-table">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th><input type="checkbox" name="allCheck" id="allCheck" checked /></th>
                                <th class="product-h">상품</th>
                                <th>가격</th>
                                <th>수량</th>
                              	<th>배송구분</th>
                              	<th>배송비</th>
                                <th>총합</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${cartList}" var="cart" varStatus="status">
                                <tr data-price="${cart.p_price}">
                                    <td class="product-close">
                                    <input type="checkbox" onClick="itemSum()"
                                           class="chkbox" value="${cart.p_price * cart.cart_cnt + cart.cart_pay}"
                                            data-Num="${cart.cart_no}" /> 
                                    </td> 
                                            <%-- <img src="/uploadStorage/refund/${detail.rf_image}"/> --%>
                                            <td class="product-col">${cart.p_name}
                                            
                                    <%--  <td class="product-col">
                                         <img src="/uploadStorage/goods/${cart.i_thumb}" />
                                    </td>  --%>                               
                                    <td class="price-col">
                                        <fmt:formatNumber pattern="###,###,###" value="${cart.p_price}" />
                                        원
                                    </td>
                                    <td>
                                       <input type="text" id="c_cnt" name="c_cnt" value="${cart.cart_cnt}개" readonly="readonly" />
                                       <button type="button" class="glyphicon glyphicon-plus" id="plus" onclick="changeCnt('p', this)"></button> 
                                       <button type="button" class="glyphicon glyphicon-minus" id="minus" onclick="changeCnt('m', this)"></button>
                                       <button type="button" class="c_cntBtn">변경</button>
                                    </td>
                                    <td>
                                    	${cart.cart_delivery}
                                    </td>
                                    <td>
                                    	<fmt:formatNumber pattern="###,###,###" value="${cart.cart_pay}" /> 원
                                    </td>
                                    <td class="total">
                                        <fmt:formatNumber pattern="###,###,###"
                                            value="${cart.cart_price + cart.cart_pay}" /> 원
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
  					
  					<c:if test="${empty cartList}">
                        <c:set var="cart" value="false" />
                        <div class="card border-light mb-3 text-center spad">
                            <div class="card-header">
                                <h3>카트에 상품이 없습니다.</h3>
                            </div>
                            <div class="card-body">
                                <p class="card-text">카트에 물건을 담고 이용해주세요!</p>
                            </div>
                        </div>
                    </c:if>
 
                </div>
            </div>
            
            <div class="shopping-method">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="total-info">
                                <div class="total-table">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="total-cart">Total Cart</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="total-cart-p" id="total_sum">
                                                	
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <c:if test="${not empty cartList}">
                                    <div class="row">
                                        <div class="col-lg-12 text-right">
                                            <button type="button" class="primary-btn" id="orderBtn">주문하기</button>
                                            <input type="button" class="site-btn clear-btn" id="selectDelete_btn" value="선택상품 삭제">
                                        </div>
                                        <div class="text-left">
                                        	<button type="button" class="primary-btn" id="mainBtn">쇼핑 계속하기</button>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            
        </div>
        <!-- Cart Page Section End -->
	</body>
</html>