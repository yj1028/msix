package com.msix.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.product.dao.ProductDAO;
import com.msix.admin.product.vo.ProductVO;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductDAO productDAO;
	
	// 상품목록 구현
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> list = productDAO.productList(pvo);
		
		return list;
	}

}
