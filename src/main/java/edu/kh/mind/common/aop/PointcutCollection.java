package edu.kh.mind.common.aop;

import org.aspectj.lang.annotation.Pointcut;

// Pointcut을 모아둘 클래스
public class PointcutCollection {
	
	@Pointcut("execution(* edu.kh.mind..*Controller.*(..))")
	public void controllerPointcut() {}
	
	@Pointcut("execution(* edu.kh.mind..*ServiceImpl.*(..))")
	public void serviceImplPointcut() {}
	
	
}
