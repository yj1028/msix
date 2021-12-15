package com.msix.client.address.vo;


import com.msix.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class AddressVO extends MemberVO{
	private int a_no;
	private int m_no;				// 회원번호
	private String a_pcode;			// 우편번호
	private String a_addr;			// 기본주소
	private String a_daddr;			// 상세주소
	private String a_destn;			// 배송지
	private String a_date;			// 등록일
	
	
}
