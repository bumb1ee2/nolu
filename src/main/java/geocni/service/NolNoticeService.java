package geocni.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import geocni.vo.NolNoticeVo;

public interface NolNoticeService {

	public List<NolNoticeVo> noList();
	
	public List<NolNoticeVo> upList();
	
	public int count();
	
	public NolNoticeVo noDetail(int n_num);
	
	public void readCount(int n_num);
	
	public NolNoticeVo selectBf(int n_num);
	
	public NolNoticeVo selectNx(int n_num);
	
	public void noWrite(NolNoticeVo nnVo) throws Exception;
	
	public void noMod(NolNoticeVo nnVo) throws Exception;
	
	public void noDel(int n_num);
}
