package tw.iiihealth.drugs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import tw.iiihealth.drugs.model.Drug;
import tw.iiihealth.drugs.model.DrugService;
import tw.iiihealth.membersystem.manager.model.Manager;
import tw.iiihealth.membersystem.manager.service.ManagerService;




@Controller
@RequestMapping(path="/Drug")
public class DrugController {
	
	@Autowired
	DrugService DrugService;
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping(path="findalldrug")
	public String ListAllDrug(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String manageraccount = auth.getName();
		Manager user = managerService.searchUserDetails(manageraccount);
		model.addAttribute("user", user);
		List<Drug> list = DrugService.findAll();
		model.addAttribute("list", list);
		return "drugs/drug";
	}
	
	@RequestMapping(path="findalldrugFront")
	public String ListAllDrugFront(Model model) {
		List<Drug> list = DrugService.findAll();
		model.addAttribute("list", list);
		return "drugs/DrugFront";
	}
	
	
	
	@PostMapping(path="showUpdate")
	public String SearchById(@RequestParam("eId") int eid, Model model) {
		Drug Drug = DrugService.findById(eid);
		model.addAttribute("Drug", Drug);
		return "drugs/updatedrug";
	}
	
	
	
	
	@PostMapping(path = "/showFormForAdd")
	public String addDrug(Model model) {
		Drug Drug = new Drug();
		model.addAttribute("Drug", Drug);
		return "drugs/updatedrug";
	}
	
	@PostMapping(path ="save")
	public String saveDrug(@ModelAttribute("Drug") Drug p , Model model ) {
        
		DrugService.save(p);
	    model.addAttribute("Drug", new Drug());
		model.addAttribute("listDrugs",DrugService.findAll());
		List<Drug> list = DrugService.findAll();
		model.addAttribute("list", list);
		return "drugs/drug";
	}


	
	@RequestMapping(path = "delete", method = RequestMethod.POST)
	public String delete(@RequestParam("eId") int eId) {
		DrugService.delete(eId);
		return "redirect:/Drug/findalldrug";
	
	}
	
}
