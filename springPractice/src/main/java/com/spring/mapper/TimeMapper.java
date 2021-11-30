package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.spring.example.domain.SubjectVO;

public interface TimeMapper {
//인터페이스로 생성하면 mybatis가 구현클래스를 자동생성한다. 
	
	@Select("select sysdate from dual")
	//오늘 날짜 얻어오는 쿼리를 Select어노테이션으로 명시 가능.
	//xml문서에 쿼리 정의를 많이 함.
	public String getTime();
	
	@Select("select author from board where num='1'")
	public String getAuthor();
	
	public String getTime2();
	
	public String getSubjectName(String s_num);
	
	//테이블 전체를 조회하려면 반환타입을 list로 잡는다. 
	public List<SubjectVO> getSubjects(int no);
	
	/* insert는 select와 달리 반환되는 값이 0과 1이므로 반환타입 int이다.
	조회역할을 하는 select만 받아오는 값이 다름. */
	public int subjectInsert(SubjectVO svo);
	
	public int subjectUpdate(SubjectVO svo);
	
	public int subjectDelete(SubjectVO svo);
}
