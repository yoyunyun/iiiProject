package tw.iiihealth.elder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.iiihealth.elder.model.Order;
import tw.iiihealth.elder.model.OrderMailService;
import tw.iiihealth.elder.model.OrderService;
import tw.iiihealth.membersystem.manager.model.Manager;
import tw.iiihealth.membersystem.manager.service.ManagerService;

@Controller
@RequestMapping(path="/order")
public class OrderController {
	
	
	@Autowired
	OrderService orderService;
	
	
	@Autowired
	private OrderMailService orderMailService;

	@Autowired
	private ManagerService managerService;
	
	@RequestMapping(path = "/findall")
	public String findAllOrder(Model model) {
		List<Order> list = orderService.findAll();
		
		model.addAttribute("list", list);
		
		// 會員姓名顯示
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String manageraccount = auth.getName();
		Manager user = managerService.searchUserDetails(manageraccount);
		model.addAttribute("user", user);
		
		return "equip/order-list";
	}
	
	
	@PostMapping(path="/orderdetail")
	public String findOrderDetailbyId(@RequestParam("oId") int oId, Model model) {
		
		Order order = orderService.findbyId(oId);
		
		model.addAttribute("order", order);
		
		// 會員姓名顯示
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String manageraccount = auth.getName();
		Manager user = managerService.searchUserDetails(manageraccount);
		model.addAttribute("user", user);
		
		return "equip/order-detail";
	}
	
	
	
	
	// Ajax 動態更新出貨狀態
	@PostMapping(path="/changestatus")
	@ResponseBody
	public String changeStatusbyId(@RequestParam("oId") int oId) throws Exception {
		
		Order order = orderService.findbyId(oId);
		
		// 更改出貨狀態
		order.setStatus("已經出貨");
		
		// 取得收貨人姓名
		String user = order.getName();
		
		//寄送
		orderMailService.sendTemplateMail(user);
		
		
		orderService.save(order);
		
		return "change success";
	}
}
