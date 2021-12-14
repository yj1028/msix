package com.msix.client.member.dao;

import com.msix.client.member.vo.MemberVO;

public interface MemberDAO {
	public int idCheck(String m_id);
	public int memberInsert(MemberVO mvo);
	public MemberVO login(MemberVO mvo);
	public MemberVO selectId(MemberVO mvo);
	public int selectPwd(MemberVO mvo);
	public int rePasswd(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public int memberUpPasswd(MemberVO mvo);
	public int memberDelete(MemberVO mvo);
}
