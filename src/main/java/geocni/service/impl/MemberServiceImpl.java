package geocni.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import geocni.dao.MemberDao;
import geocni.service.MemberService;
import geocni.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public void memberReg(MemberVo mvo) {
		memberDao.memberReg(mvo);
	}
	
	@Override
	public int idChk(MemberVo mvo) {
		return memberDao.idChk(mvo);
	}
	
	@Override
	public boolean loginCheck(MemberVo mvo, HttpSession session) {
		boolean result = memberDao.loginCheck(mvo);
		if(result) {
			MemberVo svo = viewMember(mvo);
			session.setAttribute("mid", svo.getMid());
			session.setAttribute("name", svo.getName());
		}
		return result;
	}
	
	@Override
	public MemberVo viewMember(MemberVo mvo) {
		return memberDao.viewMember(mvo);
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
}
