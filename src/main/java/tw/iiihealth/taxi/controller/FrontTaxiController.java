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
		return "taxi/FrontSearchTaxi2";
	}
	
	@GetMapping(path = "/frontstart")
	public String start() {
		return "index";
	}

//	@GetMapping(path = "/fronttaxitest.controller")
//	public String processQueryTest() {		
//		return "taxi/test";
//	}
	
	@PostMapping(path = "/queryalltest")
	@ResponseBody
	public List<TaxiBean> QueryAll() {
		return tService.findAll();
	}
	
	@PostMapping(path = "/queryfronttaxi/{search}")
	@ResponseBody
	public List<TaxiBean> processQueryCity(@PathVariable("search") String search) {
	
		List<TaxiBean> city ;
		if(search.equals("1")) {
			city = tService.findAll();
		}else {
			city = tService.search(search);
		}
		return city;

	}
}
