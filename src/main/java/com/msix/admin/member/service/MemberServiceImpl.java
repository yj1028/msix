package com.msix.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.member.dao.AMemberDAO;
import com.msix.admin.member.vo.AMemberVO;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private AMemberDAO memberDAO;
	
	@Override
	public List<AMemberVO> memberList(AMemberVO mvo) {
		List<AMemberVO> list = memberDAO.memberList(mvo);
		return list;
	}
	
	@Override
	public int memberListCnt(AMemberVO mvo) {
		return memberDAO.memberListCnt(mvo);
	}
	
	@Override
	public AMemberVO memberDetail(AMemberVO mvo) {
		AMemberVO detail = memberDAO.memberDetail(mvo);
		return detail;
	}
	
	@Override
	public int memberDormancy(AMemberVO mvo) {
		int result = 0;
		result = memberDAO.memberDormancy(mvo);
		return result;
	}

}
