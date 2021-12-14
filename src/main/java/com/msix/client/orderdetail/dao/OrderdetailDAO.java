package com.msix.client.orderdetail.dao;

import java.util.List;

import com.msix.client.orderdetail.vo.OrderdetailVO;

public interface OrderdetailDAO {
	public List<OrderdetailVO> orderDetailList(OrderdetailVO odvo);
	public int orderDetailInsert(OrderdetailVO odvo);
}
