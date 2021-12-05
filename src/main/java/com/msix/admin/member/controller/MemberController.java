package com.msix.admin.member.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.msix.admin.member.service.MemberService;
import com.msix.admin.member.vo.MemberVO;
import com.msix.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
@AllArgsConstructor
public class MemberController {
	
	private MemberService memberService;
	
	@GetMapping("/memberList")
	public String memberList(@ModelAttribute("data") MemberVO mvo, Model model) {
		log.info("memberList 호출 성공");
		
		List<MemberVO> memberList = memberService.memberList(mvo);
		model.addAttribute("memberList", memberList);
		
		// 전체 레코드 수 구현
		int total = memberService.memberListCnt(mvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(mvo, total));
		// 출력되는 글번호 제어
		int count = total - (mvo.getPageNum() - 1) * mvo.getAmount();
		model.addAttribute("count", count);
		
		return "member/memberList";
	}
	
	@GetMapping("/memberDetail")
	public String memberDetail(MemberVO mvo, Model model) {
		log.info("memberDetail 호출 성공");
		
		MemberVO detail = memberService.memberDetail(mvo);
		model.addAttribute("detail", detail);
		
		return "member/memberDetail";
	}
	
	@RequestMapping(value = "/memberDormancy", method = RequestMethod.POST)
	public String memberDormancy(@ModelAttribute MemberVO mvo, Model model) {
		log.info("memberDormancy 호출 성공");
		
		int result = 0;
		
		result = memberService.memberDormancy(mvo);
		if(result == 1) {
			model.addAttribute("msg", "회원 탈퇴 되었습니다.");
		}
		
		return "redirect:/member/memberList";
	}
}
