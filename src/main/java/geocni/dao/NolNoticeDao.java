package geocni.dao;

import java.util.List;

import geocni.vo.NolNoticeVo;

public interface NolNoticeDao {

	public List<NolNoticeVo> noList();
	
	public List<NolNoticeVo> upList();
	
	public int count();
	
	public NolNoticeVo noDetail(int n_num);
	
	public void readCount(int n_num);
	
	public NolNoticeVo selectBf(int n_num);
	
	public NolNoticeVo selectNx(int n_num);
	
	public void noWrite(NolNoticeVo nnVo);
	
	public void noMod(NolNoticeVo nnVo);
	
	public void noDel(int n_num);
}
