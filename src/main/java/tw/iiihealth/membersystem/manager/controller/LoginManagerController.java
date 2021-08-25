package tw.iiihealth.membersystem.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



//紀岱昀 帳:eeit12901  密:password01
//林昱伸 帳:eeit12902  密:password02
//林羽墨 帳:eeit12903  密:password03
//陳厚丞 帳:eeit12904  密:password04
//陳宥芸 帳:eeit12905  密:password05

@Controller
public class LoginManagerController {
	
//	@Autowired
//	private ManagerService managerService;

	//登入(1)
	@RequestMapping("/Manager/")
	public ModelAndView managerLogin1() {
		return new ModelAndView("membersystem/Login/ManagerLogin");
	}

	//登入(2)
	@RequestMapping("/Manager/login")
	public ModelAndView managerLogin2() {
		return new ModelAndView("membersystem/Login/ManagerLogin");
	}

	//登入成功
	@RequestMapping("/Manager/login/success")
	public ModelAndView managerSuccess() {
		return new ModelAndView("membersystem/Login/LoginManagerSuccess");
	}
	
	//登入失敗(1)
	@RequestMapping("/Manager/login/AccessDenied")
	public ModelAndView managerAccessError1() {
		return new ModelAndView("membersystem/Login/ManagerAccessdenied");
	}

	//登入失敗(2)
	@RequestMapping("/Manager/AccessDenied")
	public ModelAndView managerAccessError2() {	
		return new ModelAndView("membersystem/Login/ManagerAccessdenied");
	}
	
}
