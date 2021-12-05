package com.msix.admin.product.dao;

import java.util.List;

import com.msix.admin.product.vo.ProductVO;

public interface ProductDAO {
	public List<ProductVO> productList(ProductVO pvo);
	
}
