package com.msixpet.client.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msixpet.client.cart.dao.CartDAO;
import com.msixpet.client.cart.vo.CartVO;

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
}
