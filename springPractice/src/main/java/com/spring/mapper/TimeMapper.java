package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.spring.example.domain.SubjectVO;

public interface TimeMapper {
	@Select("select sysdate from dual")
	public String getTime();
	
	
	@Select("select s_name from subject where s_num ='01'")
	public String getNum();
	
	//쿼리문은 xml에 있음. 
	public String getTime2();
	
	public String getSubjectName(String s_num);
	
	public List<SubjectVO> getSubjects(int no);
	
	public int subjectInsert(SubjectVO vo);
	
	public int subjectUpdate(SubjectVO vo);
	
	public int subjectDelete(SubjectVO vo);
	
}
