package tw.iiihealth.meal.diet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(path = "diet")
@Controller("DietController")
public class DietController {

	@Autowired
	private DietService dietService;

	@RequestMapping(path = "/dietViewIndex.controller", method = RequestMethod.GET)
	public String processShowIndex(Model m) {
		return "meal/Diet/indexDietMenu";
	}

	@RequestMapping(path = "/dietCreate.controller", method = RequestMethod.GET)
	public String processShowForm(Model m) {
		return "meal/Diet/DietForm";
	}
	
	@RequestMapping(path = "/dietUpdate.controller", method = RequestMethod.GET)
	public String processShowUpdate(Model m) {
		return "meal/Diet/UpdateDiet";
	}

	@RequestMapping(path = "/dietDelete.controller", method = RequestMethod.GET)
	public String processShowDelete(Model m) {
		return "meal/Diet/DeleteDiet";
	}

	// 新增食品資料
	@RequestMapping(path = "/addDiet.controller", method = RequestMethod.POST)
	public ModelAndView processFormAction(@RequestParam(name = "name") String name,@ModelAttribute(name = "Dietform") DietBean diet2) {

		if (dietService.findDiet(name) != null) {
			return new ModelAndView("forward:/WEB-INF/pages/meal/Diet/existfail.jsp");
		}else {
			dietService.insert(diet2);
			return new ModelAndView("forward:/diet/dietView.controller");
		}

	}

	// 查詢食品資料庫
	@RequestMapping(path="/dietView.controller",method = { RequestMethod.POST, RequestMethod.GET })
	public String processQueryAll(HttpServletRequest request,Model m) throws SQLException {

		List<DietBean> db = dietService.findAllDiet();
		
		request.getSession().setAttribute("queryAll", db);
		
		return "meal/Diet/ViewDietMenu";
	}
	
	// 查詢分類食品資料庫
	@RequestMapping(path="/dietViewType.controller",method = RequestMethod.GET)
	public String processQueryType(HttpServletRequest request,Model m) throws SQLException {

		String type2 = request.getParameter("h");
		ArrayList<DietBean> dbData = dietService.findTypeDiet(type2);
		request.getSession(true).setAttribute("reg_array",dbData);
		
		return "meal/Diet/ViewTypeDietMenu";
	}
	
	// 刪除食品資料
	@RequestMapping(path = "/deleteDietByName.controller", method = RequestMethod.POST)
	public String deleteByName(@RequestParam(name = "name") String name,HttpServletRequest request, Model m) throws SQLException {

		if (dietService.findDiet(name) != null) {
			DietBean db = dietService.findDiet(name);
			request.getSession().setAttribute("d", db);
			return "meal/Diet/DisplayDeleteDiet";
		}else {
			return "meal/Diet/notexistfail2";
		}
	}

	// 確認刪除
	@RequestMapping(path = "/deleteDietConfirm.controller", method = RequestMethod.POST)
	public ModelAndView deleteConfirm(@RequestParam(name = "selected",required = false) int dId) {

	    dietService.delete(dId);
		
	    return new ModelAndView("forward:/diet/dietView.controller");
	}
	

	// 修改食品資料
	@RequestMapping(path = "/updateDietByName.controller", method = RequestMethod.POST)
	public String updateByName(@RequestParam(name = "name") String name,HttpServletRequest request, Model m) throws SQLException {

		if (dietService.findDiet(name) != null) {
			DietBean db = dietService.findDiet(name);
			request.getSession().setAttribute("u", db);
	    	request.getSession(true).setAttribute("un",db.getName());
	    	request.getSession(true).setAttribute("ut",db.getType());
			return "meal/Diet/DisplayUpdateDiet";
		}else {
			return "meal/Diet/notexistfail2";
		}
	}
	
	// 確認修改
	@RequestMapping(path = "/updateDietConfirm.controller", method = RequestMethod.POST)
	public ModelAndView updateConfirm(@ModelAttribute(name = "DisplayUpdateMeal") DietBean diet2,HttpServletRequest request) {

		String name = (String) request.getSession(true).getAttribute("un");
		String type = (String) request.getSession(true).getAttribute("ut");
		diet2.setName(name);
		diet2.setType(type);
		diet2.setID(dietService.findDiet(name).getID());
		dietService.update(diet2);
		
		return new ModelAndView("forward:/diet/dietView.controller");
	}
	
	
}
