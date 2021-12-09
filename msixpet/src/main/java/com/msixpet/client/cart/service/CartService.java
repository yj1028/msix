package com.msixpet.client.cart.service;

import java.util.ArrayList;

import com.msixpet.client.cart.vo.CartVO;

public interface CartService {
	public ArrayList<CartVO> cartList(CartVO cvo);
	public int addCart(CartVO cvo);
	public int deleteCart(CartVO cvo);
}
