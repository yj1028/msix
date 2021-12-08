package com.msixpet.client.cart.service;

import java.util.List;

import com.msixpet.client.cart.vo.CartVO;

public interface CartService {
	public List<CartVO> cartList(CartVO cvo);
}
