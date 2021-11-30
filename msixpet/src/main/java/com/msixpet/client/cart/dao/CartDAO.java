package com.msixpet.client.cart.dao;

import java.util.List;

import com.msixpet.client.cart.vo.CartVO;

public interface CartDAO {
	public List<CartVO> cartList(CartVO cvo);
	
}
