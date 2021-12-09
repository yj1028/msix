package com.msixpet.client.cart.vo;

import com.msixpet.client.product.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class CartVO extends ProductVO {
	private int cart_no;
	private int m_no = 0;
	private String p_no = "";
	private int cart_cnt =0;
	private String cart_price = "";
	private String cart_delivery = "";
	private int cart_pay =0;
	private String cart_date ="";
	
	
}
