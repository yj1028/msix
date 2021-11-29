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
	
	@Test
	public void testProductList() {
		ProductVO pvo = new ProductVO();
		
		List<ProductVO> list = productDAO.productList(pvo);
		for(ProductVO vo : list) {
			log.info(vo);
		}
	}
}
