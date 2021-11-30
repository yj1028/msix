package com.msixpet.client.cart.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cart_no = 0;
	private int m_no = 0;
	private String p_no = "";
	private int cart_cnt =0;
	private String cart_delivery = "";
	private int cart_pay =0;
	private String cart_date ="";
	
}
