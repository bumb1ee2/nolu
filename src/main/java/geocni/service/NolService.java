package geocni.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import geocni.vo.NolVo;

public interface NolService {

	public void memberJoin(NolVo nolVo);
	
	public boolean loginCheck(NolVo nolVo, HttpSession session);
	
	public int idCheck(String id);
	
	public NolVo viewMember(NolVo nolVo);

	public void logout(HttpSession session);
	
	public NolVo memInfo(String id);
	
	public void memMod(NolVo nolVo);
	
	public void memDel(String id);
	
	public List<NolVo> memList(NolVo nolVo);
	
	
}
