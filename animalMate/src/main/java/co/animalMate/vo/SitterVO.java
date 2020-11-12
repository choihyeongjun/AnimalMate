package co.animalMate.vo;

public class SitterVO {
	private String id;
	private int maxP;
	private String status;
	private String code;
	private String comm;
	

	public String getComm() {
		return comm;
	}

	public void setComm(String comm) {
		this.comm = comm;
	}

	public SitterVO() {}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMaxP() {
		return maxP;
	}

	public void setMaxP(int maxP) {
		this.maxP = maxP;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
