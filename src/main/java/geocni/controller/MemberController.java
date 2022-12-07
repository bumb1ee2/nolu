package geocni.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import geocni.service.MemberService;
import geocni.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
/*	
	//회원가입(페이지)
	@RequestMapping(value="join.do")
	public String join() {
		return "member/register";
	}
	
	//회원가입
	@RequestMapping(value="memberReg.do", method=RequestMethod.POST) 
	public String regPOST(MemberVo mvo) {
		memberService.memberReg(mvo);
		return "member/login";
	}
	
	//아이디중복
	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(MemberVo mvo) {
		int result = memberService.idChk(mvo);
		return result;
	}
	

	//로그인(페이지)
	@RequestMapping(value="login.do")
	public String login() {
		return "member/login";
	}

	
	//로그인
	@RequestMapping(value="loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVo mvo, HttpSession session) {
		boolean result = memberService.loginCheck(mvo, session);
		
		
		ModelAndView mav = new ModelAndView();
			if(result == true) {
				mav.setViewName("redirect:testList.do");
			} else {
				mav.setViewName("redirect:login.do");
			}
			return mav;
		}

	
	//로그아웃
	@RequestMapping(value="logout.do")
	public ModelAndView logout(HttpSession session) {
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		mav.addObject("msg", "logout");
		return mav;
	}
*/
}
