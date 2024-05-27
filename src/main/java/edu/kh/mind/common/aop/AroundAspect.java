package edu.kh.mind.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Aspect
@Component
public class AroundAspect {

	private Logger logger = LoggerFactory.getLogger(AroundAspect.class);

	@Around("PointcutCollection.serviceImplPointcut()")
	public Object aroundLog(ProceedingJoinPoint pp) throws Throwable {

		String className = pp.getTarget().getClass().getSimpleName();

		String methodName = pp.getSignature().getName();
		
		String str = "";

		str += "[Service]" + className + "-" + methodName + "()";

		long startMs = System.currentTimeMillis();
		
		Object obj = pp.proceed();
		
		long endMs = System.currentTimeMillis();

		str += " [Running Time]" + (endMs - startMs) + "ms";
		str += " [param]" + Arrays.toString(pp.getArgs() );
		
		logger.debug(str);
		
		return obj;
	}

}
