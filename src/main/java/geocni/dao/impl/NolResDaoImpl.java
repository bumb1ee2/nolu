package geocni.dao.impl;

import java.util.List;
import java.sql.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import geocni.dao.NolResDao;
import geocni.vo.NolResVo;

@Repository
public class NolResDaoImpl implements NolResDao{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<NolResVo> resList(NolResVo nreVo) {
		return sqlSession.selectList("nol.resList");
	}
	
	@Override
	public List<NolResVo> resInfo(NolResVo nreVo) {
		return sqlSession.selectList("nol.resInfo", nreVo);
	}
	
	@Override
	public void rsv(NolResVo nreVo) {
		sqlSession.insert("nol.reserv", nreVo);
	}
	
	@Override
	public void resMod(NolResVo nreVo) {
		sqlSession.update("nol.resMod", nreVo);
	}
	
	@Override
	public void resDel(int res_num) {
		sqlSession.delete("nol.resDel", res_num);
	}
}
