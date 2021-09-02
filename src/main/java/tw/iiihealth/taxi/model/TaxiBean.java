package tw.iiihealth.taxi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="taxi")
@Component
public class TaxiBean {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="TNAME")
	private String tname;
	@Column(name="PHONE")
	private String phone;
	@Column(name="ADDRESS")
	private String address;
	@Column(name="SERCITY")
	private String serCity;
	@Column(name="CARETAXI")
	private String careTaxi;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSerCity() {
		return serCity;
	}
	public void setSerCity(String serCity) {
		this.serCity = serCity;
	}
	public String getCareTaxi() {
		return careTaxi;
	}
	public void setCareTaxi(String careTaxi) {
		this.careTaxi = careTaxi;
	}
	
	
	
}
