package tw.iiihealth.meal.meals;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="meals")
@Component("MealBean")
public class MealBean{
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	int ID;
	String name;
	int price;
	String material;
	double calories;
	double protein;
	double carbohydrates;
	double fat;
	int store_ID;
	
	
	public MealBean() {
		
	}
	
	public MealBean(String name ,int price,String material,double calories,
	        double protein,double carbohydrates,double fat,int store_ID) {
		this.name=name;
		this.price=price;
		this.material=material;
		this.calories=calories;
		this.protein=protein;
		this.carbohydrates=carbohydrates;
		this.fat=fat;
		this.store_ID=store_ID;
	}
	
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public double getProtein() {
		return protein;
	}

	public void setProtein(double protein) {
		this.protein = protein;
	}

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


	public double getCalories() {
		return calories;
	}


	public void setCalories(double calories) {
		this.calories = calories;
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


	public int getStore_ID() {
		return store_ID;
	}


	public void setStore_ID(int store_ID) {
		this.store_ID = store_ID;
	}

}
