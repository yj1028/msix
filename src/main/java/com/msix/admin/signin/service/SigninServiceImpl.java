package com.msix.admin.signin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.msix.admin.signin.dao.SigninDAO;
import com.msix.admin.signin.vo.SigninVO;
import lombok.Setter;

@Service
public class SigninServiceImpl implements SigninService {
	
	@Setter(onMethod_ = @Autowired)
	private SigninDAO signinDAO;
	
	// 관리자 로그인 구현
	@Override
	public int signin(SigninVO svo) {
		int result = 0;
		result = signinDAO.signin(svo);
		
		return result;
	}

}
