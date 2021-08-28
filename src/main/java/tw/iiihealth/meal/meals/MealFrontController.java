package tw.iiihealth.meal.meals;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.iiihealth.elder.model.Equip;

@Controller("MealFrontController")
public class MealFrontController {

	@Autowired
	private MealService mealService;

	@RequestMapping(path = "/mealIndex.controller",method = { RequestMethod.POST, RequestMethod.GET })
	public String processShowIndex(HttpServletRequest request,Model m) throws SQLException  {
		
		ArrayList<MealBean> mb = mealService.findAllMeals();
		
		request.getSession().setAttribute("queryAll", mb);
		
		return "meal/Meals/Meals";
	}

}
