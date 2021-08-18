package tw.iiihealth.elder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.iiihealth.elder.model.Equip;
import tw.iiihealth.elder.model.EquipService;

@Controller
@RequestMapping(path="/consumer")
@SessionAttributes(names = {"totalPages","totalElements"})
public class EquipConsumerController {

	
	
	@Autowired
	EquipService equipService;
	
	
	// 到使用者商品頁面
	@RequestMapping(path="/toTheFrontPage")
	public String  toTheFrontPage() {
		return "equipsell/all-equip-page";
	}
	
	

	// Ajax請求商品內容
	@PostMapping(path="/findallforConsumerByPage/{pageNo}")
	@ResponseBody
	public List<Equip> findallforConsumerByPage(@PathVariable("pageNo") int pageNo, Model m){
		
		// 每頁幾筆
		int pageSize = 8;
				
		// 要查詢幾頁 (因為是從0算起，所以要減掉1)， 每頁幾筆
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
			
		// 開始查詢
		Page<Equip> page = equipService.findAllByPage(pageable);
		
		// 總共頁數
		int totalPages = page.getTotalPages();
				
		// 總共幾筆
		long totalElements = page.getTotalElements();
		
		
		m.addAttribute("totalPages", totalPages);
		
		m.addAttribute("totalElements", totalElements);
		
		
		return page.getContent();
	}
	
	
	
	
	// 向使用者顯示單項商品
	@GetMapping(path="/findByIdforCustomer/{eId}")
	public String findByIdForCustomer(@PathVariable("eId") int eid, Model model) {
		Equip equip = equipService.findById(eid);
		model.addAttribute("equip", equip);
		return "equipsell/equip-detail-page";
	}
}