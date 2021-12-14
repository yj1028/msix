package com.msix.client.qboard.contoller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.client.common.vo.PageDTO;
import com.msix.client.member.vo.MemberVO;
import com.msix.client.qboard.service.QboardService;
import com.msix.client.qboard.vo.QboardVO;

import lombok.AllArgsConstructor;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qboard/")
@Log4j
@AllArgsConstructor
public class QboardController {
	private QboardService qboardService;
	
	//글목록 구현하기
	@RequestMapping(value = "/qboardList",method = RequestMethod.GET)
	public String qboardList(Model model,@ModelAttribute("data") QboardVO qvo) {
		log.info("qboardList호출 성공");
		//전체 레코드 조회
		List<QboardVO> qboardList=qboardService.qboardList(qvo);
		model.addAttribute("qboardList",qboardList);
		
	
		//전체 레코드 수 구현
		int total= qboardService.qboardListCnt(qvo);
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(qvo,total));
		//출력되는 글번호 표시
		int count=total-(qvo.getPageNum()-1)*qvo.getAmount();
		model.addAttribute("count",count);
		
		return "qboard/qboardList";
	
	}
	//글쓰기 폼 출력하기
	@RequestMapping(value = "/writeForm")
	public String writeForm() {
		log.info("writeForm호출성공");
		return "qboard/writeForm";
	}
	
	//글입력 구현하기
	@RequestMapping(value = "/qboardInsert", method = RequestMethod.POST)
	public String qboardInsert(QboardVO qvo, Model model, HttpSession session) {
		log.info("qboardInsert호출 성공");
		
		MemberVO vo = (MemberVO)session.getAttribute("login");
		qvo.setM_no(vo.getM_no());
		//추후세션변경
		int result=0;
		String url="";
		
		result=qboardService.qboardInsert(qvo);
		if(result==1) {
			url="/qboard/qboardList";
		}else {
			url="/qboard/writeForm";
		}
		return "redirect:"+url;
	}
	//글상세페이지 이동하기
	@RequestMapping(value = "/qboardDetail" ,method = RequestMethod.GET)
	public String qboardDetail(@ModelAttribute("data") QboardVO qvo,Model model) {
		log.info("qboardDetail호출성공");
		QboardVO detail =qboardService.qboardDetail(qvo);
		model.addAttribute("detail",detail);
		return "qboard/qboardDetail";
	}
	// 글수정 폼 이동하기
	@RequestMapping(value ="/updateForm",method = RequestMethod.GET )
	public String updateForm(@ModelAttribute("data") QboardVO qvo, Model model) {
		log.info("updateForm호출 성공");		
		QboardVO updateData=qboardService.updateForm(qvo);
		model.addAttribute("updateData",updateData);
		return "qboard/updateForm";
	}
	
	//글수정구현
	@RequestMapping(value = "/qboardUpdate",method = RequestMethod.POST)
	public String qboardUpdate(@ModelAttribute QboardVO qvo, RedirectAttributes ras) {
		log.info("qboardUpdate호출 성공");
		log.info("qvo"+qvo);
		int result=0;
		String url="";
		
		result=qboardService.qboardUpdate(qvo);
		ras.addAttribute("q_no",qvo.getQ_no());
		if (result==1) {
			url="/qboard/qboardDetail";
		} else {
			url="/qboard/qboardList";
		}	
		return "redirect:"+url;
	}
		
	//글삭제 구현
	@RequestMapping(value = "/qboardDelete" ,method = RequestMethod.POST)
	public String qboardDelete(@ModelAttribute QboardVO qvo,RedirectAttributes ras) {
		log.info("qboardDelete호출성공");
		//아래 변수에는 입력 성공에 대한 상태값 담습니다 (1or0)
		
		int result=0;
		String url="";
		
		result=qboardService.qboardDelete(qvo);
		
		if(result==1) {
			url="/qboard/qboardList";
		}else {
			url="/qboard/qboardDetail";
		}
		return "redirect:"+url;
	}
}