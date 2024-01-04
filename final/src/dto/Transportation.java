package dto;

public class Transportation {
	int transport_id;       
	String departure_station;   
	String arrival_station;  
	String transportation_type;  
	String transportation_number;
	
	public int getTransport_id() {
		return transport_id;
	}
	public void setTransport_id(int transport_id) {
		this.transport_id = transport_id;
	}
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
}

