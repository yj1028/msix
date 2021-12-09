package com.msixpet.client.common.vo;

import lombok.Getter;

@Getter
public class PageDTO {
	private int startPage; // 화면에서 보여지는 페이지의 시작번호
	private int endPage; // 화면에서 보여지는 페이지의 끝번호
	private boolean prev, next; // 이전과 다음으로 이동한 링크의 표시 여부
	
	private int total; // 전체 레코드 수
	private CommonVO cvo; // 페이지번호, 한 페이지에 보여줄 레코드 수가 필드로 존재
	
	public PageDTO(CommonVO cvo, int total) {
		this.cvo = cvo;
		this.total = total;
		
		/* 페이징의 끝번호(endPage) 구하기
		   this.endPage = (int)(Math.ceil(페이지번호 / 10.0) * 10; */
		this.endPage = (int)(Math.ceil(cvo.getPageNum() / 10.0)) * 10;
		
		/* 페이징의 시작번호(startPage) 구하기 */
		this.startPage = this.endPage - 9;
		
		/*끝 페이지 구하기 */
		int realEnd = (int)(Math.ceil((total * 1.0)/cvo.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		/* 이전(prev) 구하기 */
		this.prev = this.startPage > 1; // 1 11 21 31...
		
		/* 다음(next) 구하기 */
		this.next = this.endPage < realEnd; // 10 20 30 40...
	}
}
