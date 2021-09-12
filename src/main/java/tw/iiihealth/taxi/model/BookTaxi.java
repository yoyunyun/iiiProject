package tw.iiihealth.taxi.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.iiihealth.membersystem.member.model.Member;

@Entity
@Table(name = "booktaxi")
@Component
public class BookTaxi {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "book_id")
	private int book_id;

	@ManyToOne(cascade = {CascadeType.DETACH, CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "member_id")
	private Member member_id;

	private String tname;
	private String address;
	private String date;
	private String hour;
	private String min;
	private String passenger;
	private String phone;
	private String mail;

	public BookTaxi() {
	};

	public BookTaxi(Member member_id, String tname, String address, String date, String hour, String min,
			String passenger, String phone, String mail) {
		this.member_id = member_id;
		this.tname = tname;
		this.address = address;
		this.date = date;
		this.hour = hour;
		this.min = min;
		this.passenger = passenger;
		this.phone = phone;
		this.mail = mail;
	}

	public BookTaxi(int book_id, Member member_id, String tname, String address, String date, String hour, String min,
			String passenger, String phone, String mail) {
		this.book_id = book_id;
		this.member_id = member_id;
		this.tname = tname;
		this.address = address;
		this.date = date;
		this.hour = hour;
		this.min = min;
		this.passenger = passenger;
		this.phone = phone;
		this.mail = mail;
	}

	public Member getMember_id() {
		return member_id;
	}

	public void setMember_id(Member member_id) {
		this.member_id = member_id;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public String getMin() {
		return min;
	}

	public void setMin(String min) {
		this.min = min;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassenger() {
		return passenger;
	}

	public void setPassenger(String passenger) {
		this.passenger = passenger;
	}

}
