package com.msix.admin.member.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.msix.admin.member.vo.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberDAO memberDAO;
	
	@Test
	public void testMemberList() {
		MemberVO mvo = new MemberVO();
		
		List<MemberVO> list = memberDAO.memberList(mvo);
		for(MemberVO vo : list) {
			log.info(vo);
		}
	}
	
//	@Test
//	public void testMemberDetail() {
//		MemberVO mvo = new MemberVO();
//		mvo.setM_no(1);
//		
//		MemberVO member = memberDAO.memberDetail(mvo);
//		
//		log.info(member.toString());
//	}
}
