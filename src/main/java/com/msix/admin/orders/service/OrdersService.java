package com.msix.admin.orders.service;

import java.util.List;

import com.msix.admin.orders.vo.OrderDetailVO;
import com.msix.admin.orders.vo.OrdersVO;

public interface OrdersService {
	public List<OrdersVO> orderList(OrdersVO ovo);
	public int orderListCnt(OrdersVO ovo);
	public OrderDetailVO orderDetail(OrderDetailVO odvo);
	public int orderChange(OrderDetailVO odvo);
	public int orderCancel(OrderDetailVO odvo);
}
