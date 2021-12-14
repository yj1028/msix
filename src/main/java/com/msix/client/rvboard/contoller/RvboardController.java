package com.msix.client.rvboard.contoller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.client.common.vo.PageDTO;
import com.msix.client.member.vo.MemberVO;
import com.msix.client.rvboard.service.RvboardService;
import com.msix.client.rvboard.vo.RvboardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rvboard/")
@Log4j
@AllArgsConstructor
public class RvboardController {
	private  RvboardService  rvboardService;
	
	
	//글목록 구현하기
	@RequestMapping(value = "/rvboardList" ,method = RequestMethod.GET)
	public String rvboardList(Model model,@ModelAttribute("data") RvboardVO rvvo) {
		log.info("rvboardList호출성공");
		
		List<RvboardVO> rvboardList=rvboardService.rvboardList(rvvo);
		model.addAttribute("rvboardList",rvboardList);
	
		
		//전체 레코드 수 구현
		int total=rvboardService.rvboardListCnt(rvvo);
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(rvvo, total));
		//출력되는 글번호 표시
		int count=total-(rvvo.getPageNum()-1)*rvvo.getAmount();
		model.addAttribute("count",count);
		return "rvboard/rvboardList";
	}
	
	//글쓰기 폼 출력하기
	@RequestMapping(value = "/writeForm")
	public String writeForm() {
		log.info("writeForm 호출성공");
		return "rvboard/writeForm";
	}
	//글입력 구현라기
	@RequestMapping(value = "/rvboardInsert" , method = RequestMethod.POST)
	public String rvboardInsert(RvboardVO rvvo, Model model, HttpSession session)throws Exception {
		log.info("rvboardInsert 호출성공");
		
		MemberVO vo = (MemberVO)session.getAttribute("login");
		rvvo.setM_no(vo.getM_no());
		
		//추후세션변경
		int result=0;
		String url="";
		
		result=rvboardService.rvboardInsert(rvvo);
		if(result==1) {//입력 성공시 게시판 리스트로 이동
			url="/rvboard/rvboardList";
		}else {
			url="/rvboard/writeForm";
		}
		return "redirect:"+url;
	}
	
	//글상세 구현 
	@RequestMapping(value = "/rvboardDetail",method =RequestMethod.GET )
	public String rvboardDetail(@ModelAttribute("data") RvboardVO rvvo, Model model) {
		log.info("rvboardDetail호출 성공");
		
		RvboardVO detail=rvboardService.rvboardDetail(rvvo);
		model.addAttribute("detail",detail);
		return "rvboard/rvboardDetail";
	}
	
	//글 수정 폼 출력하기 
	@RequestMapping(value = "/updateForm",method = RequestMethod.GET)
	public String updateForm(@ModelAttribute("data") RvboardVO rvvo,Model model) {
		log.info("updateForm호출성공");
		RvboardVO updateData=rvboardService.updateForm(rvvo);
		model.addAttribute("updateData",updateData);
		return "rvboard/updateForm";
	}
	
	//글수정 구현하기
	@RequestMapping(value = "/rvboardUpdate",method = RequestMethod.POST)
	public String rvboardUpdate(@ModelAttribute RvboardVO rvvo, RedirectAttributes ras)throws Exception {
		log.info("rvboardUpdate 호출성공"); 
		log.info("rvvo"+rvvo);
		int result=0;
		String url="";
		
		result=rvboardService.rvboardUpdate(rvvo);
		ras.addAttribute("rv_no",rvvo.getRv_no() );
		if(result==1) {
			url="/rvboard/rvboardDetail";
		}else {
			url="/rvboard/updateForm";
		}
		return "redirect:"+url;
	}
	
	
	//글삭제
	@RequestMapping(value = "/rvboardDelete", method = RequestMethod.POST)
	public String rvboardDelete(@ModelAttribute RvboardVO rvvo,RedirectAttributes ras)throws Exception {
		log.info("rvboardDelete호출성공");
		int result=0;
		
		String url="";
		
		result=rvboardService.rvboardDelete(rvvo);
		
		if(result==1) {
			url="/rvboard/rvboardList";
		}else {
			url="rvboard/rvboardDetail";
		}
		return "redirect:"+url;
	}
	
	//댓글 갯수 구하기
	@RequestMapping(value = "/ccmntCnt")
	@ResponseBody
	public String ccmntCnt(@RequestParam("rv_no") int rv_no) {
		int result=0;
		result=rvboardService.ccmntCnt(rv_no);
		return String.valueOf(result);
	}
}
