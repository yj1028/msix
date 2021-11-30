package com.msix.admin.product.service;

import java.util.List;

import com.msix.admin.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);
	
	public int productListCnt(ProductVO pvo);
}
