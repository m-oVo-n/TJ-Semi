package dto;

import java.sql.Timestamp;

public class Payment {
	int payment_id;
	String member_id;
	int quantity;
	Timestamp payment_date;
	String payment_method = "card";
	int points_earned;
	int points_used;
	int total_price;
	
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Timestamp getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Timestamp payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	public int getPoints_earned() {
		return points_earned;
	}
	public void setPoints_earned(int points_earned) {
		this.points_earned = points_earned;
	}
	public int getPoints_used() {
		return points_used;
	}
	public void setPoints_used(int points_used) {
		this.points_used = points_used;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String check() {
		return "1:" + payment_id + " 2:" + member_id + " 3:" + quantity + " 4:" + payment_date + " 5:" + payment_method + " 6:" + points_earned + " 7:" + points_used + " 8:" + total_price;
	}
}