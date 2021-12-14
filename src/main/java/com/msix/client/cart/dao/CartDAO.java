package com.msix.client.cart.dao;

//import java.util.ArrayList;
import java.util.List;

import com.msix.client.cart.vo.CartVO;

public interface CartDAO {
	public List<CartVO> cartList(CartVO cvo);
	
	public int addCart(CartVO cvo);
	
	public int deleteCart(CartVO cvo);
	
	public int updateCart(CartVO cvo);
	
	public int updateCartcnt(CartVO cvo);
}
