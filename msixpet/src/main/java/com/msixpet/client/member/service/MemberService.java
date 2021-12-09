package com.msixpet.client.member.service;


import com.msixpet.client.member.vo.MemberVO;

public interface MemberService {
	public int idCheck(String m_id);
	public int memberInsert(MemberVO mvo);
	public MemberVO login(MemberVO mvo) ;
}
