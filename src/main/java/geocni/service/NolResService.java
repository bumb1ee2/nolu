package geocni.service;

import java.util.List;

import geocni.vo.NolResVo;

public interface NolResService {
	public List<NolResVo> resList(NolResVo nreVo);
	
	public List<NolResVo> resInfo(NolResVo nreVo);
	
	public void rsv(NolResVo nreVo);
	
	public void resMod(NolResVo nreVo);
	
	public void resDel(int res_num);
}
