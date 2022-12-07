package geocni.vo;

import java.util.Date;

public class NolResVo {

	private int res_num;
	private String m_id;
	private Date res_date;
	private Date res_checkIn;
	private int res_day;
	private int r_num;
	private String res_state;
	private Date res_checkOut;
	private int price;
	
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	public Date getRes_checkIn() {
		return res_checkIn;
	}
	public void setRes_checkIn(Date res_checkIn) {
		this.res_checkIn = res_checkIn;
	}
	public int getRes_day() {
		return res_day;
	}
	public void setRes_day(int res_day) {
		this.res_day = res_day;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getRes_state() {
		return res_state;
	}
	public void setRes_state(String res_state) {
		this.res_state = res_state;
	}
	
	public Date getRes_checkOut() {
		return res_checkOut;
	}
	public void setRes_checkOut(Date res_checkOut) {
		this.res_checkOut = res_checkOut;
	}
}
