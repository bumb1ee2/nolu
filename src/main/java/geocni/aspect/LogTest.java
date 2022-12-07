package geocni.aspect;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogTest {
	
	private static Logger logger = LoggerFactory.getLogger(LogTest.class);
	
	@RequestMapping(value="log/log.do")
	public String logTest() {
		logger.info("TEST LOG");
		return "";
	}
	
	
}	

