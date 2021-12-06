package com.msix.admin.product.service;

import java.util.ArrayList;
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
		List<ImageVO> imgList = imageDAO.imageDetail(pvo);
		pvo.setList(imgList);
		
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
		//System.out.println(pvo.getList().size());
		int p_no = productDAO.productNumber();
		pvo.setP_no(p_no);
		result = productDAO.productInsert(pvo);
		
		for(ImageVO ivo : pvo.getList()) {
			ivo.setP_no(p_no);
			if(ivo.getFile().getSize() > 0) {
				String fileName = FileUploadUtil.fileUpload(ivo.getFile(), "product"); 
				 ivo.setI_name(fileName);
				 if(ivo.getFile() == pvo.getList().get(0).getFile()) {
					 String thumbName = FileUploadUtil.makeThumbnail(fileName);
					 ivo.setI_thumb(thumbName);
					 imageDAO.imageInsert(ivo);
				 }else {
					 ivo.setI_thumb("");
					 imageDAO.imageInsert(ivo); 
				 }	
			}
		}
			
		return result;
	}
	
	// 상세페이지 구현(이미지)
	/*@Override 
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail = null;
		List<ImageVO> list = new ArrayList<ImageVO>();
		list.add(imageDAO.imageList(pvo.getP_no()));
		pvo.setList(list);
	
		detail = productDAO.productDetail(pvo);
		if(detail != null) {
			detail.setP_info(detail.getP_info().toString().replace("\n", "<br />"));
		}
		
		return detail;
	} */
	
	// 상세페이지 구현
		@Override
		public ProductVO productDetail(ProductVO pvo) {
			ProductVO detail = null;
			List<ImageVO> list = imageDAO.imageDetail(pvo);
			
			detail = productDAO.productDetail(pvo);
			detail.setList(list);
			if(detail != null) {
				detail.setP_info(detail.getP_info().toString().replace("\n", "<br />"));
			}

			return detail;
		}
	
	// 상품수정 폼 구현
	@Override
	public ProductVO updateForm(ProductVO pvo) {
		ProductVO update = null;
		List<ImageVO> list = imageDAO.imageDetail(pvo);
		
		update = productDAO.productUpdateForm(pvo);
		update.setList(list);
		
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
	
	// 상품이미지 조회
	@Override
	public List<ImageVO> imageDetail(ProductVO pvo) {
		List<ImageVO> list = imageDAO.imageDetail(pvo);
		
		return list;
	}
	
	// 상품이미지 수정
//	@Override
//	public int imageUpdate(ProductVO pvo) throws Exception {
//		int result = 0;
//		
//		for(ImageVO ivo : pvo.getList()) {
//			if(!ivo.getFile().isEmpty()) {
//				FileUploadUtil.fileDelete(ivo.getI_name());
//			}else if(!ivo.getI_thumb().isEmpty()) {
//				FileUploadUtil.fileDelete(ivo.getI_thumb());
//			}
//			String fileName = FileUploadUtil.fileUpload(ivo.getFile(), "product");
//			ivo.setI_name(fileName);
//			if(ivo.getFile() == pvo.getList().get(0)) {
//				String thumbName = FileUploadUtil.makeThumbnail(fileName);
//				ivo.setI_thumb(thumbName);
//			}
//		}
//		result = imageDAO.imageUpdate(pvo);
//		
//		return result;
//	}
	
	// 상품이미지 삭제
	@Override
	public int imageDelete(ImageVO ivo) throws Exception{
		int result = 0;
		
		if(!ivo.getI_name().isEmpty()) {
			FileUploadUtil.fileDelete(ivo.getI_name());
		} else if(!ivo.getI_thumb().isEmpty()) {
			FileUploadUtil.fileDelete(ivo.getI_thumb());
		}
		
//		for(ImageVO ivo : pvo.getList()) {
//			if(!ivo.getFile().isEmpty()) {
//				FileUploadUtil.fileDelete(ivo.getI_name());
//				if(!ivo.getI_thumb().isEmpty()) {
//					FileUploadUtil.fileDelete(ivo.getI_thumb());
//				}
//			}
//		}
		result = imageDAO.imageDelete(ivo);
		
		return result;
	}
	
	// 재고리스트 조회 구현
	@Override
	public List<ProductVO> stockList(ProductVO pvo) {
		List<ProductVO> list = productDAO.stockList(pvo);
		
		return list;
	}
	
	// 재고수정 구현
	@Override
	public int stockUpdate(ProductVO pvo) {
		int result = 0;
		result = productDAO.stockUpdate(pvo);
		
		return result;
	}
}
