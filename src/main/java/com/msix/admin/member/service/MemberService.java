package com.msix.admin.member.service;

import java.util.List;

import com.msix.admin.member.vo.AMemberVO;

public interface MemberService {
	public List<AMemberVO> memberList(AMemberVO mvo);
	public int memberListCnt(AMemberVO mvo);
	public AMemberVO memberDetail(AMemberVO mvo);
	public int memberDormancy(AMemberVO mvo);
}
