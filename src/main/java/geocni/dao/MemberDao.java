package geocni.dao;

import javax.servlet.http.HttpSession;

import geocni.vo.MemberVo;

public interface MemberDao {
	
	public void memberReg(MemberVo mvo);
	
	public int idChk(MemberVo mvo);
	
	public boolean loginCheck(MemberVo mvo);

	public MemberVo viewMember(MemberVo mvo);
	
	public void logout(HttpSession session);
}
