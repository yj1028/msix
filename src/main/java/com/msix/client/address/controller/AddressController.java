package com.msix.client.address.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.client.address.service.AddressService;
import com.msix.client.address.vo.AddressVO;
import com.msix.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/address/*")
@Log4j
@AllArgsConstructor
public class AddressController {

	private AddressService addressService;
	
	// 주소지 리스트
	@RequestMapping(value="/addressList")
	public String addressList(AddressVO avo, Model model, HttpSession session) {
		log.info("addressList 호출 성공");
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		
		avo.setM_no(mvo.getM_no());
		List<AddressVO> addressList = addressService.addressList(avo);
		model.addAttribute("addressList", addressList);
		
		return "address/addressList";
	}
	
	// 주소지 등록폼
	@RequestMapping(value="/writeForm")
	public String writeForm() {
		log.info("writeForm 호출 성공");
		
		return "address/writeForm";
	}
	
	// 주소지 등록
	@RequestMapping(value="/addressInsert", method=RequestMethod.POST)
	public String addressInsert(AddressVO avo, HttpSession session) {
		log.info("addressInsert 호출 성공");
		
		int result = 0;
		String url = "";
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		
		avo.setM_no(mvo.getM_no());
		
		result = addressService.addressInsert(avo);
		if(result == 1) {
			url = "/address/addressList";
		}else {
			url = "/address/writeForm";
		}
		
		return "redirect:"+url;
	}
	
	// 주소지 수정폼
	@RequestMapping(value="/updateForm")
	public String updateForm(AddressVO avo, HttpSession session, Model model) {
		log.info("updateForm 호출 성공");
		
		
		AddressVO vo = addressService.addressSelect(avo);
		model.addAttribute("address", vo);
		
		return "address/updateForm";
	}
	
	// 주소지 수정
	@RequestMapping(value="/addressUpdate", method=RequestMethod.POST)
	public String addressUpdate(AddressVO avo, HttpSession session, RedirectAttributes ras) {
		log.info("addressUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = addressService.addressUpdate(avo);
		
		log.info(result);
		if(result == 1) {
			url = "/address/addressList";
		}else {
			url = "/address/updateForm";
		}
		
		return "redirect:"+url;
	}
	
	// 주소지 삭제
	@RequestMapping(value="/addressDelete", method=RequestMethod.POST)
	@ResponseBody
	public String addressDelete(AddressVO avo) {
		log.info("addressDelete 호출 성공");
		String result = "";
	
		int resultData = addressService.addressDelete(avo);
		
		if(resultData == 1) {
			result = "success";
		}else {
			result = "false";
		}
		
		return result;
	}
	
}
