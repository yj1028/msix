package com.msix.admin.member.vo;

import com.msix.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AMemberVO extends CommonVO {
	private int m_no;
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_tel;
	private String m_email;
	private String m_date;
	private String m_update;
	private String m_isdelete;
}