package com.msix.admin.product.service;

import java.util.List;

import com.msix.admin.image.vo.ImageVO;
import com.msix.admin.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo); // 상품 리스트 조회
	
	public int productListCnt(ProductVO pvo); // 전체 레코드 수
	
	public int productInsert(ProductVO pvo) throws Exception; // 상품 등록
	
	public ProductVO productDetail(ProductVO pvo); // 상세 페이지 조회
	
	public ProductVO updateForm(ProductVO pvo); // 상품 수정 폼 조회
	
	public int productUpdate(ProductVO pvo) throws Exception; // 상품 수정
	
	public int productDelete(ProductVO pvo) throws Exception; // 상품 삭제
	
	public List<ImageVO> imageDetail(ProductVO pvo); // 상품이미지 조회
	
	public int imageDelete(ImageVO ivo) throws Exception; // 상품이미지 삭제
	
	public int imageUpdate(ImageVO ivo) throws Exception; // 상품이미지 수정
	
	public List<ProductVO> stockList(ProductVO pvo); // 재고 리스트 조회
	
	public int stockUpdate(ProductVO pvo); // 재고 수정

}
