package com.spring.client.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.board.dao.BoardDAO;
import com.spring.client.board.vo.BoardVO;
import com.spring.common.file.FileUploadUtil;

import lombok.Setter;

@Service  // 인스턴스를 만들기 위한 선언
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardDAO boardDAO;
	
	// 글 목록 구현
	@Override
	public List<BoardVO> boardList(BoardVO bvo){
		List<BoardVO> list = boardDAO.boardList(bvo);
		return list;
	}
	
	@Override
	public int boardListCnt(BoardVO bvo) {
		return boardDAO.boardListCnt(bvo);
	}
	
	@Override
	public int boardInsert(BoardVO bvo) throws Exception {
		int result = 0;
		/* 예외를 발생시킬 코드 작성
		bvo.setB_num(0);
		if(bvo.getB_num() == 0) {
			throw new IllegalArgumentException("0번 글은 등록할 수 업습니다.");
		} */
		if(bvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "board");
			bvo.setB_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			bvo.setB_thumb(thumbName);
		}
		
		result = boardDAO.boardInsert(bvo);
		return result;
	}
	
	@Override
	public BoardVO boardDetail(BoardVO bvo) {
//		BoardVO detail = boardDAO.boardDetail(bvo);
//		return detail;
		BoardVO detail = null;
		detail = boardDAO.boardDetail(bvo);
		if(detail!=null) {
			detail.setB_content(detail.getB_content().toString().replaceAll("\n", "<br />"));
		}						// 받아온 내용중 엔터 처리되는것을 인식 시켜주기 위하여 \n을 <br />로 바꿔준다.
		return detail;
	}
	
	@Override
	public int pwdConfirm(BoardVO bvo) {
		int result = 0;
		result = boardDAO.pwdConfirm(bvo);
		return result;
	}
	
	@Override
	public BoardVO updateForm(BoardVO bvo) {
		BoardVO update = null;
		update = boardDAO.boardDetail(bvo);
		return update;
	}
	
	@Override
	public int boardUpdate(BoardVO bvo) throws Exception {
		int result = 0;
		//새 파일 유무 확인
		if(!bvo.getFile().isEmpty()) {
			// 기존 파일 유무 확인
			if(!bvo.getB_file().isEmpty()) {
				FileUploadUtil.fileDelete(bvo.getB_file());
				FileUploadUtil.fileDelete(bvo.getB_thumb());
			}
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "board");
			bvo.setB_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			bvo.setB_thumb(thumbName);
		}
		result = boardDAO.boardUpdate(bvo);
		return result;
	}
	
	public int boardDelete(BoardVO bvo) throws Exception {
		int result = 0;
		
		if(!bvo.getB_file().isEmpty()) {
			FileUploadUtil.fileDelete(bvo.getB_file());
			FileUploadUtil.fileDelete(bvo.getB_thumb());
		}
		result = boardDAO.boardDelete(bvo);
		return result;
	}
}
