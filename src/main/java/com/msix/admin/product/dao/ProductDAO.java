package com.msix.admin.product.dao;

import java.util.List;

import com.msix.admin.product.vo.ProductVO;

public interface ProductDAO {
	public List<ProductVO> productList(ProductVO pvo); // 상품 리스트 조회
	
	public int productListCnt(ProductVO pvo); // 전체 레코드 수
	
}
