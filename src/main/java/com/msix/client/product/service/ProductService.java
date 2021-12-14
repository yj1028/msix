package com.msix.client.product.service;

import java.util.List;

import com.msix.client.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);
	public int productListCnt(ProductVO pvo);
	public ProductVO productDetail(ProductVO pvo);
	
}
