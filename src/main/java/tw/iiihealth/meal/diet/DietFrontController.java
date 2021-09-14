package tw.iiihealth.meal.diet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.iiihealth.membersystem.manager.model.Manager;
import tw.iiihealth.membersystem.manager.service.ManagerService;

@Controller("DietFrontController")
public class DietFrontController {

	@Autowired
	private DietService dietService;

	@RequestMapping(path = "/dietIndex.controller", method = { RequestMethod.POST, RequestMethod.GET })
	public String dietIndex(HttpServletRequest request,Model m) throws SQLException {
		
		List<DietBean> db = dietService.findAllDiet();
		
		request.getSession().setAttribute("queryAll", db);
		
		return "meal/Diet/Diet";
	}
	
	@RequestMapping(path = "/dietIndex2.controller", method = { RequestMethod.POST, RequestMethod.GET })
	public String dietIndex2(HttpServletRequest request,Model m) throws SQLException {
		
		List<DietBean> db = dietService.findAllDiet();
		
		request.getSession().setAttribute("queryAll", db);
		
		return "meal/Diet/Diet2";
	}
	
	@RequestMapping(path = "/dietTest", method = { RequestMethod.POST, RequestMethod.GET })
	public String dietTest(HttpServletRequest request,Model m) throws SQLException {
		
		List<DietBean> db = dietService.findAllDiet();
		
		request.getSession().setAttribute("queryAll", db);
		
		return "meal/Diet/DietTest";
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
	
}
