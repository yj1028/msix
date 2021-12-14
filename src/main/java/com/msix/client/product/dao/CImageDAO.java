package com.msix.client.product.dao;

import java.util.List;

import com.msix.client.product.vo.CImageVO;
import com.msix.client.product.vo.ProductVO;

public interface CImageDAO {
	public List<CImageVO> imageList(ProductVO pvo);
	
}
