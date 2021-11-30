package com.msix.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.admin.member.dao.MemberDAO;
import com.msix.admin.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberDAO memberDAO;
	
	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		List<MemberVO> list = memberDAO.memberList(mvo);
		return list;
	}
	
	@Override
	public int memberListCnt(MemberVO mvo) {
		return memberDAO.memberListCnt(mvo);
	}
	
	@Override
	public MemberVO memberDetail(MemberVO mvo) {
		MemberVO detail = memberDAO.memberDetail(mvo);
		return detail;
	}
	
	@Override
	public int memberDelete(MemberVO mvo) {
		int result = 0;
		result = memberDAO.memberDelete(mvo);
		return result;
	}

}
