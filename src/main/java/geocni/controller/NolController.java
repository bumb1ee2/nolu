package geocni.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.enterprise.context.RequestScoped;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import geocni.service.NolNoticeService;
import geocni.service.NolResService;
import geocni.service.NolRoomService;
import geocni.service.NolService;
import geocni.vo.NolNoticeVo;
import geocni.vo.NolResVo;
import geocni.vo.NolRoomVo;
import geocni.vo.NolVo; 

@Controller
public class NolController {
	
	/*member*/
	@Autowired
	private NolService nolService;
	
	// 로그인(페이지)
	@RequestMapping(value="login.do")
	public String login() {
		return "member/login";
	}
	
	// 로그인
	@RequestMapping(value="loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute NolVo nolVo, HttpSession session) {	 
		
		boolean result = nolService.loginCheck(nolVo, session);
				
		ModelAndView mav = new ModelAndView();

		if(result == true) {
			mav.setViewName("redirect:main.do");
		} else {
			mav.setViewName("redirect:login.do");
		}
		return mav;
	}
	// 회원가입 (페이지)
	@RequestMapping(value="joinForm.do")
	public String joinForm() {
		return "member/register";
	}
	
	// 회원가입
	@RequestMapping(value="join.do")
	public String join(NolVo nolVo, String m_id) {		
		nolService.memberJoin(nolVo);
		return "redirect:login.do";	
	}
	
	// 중복확인
	@RequestMapping(value="idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam("m_id") String m_id) {
		String result = "N";
		int i = nolService.idCheck(m_id);
		if (i == 1) result = "Y";
		return result;
	}

	
	// 로그아웃
	@RequestMapping(value="logout.do")
	public ModelAndView logout(HttpSession session) {
		nolService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:main.do");
		return mav;
	}
	
	// 회원 상세
	@RequestMapping(value="memInfo.do")
	public String memInfo(String id, Model model) {
		model.addAttribute("mem", nolService.memInfo(id));
		return "member/m_info";
	}
	
	// 회원 수정 (페이지)
	@RequestMapping(value="memModForm.do")
	public String memModForm(String id, Model model) {
		model.addAttribute("mem", nolService.memInfo(id));
		return "member/m_modForm";
	}
	
	// 회원 수정
	@RequestMapping(value="memMod.do")
	public String memMod(@ModelAttribute("nolVo") NolVo nolVo, String m_id, HttpServletRequest request) {
		nolService.memMod(nolVo);
		request.getParameter(m_id);
		return "redirect:memInfo.do?id="+m_id;
	}
	
	// 회원 탈퇴
	@RequestMapping(value="memDel.do")
	public String memDel(HttpSession session, String id) {
		nolService.memDel(id);
		session.invalidate();
		return "member/login";
	}
	
	// 회원 탈퇴 (관리자)
	@RequestMapping(value="memDelAdmin.do")
	public String memDelA(String id) {
		nolService.memDel(id);
		return "redirect:memberList.do";
	}
	
	// 회원 목록 (관리자)
	@RequestMapping(value="memberList.do")
	public String memberList(NolVo nolVo, Model model) {
		model.addAttribute("memList", nolService.memList(nolVo));
		return "member/memberList";
	}
	
	
	
	/* room */
	@Autowired
	private NolRoomService nrService;
	
	// 객실 소개
	@RequestMapping(value="rooms.do")
	public String rooms(NolRoomVo nrVo, Model model) {
		model.addAttribute("rooms", nrService.roomPreview(nrVo));
		return "room/rooms";
	}
	
	// 객실 상세
	@RequestMapping(value="roomview.do")
	public String roomView(Model model, HttpServletRequest request) {
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		model.addAttribute("room", nrService.roomView(r_num));
		return "room/roomview";
	}
	
	// 객실 관리 (관리자)
	@RequestMapping(value="roomAdmin.do")
	public String roomAdmin(NolRoomVo nrVo, Model model) {
		model.addAttribute("rooms", nrService.roomPreview(nrVo));
		return "room/admin/roomManagement";
	}
	
	// 객실상태 수정 (관리자)
	@RequestMapping(value="roomState.do")
	public String roomState(@ModelAttribute("nrVo") NolRoomVo nrVo) {
		nrService.roomState(nrVo);
		return "redirect:roomAdmin.do";
	}
	
	// 객실관리 상세 (페이지)
	@RequestMapping(value="roomDetail.do")
	public String roomDetail(int r_num, Model model) {
		model.addAttribute("room", nrService.roomView(r_num));
		return "room/admin/roomDetail";
	}
	// 객실 정보 수정
	@RequestMapping(value="roomMod.do")
	public String roomMod(@ModelAttribute("nrVo") NolRoomVo nrVo, int r_num, HttpServletRequest request) throws Exception{
		nrService.roomMod(nrVo);
		r_num = Integer.parseInt(request.getParameter("r_num"));
		return "redirect:roomDetail.do?r_num="+r_num;
	}
	// 객실 이미지2 수정
	@RequestMapping(value="roomImgMod.do")
	public String roomImgMod(@ModelAttribute("nrVo") NolRoomVo nrVo, int r_num, HttpServletRequest request) throws Exception {
		nrService.roomImgMod(nrVo);
		r_num = Integer.parseInt(request.getParameter("r_num"));
		return "redirect:roomDetail.do?r_num="+r_num;
	}
	
	/* reservation */
	@Autowired
	private NolResService nreService;
	
	// 예약 하기 (페이지)
	@RequestMapping(value="reserP.do")
	public String reserP() {
		return "reservation/reservationP";
	}
	// 예약하기 (AJAX)
	@RequestMapping(value="resAjax.do")
	public String resAjax() {
		return "reservation/resAjax";
	}
	// 예약하기
	@RequestMapping(value="rsv.do")
	public String rsv(NolResVo nreVo) {
		nreService.rsv(nreVo);
		return "redirect:main.do";
	}
	
	// 예약 목록 (관리자)
	@RequestMapping(value="reservList.do")
	public String resList(NolResVo nreVo, Model model) {
		model.addAttribute("reservationList", nreService.resList(nreVo));
		return "reservation/resList";
	}
	
	// 예약 목록 (회원)
	@RequestMapping(value="reservInfo.do")
	public String resInfo(NolResVo nreVo, Model model) {
		model.addAttribute("res", nreService.resInfo(nreVo));
		return "reservation/m_reservation";
	}
	
	// 결제상태 수정 (관리자)
	@RequestMapping(value="resMod.do")
	public String resMod(@ModelAttribute("nreVo") NolResVo nreVo) {
		nreService.resMod(nreVo);
		return "redirect:reservList.do";
	}
	
	// 예약 삭제 (관리자)
	@RequestMapping(value="resDel.do")
	public String resDel(int res_num) {
		nreService.resDel(res_num);
		return "redirect:reservList.do";
	}
	
	/* notice */
	@Autowired
	private NolNoticeService nnService;
	
	// 공지 리스트
	@RequestMapping(value="noList.do")
	public String noList(Model model) {
		model.addAttribute("noList", nnService.noList());
		model.addAttribute("upList", nnService.upList());
		return "notice/noList";
	}
	// 상세
	@RequestMapping(value="noDetail.do")
	public String noDetail(Model model, HttpServletRequest request) {
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		nnService.readCount(n_num);
		model.addAttribute("article", nnService.noDetail(n_num));
		return "notice/notice_view";
	}
	// 이전페이지
	@RequestMapping(value="selectBf.do")
	public String selectBf(Model model, HttpServletRequest request) {
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		model.addAttribute("article", nnService.selectBf(n_num));
		return "notice/notice_view";
	}
	// 다음페이지
	@RequestMapping(value="selectNx.do")
	public String selectNx(Model model, HttpServletRequest request) {
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		model.addAttribute("article", nnService.selectNx(n_num));
		return "notice/notice_view";
	}
	// 작성 (페이지)
	@RequestMapping(value="noWriteForm.do")
	public String noWriteForm() {
		return "notice/notice_write";
	}
	
	// 작성
	@RequestMapping(value="noWrite.do")
	public String noWrite(NolNoticeVo nnVo) throws Exception {
		nnService.noWrite(nnVo);
		return "redirect:noList.do";
	}
	
	// 수정 (페이지)
	@RequestMapping(value="noModForm.do")
	public String noModForm(int n_num, Model model) {
		model.addAttribute("article", nnService.noDetail(n_num));
		return "notice/notice_modify";
	}
	
	// 수정
	@RequestMapping(value="noMod.do")
	public String noMod(@ModelAttribute("nnVo") NolNoticeVo nnVo, int n_num, HttpServletRequest request) throws Exception {
		nnService.noMod(nnVo);
		return "redirect:noDetail.do?n_num="+n_num;
	}
	
	// 삭제 (페이지)
	@RequestMapping(value="noDelForm.do")
	public String noDelForm(@RequestParam("n_num") int n_num, Model model) {
		model.addAttribute("n_num", n_num);
		return "notice/notice_delete";
	}
	
	// 삭제
	@RequestMapping(value="noDel.do")
	public String noDel(int n_num) {
		nnService.noDel(n_num);
		return "redirect:noList.do";
	}
	
	
	/* etc */
	@RequestMapping(value="hotel_intro.do")
	public String hotel_intro() {
		return "common/hotel_intro";
	}
	@RequestMapping(value="loca.do")
	public String loca() {
		return "common/loca";
	}
	@RequestMapping(value="tour.do")
	public String tour() {
		return "common/tour";
	}
	
	
}