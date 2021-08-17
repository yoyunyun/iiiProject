package tw.iiihealth.meal.meals;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//@RequestMapping(path = "meals")
@Controller("MealController")
public class MealController {

	@Autowired
	private MealService mealService;

	@RequestMapping(path = "/mealIndex.controller", method = RequestMethod.GET)
	public String processShowIndex(Model m) {
		return "meal/Meals/index";
	}

	@RequestMapping(path = "/mealCreate.controller", method = RequestMethod.GET)
	public String processShowForm(Model m) {
		return "meal/Meals/MealForm";
	}
	
	@RequestMapping(path = "/mealUpdate.controller", method = RequestMethod.GET)
	public String processShowUpdate(Model m) {
		return "meal/Meals/UpdateMeal";
	}

	@RequestMapping(path = "/mealDelete.controller", method = RequestMethod.GET)
	public String processShowDelete(Model m) {
		return "meal/Meals/DeleteMeal";
	}

	//新增餐點
	@RequestMapping(path = "/addMeals.controller", method = RequestMethod.POST)
	public String processFormAction(@RequestParam(name = "name") String name,@ModelAttribute(name = "Mealform") MealBean meal2) {

		if (mealService.findMeal(name) != null) {
			return "meal/Meals/existfail";
		}else {
			mealService.insert(meal2);
			return "meal/Meals/Thanks";
		}

	}

	//查詢菜單
	@RequestMapping(path="/mealView.controller",method = RequestMethod.GET)
	public String processQueryAll(HttpServletRequest request,Model m) throws SQLException {

		ArrayList<MealBean> mb = mealService.findAllMeals();
		
		request.getSession().setAttribute("queryAll", mb);
		
		return "meal/Meals/ViewMenu";
	}
	
	// 刪除餐點
	@RequestMapping(path = "/deleteByName.controller", method = RequestMethod.POST)
	public String deleteByName(@RequestParam(name = "name") String name,HttpServletRequest request, Model m) throws SQLException {

		if (mealService.findMeal(name) != null) {
			MealBean mb = mealService.findMeal(name);
			request.getSession().setAttribute("m", mb);
			return "meal/Meals/DisplayDeleteMeal";
		}else {
			return "meal/Meals/notexistfail";
		}
	}

	// 確認刪除
	@RequestMapping(path = "/deleteConfirm.controller", method = RequestMethod.POST)
	public String deleteConfirm(@RequestParam(name = "name",required = false) String name,HttpServletRequest request, Model m) {

	    MealBean mealData = (MealBean)request.getSession(true).getAttribute("m");
	    mealService.delete(mealData);
		
		return "meal/Meals/Thanks";
	}

	// 修改餐點
	@RequestMapping(path = "/updateByName.controller", method = RequestMethod.POST)
	public String updateByName(@RequestParam(name = "name") String name,HttpServletRequest request, Model m) throws SQLException {

		if (mealService.findMeal(name) != null) {
			MealBean mb = mealService.findMeal(name);
			request.getSession().setAttribute("u", mb);
	    	request.getSession(true).setAttribute("un",mb.getName());
	    	request.getSession(true).setAttribute("us",mb.getStore_ID());
			return "meal/Meals/DisplayUpdateMeal";
		}else {
			return "meal/Meals/notexistfail";
		}
	}
	
	// 確認修改
	@RequestMapping(path = "/updateConfirm.controller", method = RequestMethod.POST)
	public String updateConfirm(@ModelAttribute(name = "DisplayUpdateMeal") MealBean meal2,HttpServletRequest request) {

		String name = (String) request.getSession(true).getAttribute("un");
		int store_ID =(int) request.getSession(true).getAttribute("us");
		meal2.setName(name);
		meal2.setStore_ID(store_ID);
		meal2.setID(mealService.findMeal(name).getID());
	    mealService.update(meal2);
		
		return "meal/Meals/Thanks";
	}

}
