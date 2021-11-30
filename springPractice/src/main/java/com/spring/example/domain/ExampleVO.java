package com.spring.example.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExampleVO {
	
	private Integer no;
	private String name;
	private String phone;
	/* 클래스에 설정해놓은 필드명과 jsp문서의 form에 준 이름, 아이디 같아야 함.
	 * +테이블 컬럼명도 다같이 같아야함. */
	
}
