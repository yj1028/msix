package com.spring.example.domain;
/*
import lombok.Getter;
import lombok.Setter;
import lombok.ToString; */
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
/*
@Setter
@Getter
@ToString
*/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SampleDTO {
	private String name;
	private int age;
}
