package com.msix.client.cart.service;

//import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.client.cart.dao.CartDAO;
import com.msix.client.cart.vo.CartVO;

import lombok.Setter;

@Service
public class CartServiceImpl implements CartService {
	
	@Setter(onMethod_=@Autowired)
	private CartDAO cartDAO;
	
	public List<CartVO> cartList(CartVO cvo){
		List<CartVO> list = null;
		list = cartDAO.cartList(cvo);
		
		return list;
	}
	
	public int addCart(CartVO cvo) {
		int result = 0;
		result = cartDAO.addCart(cvo);
		return result;
	}
	
	public int deleteCart(CartVO cvo) {
		int result = 0;
		result = cartDAO.deleteCart(cvo);
		return result;
	}
	
	public int updateCart(CartVO cvo) {
		int result = 0;
		result = cartDAO.updateCart(cvo);
		return result;
	}
	
	public int updateCartcnt(CartVO cvo) {
		int result = 0;
		result = cartDAO.updateCartcnt(cvo);
		return result;
	}
	
	
}
