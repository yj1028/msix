package com.msix.admin.image.dao;

import java.util.List;

import com.msix.admin.image.vo.ImageVO;
import com.msix.admin.product.vo.ProductVO;

public interface ImageDAO {
	public List<ImageVO> imageDetail(ProductVO pvo); // 상품이미지 조회
 
	public int imageInsert(ImageVO ivo); // 상품이미지 등록
	
	public int imageUpdate(ImageVO ivo); // 상품이미지 수정
	
	public int imageDelete(ImageVO ivo); // 상품이미지 삭제
}
