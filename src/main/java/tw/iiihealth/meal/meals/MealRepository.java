package tw.iiihealth.meal.meals;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface MealRepository extends JpaRepository<MealBean, Integer> {
	
	@Query(value = "from MealBean where name =?1")
	public MealBean findMeal(String name);
	
	@Query(value = "Select * From Meals", nativeQuery = true)
	public ArrayList<MealBean> findAllMeals();
}
