package com.msix.admin.product.dao;

import java.util.List;

import com.msix.admin.product.vo.AProductVO;

public interface AProductDAO {
	public List<AProductVO> productList(AProductVO pvo); // 상품 리스트 조회
	
	public int productListCnt(AProductVO pvo); // 전체 레코드 수
	
	public String productNumber(); // 상품번호 추출
	
	public int productInsert(AProductVO pvo); // 상품 등록
	
	public AProductVO productDetail(AProductVO pvo); // 상세 페이지 조회
	
	public AProductVO productUpdateForm(AProductVO pvo); // 상품 수정 폼 조회
	
	public int productUpdate(AProductVO pvo); // 상품 수정
	
	public int productDelete(AProductVO pvo); // 상품 삭제
	
	public List<AProductVO> stockList(AProductVO pvo); // 재고 리스트 조회
	
	public int stockUpdate(AProductVO pvo); // 재고 수정

}