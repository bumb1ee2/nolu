package geocni.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import geocni.dao.TestDao;
import geocni.service.TestMapper;
import geocni.vo.TestVo;


@Repository
public class TestDaoImpl implements TestDao{

	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<TestVo> selectTest(TestVo testVo) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.selectTest(testVo);
	}
	
	@Override
	public TestVo selectDetail(int bno) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.selectDetail(bno);
	}
	
	@Override
	public void insertTest(TestVo testVo) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.insertTest(testVo);
	}
	
	@Override
	public void updateTest(TestVo testVo) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.updateTest(testVo);
	}
	
	@Override
	public void deleteTest(int bno) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.deleteTest(bno);
	}
	
	@Override
	public void boardHit(int bno) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.boardHit(bno);
	}
	
}
