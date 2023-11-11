package db;

public class CarReserveBean {
	private int reserveno;
	private int no;
	private String id;
	private int qty;//수량
	private int pday;//대여기간
	private String rday;//대여일(Date형 날짜연산가능)
	private int insurance;
	private int bicycle;
	private int tableset;
	private int bbq;
	public int getReserveno() {
		return reserveno;
	}
	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getPday() {
		return pday;
	}
	public void setPday(int pday) {
		this.pday = pday;
	}
	public String getRday() {
		return rday;
	}
	public void setRday(String rday) {
		this.rday = rday;
	}
	public int getInsurance() {
		return insurance;
	}
	public void setInsurance(int insurance) {
		this.insurance = insurance;
	}
	public int getBicycle() {
		return bicycle;
	}
	public void setBicycle(int bicycle) {
		this.bicycle = bicycle;
	}
	public int getTableset() {
		return tableset;
	}
	public void setTableset(int tableset) {
		this.tableset = tableset;
	}
	public int getBbq() {
		return bbq;
	}
	public void setBbq(int bbq) {
		this.bbq = bbq;
	}
	
	
}
