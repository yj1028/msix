package com.msix.client.product.vo;

import com.msix.client.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ProductVO extends CommonVO {
	private String p_no; // 상품번호	//----타입변경
	private String p_name = ""; // 상품명
	private String p_price; // 상품가격
	private String p_type = ""; // 상품분류
	private String p_code = ""; // 상품분류	//----추가
	private int p_cnt = 0; // 상품수량(재고)
	private String p_info = ""; // 상품정보
	private String p_date; // 등록일
	private String p_update; // 수정일
	private String p_isdelete; // 삭제여부
	
	private String i_thumb;
	
	public ProductVO() {
		CImageVO ivo = new CImageVO();
		i_thumb = ivo.getI_thumb();
		
		super.setPageNum(1);
		super.setAmount(15);
		
	}
	
}
