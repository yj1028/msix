package com.msixpet.client.member.dao;

import com.msixpet.client.member.vo.MemberVO;

public interface MemberDAO {
	public int idCheck(String m_id);
	public int memberInsert(MemberVO mvo);
	public MemberVO login(MemberVO mvo);
}
