package com.msix.admin.orders.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class AOrderDetailVO extends AOrdersVO{
	private String d_no;
	private String p_no;
	private int d_cnt;
	private int d_price;
	private String d_delivery;
	private String d_shipment;
	private int d_pay;
	private String d_refund;
}
