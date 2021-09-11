package tw.iiihealth.membersystem.health.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.iiihealth.membersystem.member.model.Member;

@Entity // 指自己就是java bean //給Hibernate看的
@Table(name = "health") // 指bean對應到名為member的table //給Hibernate看的
@Component("Health") // 指自己就是java bean，並且名稱為Member //給Spring看的，重點是HQL要對到這
public class Health {

	@Id
	@Column(name = "healthid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int healthid;

	private int systolicBloodPressure;
	
	private int diastolicBloodPressure;
	
	private int heartRate;
	
	private int fastingBloodSugar;
	
	private int bloodSugarAfterMeal;
	
	private int height;
	
	private int weight;
	
	private double bmi;
	
	private int waistline;
	
	private int oxygenSaturation;
	
	private double temperature;
	
	private String medicalHistory;
	
	
	
    @OneToOne(cascade = {CascadeType.DETACH, CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH },
    		fetch = FetchType.EAGER)
    @JoinColumn(name = "memberid")
	private Member memberHealth;
	
    
    
	public int getHealthid() {
		return healthid;
	}

	public void setHealthid(int healthid) {
		this.healthid = healthid;
	}

	public int getSystolicBloodPressure() {
		return systolicBloodPressure;
	}

	public void setSystolicBloodPressure(int systolicBloodPressure) {
		this.systolicBloodPressure = systolicBloodPressure;
	}

	public int getDiastolicBloodPressure() {
		return diastolicBloodPressure;
	}

	public void setDiastolicBloodPressure(int diastolicBloodPressure) {
		this.diastolicBloodPressure = diastolicBloodPressure;
	}

	public int getHeartRate() {
		return heartRate;
	}

	public void setHeartRate(int heartRate) {
		this.heartRate = heartRate;
	}

	public int getFastingBloodSugar() {
		return fastingBloodSugar;
	}

	public void setFastingBloodSugar(int fastingBloodSugar) {
		this.fastingBloodSugar = fastingBloodSugar;
	}

	public int getBloodSugarAfterMeal() {
		return bloodSugarAfterMeal;
	}

	public void setBloodSugarAfterMeal(int bloodSugarAfterMeal) {
		this.bloodSugarAfterMeal = bloodSugarAfterMeal;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public double getBmi() {
		return bmi;
	}

	public void setBmi(double bmi) {
		this.bmi = bmi;
	}

	public int getWaistline() {
		return waistline;
	}

	public void setWaistline(int waistline) {
		this.waistline = waistline;
	}

	public int getOxygenSaturation() {
		return oxygenSaturation;
	}

	public void setOxygenSaturation(int oxygenSaturation) {
		this.oxygenSaturation = oxygenSaturation;
	}

	public double getTemperature() {
		return temperature;
	}

	public void setTemperature(double temperature) {
		this.temperature = temperature;
	}

	public String getMedicalHistory() {
		return medicalHistory;
	}

	public void setMedicalHistory(String medicalHistory) {
		this.medicalHistory = medicalHistory;
	}

	
	
	public Member getMember() {
		return memberHealth;
	}

	public void setMember(Member memberHealth) {
		this.memberHealth = memberHealth;
	}

	
	
}
