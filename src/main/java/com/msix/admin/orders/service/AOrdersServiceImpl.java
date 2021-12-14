package com.msix.admin.orders.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.orders.dao.AOrdersDAO;
import com.msix.admin.orders.vo.AOrderDetailVO;
import com.msix.admin.orders.vo.AOrdersVO;

import lombok.Setter;

@Service
public class AOrdersServiceImpl implements OrdersService {
	
	@Setter(onMethod_ = @Autowired)
	private AOrdersDAO ordersDAO;
	
	@Override
	public List<AOrdersVO> orderList(AOrdersVO ovo){
		List<AOrdersVO> list = ordersDAO.orderList(ovo);
		return list;
	}
	
	@Override
	public int orderListCnt(AOrdersVO ovo) {
		int result = ordersDAO.orderListCnt(ovo);
		return result;
	}
	
	@Override
	public List<AOrderDetailVO> orderDetail(AOrderDetailVO odvo) {
		List<AOrderDetailVO> detail = ordersDAO.orderDetail(odvo);
		return detail;
	}
	
	@Override
	public int orderChange(AOrderDetailVO odvo) {
		int result = ordersDAO.orderChange(odvo);
		return result;
	}
	
	@Override
	public int orderCancel(AOrderDetailVO odvo) {
		
		int o_no = odvo.getO_no();
		
		ordersDAO.orderDetailCancel(o_no);
		
		int result = ordersDAO.orderCancel(o_no);
		return result;
	}
	
}
