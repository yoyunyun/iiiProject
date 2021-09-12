package tw.iiihealth.membersystem.manager.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tw.iiihealth.membersystem.manager.model.Manager;
import tw.iiihealth.membersystem.manager.service.MailService;
import tw.iiihealth.membersystem.manager.service.ManagerService;

//	紀岱昀 帳:eeit12901  密:password01
//	林昱伸 帳:eeit12902  密:password02
//	林羽墨 帳:eeit12903  密:password03
//	陳厚丞 帳:eeit12904  密:password04
//	陳宥芸 帳:eeit12905  密:password05

@Controller
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;

	@Autowired
	private MailService mailService;
	
	
	
//-------------------------------------------------------登入-----------------------------------------------------------------

	//登入
	@RequestMapping("/iiiHealth/login")
	public ModelAndView managerLogin2(Model m) {
		return new ModelAndView("membersystem/Login/ManagerLogin");
	}
	
	//登入失敗(1)
	@RequestMapping("/iiiHealth/login/AccessDenied")
	public ModelAndView managerAccessError1() {
		return new ModelAndView("membersystem/Login/ManagerAccessdenied");
	}

	//登入失敗(2)
	@RequestMapping("/iiiHealth/AccessDenied")
	public ModelAndView managerAccessError2() {	
		return new ModelAndView("membersystem/Login/ManagerAccessdenied");
	}
	

	
	
//-------------------------------------------------------首頁(管理員資料表)-----------------------------------------------------------------
	
	
	
	@RequestMapping(path = "/Manager/searchAllManagerAction", method = {RequestMethod.GET, RequestMethod.POST})
	public String test(@ModelAttribute("manager") Manager manager, Model m) {
		return "membersystem/Manager/DisplaySearchAllManager";
	}
	
	
	@GetMapping(path = "/Manager/searchAllManagerAction.controller")
	@ResponseBody
	public List<Manager> searchAllManagerAction(){
		return managerService.searchAllManager();
	}

	
	
	
//-------------------------------------------------------註冊-----------------------------------------------------------------

	
	
	// 註冊單筆(跳轉)
	@RequestMapping(path = "/Manager/insertManager", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertManager(@ModelAttribute("manager") Manager manager, Model m) {
		
		m.addAttribute("manager", manager);

		return "membersystem/Manager/InsertManager";
	}

	// 註冊單筆(返回上一頁)
	@PostMapping(path = "/Manager/reInsertManager")
	public String reInsertManager(@ModelAttribute("manager") Manager manager, Model m) {
		
		m.addAttribute("manager", manager);

		return "membersystem/Manager/InsertManager";
	}

	// 確認註冊的單筆是否正確
	@PostMapping(path = "/Manager/displayInsertManager")
	public String displayInsertManager(@ModelAttribute("manager") Manager manager, Model m) {
		
		m.addAttribute("manager", manager);

		return "membersystem/Manager/DisplayInsertManager";
	}

	// 註冊單筆進SQL(1)
	@PostMapping(path = "/Manager/insertManagerAction.controller")
	public String insertManagerAction(@ModelAttribute("manager") Manager manager, HttpServletRequest request, Model m)
			throws UnsupportedEncodingException, MessagingException {

		String managerpwd = new BCryptPasswordEncoder().encode(manager.getManagerpwd());
		manager.setManagerpwd(managerpwd);

		mailService.register(manager, getSiteURL(request));

		return "membersystem/Manager/registerSuccess";
	}

	// 註冊單筆進SQL(2)
	private String getSiteURL(HttpServletRequest request) {
		String siteURL = request.getRequestURL().toString();
		return siteURL.replace(request.getServletPath(), "");
	}

	
	
	
//-------------------------------------------------------註冊(確認帳號是否不同)-----------------------------------------------------------------
	

	
		@PostMapping(path = "/checkManagerAccount")
		public ResponseEntity<String> checkManagerAccount(@RequestBody Manager manager) {
			
			List<Manager> list = managerService.searchManagerAccount(manager.getManageraccount());
			if(list.isEmpty()) {
				return new ResponseEntity<String>("N", HttpStatus.OK);
			}
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}
		
		
		
		
		

//------------------------------------------------------------------------------------------------------------------------
	
	
	

	// 查詢單筆
	@GetMapping(path = "/Manager/searchOneManagerAction.controller/{managerid}")
	@ResponseBody
	public Manager searchOneMtoMAction(@PathVariable Integer managerid) throws Exception {
		return managerService.searchManagerId(managerid);
	}

	
	
	
	

	// 修改單筆進SQL
	@PostMapping(path = "/Manager/updateManagerAction.controller", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateManagerAction(@ModelAttribute("manager") Manager manager, Model m) throws Exception {
		
		//會員密碼加密
		String managerpwd = new BCryptPasswordEncoder().encode(manager.getManagerpwd());
		manager.setManagerpwd(managerpwd);

		managerService.saveManager(manager);

		return "success";
	}
	
	

	
	
	
	
	// 刪除單筆
	@PostMapping(path = "/Manager/deleteManagerAction.controller/{managerid}")
	@ResponseBody
	public Map<String,String> deleteManagerAction(@PathVariable Integer managerid) throws Exception {

		Map<String,String> map = new HashMap<String,String>();
		managerService.deleteManager(managerid);
		Manager torf =managerService.searchManagerId(managerid);
		
		if(torf != null) {
			System.err.println("刪除失敗");
		} else {
			map.put("msg","成功刪除id:"+managerid);
		}
		return map;
	}

}
