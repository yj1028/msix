package com.msix.admin.image.dao;

import java.util.List;

import com.msix.admin.image.vo.AImageVO;
import com.msix.admin.product.vo.AProductVO;

public interface AImageDAO {
	public List<AImageVO> imageDetail(AProductVO pvo); // 상품이미지 조회
 
	public int imageInsert(AImageVO ivo); // 상품이미지 등록
	
	public int imageUpdate(AImageVO ivo); // 상품이미지 수정
	
	public int imageDelete(AImageVO ivo); // 상품이미지 삭제
}
