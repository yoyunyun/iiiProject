package tw.iiihealth.meal.diet;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="diet")
@Component("DietBean")
public class DietBean {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	int ID;
	String name;
	String type;
	double calories;
	double protein;
	double carbohydrates;
	double fat;
	double sugar;
	double na;
	
	public DietBean() {
		
	}
	
	public DietBean(String name,String type,double calories,
			        double protein,double carbohydrates,double fat,
			        double sugar,double na) {
		this.type=type;
		this.name=name;
		this.calories=calories;
		this.protein=protein;
		this.carbohydrates=carbohydrates;
		this.fat=fat;
		this.sugar=sugar;
		this.na=na;
		
	}
	
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getCalories() {
		return calories;
	}
	public void setCalories(double calories) {
		this.calories = calories;
	}
	public double getProtein() {
		return protein;
	}
	public void setProtein(double protein) {
		this.protein = protein;
	}
	public double getCarbohydrates() {
		return carbohydrates;
	}
	public void setCarbohydrates(double carbohydrates) {
		this.carbohydrates = carbohydrates;
	}
	public double getFat() {
		return fat;
	}
	public void setFat(double fat) {
		this.fat = fat;
	}
	public double getSugar() {
		return sugar;
	}
	public void setSugar(double sugar) {
		this.sugar = sugar;
	}
	public double getNa() {
		return na;
	}
	public void setNa(double na) {
		this.na = na;
	}
}
