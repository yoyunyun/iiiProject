package tw.iiihealth.membersystem.health.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.iiihealth.membersystem.health.model.Health;
import tw.iiihealth.membersystem.health.service.HealthService;
import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.service.MemberService;

@Controller
public class HealthController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HealthService healthService;
	
	
	// 跳轉畫面(健康資料表)
	@RequestMapping(path = "/Member/gotoHealth", method = {RequestMethod.GET, RequestMethod.POST})
	public String gotoHealth() {
			return "membersystem/Health/DisplayHealth";
		}
		
	
	
	
	
	// 查詢單筆
	@PostMapping(path = "/Member/searchOneHealth")
	@ResponseBody
	public Health searchOneHealth() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String memberaccount = auth.getName();
		Member memberDetail = memberService.searchUserDetails(memberaccount);
		
		Health checkHealth = healthService.checkHealth(memberDetail.getMemberid());
		System.out.println(checkHealth);
		if(checkHealth == null) {
			return null;
		}
		return checkHealth;
	}
	
	
	//新增
	@PostMapping(path = "/Member/insertHealth", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertHealth(Health health) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String memberaccount = auth.getName();
		Member memberDetail = memberService.searchUserDetails(memberaccount);

		double intBMI = ((health.getWeight()*100000)/((health.getHeight()*health.getHeight())));
		double ansBMI = (intBMI/10);		

		
		health.setBmi(ansBMI);
		health.setMedicalHistory(health.getMedicalHistory().trim());
		
		health.setMember(memberDetail);
		
		healthService.saveMember(health);
		
		return "insert success";
		
	}
	
	
	//修改
	@PostMapping(path = "/Member/updateHealth", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateHealth(Health health) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String memberaccount = auth.getName();
		Member memberDetail = memberService.searchUserDetails(memberaccount);
		
		double intBMI = ((health.getWeight()*100000)/((health.getHeight()*health.getHeight())));
		double ansBMI = (intBMI/10);


		health.setBmi(ansBMI);

		health.setMedicalHistory(health.getMedicalHistory().trim());
		
		health.setMember(memberDetail);
		
		healthService.saveMember(health);
		
		return "update success";
		
	}
}
