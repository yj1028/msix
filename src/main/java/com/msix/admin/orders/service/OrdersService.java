package com.msix.admin.orders.service;

import java.util.List;

import com.msix.admin.orders.vo.AOrderDetailVO;
import com.msix.admin.orders.vo.AOrdersVO;

public interface OrdersService {
	public List<AOrdersVO> orderList(AOrdersVO ovo);
	public int orderListCnt(AOrdersVO ovo);
	public List<AOrderDetailVO> orderDetail(AOrderDetailVO odvo);
	public int orderChange(AOrderDetailVO odvo);
	public int orderCancel(AOrderDetailVO odvo);
}
