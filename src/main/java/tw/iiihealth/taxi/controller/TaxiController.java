package tw.iiihealth.taxi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.iiihealth.taxi.model.TaxiBean;
import tw.iiihealth.taxi.model.TaxiService;

@Controller
@RequestMapping(path = "/taxi")
@SessionAttributes(names = { "totalPages", "totalElement" })
public class TaxiController {

	@Autowired
	private TaxiService tService;

	@GetMapping(path = "/taximainpage.controller")
	public String processQueryMainPage(Model m) {
		List<TaxiBean> listT = tService.findAll();
		m.addAttribute("listTaxi",listT);
		return "taxi/SearchTaxi3";
	}

	@PostMapping(path = "/queryallbypage/{pageNo}")
	@ResponseBody
	public List<TaxiBean> QueryByPageAction(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<TaxiBean> page = tService.findAllByPage(pageable);
		int totalPages = page.getTotalPages();
		long totalElement = page.getTotalElements();
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElement", totalElement);

		return page.getContent();
	}

	@PostMapping(path = "/queryall")
	@ResponseBody
	public List<TaxiBean> QueryAll() {
		return tService.findAll();
	}

	@GetMapping(path = "/query/{search}/{pageNo}")
	@ResponseBody
	public List<TaxiBean> processQuery(@PathVariable("search") String search,@PathVariable("pageNo") int pageNo, Model m) {

		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<TaxiBean> page = tService.query(search,pageable);
		int totalPages = page.getTotalPages();
		long totalElement = page.getTotalElements();
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElement", totalElement);
		
		return page.getContent();

	}
	@GetMapping(path = "/add.controller")
	public String processAddAction(@ModelAttribute("addtaxi") TaxiBean taxi) {
		return "taxi/NewTaxiForm2";
	}
	
	@PostMapping(path = "/addcheck.controller")
	public String processAddCheck(@ModelAttribute("addtaxi") TaxiBean taxi, Model m) {
		m.addAttribute("newTaxiC",taxi);
		return "taxi/DisplayNewTaxi";
	}
	
	@PostMapping(path = "/addback.controller")
	public String processAddBack(@ModelAttribute("newTaxiC") TaxiBean taxi, Model m) {
		m.addAttribute("addtaxi",taxi);
		return "taxi/NewTaxiForm2";
	}

	@PostMapping(path = "/add")
	public String processAdd(@ModelAttribute("addtaxi") TaxiBean taxi, Model m) {
		tService.insert(taxi);
		List<TaxiBean> listT = tService.findAll();
		m.addAttribute("listTaxi",listT);
		return "taxi/SearchTaxi3";
	}
	
	@GetMapping(path = "/updateold.controller/{id}")
	public String processUpdateOld(@PathVariable("id") int id, Model m) {
		TaxiBean oldT = tService.findById(id);
		m.addAttribute("oldTaxi",oldT);
		return "taxi/updateTaxiForm";
	}
	
	@PostMapping(path = "/updateold2.controller")
	public String processUpdateOld2(@RequestParam(name="id") Integer id, Model m) {
		TaxiBean oldT = tService.findById(id);
		m.addAttribute("oldTaxi",oldT);
		return "taxi/updateTaxiForm";
	}
	
	@PostMapping(path = "/update.controller")
	public String processUpdateAction(@ModelAttribute("addtaxi") TaxiBean taxi, Model m) {
		m.addAttribute("updateTaxiC",taxi);
		return "taxi/updateDisplayTaxi";
	}
	
	
	@PostMapping(path = "/updateback.controller")
	public String processUpdateCheckAction(@ModelAttribute("updateTaxiC") TaxiBean taxi, Model m) {
		m.addAttribute("oldTaxi",taxi);
		return "taxi/updateTaxiForm";
	}

	@PostMapping(path = "/delete")
	public String processDeleteAction(@RequestParam(name="selected") Integer id,Model m) {
		tService.deleteById(id);
		List<TaxiBean> listT = tService.findAll();
		m.addAttribute("listTaxi",listT);
		return "taxi/SearchTaxi3";
	}
}

