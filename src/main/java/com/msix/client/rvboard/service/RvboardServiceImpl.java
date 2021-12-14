package com.msix.client.rvboard.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.client.ccmnt.dao.CcmntDAO;
import com.msix.client.rvboard.dao.RvboardDAO;
import com.msix.client.rvboard.vo.RvboardVO;
import com.msix.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class RvboardServiceImpl implements RvboardService {
	@Setter(onMethod_= @Autowired)
	private RvboardDAO rvboardDAO;
	
	@Setter(onMethod_= @Autowired)
	private CcmntDAO ccmntDAO;
	//글목록 구현
	@Override
	public List<RvboardVO> rvboardList(RvboardVO rvvo){
		List<RvboardVO> list =null;
		list =rvboardDAO.rvboardList(rvvo);
		return list;
	}
	//전체 레코드 수 구현
	public int rvboardListCnt(RvboardVO rvvo) {
		return rvboardDAO.rvboardListCnt(rvvo);
	}
	
	//글입력 구현
	@Override
	public int rvboardInsert(RvboardVO rvvo)throws Exception {
		int result=0;

		if(rvvo.getFile().getSize()>0) {
			String fileName=FileUploadUtil.fileUpload(rvvo.getFile(),"rvboard");
			rvvo.setRv_image(fileName);
		}
		
		result=rvboardDAO.rvboardInsert(rvvo);
		return result;
	}
	//글상세 구현
	@Override
	public RvboardVO rvboardDetail(RvboardVO rvvo) {
		rvboardDAO.RvcntUpdate(rvvo);
		RvboardVO detail=null;
		detail=rvboardDAO.rvboardDetail(rvvo);
		if(detail!=null) {
			detail.setRv_content(detail.getRv_content().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}
	
	//수정폼으로 이동하기
	@Override
	public RvboardVO updateForm(RvboardVO rvvo) {
		RvboardVO update=null;
		update=rvboardDAO.rvboardDetail(rvvo);
		return update;
	
	}
	
	//글 수정 구현하기
	@Override
	public int rvboardUpdate(RvboardVO rvvo)throws Exception {
		int result=0;
		
		if(!rvvo.getFile().isEmpty()) {
			if(!rvvo.getRv_image().isEmpty()) {
				FileUploadUtil.fileDelete(rvvo.getRv_image());
			}
			String fileName=FileUploadUtil.fileUpload(rvvo.getFile(), "rvboard");
			rvvo.setRv_image(fileName);
		}
		result =rvboardDAO.rvboardUpdate(rvvo);
		return result;
	}

	
	//글삭제 구현하기
	@Override
	public int rvboardDelete(RvboardVO rvvo) throws Exception{
		int result=0;
		ccmntDAO.rvccmntDelete(rvvo.getRv_no());
		if(!rvvo.getRv_image().isEmpty()) {
			FileUploadUtil.fileDelete(rvvo.getRv_image());
		}
		result=rvboardDAO.rvboardDelete(rvvo);
		return result;
	}
	@Override
	public int ccmntCnt(int rv_no) {
		int result=0;
		result=ccmntDAO.ccmntCnt(rv_no);
		return result;
	}
		
}
