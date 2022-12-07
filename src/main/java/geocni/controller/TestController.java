package geocni.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import geocni.service.TestService;
import geocni.vo.TestVo;



@Controller
public class TestController {

	@Autowired
	private TestService testService;
	
	//목록
	@RequestMapping(value="/testList.do")
	public String testListDo(TestVo testVo, Model model) throws Exception {

		model.addAttribute("list", testService.selectTest(testVo));
		
		return "test/testList";
	}
	
	//상세 & 조회수
	@RequestMapping(value="/testDetail.do")
	public String viewForm(Model model, HttpServletRequest request) throws Exception {

		int bno = Integer.parseInt(request.getParameter("bno"));
		testService.boardHit(bno);
		TestVo testVo = testService.selectDetail(bno);
		model.addAttribute("vo", testVo);
		return "test/testDetail";
	}
	
	//작성(페이지)
	@RequestMapping(value="testRegister.do")
	public String testRegister() {
		return "test/testRegister";
	}
	
	//작성
	@RequestMapping(value="/insertTest.do")
	public String write(@ModelAttribute("testVo") TestVo testVo) throws Exception {
		testService.insertTest(testVo);
		return "redirect:testList.do";
	}
	
	//수정(페이지)
	@RequestMapping(value="modify.do")
	public String modForm(Model model, HttpServletRequest request) throws Exception {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		TestVo testVo = testService.selectDetail(bno);
		model.addAttribute("vo", testVo);
		
		return "test/testModify";
				
	}
	//수정
	@RequestMapping(value="updateTest.do")
	public String updateTest(@ModelAttribute("testVo") TestVo testVo) throws Exception {
		testService.updateTest(testVo);
		return "redirect:testDetail.do?bno="+testVo.getBno();
	}
	
	//삭제
	@RequestMapping(value="deleteTest.do")
	public String deleteTest(HttpServletRequest request) throws Exception {
		int bno = Integer.parseInt(request.getParameter("bno"));
		testService.deleteTest(bno);
		return "redirect:testList.do";
	}
	
 
}
