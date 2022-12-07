package geocni.vo;

import org.springframework.web.multipart.MultipartFile;

public class NolRoomVo {
	private int r_num;
	private int r_base_person;
	private int r_max_person;
	private int r_base_price;
	private String r_amenty;
	private String r_img1;
	private String  r_img2;
	private String r_state;
	private String r_type;
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getR_base_person() {
		return r_base_person;
	}
	public void setR_base_person(int r_base_person) {
		this.r_base_person = r_base_person;
	}
	public int getR_max_person() {
		return r_max_person;
	}
	public void setR_max_person(int r_max_person) {
		this.r_max_person = r_max_person;
	}
	public int getR_base_price() {
		return r_base_price;
	}
	public void setR_base_price(int r_base_price) {
		this.r_base_price = r_base_price;
	}
	public String getR_amenty() {
		return r_amenty;
	}
	public void setR_amenty(String r_amenty) {
		this.r_amenty = r_amenty;
	}
	public String getR_img1() {
		return r_img1;
	}
	public void setR_img1(String r_img1) {
		this.r_img1 = r_img1;
	}
	public String getR_img2() {
		return r_img2;
	}
	public void setR_img2(String r_img2) {
		this.r_img2 = r_img2;
	}
	public String getR_state() {
		return r_state;
	}
	public void setR_state(String r_state) {
		this.r_state = r_state;
	}
	public String getR_type() {
		return r_type;
	}
	public void setR_type(String r_type) {
		this.r_type = r_type;
	}	
	

}
