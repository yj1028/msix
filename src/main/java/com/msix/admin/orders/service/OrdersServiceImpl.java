package com.msix.admin.orders.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.orders.dao.OrdersDAO;
import com.msix.admin.orders.vo.OrderDetailVO;
import com.msix.admin.orders.vo.OrdersVO;

import lombok.Setter;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Setter(onMethod_ = @Autowired)
	private OrdersDAO ordersDAO;
	
	@Override
	public List<OrdersVO> orderList(OrdersVO ovo){
		List<OrdersVO> list = ordersDAO.orderList(ovo);
		return list;
	}
	
	@Override
	public int orderListCnt(OrdersVO ovo) {
		int result = ordersDAO.orderListCnt(ovo);
		return result;
	}
	
	@Override
	public OrderDetailVO orderDetail(OrderDetailVO odvo) {
		OrderDetailVO detail = ordersDAO.orderDetail(odvo);
		return detail;
	}
	
	@Override
	public int orderChange(OrderDetailVO odvo) {
		int result = ordersDAO.orderChange(odvo);
		return result;
	}
	
	@Override
	public int orderCancel(OrdersVO ovo) {
		int result = ordersDAO.orderCancel(ovo);
		return result;
	}
	
	@Override
	public int orderDetailCancel(OrderDetailVO odvo) {
		int result = ordersDAO.orderDetailCancel(odvo);
		return result;
	}
}
