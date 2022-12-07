package geocni.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import geocni.dao.NolNoticeDao;
import geocni.vo.NolNoticeVo;

@Repository
public class NolNoticeDaoImpl implements NolNoticeDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NolNoticeVo> noList() {
		return sqlSession.selectList("nol.noList");
	}
	
	@Override
	public List<NolNoticeVo> upList() {
		return sqlSession.selectList("nol.upList");
	}
	
	@Override
	public int count() {
		return sqlSession.selectOne("nol.count");
	}
	@Override
	public NolNoticeVo noDetail(int n_num) {
		return sqlSession.selectOne("nol.noDetail", n_num);
	}
	@Override
	public void readCount(int n_num) {
		sqlSession.selectOne("nol.readCount", n_num);
	}
	@Override
	public NolNoticeVo selectBf(int n_num) {
		return sqlSession.selectOne("nol.selectBefore", n_num);
	}
	@Override
	public NolNoticeVo selectNx(int n_num) {
		return sqlSession.selectOne("nol.selectNext", n_num);
	}
	
	@Override
	public void noWrite(NolNoticeVo nnVo) {
		sqlSession.insert("nol.noWrite", nnVo);
	}
	
	@Override
	public void noMod(NolNoticeVo nnVo) {
		sqlSession.update("nol.noMod", nnVo);
	}
	
	@Override
	public void noDel(int n_num) {
		sqlSession.delete("nol.noDel", n_num);
	}
	
}
