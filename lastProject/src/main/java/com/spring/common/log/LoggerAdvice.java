package com.spring.common.log;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;

//import java.util.Arrays;

//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.annotation.AfterReturning;
//import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

//import com.spring.client.board.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@Log4j
// 스프링에서 빈으로 인식하가 위해서 사용
@Component
// 해당 클래스의 객체가 aspect를 구현한 것임으로 나타내기 위해서 사용
@Aspect
public class LoggerAdvice {
	
	/*
	@Before("execution(* com.spring..*Impl.*(..))")
	public void printLogging() {
		log.info(" ");
		log.info("공통 로그 LogJ 비지니스 로직 수행 전 동작");
		log.info(" ");
	}
	*/
	/*
	@Before("execution(* com.spring..*Impl.*(..)) && args(bvo)")
	public void printLogging(BoardVO bvo) {
		log.info(" ");
		log.info("공통 로그 LogJ 비지니스 로직 수행 전 동작");
		log.info(" ");
		log.info("BoardVO 타입의 bvo 파라미터 값: "+ bvo);
	}
	*/
	/*
	@Before("execution(* com.spring..*Impl.*(..))")
	public void printLogging(JoinPoint jp) {
		log.info(" ");
		log.info("공통 로그 LogJ 비지니스 로직 수행 전 동작");
		log.info("호출 메서드명: "+jp.getSignature().getName());
		log.info("호출 메서드의 파라미터 값: "+Arrays.toString(jp.getArgs()));
		log.info(" ");
	}
	
	@AfterThrowing(pointcut="execution(* com.spring..*Impl.*(..))", throwing="exception")
	public void printLogging(JoinPoint jp, Throwable exception) {
		log.info(" ");
		log.info("예외 발생");
		log.info("예외 발생 메서드명 " +jp.getSignature().getName());
		log.info("예외 메시지" +exception);
		log.info(" ");
	}
	
	@AfterReturning(pointcut="execution(* com.spring..*Impl.*(..))", returning ="returnValue")
	public void afterReturningMethod(JoinPoint jp, Object returnValue) {
		log.info(" ");
		log.info("공통 로그 비지니스 로직 수행 후 동작");
		log.info("afterReturningMethod() called " +jp.getSignature().getName());
		log.info("리턴 결과 : "+returnValue);
		log.info(" ");
	}
	*/
	@Around("execution(* com.spring..*Impl.*(..))")
	public Object timeLogging(ProceedingJoinPoint pjp) throws Throwable {
		log.info(" ");
		log.info("공통 로그 비지니스 로직 수행 전 동작");
		
		StopWatch watch = new StopWatch();
		watch.start();
		log.info("호출 메서드의 파라미터 값: "+Arrays.toString(pjp.getArgs()));
		Object result = null;
		result = pjp.proceed();
		watch.stop();
		
		log.info("class " + pjp.getTarget().getClass());
		
		log.info("호출 메서드명:"+pjp.getSignature().getName());
		log.info("소요시간:"+watch.getTotalTimeSeconds());
		log.info("리턴결과:"+result);
		log.info("공통 로그 비지니스 로직 수행 후 동작");
		log.info(" ");
		
		return result;
	}
}
