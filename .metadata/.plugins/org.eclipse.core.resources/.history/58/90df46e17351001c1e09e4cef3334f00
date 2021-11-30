package com.msix.common.log;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
@Aspect
public class LoggerAdvice {
	
	@Around("execution(* com.msix..*Impl.*(..))")
	public Object timeLogging(ProceedingJoinPoint pjp) throws Throwable{
		log.info("-----------------------------------");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
		
		//long startTime = System.currentTimeMillis();
		StopWatch watch = new StopWatch();
		watch.start();
		log.info("[호출 메서드의 파라미터 값] " + Arrays.toString(pjp.getArgs()));
		
		Object result = null;
		// proceed() : 실제 target 객체의 메서드를 실행하는 기능
		result = pjp.proceed();
		
		//long endTime = System.currentTimeMillis();
		watch.stop();
		
		log.info("[Class] " + pjp.getTarget().getClass()); // 현재 실행중인 클래스
		
		//logger.info(pjp.getSignature().getName()+":소요시간 " + (endtime-startTime)+"ms");
		log.info("[호출 메서드명] " + pjp.getSignature().getName());
		log.info("[소요시간] " + watch.getTotalTimeSeconds() + "ms");
		log.info("[리턴 결과] " + result);
		log.info("[공통 로그 Log] 비즈니스 로직 수행 후 동작");
		log.info("-----------------------------------");
		
		return result;
	}
}
