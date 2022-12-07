package geocni.aspect;


import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogTest2 {
	private static Logger logger = LoggerFactory.getLogger(LogTest2.class);
	
	@Pointcut("within(geocni.*.impl..*")
	@Before("execution (* geocni.*.impl.*(..))")
	public void implLog() {
		logger.info("*****************");
	}
	
}
