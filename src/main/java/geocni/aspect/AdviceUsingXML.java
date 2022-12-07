package geocni.aspect;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AdviceUsingXML {
	private Logger LOGGER = LoggerFactory.getLogger(this.getClass());
	
	public void beforeTargetMethod(JoinPoint thisjoinPoint) {
		LOGGER.info("adviceUsingXML.beforeTargetMethod excute...");
		
		/* 현재 실행되는 로직의 클래스명과 메서드명을 가져옴 */
		Class clazz = thisjoinPoint.getTarget().getClass();
		
		String className = clazz.getSimpleName();
		String methodName = thisjoinPoint.getSignature().getName();
		/* 현재 실행되는 로직의 클래스명과 메서드명을 가져옴 */
		
		LOGGER.info("{}.{} executed", className, methodName);
	}
}
