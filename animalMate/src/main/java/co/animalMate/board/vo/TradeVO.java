package co.animalMate.board.vo;

public class TradeVO {
	private int code;
	private String status;
	private String stime;
	private String etime;
	private String day;
	private String id;
	private int tmoney;
	
	public TradeVO() {}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getTmoney() {
		return tmoney;
	}

	public void setTmoney(int tmoney) {
		this.tmoney = tmoney;
	}
	
	
}
