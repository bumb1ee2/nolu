package geocni.service;

import javax.servlet.http.HttpSession;

import geocni.vo.MemberVo;

public interface MemberService {

	public void memberReg(MemberVo mvo);

	public int idChk(MemberVo mvo);
	
	public boolean loginCheck(MemberVo mvo, HttpSession session);
	
	public MemberVo viewMember(MemberVo mvo);
	
	public void logout(HttpSession session);
}
