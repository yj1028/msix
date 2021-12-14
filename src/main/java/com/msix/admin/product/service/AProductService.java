package com.msix.admin.product.service;

import java.util.List;

import com.msix.admin.image.vo.AImageVO;
import com.msix.admin.product.vo.AProductVO;

public interface AProductService {
	public List<AProductVO> productList(AProductVO pvo); // 상품 리스트 조회
	
	public int productListCnt(AProductVO pvo); // 전체 레코드 수
	
	public int productInsert(AProductVO pvo) throws Exception; // 상품 등록
	
	public AProductVO productDetail(AProductVO pvo); // 상세 페이지 조회
	
	public AProductVO updateForm(AProductVO pvo); // 상품 수정 폼 조회
	
	public int productUpdate(AProductVO pvo) throws Exception; // 상품 수정
	
	public int productDelete(AProductVO pvo) throws Exception; // 상품 삭제
	
	public List<AImageVO> imageDetail(AProductVO pvo); // 상품이미지 조회
	
	public int imageInsert(AImageVO ivo) throws Exception; // 상품이미지 등록
	
	public int imageDelete(AImageVO ivo) throws Exception; // 상품이미지 삭제
	
	public int imageUpdate(AImageVO ivo) throws Exception; // 상품이미지 수정
	
	public List<AProductVO> stockList(AProductVO pvo); // 재고 리스트 조회
	
	public int stockUpdate(AProductVO pvo); // 재고 수정

}