package com.spring.client.board.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.board.vo.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardDAO boardDAO;
	
	@Test 
	public void testBoardList() {
		BoardVO bvo = new BoardVO();
		
		bvo.setPageNum(2);
		bvo.setAmount(10);
		
//		bvo.setSearch("b_title");
//		bvo.setKeyword("입력");
		
		List<BoardVO> list = boardDAO.boardList(bvo); 
		for(BoardVO vo : list) { 
			log.info(vo); 
		} 
	}
	
	
	
//	@Test
//	public void testBoardInsert() {
//		BoardVO board = new BoardVO();
//		board.setB_name("홍길동");
//		board.setB_title("입력확인");
//		board.setB_content("오늘도 힘 냅시다");
//		board.setB_pwd("1234");
//		
//		int count = boardDAO.boardInsert(board);
//		log.info("INSERT COUNT: " + count);
//	}
	
//	@Test
//	public void testBoardDetail() {
//		BoardVO vo = new BoardVO();
//		vo.setB_num(1);
//		BoardVO board = boardDAO.boardDetail(vo);
//		
//		log.info(board.toString());
//	}
	
//	@Test
//	public void testPwdConfirm() {
//		BoardVO vo = new BoardVO();
//		vo.setB_num(1);
//		vo.setB_pwd("123");
//		int count = boardDAO.pwdConfirm(vo);
//		
//		log.info("count : " + count);
//	}
	
//	@Test
//	public void testBoardUpdate() {
//		BoardVO vo = new BoardVO();
//		vo.setB_num(2);
//		vo.setB_title("수정~");
//		vo.setB_content("수정을 확인합니다");
//		//vo.setB_pwd("1111");
//		
//		int count = boardDAO.boardUpdate(vo);
//		log.info("update count : " + count);
//	}
	
//	@Test
//	public void testBoardDelete() {
//		BoardVO vo = new BoardVO();
//		vo.setB_num(6);
//		
//		int count = boardDAO.boardDelete(vo);
//		log.info("delete count: " + count);
//	}
}
