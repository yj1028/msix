package com.msix.admin.member.service;

import java.util.List;

import com.msix.admin.member.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> memberList(MemberVO mvo);
	public int memberListCnt(MemberVO mvo);
	public MemberVO memberDetail(MemberVO mvo);
	public int memberDormancy(MemberVO mvo);
}
