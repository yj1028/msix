<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>productDetail</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<link rel="stylesheet" href="/resources/include/dist2/css/goodsDetail.css">
		<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			
			button#MOVE_TOP_BTN {
				background-color:black;
			    position: fixed;
			    right: 10%;
			    bottom: 200px;
			    display: none;
			    z-index: 999;
			    width:150px;
			}

		</style>
		<script src="/resources/include/assets/js/ie-emulation-modes-warning.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
			let p_price = $(".button_quantity").attr("data-price");
			let total1 = 0;
			let total2 = 0;
			let total = 0;
			
			
			 $(function(){
				$("#cartBtn").click(function(){
						$("#form").attr({
							"method":"post",
							"action":"/cart/addCart"
						});
						$("#form").submit();
					
				}); 
				
				/* 주문하기 버튼 클릭시 제어 */
				$("#orderBtn").click(function(){
					if(confirm("장바구니에 담겼습니다.")){
						$("#form").attr({
							"method":"post",
							"action":"/cart/addCart"
						});
						$("#form").submit();
					}
		
				});
				
				$("#rvboard").click(function(){
					location.href="/rvboard/rvboardList";
				});
				
				$("#List").click(function(){
					location.href="/goods/clientProductList?p_type=Gecko"
				});
				
				/* 바로구매 버튼 클릭시 제어 
				$("#orderBtn").click(function(){
					let cart_delivery = $("#cart_delivery").val();
					$("#cart_delivery").val(cart_delivery);
					$("#form").attr({
						"method":"get"
						"action":"order/orderInsert"
					});
					$("#form").submit();
				}); */
				
				/* $("#num").click(function(){
					if($("#cart_delivery").val() == "방문수령"){
						let p_price = $("#p_price").val();
						let num = $("#num").val();
						
						let sum = p_price * num;
						
						$("#sum").val(sum);
					}
				}); */
				
				
				<!-- 배송 방법 선택 -->
				
				$("#cart_delivery").change(function(){
					let cart_delivery = $("#cart_delivery").val();
					
					if($("#cart_delivery").val() == "방문수령"){
						if($("#num").val() == null){
							addGoods(cart_delivery);
							$("#delBtn2").click();
						} else {
							alert("이미 선택된 수령 방법입니다.");
						}
					}else if($("#cart_delivery").val() == "고속버스택배"){
						if($("#num2").val() == null){
							addGoods2(cart_delivery);
							$("#delBtn").click();
						}else {
							alert("이미 선택된 수령 방법입니다.");
						}
					}
					
				});
				
				
				$(document).on("click", "#delBtn", function(){
					if($(this).parents("li").val(".new_li")){
						$(".new_li").remove();
					}
					total1 = 0;
					total = total1 + total2;
					$("#total").html(total);
				});
				
				$(document).on("click", "#delBtn2", function(){
					if($(this).parents("li").val(".new_li2")){
						$(".new_li2").remove();
					}
					total2 = 0;
					total = total1 + total2;
					$("#total").html(total);
				});
				
				/** 직접수령 */
				$(document).on("change", "#num", function(){
					/* let c_name = $("#cart_delivery").val();
					$("#c_name").html(c_name); */
					
					let num = $(this).val();
					console.log(num);
					
					let p_price = $("#p_price").val();
					
					p_price = parseInt(p_price) + 0 ;
					let cart_price =  0 * num;
					$("#cart_price").val(cart_price);
					console.log("배송비 : "+cart_price);
					
					let sum = p_price * num;
					console.log(sum);
					$("#sum").html(sum);
					
					total1 = sum;
					total = total1 + total2;
					$("#total").html(total);
				});
				
				/** 고속버스 택배 */
				$(document).on("change", "#num2", function(){
					/* let c_name = $("#cart_delivery").val();
					$("#c_name2").html(c_name); */
					
					/* num2 = cart_cnt, p_price =상품가격, cart_del_price = 총배송비, sum2 = detail 화면에서 보여주기만 하는 가격 및 배송비포함 총액*/
					let num = $(this).val();
					console.log(num);
					let p_price = $("#p_price").val();
					
					p_price = parseInt(p_price) + 14000;
					let cart_price = 14000 * num;
					$("#cart_price").val(cart_price);
					console.log("배송비 : "+cart_price);
					
					let sum = p_price * num;
					console.log(sum);
					$("#sum2").html(sum);
					
					total2 = sum;
					total = total1 + total2;
					$("#total").html(total);
				});
				
				$(function() {
			        $(window).scroll(function() {
			            if ($(this).scrollTop() > 500) {
			                $('#MOVE_TOP_BTN').fadeIn();
			            } else {
			                $('#MOVE_TOP_BTN').fadeOut();
			            }
			        });
			        
			        $("#MOVE_TOP_BTN").click(function() {
			            $('html, body').animate({
			                scrollTop : 0
			            }, 400);
			            return false;
			        });
			    });
				
			});
			
			/** 수령방법에 따라 수량을 체크하고 가격을 책정하는 동적 함수 */
			function addGoods(cart_delivery){
				let new_li = $("<li>");
				new_li.addClass("new_li");
				let delivery_p = $("<p>");
				
				let c_name_span = $("<span>");
				c_name_span.attr({"id" : "c_name"});
				c_name_span.addClass("c_name_form");
				c_name_span.html("방문수령")
				
				let number_input = $("<input>");
				number_input.attr({"type" : "number", "id" : "num", "name" : "cart_cnt", "min" : "1", "max" : "100", "value" : ""});
				number_input.addClass("number_form");
				
				let sum_span = $("<span>");
				sum_span.attr({"id" : "sum"});
				sum_span.addClass("sum_form");
				
				let del_btn = $("<input>");
				del_btn.attr({"type" : "button", "id" : "delBtn", "value" : "제거"})
				del_btn.attr("del_form");
				
				delivery_p.append(c_name_span).append(number_input).append(sum_span).append(del_btn);
				new_li.append(delivery_p);
				$("#goodsList").append(new_li);
			}
			
			function addGoods2(cart_delivery){
				let new_li2 = $("<li>");
				new_li2.addClass("new_li2");
				let delivery_p = $("<p>");
				
				let c_name_span = $("<span>");
				c_name_span.attr({"id" : "c_name2"});
				c_name_span.addClass("c_name_form");
				c_name_span.html("고속버스수령")
				
				let number_input = $("<input>");
				number_input.attr({"type" : "number", "id" : "num2", "name" : "cart_cnt", "min" : "1", "max" : "100", "value" : ""});
				number_input.addClass("number_form");
				
				
				let sum_span = $("<span>");
				sum_span.attr({"id" : "sum2"});
				sum_span.addClass("sum_form");
				
				let del_btn2 = $("<input>");
				del_btn2.attr({"type" : "button", "id" : "delBtn2", "value" : "제거"})
				del_btn2.attr("del_form");
				
				delivery_p.append(c_name_span).append(number_input).append(sum_span).append(del_btn2);
				new_li2.append(delivery_p);
				$("#goodsList").append(new_li2);
			}
			
			
		   /*  // 변경된 값을 저장
			let sell_price;
			let amount;

		  	// init 초기값을 지정할 수 있다.
		    function init () {
		    	sell_price = document.form.sell_price.value;
		        amount = document.form.amount.value;
		        document.form.sum.value = sell_price;
		        change();
		    }

		    // add
		 	// howmany 값을 1 증가 시키고, 합계를 계산.
		    function add () {
		    	hm = document.form.amount;
		    	sum = document.form.sum;
		  		hm.value ++ ;

		    	sum.value = parseInt(hm.value) * sell_price;
		    }

		    // del
		    // howmany 값을 1 감소 시키고, 합계를 계산.
		    function del () {
		    	hm = document.form.amount;
		    	sum = document.form.sum;
		    	// 에러 처리 : 음수 값
			    if (hm.value > 1) {
			      hm.value -- ;
			      sum.value = parseInt(hm.value) * sell_price;
			    }
		    }

		    function change () {
			    hm = document.form.amount;
			    sum = document.form.sum;
			    if (hm.value < 0) {
			      hm.value = 0;
			    }
		    	sum.value = parseInt(hm.value) * sell_price;
		    } */
			
		</script>
	</head>
	<body>
		<div class="wrapper">
			<div class="wrap">
				<div class="content_area">
					<div class="line">
					</div>
					<form name="form" id="form" method="post">
					<input type="hidden" name="p_no" value="${product.p_no}" />
					<input type="hidden" name="cart_pay" id="cart_price" />
					
					<div class="content_top">
						<div class="ct_left_area">
							<div class="image_wrap">
								<img src="/uploadStorage/product/thumbnail/${image[0].i_thumb}" alt="msix">
							</div>				
						</div>
						<div class="ct_right_area">
							<div class="title">
								<p id="a">
									${product.p_name}
								</p>
							</div>
							<div class="line">
							</div>
							<div class="author">
								 <span>
								 	판매가   ${product.p_price} 원
								 </span>
								 <br />
								 <span class="publeyear">
								 	<label>수령방법</label>   <%-- 배송구분 select box --%>
								 	<select name="cart_delivery" id="cart_delivery" class="form-control">
								 		<option  value="default">- [필수] 옵션을 선택해 주세요 -</option>
								 		<option value="방문수령">방문수령</option>
								 		<option value="고속버스택배">고속버스택배(+14,000원)</option>
								 	</select>
								 </span>
								 <br />
							</div>
							<div class="line">
							</div>
							<br />
							<div>
								<ul id="goodsList">
									<!-- 여기에 동적 생성 요소 추가 -->
								</ul>
							</div>
							<div class="price">
								<div class="sale_price"><strong>총가격</strong> : <span id="total"></span></div>
							</div>			
							<div class="line">
							</div>
							
							<div class="button">						
								<div class="button_quantity" data-price="${product.p_price}">
									<input type="hidden" name="p_price" id="p_price" value="${product.p_price}">
									<!-- <input type="number" id="num" min="1" max="100" value=""> -->
									<!-- <input type="text" name="amount" value="1" size="3" onchange="change();">
									<input type="button" value=" + " onclick="add();">
									<input type="button" value=" - " onclick="del();"> <fmt:formatNumber value="${product.p_price}" pattern="###,### 원" /> -->
								</div>
								<div class="button_set">
									<p>
									  <button type="button" class="btn btn-primary btn-lg" name="cartBtn" id="cartBtn">장바구니 담기</button>
									  <button type="button" class="btn btn-primary btn-lg" name="orderBtn" id="orderBtn">상품 주문하기</button>
									</p>
								</div>
							</div>
							
						</div>
					</div>
					<button type="button" id="MOVE_TOP_BTN">TOP</button>
					</form>
					<div class="line">
					</div>				
					<div class="content_middle text-center">
						<div class="book_intro">
							<hr />
							<table>
								<tr>
									<th>
										<h2>${product.p_name}</h2>
									</th>
								</tr>
								<tr>
									<td>
										&nbsp;&nbsp;${product.p_info}
									</td>
								</tr>
							</table>
						</div>
						<div class="book_content">
							<c:choose>
								<c:when test="${not empty image}">
									<c:forEach var="img" items="${image}" varStatus="status">
										<div class="">
											<c:if test="${not empty img.i_name}">
												<img src="/uploadStorage/product/${img.i_name}" alt="msix"><br /><br />	
											</c:if>
								        </div>
						        	</c:forEach>
								</c:when>
								<c:otherwise>
									<div>등록된 게시물이 존재하지 않습니다.</div>
								</c:otherwise> 
					     	</c:choose>
						</div>
					</div>
					<div class="line">
					</div>				
					<!-- <div class="content_bottom">
					</div> -->
			<%-- <div id="imgdiv">
               <img id="img" src="/uploadStorage/prDetail/${detail.pr_contentimg}">
            </div> --%>
            
            <h3 id="Shipping" >배송문의</h3>
            <div class="text-center">
               <div class="Shipping">
                  배송안내<br>
                  5만원 이상 구매 시 무료배송, 7만원 미만의 경우 2,500원의 배송비가 추가됩니다.<br>
                  (제주도 : 5만원 이상 구매 시 배송비 2,500원 할인되며, 7만원 미만의 경우 6,000원입니다)<br>
                  CJ 택배로 발송되며, CJ택배로 발송시 배송기간은 2-3일(주말, 공휴일 제외) 소요될 수 있습니다.<br>
                  <br>
                  <br>
                  <br>


                  택배발송<br>
                  - 평일 PM 19:00 까지 결제 완료된 주문건에 한하여 거래처에 입고요청되어 입고 완료시 정상 발송됩니다.<br>
                  - 택배발송 업무시간은 평일 PM 18:00 마감됩니다.<br>
                  - 주문 후 평균적으로 2~3일정도 상품 입고기간이 소요됩니다.<br>
                  - 택배 발송 시 알림톡을 통해 운송장번호가 발송됩니다. (알림톡 미발송시 문자발송)<br>
               </div>
            </div>
            
            <hr/>
	            	<div class="text-center">
		            	<button type="button" id="rvboard" class="btn btn-primary">리뷰게시판</button>
		            	<button type="button" id="List" class="btn btn-primary">상품리스트</button>
					</div>
					<br/><br/>
				</div>
			</div>	<!-- class="wrap" -->
			<br/>
            <br/>
            <br/>
            <br/>
            <br/>
            
		</div>	<!-- class="wrapper" -->
	</body>
</html>