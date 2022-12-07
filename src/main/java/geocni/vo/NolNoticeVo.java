package geocni.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NolNoticeVo {
	private int n_num;
	private String m_id;
	private String n_pass;
	private String n_subject;
	private String n_content;
	private String n_file; 
	private int n_re_ref;
	private int n_re_lev;
	private int n_re_seq;
	private int n_readcount;
	private Date n_date;
	private String n_fix;
	private MultipartFile uploadFile;
	
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getN_pass() {
		return n_pass;
	}
	public void setN_pass(String n_pass) {
		this.n_pass = n_pass;
	}
	public String getN_subject() {
		return n_subject;
	}
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_file() {
		return n_file;
	}
	public void setN_file(String n_file) {
		this.n_file = n_file;
	}
	public int getN_re_ref() {
		return n_re_ref;
	}
	public void setN_re_ref(int n_re_ref) {
		this.n_re_ref = n_re_ref;
	}
	public int getN_re_lev() {
		return n_re_lev;
	}
	public void setN_re_lev(int n_re_lev) {
		this.n_re_lev = n_re_lev;
	}
	public int getN_re_seq() {
		return n_re_seq;
	}
	public void setN_re_seq(int n_re_seq) {
		this.n_re_seq = n_re_seq;
	}
	public int getN_readcount() {
		return n_readcount;
	}
	public void setN_readcount(int n_readcount) {
		this.n_readcount = n_readcount;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public String getN_fix() {
		return n_fix;
	}
	public void setN_fix(String n_fix) {
		this.n_fix = n_fix;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}


}