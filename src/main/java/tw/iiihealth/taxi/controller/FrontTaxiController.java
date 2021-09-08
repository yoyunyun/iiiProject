package tw.iiihealth.taxi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.iiihealth.taxi.model.TaxiBean;
import tw.iiihealth.taxi.model.TaxiService;

@Controller
@RequestMapping(path = "/taxiFront")
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
	
//	@PostMapping(path = "/queryid/{id}")
//	@ResponseBody
//	public TaxiBean QueryId(@PathVariable("id") Integer id) {
//		return tService.findById(id);
//	}
	
	// Ajax 動態更新出貨狀態
		@PostMapping(path="/booktaxi")
		@ResponseBody
		public String bookTaxibyId(@RequestParam("mail") String mail, @RequestParam("passanger") String user, @RequestParam("taxi") String taxi,
									@RequestParam("loc") String loc, @RequestParam("date") String date, @RequestParam("hour") String hour,
									@RequestParam("min") String min, @RequestParam("tel") String tel) throws Exception {
			
//			System.out.println("---------------");
//			System.out.println(mail);
//			System.out.println(taxi);
			//寄送
			tService.sendTemplateMail(mail, user, taxi, loc, date, hour, min, tel);

			return "mail success";
		}
}
