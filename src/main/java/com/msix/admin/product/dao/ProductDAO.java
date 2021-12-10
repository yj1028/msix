package com.msix.admin.product.dao;

import java.util.List;

import com.msix.admin.product.vo.ProductVO;

public interface ProductDAO {
	public List<ProductVO> productList(ProductVO pvo); // 상품 리스트 조회
	
	public int productListCnt(ProductVO pvo); // 전체 레코드 수
	
	public String productNumber(); // 상품번호 추출
	
	public int productInsert(ProductVO pvo); // 상품 등록
	
	public ProductVO productDetail(ProductVO pvo); // 상세 페이지 조회
	
	public ProductVO productUpdateForm(ProductVO pvo); // 상품 수정 폼 조회
	
	public int productUpdate(ProductVO pvo); // 상품 수정
	
	public int productDelete(ProductVO pvo); // 상품 삭제
	
	public List<ProductVO> stockList(ProductVO pvo); // 재고 리스트 조회
	
	public int stockUpdate(ProductVO pvo); // 재고 수정

}