package com.msix.admin.orders.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class OrderDetailVO extends OrdersVO{
	private int d_no;
	private int p_no;
	private int d_cnt;
	private int d_sum;
	private String d_delivery;
	private String d_payment;
	private String d_refund;
}
