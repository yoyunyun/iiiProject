package tw.iiihealth.membersystem.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.service.MemberService;



//林家瑋 帳:2z5fhjaxmase  		密:a8jbuxt8
//吳哲瑋 帳:xchbfp5132uswuzc  	密:fb4swqiw
//蔡明杰 帳:wsas23a12s  			密:58is87dx
//林睿梅 帳:kpxcepbjgu3h  		密:df3isjbj
//張仲淑 帳:cj4y24mabc7  			密:bp969hg8

@Controller
public class LoginMemberController {
	
	
	@Autowired
	private MemberService memberService;
	
	
//	@RequestMapping("/test")
//	public ModelAndView test(@ModelAttribute("member") Member member, Model m) {
//		return new ModelAndView("membersystem/test");
//	}
	
//	//首頁(無會員)
//	@RequestMapping("/HealthProject")
//	public ModelAndView index1() {
//		return new ModelAndView("index");
//	}






	// 登入失敗
	@RequestMapping("/Member/login/AccessDenied")
	public ModelAndView adminAccessError() {
		return new ModelAndView("membersystem/Login/MemberAccessdenied");
	}
}
