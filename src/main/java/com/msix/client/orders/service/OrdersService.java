package com.msix.client.orders.service;

import java.util.List;

import com.msix.client.orderdetail.vo.OrderdetailVO;
import com.msix.client.orders.vo.OrdersVO;

public interface OrdersService {
	public List<OrdersVO> ordersList(OrdersVO ovo);
	
	public int ordersInsert(OrdersVO ovo);
	
	public List<OrderdetailVO> ordersDetailList(OrderdetailVO odvo);
}
