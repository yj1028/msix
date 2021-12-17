package com.msix.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.client.product.dao.ProductDAO;
import com.msix.client.product.vo.ProductVO;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductDAO productDAO;
	
	
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		pvo.setAmount(10);
		
		List<ProductVO> list = productDAO.productList(pvo);
		return list;
	}

	@Override
	public int productListCnt(ProductVO pvo) {
		return productDAO.productListCnt(pvo);
	}

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail = productDAO.productDetail(pvo);
		return detail;
	}

}
