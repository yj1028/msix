package com.msix.admin.product.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.msix.admin.product.vo.ProductVO;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ProductDAO productDAO;
	
//	@Test
//	public void testProductList() {
//		ProductVO pvo = new ProductVO();
//		pvo.setPageNum(1);
//		pvo.setAmount(10);
//		pvo.setSearch("p_no");
//		pvo.setKeyword("1");
//		List<ProductVO> list = productDAO.productList(pvo);
//		for(ProductVO vo : list) {
//			log.info(vo);
//		}
//	}
	
//	@Test
//	public void testBoardListCnt() {
//		ProductVO pvo = new ProductVO();
//
//		int result = productDAO.productListCnt(pvo);
//		log.info("전체 레코드 수 : " + result);
//	}
	
//	@Test
//	public void testProductInsert() {
//		ProductVO pvo = new ProductVO();
//		pvo.setP_name("가고일게코");
//		pvo.setP_type("Gecko");
//		pvo.setP_info("가고일게코 입니다.");
//		pvo.setP_price("120000");
//		pvo.setP_cnt(3);
//		
//		int result = productDAO.productInsert(pvo);
//		log.info("result : " + result);
//	}
	
	@Test
	public void testProductDetail() {
		ProductVO pvo = new ProductVO();
		pvo.setP_no("1");
		
		ProductVO vo = productDAO.productDetail(pvo);
		log.info(vo);
	}
	
}
