package com.msix.admin.orders.dao;

import java.util.List;

import com.msix.admin.orders.vo.AOrderDetailVO;
import com.msix.admin.orders.vo.AOrdersVO;

public interface AOrdersDAO {
	public List<AOrdersVO> orderList(AOrdersVO ovo);
	public int orderListCnt(AOrdersVO ovo);
	public List<AOrderDetailVO> orderDetail(AOrderDetailVO odvo);
	public int orderChange(AOrderDetailVO odvo);
	public int orderCancel(int o_no);
	public int orderDetailCancel(int o_no);
}
