//package com.msix.admin.member.dao;
//
//import java.util.List;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//<<<<<<< HEAD
//
//=======
//>>>>>>> branch 'msix_total' of https://github.com/yj1028/msix.git
//import com.msix.admin.member.vo.AMemberVO;
//
//import lombok.Setter;
//import lombok.extern.log4j.Log4j;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//@Log4j
//public class MemberMapperTests {
//	
//	@Setter(onMethod_ = @Autowired)
//	private AMemberDAO memberDAO;
//	
//	@Test
//	public void testMemberList() {
//		AMemberVO mvo = new AMemberVO();
//		
//		List<AMemberVO> list = memberDAO.memberList(mvo);
//		for(AMemberVO vo : list) {
//			log.info(vo);
//		}
//	}
//	
////	@Test
////	public void testMemberDetail() {
////		MemberVO mvo = new MemberVO();
////		mvo.setM_no(1);
////		
////		MemberVO member = memberDAO.memberDetail(mvo);
////		
////		log.info(member.toString());
////	}
//}
