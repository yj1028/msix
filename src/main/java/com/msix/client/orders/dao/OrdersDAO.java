package com.msix.client.orders.dao;

import java.util.List;

import com.msix.client.orders.vo.OrdersVO;

public interface OrdersDAO {
	public List<OrdersVO> ordersList(OrdersVO ovo);
	
	public int ordersInsert(OrdersVO ovo);
	
	public List<OrdersVO> orderDetailList(OrdersVO ovo);
	
	public int orderNumber();
}
