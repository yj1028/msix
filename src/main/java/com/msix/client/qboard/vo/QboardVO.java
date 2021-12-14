package com.msix.client.qboard.vo;

import com.msix.client.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class QboardVO extends CommonVO {
	private int q_no=0;
	private int m_no=0;
	private String q_tag="";
	private String q_title="";
	private String q_content="";
	private String q_date="";
	private int q_cnt=0;
	private String m_name="";
}
