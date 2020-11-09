package co.animalMate.vo;

public class BoardSearchVO {
	private String Pic;
	private String Type;
	private String Location1;
	private int Price;
	private String Status;
	private String Stime;
	private String Etime;
	private int code;
	private String Edate;
	private String Sdate;
	
	
	

	public String getEdate() {
		return Edate;
	}
	public void setEdate(String edate) {
		Edate = edate;
	}
	public String getSdate() {
		return Sdate;
	}
	public void setSdate(String sdate) {
		Sdate = sdate;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public BoardSearchVO() {
		super();
	}
	public String getPic() {
		return Pic;
	}
	public void setPic(String pic) {
		Pic = pic;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}

	public String getLocation1() {
		return Location1;
	}
	public void setLocation1(String location1) {
		Location1 = location1;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getStime() {
		return Stime;
	}
	public void setStime(String stime) {
		Stime = stime;
	}
	public String getEtime() {
		return Etime;
	}
	public void setEtime(String etime) {
		Etime = etime;
	}
 
	
	}
