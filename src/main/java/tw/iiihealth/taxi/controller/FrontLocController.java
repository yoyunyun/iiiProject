package tw.iiihealth.taxi.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.iiihealth.taxi.model.LocService;
import tw.iiihealth.taxi.model.Location;

@Controller
@RequestMapping(path="/taxiFront")
public class FrontLocController {

	@Autowired
	private LocService locService;
	
	@GetMapping(path = "/frontlocmainpage.controller")
	public String processQueryLocMainPage() {		
		return "taxi/FrontSearchLoc";
	}
	
	@GetMapping(path = "/frontloctest.controller")
	public String processQueryLocTest() {		
		return "taxi/test";
	}
	
	@PostMapping(path = "/querylocall")
	@ResponseBody
	public List<Location> QueryLocAll(){
		return locService.findAll();
	}
	
	@PostMapping(path = "/queryloc/{cv}/{tv}/{tp}")
	@ResponseBody
	public List<Location> QueryLoc(@PathVariable("cv") String city, 
			@PathVariable("tv") String town, @PathVariable("tp") String type){
		
		if (town.equals("0")) {
			return locService.queryCity(city,type);
		}else {
			return locService.queryTown(town,type);
		}
	}
	
	@GetMapping(path = "/search/{id}")
	public String processSearchId(@PathVariable("id") int id, Model m) {

		Location oldT = locService.findById(id);
		String city = oldT.getCity();
		String type = oldT.getType();
		List<Location> listL = locService.queryCity(city,type);
		
		m.addAttribute("loc",oldT);
		m.addAttribute("listLoc",listL);
		return "taxi/LocIntro";
	}
	
	@PostMapping(path = "/search2/{id}")
	@ResponseBody
	public Location processSearchId2(@PathVariable("id") int id, Model m) {
		return locService.findById(id);
	}
	
	
	
}
