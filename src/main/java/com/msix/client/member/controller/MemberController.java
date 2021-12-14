package com.msix.client.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.msix.client.member.service.MemberService;
import com.msix.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
@AllArgsConstructor
public class MemberController {
	
	private MemberService memberService;
	
	// 회원가입 페이지
	@RequestMapping(value="/memberJoinForm")
	public String joinForm() {
		log.info("join 호출 성공");
		
		return "member/memberJoin";	
	}
	
	// 회원수정 페이지
	@RequestMapping(value="/memberUpdateForm")
	public String UpdateForm(MemberVO mvo) {
		log.info("memberUpdateForm 호출 성공");
		
		return "member/memberUpdate";	
	}
	
	// 아이디 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String idCheck(String m_id) {
		log.info("idCheck 호출 성공");
		log.info("전달받은 id: "+m_id);
		
		int result = memberService.idCheck(m_id);
		log.info("결과 : " + result);
		
		return String.valueOf(result);
	}
	
	// 회원가입
	@RequestMapping(value="/memberInsert", method=RequestMethod.POST)
	public String memberInsert(MemberVO mvo, Model model) throws Exception {
		log.info("memberInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = memberService.memberInsert(mvo);
		if(result == 1) {
			url = "/login/loginForm";
		} else {
			url = "/main/main";
		}
		
		return "redirect:"+url;
	}
	
	// 회원정보 수정
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MemberVO mvo, HttpSession session, Model model){
		log.info("memberUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		MemberVO vo = (MemberVO)session.getAttribute("login");
		mvo.setM_no(vo.getM_no());
		
		result = memberService.memberUpdate(mvo);
		
		log.info("result : " + mvo.getM_no());
		
		if(result == 1) {
			session.invalidate();
			model.addAttribute("errorMsg", "회원정보가 변경되었습니다.");
			url="login/loginForm";
		}
		
//		session.invalidate();
		
		//return "redirect:"+url;
		return url;
	}
	
	// 회원정보에서 비밀번호 수정
	@RequestMapping(value="/memberUpPwd", method=RequestMethod.POST)
	public String memberUpPasswd(@ModelAttribute MemberVO mvo, HttpSession session ,Model model){
		log.info("memberUpPasswd 호출 성공");
		
		int result = 0;
		String url = "";
		
		MemberVO vo = (MemberVO)session.getAttribute("login");
		mvo.setM_no(vo.getM_no());
		
		result = memberService.memberUpPasswd(mvo);
		
		log.info("result : " + result);

		if(result == 1) {
			session.invalidate();
			model.addAttribute("errorMsg", "비밀번호가 변경되었습니다.");
			url="login/loginForm";
		}else {
			model.addAttribute("msg", "비밀번호를 다시 입력해주세요.");
			url="member/memberUpdate";
		}
		return url;
	}
	
	// 회원삭제 페이지
	@RequestMapping(value="/memberDeleteForm")
	public String deleteForm() {
		log.info("memberDeleteForm 호출 성공");
		
		return "member/memberDelete";	
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/memberDelete", method=RequestMethod.POST)
	public String memberDelete(@ModelAttribute MemberVO mvo, HttpSession session, Model model) {
		log.info("memberDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = memberService.memberDelete(mvo);
		
		log.info("result : " + result);
		if(result == 1) {
			session.invalidate();
			model.addAttribute("errorMsg", "회원삭제가 되었습니다.");
			url="main/main";
		}else {
			model.addAttribute("msg", "비밀번호가 틀렷습니다 다시 입력해주세요.");
			url="member/memberDelete";
		}
		return url;
	}
}
