package geocni.dao;

import java.util.List;

import geocni.vo.NolRoomVo;

public interface NolRoomDao {
	
	public List<NolRoomVo> roomPreview(NolRoomVo nrVo);
	
	public NolRoomVo roomView(int r_num);
	
	public void roomState(NolRoomVo nrVo);
	
	public void roomMod(NolRoomVo nrVo);
	
	public void roomImgMod(NolRoomVo nrVo);
}
