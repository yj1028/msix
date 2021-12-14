package com.msix.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.client.address.dao.AddressDAO;
import com.msix.client.member.dao.MemberDAO;
import com.msix.client.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberServicelmpl implements MemberService{
	
	@Setter(onMethod_=@Autowired)
	private MemberDAO memberDAO;
	
	@Setter(onMethod_=@Autowired)
	private AddressDAO addressDAO;
	
	@Override
	public int idCheck(String m_id) {
		int result = 0;
		
		result = memberDAO.idCheck(m_id); 
		return result;
	}
	
	@Override
	public int memberInsert(MemberVO mvo) {
		int result = 0;
		
		result = memberDAO.memberInsert(mvo);
		return result;
	}

	@Override
	public MemberVO login(MemberVO mvo)  {
		
		MemberVO vo = memberDAO.login(mvo);
		return vo;
	}

	@Override
	public MemberVO selectId(MemberVO mvo) {
		
		MemberVO vo = memberDAO.selectId(mvo);
		return vo;
	}

	@Override
	public int selectPwd(MemberVO mvo) {
		int result = 0;
		
		result = memberDAO.selectPwd(mvo);
		return result;
	}

	@Override
	public int rePasswd(MemberVO mvo) {
		int result = 0;
		
		result = memberDAO.rePasswd(mvo);
		return result;
	}

	@Override
	public int memberUpdate(MemberVO mvo){
		int result = 0;
		
		result = memberDAO.memberUpdate(mvo);
		return result;
	}

	@Override
	public int memberUpPasswd(MemberVO mvo){
		int result = 0;
		
		result = memberDAO.memberUpPasswd(mvo);
		return result;
	}

	@Override
	public int memberDelete(MemberVO mvo){
		int result = 0;
		
		result = memberDAO.memberDelete(mvo);
		return result;
	}
	
	

}
