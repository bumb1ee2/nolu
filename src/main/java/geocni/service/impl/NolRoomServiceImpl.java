package geocni.service.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import geocni.dao.NolRoomDao;
import geocni.service.NolRoomService;
import geocni.vo.NolNoticeVo;
import geocni.vo.NolRoomVo;

@Service
public class NolRoomServiceImpl implements NolRoomService{

	@Autowired
	NolRoomDao nrDao;
	
	@Override
	public List<NolRoomVo>roomPreview(NolRoomVo nrVo) {
		return nrDao.roomPreview(nrVo);
	}
	
	@Override
	public NolRoomVo roomView(int r_num) {
		return nrDao.roomView(r_num);
	}
	
	@Override
	public void roomState(NolRoomVo nrVo) {
		nrDao.roomState(nrVo);
	}
	
	@Override
	public void roomMod(NolRoomVo nrVo) throws Exception {
		String r_img1 = null;
		MultipartFile uploadFile = nrVo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			r_img1 = uuid+"."+ext;
			uploadFile.transferTo(new File("C:\\Users\\geocni\\Desktop\\eGovFrameDev-3.8.0-64bit\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\t\\images\\img_room\\" + r_img1));
		} else {
			r_img1 = nrVo.getR_img1();
		}
		nrVo.setR_img1(r_img1);
		nrDao.roomMod(nrVo);
	}
	
	@Override
	public void roomImgMod(NolRoomVo nrVo) throws Exception {
		String r_img2 = null;
		MultipartFile uploadFile = nrVo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			r_img2 = uuid+"."+ext;
			uploadFile.transferTo(new File("C:\\Users\\geocni\\Desktop\\eGovFrameDev-3.8.0-64bit\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\t\\images\\img_room\\" + r_img2));
		} else {
			r_img2 = nrVo.getR_img2();
		}
		nrVo.setR_img2(r_img2);
		nrDao.roomImgMod(nrVo);
	}
}
