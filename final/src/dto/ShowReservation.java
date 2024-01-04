package dto;


public class ShowReservation {
	String departure_station;
	String arrival_station;
	String transportation_type;
	String transportation_number;
	String departure_time;
	String arrival_time;
	String total_time;
	int payment_id;
	int quantity;
	String payment_date;
	int total_price;
	String age;
	int seat_number;
	
	public String getDeparture_station() {
		return departure_station;
	}
	public void setDeparture_station(String departure_station) {
		this.departure_station = departure_station;
	}
	public String getArrival_station() {
		return arrival_station;
	}
	public void setArrival_station(String arrival_station) {
		this.arrival_station = arrival_station;
	}
	public String getTransportation_type() {
		return transportation_type;
	}
	public void setTransportation_type(String transportation_type) {
		this.transportation_type = transportation_type;
	}
	public String getTransportation_number() {
		return transportation_number;
	}
	public void setTransportation_number(String transportation_number) {
		this.transportation_number = transportation_number;
	}
	public String getDeparture_time() {
		return departure_time;
	}
	public void setDeparture_time(String departure_time) {
		this.departure_time = departure_time;
	}
	public String getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}
	public String getTotal_time() {
		return total_time;
	}
	public void setTotal_time(String total_time) {
		this.total_time = total_time;
	}
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public int getSeat_number() {
		return seat_number;
	}
	public void setSeat_number(int seat_id) {
		this.seat_number = seat_id;
	}
	
	
}