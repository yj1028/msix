package com.msix.admin.orders.dao;

import java.util.List;

import com.msix.admin.orders.vo.OrderDetailVO;
import com.msix.admin.orders.vo.OrdersVO;

public interface OrdersDAO {
	public List<OrdersVO> orderList(OrdersVO ovo);
	public int orderListCnt(OrdersVO ovo);
	public List<OrderDetailVO> orderDetail(OrderDetailVO odvo);
	public int orderChange(OrderDetailVO odvo);
	public int orderCancel(int o_no);
	public int orderDetailCancel(int o_no);
}
