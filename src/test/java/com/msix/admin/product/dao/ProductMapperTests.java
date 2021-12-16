//package com.msix.admin.product.dao;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//<<<<<<< HEAD
//
//import com.msix.admin.product.vo.AProductVO;
//
//=======
//import com.msix.admin.product.vo.AProductVO;
//>>>>>>> branch 'msix_total' of https://github.com/yj1028/msix.git
//
//import lombok.Setter;
//import lombok.extern.log4j.Log4j;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//@Log4j
//public class ProductMapperTests {
//	
//	@Setter(onMethod_ = @Autowired)
//	private AProductDAO productDAO;
//	
////	@Test
////	public void testProductList() {
////		ProductVO pvo = new ProductVO();
////		List<ProductVO> list = productDAO.productList(pvo);
////		for(ProductVO vo : list) {
////			log.info(vo);
////		}
////	}
//	
////	@Test
////	public void testBoardListCnt() {
////		ProductVO pvo = new ProductVO();
////
////		int result = productDAO.productListCnt(pvo);
////		log.info("전체 레코드 수 : " + result);
////	}
//	
//	@Test
//	public void testProductInsert() {
//		AProductVO pvo = new AProductVO();
//		pvo.setP_no("1");
//		pvo.setP_name("가고일게코");
//		pvo.setP_code("10");
//		pvo.setP_type("Gecko");
//		pvo.setP_info("가고일게코 입니다.");
//		pvo.setP_price("120000");
//		pvo.setP_cnt(3);
//		
//		int result = productDAO.productInsert(pvo);
//		log.info("result : " + result);
//	}
//	
////	@Test
////	public void testProductDetail() {
////		ProductVO pvo = new ProductVO();
////		pvo.setP_no("1");
////		
////		ProductVO vo = productDAO.productDetail(pvo);
////		log.info(vo);
////	}
//	
////	@Test
////	public void testProductUpdate() {
////		ProductVO pvo = new ProductVO();
////		pvo.setP_no("1");
////		pvo.setP_name("카모 팩맨");
////		pvo.setP_type("야앙서류");
////		pvo.setP_price("78000");
////		pvo.setP_info("튼튼하고 건강한 개구리입니다.");
////		
////		int count = productDAO.productUpdate(pvo);
////		log.info("count : " + count);
////	}
//	
////	@Test
////	public void testProductDelete() {
////		ProductVO pvo = new ProductVO();
////		pvo.setP_isdelete("Y");
////		pvo.setP_no(2);
////		
////		int count = productDAO.productDelete(pvo);
////		log.info("count : " + count);
////	}
//	
//}