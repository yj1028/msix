package com.spring.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.reply.dao.ReplyDao;
import com.spring.client.reply.vo.ReplyVO;

//import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
//주입 방식 : @AllArgsConstructor 또는 @Setter(onMethod_ = @Autowired)
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyDao replyDao;

	@Override
	public List<ReplyVO> replyList(Integer b_num) {
		List<ReplyVO> list = null;
		list = replyDao.replyList(b_num);
		return list;
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = 0;
		result = replyDao.replyInsert(rvo);
		return result;
	}

	@Override
	public int pwdConfirm(ReplyVO rvo) {
		int result = 0;
		result = replyDao.pwdConfirm(rvo);
		return result;
	}

	@Override
	public int replyupdate(ReplyVO rvo) {
		int result = 0;
		result = replyDao.replyupdate(rvo);
		return result;
	}

	@Override
	public int replyDelete(Integer r_num) {
		int result = 0;
		result = replyDao.replyDelete(r_num);
		return result;
	}
	
	
}
