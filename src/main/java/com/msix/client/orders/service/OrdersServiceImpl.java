package com.msix.client.orders.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.client.cart.dao.CartDAO;
import com.msix.client.cart.vo.CartVO;
import com.msix.client.orderdetail.dao.OrderdetailDAO;
import com.msix.client.orderdetail.vo.OrderdetailVO;
//import com.msixpet.client.orderdetail.vo.OrderdetailVO;
import com.msix.client.orders.dao.OrdersDAO;
import com.msix.client.orders.vo.OrdersVO;

import lombok.Setter;

@Service
public class OrdersServiceImpl implements OrdersService {
   
   @Setter(onMethod_=@Autowired)
   private OrdersDAO ordersDAO;
   @Setter(onMethod_=@Autowired)
   private OrderdetailDAO orderdetailDAO;
   @Setter(onMethod_=@Autowired)
   private CartDAO cartDAO;
   
   public List<OrdersVO> ordersList(OrdersVO ovo){
      List<OrdersVO> list = null;
      list = ordersDAO.ordersList(ovo);
      
      return list;
   }
   
   public int ordersInsert(OrdersVO ovo) {

	      int result = 0;
	      int orderNumber = ordersDAO.orderNumber();
	      ovo.setO_no(orderNumber);
	      result = ordersDAO.ordersInsert(ovo);
	         
	         OrderdetailVO dvo = new OrderdetailVO();
	         CartVO cvo = new CartVO();
	         cvo.setM_no(ovo.getM_no());
	         List<CartVO> cartList = cartDAO.cartList(cvo);
	         
	         for(CartVO cart  : cartList) {
	         dvo = new OrderdetailVO();
	         dvo.setO_no(orderNumber);
	         dvo.setP_no(cart.getP_no());
	         dvo.setD_cnt(cart.getCart_cnt());
	         dvo.setD_price(cart.getCart_price());
	         dvo.setD_delivery("결제완료");
	         dvo.setD_shipment(cart.getCart_delivery());
	         dvo.setD_pay(cart.getCart_pay());
	           orderdetailDAO.orderDetailInsert(dvo);
	           System.out.println(dvo);
	        }
	         return result;
	      }

   @Override
	public List<OrderdetailVO> ordersDetailList(OrderdetailVO odvo) {
		List<OrderdetailVO> list = null;
		list = orderdetailDAO.orderDetailList(odvo);
		
		return list;
	}
}
