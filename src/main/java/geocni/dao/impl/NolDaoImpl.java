package geocni.dao.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import geocni.dao.NolDao;
import geocni.vo.NolVo;

@Repository
public class NolDaoImpl implements NolDao{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void memberJoin(NolVo nolVo) {
		sqlSession.insert("nol.memberJoin", nolVo);
	}
	
	@Override
	public boolean loginCheck(NolVo nolVo) {
		
		String m_name = sqlSession.selectOne("nol.loginCheck", nolVo);
		
		return (m_name == null) ? false : true;
	}
	
	@Override
	public int idCheck(String id) {
		return sqlSession.selectOne("nol.idCheck", id);
	}
	
	@Override
	public NolVo viewMember(NolVo nolVo) {
		return sqlSession.selectOne("nol.viewMember", nolVo);
	}
	
	@Override
	public void logout(HttpSession session) {	
	
	}
	
	@Override
	public NolVo memInfo(String id) {
		return sqlSession.selectOne("nol.memInfo", id);
	}
	
	@Override
	public void memMod(NolVo nolVo) {
		sqlSession.update("nol.memMod", nolVo);
	}
	
	@Override
	public void memDel(String id) {
		sqlSession.delete("nol.memDel", id);
	}
	
	@Override
	public List<NolVo> memList(NolVo nolVo) {
		return sqlSession.selectList("nol.memList");
	}
}
