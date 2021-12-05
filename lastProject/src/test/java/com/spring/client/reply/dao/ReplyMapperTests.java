package com.spring.client.reply.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.client.reply.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired )
	private ReplyDao replyDao;
	
	
	public void replyList(){
		List<ReplyVO> list = replyDao.replyList(2);
		for(ReplyVO out : list) {
			log.info(out);
		}
	}
	
	
	public void replyInsert() {
		ReplyVO rvo = new ReplyVO();
		rvo.setB_num(2);
		rvo.setR_name("하려미");
		rvo.setR_content("답글 테스트 이틀째 입니다");
		rvo.setR_pwd("1234");
		
		replyDao.replyInsert(rvo);
	}

	public void pwdConfirm() {
		ReplyVO vo = new ReplyVO();
		vo.setR_num(1);
		vo.setR_pwd("1234");
		
		replyDao.pwdConfirm(vo);
	}
	
	public void replyupdate() {
		ReplyVO vo = new ReplyVO();
		vo.setR_num(1);
		vo.setR_content("답글 내용 수정 확인 테스트");
		
		replyDao.replyupdate(vo);
	}
	@Test
	public void replyDelete() {
		replyDao.replyDelete(14);
	}
	
	
}
