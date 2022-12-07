package geocni.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import geocni.dao.NolResDao;
import geocni.service.NolResService;
import geocni.vo.NolResVo;

@Service
public class NolResServiceImpl implements NolResService{
	
	@Autowired
	NolResDao nreDao;
	
	@Override
	public List<NolResVo>resList(NolResVo nreVo) {
		return nreDao.resList(nreVo);
	}
	
	@Override
	public List<NolResVo> resInfo(NolResVo nreVo) {
		return nreDao.resInfo(nreVo);
	}
	@Override
	public void rsv(NolResVo nreVo) {
		nreDao.rsv(nreVo);
	}
	@Override
	public void resMod(NolResVo nreVo) {
		nreDao.resMod(nreVo);
	}
	
	@Override
	public void resDel(int res_num) {
		nreDao.resDel(res_num);
	}
	
}
