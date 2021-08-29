package tw.iiihealth.drugs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.iiihealth.drugs.model.Drug;
import tw.iiihealth.drugs.model.DrugProduct;
import tw.iiihealth.drugs.model.DrugProductService;
import tw.iiihealth.drugs.model.DrugService;

@Controller
@RequestMapping(path="/Drugfront")
public class DrugFrontController {
	
	@Autowired
	DrugService DrugService;

	@Autowired
	DrugProductService DrugProductService;
	
	@RequestMapping(path="findalldrugFront")
	public String ListAllDrugFront(Model model) {
		List<Drug> list = DrugService.findAll();
		model.addAttribute("list", list);
		return "drugs/DrugFront";
	}
	
	@RequestMapping(path="findalldrugproductFront")
	public String ListAllDrugProductFront(Model model) {
		List<DrugProduct> list = DrugProductService.findAll();
		model.addAttribute("list", list);
		return "drugs/DrugProductFront";
	}
}