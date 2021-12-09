package com.msix.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CommonVO {
	private int pageNum = 0; // 페이지 번호
	private int amount = 0;  // 페이지에 보여줄 데이터 수
	
	private String search = "";   // 검색 대상
	private String keyword = "";  // 검색 단어
	
	public CommonVO() {
		this(1, 10);
	}
	
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
