package com.spring.example.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;*/

/*@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter 
@ToString*/
//어노테이션으로 생성자, 설정자, 접근자를 모두 만들 수 있음.

@Data
@AllArgsConstructor
@NoArgsConstructor
//data어노테이션으로 한 번에 다 생성 가능. 
public class SampleDTO {
	private String name;
	private int age;
}
