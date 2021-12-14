package com.msix.client.orders.vo;

import com.msix.client.cart.vo.CartVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class OrdersVO extends CartVO{
	private int o_no;
	private int m_no;
	private String o_date;
	private int o_pcode;
	private String o_addr;
	private String o_daddr;
	private String o_recipient;
	private String o_rectel;
	private String o_payment;
	
}
