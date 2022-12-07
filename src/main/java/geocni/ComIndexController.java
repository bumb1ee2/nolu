package geocni;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// @Controller : 해당 java 파일을 Bean객체로 지정함
// @RequestMapping : 해당 경로에 요청이 오면, 아래의 메서드를 실행함 
// return "index"; : src/main/webapp/WEB-INF/jsp/ + "index" + .jsp 로 이동함

@Controller
public class ComIndexController { 

	@RequestMapping(value="/main.do")
	public String main() {
		
		// 로직
		
		return "index";
	}
}
