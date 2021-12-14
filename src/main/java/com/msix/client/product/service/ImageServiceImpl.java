package com.msix.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.client.product.dao.CImageDAO;
import com.msix.client.product.vo.CImageVO;
import com.msix.client.product.vo.ProductVO;

import lombok.Setter;

@Service
public class ImageServiceImpl implements ImageService {

	@Setter(onMethod_ = @Autowired)
	private CImageDAO imageDAO;
	
	@Override
	public List<CImageVO> imageList(ProductVO pvo) {
		List<CImageVO> list = imageDAO.imageList(pvo); 
		return list;
	}

}
