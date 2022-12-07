package geocni.service;

import java.util.List;

import geocni.vo.NolRoomVo;

public interface NolRoomService {

	public List<NolRoomVo> roomPreview(NolRoomVo nrVo);
	
	public NolRoomVo roomView(int r_num);
	
	public void roomState(NolRoomVo nrVo);
	
	public void roomMod(NolRoomVo nrVo) throws Exception;
	
	public void roomImgMod(NolRoomVo nrVo) throws Exception;

}