package tw.iiihealth.taxi.controller;

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

import tw.iiihealth.taxi.model.TaxiBean;
import tw.iiihealth.taxi.model.TaxiService;

@Controller
@RequestMapping(path = "/taxi")
@SessionAttributes(names = { "totalPages", "totalElement" } )
public class FrontTaxiController {

	@Autowired
	private TaxiService tService;
	
	@GetMapping(path = "/fronttaximainpage.controller")
	public String processQueryMainPage() {		
		return "taxi/FrontSearchTaxi";
	}

	@PostMapping(path = "/queryfronttaxibypage/{pageNo}")
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
	
	@GetMapping(path = "/queryfronttaxi/{search}/{pageNo}")
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
}
