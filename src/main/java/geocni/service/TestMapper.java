package geocni.service;

import java.util.List;

import geocni.vo.TestVo;

public interface TestMapper {
	List<TestVo> selectTest(TestVo testVo) throws Exception;
	
	public TestVo selectDetail(int bno) throws Exception;
	
	public void insertTest(TestVo testVo) throws Exception;
	
	public void updateTest(TestVo testVo) throws Exception;
	
	public void deleteTest(int bno) throws Exception;
	
	public void boardHit(int bno) throws Exception;
}
