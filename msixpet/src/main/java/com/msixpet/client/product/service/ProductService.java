package com.msixpet.client.product.service;

import java.util.List;

import com.msixpet.client.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo); // 상품 리스트 조회
	
	public int productListCnt(ProductVO pvo); // 전체 레코드 수
	
	public ProductVO productDetail(ProductVO pvo); // 상세 페이지 조회
}
