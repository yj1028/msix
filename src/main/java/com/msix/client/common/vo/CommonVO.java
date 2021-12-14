package com.msix.client.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class CommonVO {
	// 조건검색시 사용할 필드(검색대상, 검색단어)
	private String search = "";
	private String keyword = "";
	
	private int pageNum = 0;	// 페이지 번호
	private int amount = 0;		// 페이지에 보여줄 데이터 수
	
	// 날자검색시 사용할 필드(시작일,종료일)
	private String start_date = "";
	private String end_date = "";
	
	public CommonVO() {
		this(1,15);
	}
	
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
