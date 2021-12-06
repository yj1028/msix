package com.msix.admin.image.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ImageVO {
	private int i_no = 0; // 이미지번호
	private int p_no = 0; // 상품번호
	private String i_name = ""; // 이미지파일명
	private String i_thumb = ""; // 이미지파일썸네일명
	private String i_date; //등록일
	
	private MultipartFile file;      // 파일 업로드를 위한 필드

	
	
}
