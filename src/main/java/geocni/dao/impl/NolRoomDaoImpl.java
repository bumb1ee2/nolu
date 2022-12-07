package geocni.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import geocni.dao.NolRoomDao;
import geocni.vo.NolRoomVo;

@Repository
public class NolRoomDaoImpl implements NolRoomDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NolRoomVo> roomPreview(NolRoomVo nrVo) {
		return sqlSession.selectList("nol.roomPreview");
	}
	
	@Override
	public NolRoomVo roomView(int r_num) {
		return sqlSession.selectOne("nol.roomView", r_num);
	}
	
	@Override
	public void roomState(NolRoomVo nrVo) {
		sqlSession.update("nol.roomState", nrVo);
	}
	
	@Override
	public void roomMod(NolRoomVo nrVo) {
		sqlSession.update("nol.roomMod", nrVo);
	}
	
	@Override
	public void roomImgMod(NolRoomVo nrVo) {
		sqlSession.update("nol.roomImgMod", nrVo);
	}
}
