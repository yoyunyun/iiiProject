package tw.iiihealth.meal.meals;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.iiihealth.elder.model.Equip;
import tw.iiihealth.meal.diet.DietBean;


@Service("MealService")
@Transactional
public class MealService {
	
	@Autowired
	private MealRepository mealRepository;
	
	// 新增餐點
	public MealBean insert(MealBean m) {
		return mealRepository.save(m);
	}
	
	// 修改餐點
	public MealBean update(MealBean m) {
		return mealRepository.save(m);
	}
	
	public void save(MealBean mealBean) {
		mealRepository.save(mealBean);
	}
	
	// 刪除餐點
	public void delete(int mId) {
		mealRepository.deleteById(mId);
	}
	
	// 查詢菜單
	public ArrayList<MealBean> findAllMeals() throws SQLException {
		return mealRepository.findAllMeals();
	}
	
	// 查詢單筆資料
	public MealBean findMeal(String name) {
		return mealRepository.findMeal(name);
	}
	
}
