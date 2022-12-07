package geocni.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import geocni.dao.NolDao;
import geocni.service.NolService;
import geocni.vo.NolVo;

@Service
public class NolServiceImpl implements NolService{

	@Autowired
	NolDao nolDao;
	
	@Override
	public void memberJoin(NolVo nolVo) {
		nolDao.memberJoin(nolVo);
	}
	

	@Override
	public boolean loginCheck(NolVo nolVo, HttpSession session) {
		boolean result = nolDao.loginCheck(nolVo);
		if(result) {
			NolVo nolVo2 = viewMember(nolVo);
			session.setAttribute("id", nolVo2.getM_id());
			session.setAttribute("m_id", nolVo2.getM_id());
			session.setAttribute("m_pass", nolVo2.getM_pass());
			session.setAttribute("m_name", nolVo2.getM_name());
			session.setAttribute("m_tel", nolVo2.getM_tel());
			session.setAttribute("m_birth", nolVo2.getM_birth());
			session.setAttribute("m_email", nolVo2.getM_email());
		}
		return result;
	}
	
	@Override
	public int idCheck(String id) {
		int result = 0;
		result = nolDao.idCheck(id);
		return result;
	}

	@Override
	public NolVo viewMember(NolVo nolVo) {
		return nolDao.viewMember(nolVo);
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	@Override
	public NolVo memInfo(String id) {
		return nolDao.memInfo(id);
	}
	
	@Override
	public void memMod(NolVo nolVo) {
		nolDao.memMod(nolVo);
	}
	
	@Override
	public void memDel(String id) {
		nolDao.memDel(id);
	}
	
	@Override
	public List<NolVo>memList(NolVo nolVo) {
		return nolDao.memList(nolVo);
	}
	
}
