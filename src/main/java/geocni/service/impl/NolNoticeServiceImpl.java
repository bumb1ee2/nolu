package geocni.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import geocni.dao.NolNoticeDao;
import geocni.service.NolNoticeService;
import geocni.vo.NolNoticeVo;

@Service
public class NolNoticeServiceImpl implements NolNoticeService{

	@Autowired
		private NolNoticeDao nnDao;
	
	@Override
	public List<NolNoticeVo> noList() {
		return nnDao.noList();
	}
	
	@Override
	public List<NolNoticeVo> upList() {
		return nnDao.upList();
	}
	
	@Override
	public int count() {
		return nnDao.count();
	}
	@Override
	public NolNoticeVo noDetail(int n_num) {
		return nnDao.noDetail(n_num);
	}
	
	@Override
	public void readCount(int n_num) {
		nnDao.readCount(n_num);
	}
	
	@Override
	public NolNoticeVo selectBf(int n_num) {
		return nnDao.selectBf(n_num);
	}
	
	@Override
	public NolNoticeVo selectNx(int n_num) {
		return nnDao.selectNx(n_num);
	}
	@Override
	public void noWrite(NolNoticeVo nnVo)throws Exception {
		String n_file = null;
		MultipartFile uploadFile = nnVo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			n_file = uuid+"."+ext;
			uploadFile.transferTo(new File("C:\\Users\\geocni\\Desktop\\eGovFrameDev-3.8.0-64bit\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\t\\images\\notice\\" + n_file));
		} 
		nnVo.setN_file(n_file);
		nnDao.noWrite(nnVo);
	}
	
	@Override
	public void noMod(NolNoticeVo nnVo)throws Exception {
		String n_file = null;
		MultipartFile uploadFile = nnVo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			n_file = uuid+"."+ext;
			uploadFile.transferTo(new File("C:\\Users\\geocni\\Desktop\\eGovFrameDev-3.8.0-64bit\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\t\\images\\notice\\" + n_file));
		} else {
			n_file = nnVo.getN_file();
		}
		nnVo.setN_file(n_file);
		nnDao.noMod(nnVo);
	}
	
	@Override
	public void noDel(int n_num) {
		nnDao.noDel(n_num);
	}
}
