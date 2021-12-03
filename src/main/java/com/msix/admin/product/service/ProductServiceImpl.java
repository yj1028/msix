package com.msix.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.image.dao.ImageDAO;
import com.msix.admin.image.vo.ImageVO;
import com.msix.admin.product.dao.ProductDAO;
import com.msix.admin.product.vo.ProductVO;
import com.msix.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductDAO productDAO;
	
	@Setter(onMethod_ = @Autowired)
	private ImageDAO imageDAO;
	
	// 상품목록 구현
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> list = productDAO.productList(pvo);
		
		return list;
	}
	
	// 전체 레코드 수 구현
	@Override
	public int productListCnt(ProductVO pvo) {
		return productDAO.productListCnt(pvo);
	}
	
	// 상품 등록 구현
	@Override
	public int productInsert(ProductVO pvo) throws Exception {
		int result = 0;
		
		System.out.println(pvo.getList().size());
		//result = productDAO.productInsert(pvo);
		
		ImageVO vo= pvo.getList().get(0);
		
		 /* if(vo.getFile().getSize() > 0) { 
			String fileName = FileUploadUtil.fileUpload(vo.getFile(), "product"); 
			 vo.setP_file(fileName);
			 
			 String thumbName = FileUploadUtil.makeThumbnail(fileName);
			 vo.setP_thumb(thumbName); 
			 imageDAO.
		} */
		
		
		return result;
	}
	
	// 상세페이지 구현
	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail = null;
		detail = productDAO.productDetail(pvo);
		if(detail != null) {
			detail.setP_info(detail.getP_info().toString().replace("\n", "<br />"));
		}
		
		return detail;
	}
	
	// 상품수정 폼 구현
	@Override
	public ProductVO updateForm(ProductVO pvo) {
		ProductVO update = null;
		update = productDAO.productUpdateForm(pvo);
		
		return update;
	}
	
	// 상품수정 구현
	@Override
	public int productUpdate(ProductVO pvo) throws Exception {
		int result = 0;
		
//		if(!pvo.getFile().isEmpty()) {
//			if(!pvo.getP_file().isEmpty()) {
//				FileUploadUtil.fileDelete(pvo.getP_file());
//				FileUploadUtil.fileDelete(pvo.getP_thumb());
//			}
//			String fileName = FileUploadUtil.fileUpload(pvo.getFile(), "product");
//			pvo.setP_file(fileName);
//			
//			String thumbName = FileUploadUtil.makeThumbnail(fileName);
//			pvo.setP_thumb(thumbName);
//		}
		result = productDAO.productUpdate(pvo);
		
		return result;
	}
	
	// 상품삭제 구현
	@Override
	public int productDelete(ProductVO pvo) throws Exception{
		int result = 0;
		
//		if(!pvo.getP_file().isEmpty()) {
//			FileUploadUtil.fileDelete(pvo.getP_file());
//			FileUploadUtil.fileDelete(pvo.getP_thumb());
//		}
		result = productDAO.productDelete(pvo);
		
		return result;
	}
}
