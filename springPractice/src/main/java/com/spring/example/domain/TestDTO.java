package com.spring.example.domain;

import java.util.ArrayList;
import java.util.List;

public class TestDTO {
	private List<SampleDTO> list;
	
	public TestDTO() {
		list = new ArrayList<>();
	}
	
	public List<SampleDTO> getList() {
		return list;
	}

	public void setList(List<SampleDTO> list) {
		this.list = list;
	}
	
}
