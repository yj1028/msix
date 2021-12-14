package com.msix.client.product.dao;

import java.util.List;

import com.msix.client.product.vo.ProductVO;

public interface ProductDAO {
	public List<ProductVO> productList(ProductVO pvo); // 상품 리스트 조회
	public int productListCnt(ProductVO pvo);
	public ProductVO productDetail(ProductVO pvo);	//상품 상세 조회
	
}
