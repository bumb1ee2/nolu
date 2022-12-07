package geocni.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import geocni.dao.TestDao;
import geocni.service.TestService;
import geocni.vo.TestVo;

@Service
	public class TestServiceImpl implements TestService{

	@Autowired
		private TestDao testDao;
	
	@Override
		public List<TestVo>selectTest(TestVo testVo) throws Exception {
			return testDao.selectTest(testVo);
		}	
			
	@Override
		public TestVo selectDetail(int bno) throws Exception {
			return testDao.selectDetail(bno);
		}
	
	@Override
		public void insertTest(TestVo testVo) throws Exception {
			testDao.insertTest(testVo);
	}
	
	@Override
		public void updateTest(TestVo testVo) throws Exception {
			testDao.updateTest(testVo);
	}
	
	@Override
		public void deleteTest(int bno) throws Exception {
			testDao.deleteTest(bno);
	}
	
	@Override
		public void boardHit(int bno) throws Exception {
			testDao.boardHit(bno);
	}

	@Override
	public TestVo selectDetailTest(int bno) throws Exception {
		
		Boolean hasError = true;
		
		testDao.boardHit(bno);
		
		/*로직*/
		System.out.println("LOG");
		System.out.println("LOG");
		System.out.println("LOG");
		System.out.println("LOG");
		
		if(hasError) {
			throw new Exception();
		}
		
		return testDao.selectDetail(bno);
	}
}
