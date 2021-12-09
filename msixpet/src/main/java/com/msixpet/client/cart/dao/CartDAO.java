package com.msixpet.client.cart.dao;

import java.util.ArrayList;
import java.util.List;

import com.msixpet.client.cart.vo.CartVO;

public interface CartDAO {
	public ArrayList<CartVO> cartList(CartVO cvo);
	
	public int addCart(CartVO cvo);
	
	public int deleteCart(CartVO cvo);
}
