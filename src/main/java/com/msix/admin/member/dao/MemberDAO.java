package com.msix.admin.member.dao;

import java.util.List;

import com.msix.admin.member.vo.MemberVO;

public interface MemberDAO {
	public List<MemberVO> memberList(MemberVO mvo);
	public int memberListCnt(MemberVO mvo);
	public MemberVO memberDetail(MemberVO mvo);
	public int memberDelete(MemberVO mvo);
}
