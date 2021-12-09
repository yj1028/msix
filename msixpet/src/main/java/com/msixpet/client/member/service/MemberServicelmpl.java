package com.msixpet.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msixpet.client.member.dao.MemberDAO;
import com.msixpet.client.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberServicelmpl implements MemberService{
	
	@Setter(onMethod_=@Autowired)
	private MemberDAO memberDAO;
	
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

}
