package com.msix.admin.product.vo;

import java.util.ArrayList;
import java.util.List;



import com.msix.admin.image.vo.ImageVO;
import com.msix.common.vo.CommonVO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ProductVO extends CommonVO{
	private int p_no = 0; // 상품번호
	private String p_type = ""; // 상품분류
	private String p_name = ""; // 상품명
	private String p_price = ""; // 상품가격
	private int p_cnt = 0; // 상품수량(재고)
	private String p_info = ""; // 상품정보
	private String p_date; // 등록일
	private String p_update; // 수정일
	private String p_isdelete; // 삭제여부
	
	private String i_thumb;
	private List<ImageVO> list;
	
	public ProductVO() {
		list = new ArrayList<ImageVO>();
	}
}
