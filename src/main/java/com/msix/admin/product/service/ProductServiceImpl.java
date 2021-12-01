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
	
	// 전체 레코드 수 구현
	@Override
	public int productListCnt(ProductVO pvo) {
		return productDAO.productListCnt(pvo);
	}
	
	// 상품 등록 구현
	@Override
	public int productInsert(ProductVO pvo) {
		int result = 0;
		result = productDAO.productInsert(pvo);
		
		return result;
	}
	
	// 상세페이지 구현
	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail = null;
		detail = productDAO.productDetail(pvo);
		if(detail != null) {
			detail.setP_info(detail.getP_info().toString().replace("\n", "<br />"));
		}
		
		return detail;
	}

}
