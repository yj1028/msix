package com.msix.client.orderdetail.vo;

import com.msix.client.orders.vo.OrdersVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class OrderdetailVO extends OrdersVO {
	private String d_no;
	private String p_no;
	private int o_no;
	private int d_cnt;
	private int d_price;
	private String d_delivery;
	private String d_shipment;
	private int d_pay;
	private String d_refund;
}
