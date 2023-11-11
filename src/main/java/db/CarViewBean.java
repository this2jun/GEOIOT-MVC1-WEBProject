package db;

public class CarViewBean {
	private String name; //차량이름
	private int price;
	private String img;
	private int reserveno;// 예약번호(삭제)
	private int qty;
	private int pday; //대여기간
	private String rday; //대여일
	private int insurance;
	private int bicycle;
	private int tableset;
	private int bbq;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getReserveno() {
		return reserveno;
	}
	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
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
