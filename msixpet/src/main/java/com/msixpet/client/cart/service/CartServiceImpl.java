package com.msixpet.client.cart.service;

import java.util.ArrayList;
//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msixpet.client.cart.dao.CartDAO;
import com.msixpet.client.cart.vo.CartVO;

import lombok.Setter;

@Service
public class CartServiceImpl implements CartService {
	
	@Setter(onMethod_=@Autowired)
	private CartDAO cartDAO;
	
	public ArrayList<CartVO> cartList(CartVO cvo){
		ArrayList<CartVO> list = null;
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
}
