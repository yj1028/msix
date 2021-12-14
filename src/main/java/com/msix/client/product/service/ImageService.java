package com.msix.client.product.service;

import java.util.List;

import com.msix.client.product.vo.CImageVO;
import com.msix.client.product.vo.ProductVO;

public interface ImageService {
	public List<CImageVO> imageList(ProductVO pvo);
	
}
