package tw.iiihealth.membersystem.manager.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	private static final String Null = null;

	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private MailService mailService;

	// 查詢所有
	@RequestMapping(path = "/HealthProject/ManagerHealth/searchAllManagerAction.controller", method = {RequestMethod.POST,RequestMethod.GET})
	public String searchAllManagerAction(Model m) {

		List<Manager> list = managerService.searchAllManager();

		m.addAttribute("allManager", list);

		return "membersystem/Manager/DisplaySearchAllManager";
	}

	// 註冊單筆(跳轉)
	@RequestMapping(path = "/HealthProject/ManagerHealth/insertManager", method = {RequestMethod.POST,RequestMethod.GET})
	public String insertManager() {
		return "membersystem/Manager/InsertManager";
	}

	// 註冊單筆(返回上一頁)
	@RequestMapping(path = "/HealthProject/ManagerHealth/reInsertManager", method = {RequestMethod.POST,RequestMethod.GET})
	public String reRegisterForm(@RequestParam(name = "managername") String managername,
			@RequestParam(name = "managergender") String managergender,
			@RequestParam(name = "manageraccount") String manageraccount,
			@RequestParam(name = "managerpwd") String managerpwd,
			@RequestParam(name = "manageryear") String manageryear,
			@RequestParam(name = "managermonth") String managermonth,
			@RequestParam(name = "managerday") String managerday,
			@RequestParam(name = "manageremail") String manageremail, Model m) {

		m.addAttribute("managername", managername);
		m.addAttribute("managergender", managergender);
		m.addAttribute("manageraccount", manageraccount);
		m.addAttribute("managerpwd", managerpwd);
		m.addAttribute("manageryear", manageryear);
		m.addAttribute("managermonth", managermonth);
		m.addAttribute("managerday", managerday);
		m.addAttribute("manageremail", manageremail);

		return "membersystem/Manager/reInsertManager";
	}

	// 確認註冊的單筆是否正確
	@RequestMapping(path = "/HealthProject/ManagerHealth/displayInsertManagerHealth", method = {RequestMethod.POST,RequestMethod.GET})
	public String displayInsertManagerHealth(@RequestParam(name = "managername") String managername,
			@RequestParam(name = "managergender") String managergender,
			@RequestParam(name = "manageraccount") String manageraccount,
			@RequestParam(name = "managerpwd") String managerpwd,
			@RequestParam(name = "manageryear") String manageryear,
			@RequestParam(name = "managermonth") String managermonth,
			@RequestParam(name = "managerday") String managerday,
			@RequestParam(name = "manageremail") String manageremail, Model m) {

		m.addAttribute("managername", managername.trim());
		m.addAttribute("managergender", managergender.trim());
		m.addAttribute("manageraccount", manageraccount.trim());
		m.addAttribute("managerpwd", managerpwd.trim());
		m.addAttribute("manageryear", manageryear.trim());
		m.addAttribute("managermonth", managermonth.trim());
		m.addAttribute("managerday", managerday.trim());
		m.addAttribute("manageremail", manageremail.trim());

		return "membersystem/Manager/DisplayInsertManager";
	}

//	// 新增單筆
//	@PostMapping(path = "/insertManagerHealth.controller")
//	public String insertManagerHealth(@RequestParam(name = "managername") String managername,
//			@RequestParam(name = "managergender") String managergender,
//			@RequestParam(name = "manageraccount") String manageraccount,
//			@RequestParam(name = "managerpwd") String managerpwd,
//			@RequestParam(name = "manageryear") String manageryear,
//			@RequestParam(name = "managermonth") String managermonth,
//			@RequestParam(name = "managerday") String managerday,
//			@RequestParam(name = "manageremail") String manageremail, Model m) {
//
//		String bcEncodePwd = new BCryptPasswordEncoder().encode(managerpwd);
//
//		managerService.insertManager(new Manager(managername, managergender, manageraccount, bcEncodePwd, manageryear,
//				managermonth, managerday, manageremail));
//
//		List<Manager> list = managerService.searchAllManager();
//
//		m.addAttribute("allManager", list);
//
//		return "membersystem/Manager/DisplaySearchAllManager";
//	}
	
	// 註冊單筆進SQL(1)
	@RequestMapping(path = "/HealthProject/ManagerHealth/insertManagerHealth.controller", method = {RequestMethod.POST,RequestMethod.GET})
	public String insertManagerHealth(@RequestParam(name = "managername") String managername,
			@RequestParam(name = "managergender") String managergender,
			@RequestParam(name = "manageraccount") String manageraccount,
			@RequestParam(name = "managerpwd") String managerpwd,
			@RequestParam(name = "manageryear") String manageryear,
			@RequestParam(name = "managermonth") String managermonth,
			@RequestParam(name = "managerday") String managerday,
			@RequestParam(name = "manageremail") String manageremail, HttpServletRequest request, Model m) throws UnsupportedEncodingException, MessagingException{

		String bcEncodePwd = new BCryptPasswordEncoder().encode(managerpwd);
		
		mailService.register(new Manager(managername, managergender, manageraccount, bcEncodePwd,
				manageryear, managermonth, managerday, manageremail), getSiteURL(request));

//		List<Manager> list = managerService.searchAllManager();
//
//		m.addAttribute("allManager", list);

		return "membersystem/Manager/registerSuccess";
	}
	
	// 註冊單筆進SQL(2)
    private String getSiteURL(HttpServletRequest request) {
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(), "");
    }  
	
	// 確認刪除的單筆是否正確
		@PostMapping(path = "/HealthProject/ManagerHealth/displayDeleteManager")
		public String displayDeleteManager(@RequestParam(name = "managerid") int managerid,
				@RequestParam(name = "managername") String managername,
				@RequestParam(name = "managergender") String managergender,
				@RequestParam(name = "manageraccount") String manageraccount,
				@RequestParam(name = "managerpwd") String managerpwd,
				@RequestParam(name = "manageryear") String manageryear,
				@RequestParam(name = "managermonth") String managermonth,
				@RequestParam(name = "managerday") String managerday,
				@RequestParam(name = "manageremail") String manageremail, Model m) {

			m.addAttribute("managerid", managerid);
			m.addAttribute("managername", managername);
			m.addAttribute("managergender", managergender);
			m.addAttribute("manageraccount", manageraccount);
			m.addAttribute("managerpwd", managerpwd);
			m.addAttribute("manageryear", manageryear);
			m.addAttribute("managermonth", managermonth);
			m.addAttribute("managerday", managerday);
			m.addAttribute("manageremail", manageremail);

			return "membersystem/Manager/DisplayDeleteManager";
		}

		// 刪除單筆
		@PostMapping(path = "/HealthProject/ManagerHealth/deleteManagerAction.controller")
		public String deleteManager(@RequestParam(name = "managerid") int managerid, Model m) {

			System.out.println(managerid);
			managerService.deleteManager(new Manager(managerid));

			List<Manager> list = managerService.searchAllManager();

			m.addAttribute("allManager", list);

			return "membersystem/Manager/DisplaySearchAllManager";
		}

		// 修改單筆(跳轉)
		@PostMapping(path = "/HealthProject/ManagerHealth/updateSearchManager")
		public String updateSearchManager(@RequestParam(name = "managerid") int managerid,
				@RequestParam(name = "managername") String managername,
				@RequestParam(name = "managergender") String managergender,
				@RequestParam(name = "manageraccount") String manageraccount,
				@RequestParam(name = "manageryear") String manageryear,
				@RequestParam(name = "managermonth") String managermonth,
				@RequestParam(name = "managerday") String managerday,
				@RequestParam(name = "manageremail") String manageremail, Model m) {

			m.addAttribute("managerid", managerid);
			m.addAttribute("managername", managername);
			m.addAttribute("managergender", managergender);
			m.addAttribute("manageraccount", manageraccount);
			m.addAttribute("manageryear", manageryear);
			m.addAttribute("managermonth", managermonth);
			m.addAttribute("managerday", managerday);
			m.addAttribute("manageremail", manageremail);

			return "membersystem/Manager/UpdateSearchManager";
		}

		// 確認修改的單筆是否正確
		@PostMapping(path = "/HealthProject/ManagerHealth/displayUpdateSearchManager")
		public String displayUpdateSearchManager(@RequestParam(name = "managerid") int managerid,
				@RequestParam(name = "managername") String managername,
				@RequestParam(name = "managergender") String managergender,
				@RequestParam(name = "manageraccount") String manageraccount,
				@RequestParam(name = "managerpwd") String managerpwd,
				@RequestParam(name = "manageryear") String manageryear,
				@RequestParam(name = "managermonth") String managermonth,
				@RequestParam(name = "managerday") String managerday,
				@RequestParam(name = "manageremail") String manageremail, Model m) {

			m.addAttribute("managerid", managerid);
			m.addAttribute("managername", managername.trim());
			m.addAttribute("managergender", managergender.trim());
			m.addAttribute("manageraccount", manageraccount.trim());
			m.addAttribute("managerpwd", managerpwd.trim());
			m.addAttribute("manageryear", manageryear.trim());
			m.addAttribute("managermonth", managermonth.trim());
			m.addAttribute("managerday", managerday.trim());
			m.addAttribute("manageremail", manageremail.trim());

			return "membersystem/Manager/DisplayUpdateSearchManager";
		}

		// 修改單筆(返回上一頁)
		@PostMapping(path = "/HealthProject/ManagerHealth/reUpdateSearchManager")
		public String reUpdateSearchManager(@RequestParam(name = "managerid") int managerid,
				@RequestParam(name = "managername") String managername,
				@RequestParam(name = "managergender") String managergender,
				@RequestParam(name = "manageraccount") String manageraccount,
				@RequestParam(name = "managerpwd") String managerpwd,
				@RequestParam(name = "manageryear") String manageryear,
				@RequestParam(name = "managermonth") String managermonth,
				@RequestParam(name = "managerday") String managerday,
				@RequestParam(name = "manageremail") String manageremail, Model m) {

			m.addAttribute("managerid", managerid);
			m.addAttribute("managername", managername);
			m.addAttribute("managergender", managergender);
			m.addAttribute("manageraccount", manageraccount);
			m.addAttribute("managerpwd", managerpwd);
			m.addAttribute("manageryear", manageryear);
			m.addAttribute("managermonth", managermonth);
			m.addAttribute("managerday", managerday);
			m.addAttribute("manageremail", manageremail);

			return "membersystem/Manager/UpdateSearchManager";
		}

		// 修改單筆
		@PostMapping(path = "/HealthProject/ManagerHealth/updateManagerAction.controller")
		public String updateManagerAction(@RequestParam(name = "managerid") int managerid,
				@RequestParam(name = "managername") String managername,
				@RequestParam(name = "managergender") String managergender,
				@RequestParam(name = "manageraccount") String manageraccount,
				@RequestParam(name = "managerpwd") String managerpwd,
				@RequestParam(name = "manageryear") String manageryear,
				@RequestParam(name = "managermonth") String managermonth,
				@RequestParam(name = "managerday") String managerday,
				@RequestParam(name = "manageremail") String manageremail, Model m) {
			
			String bcEncodePwd = new BCryptPasswordEncoder().encode(managerpwd);
			
			Boolean enabled = true;
			String verificationCode = Null;

			managerService.updateManager(new Manager(managerid, managername, managergender, manageraccount,
					bcEncodePwd, manageryear, managermonth, managerday, manageremail,verificationCode,enabled));

			List<Manager> list = managerService.searchAllManager();

			m.addAttribute("allManager", list);

			return "membersystem/Manager/DisplaySearchAllManager";
		}
		
}
