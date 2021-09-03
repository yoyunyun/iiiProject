package tw.iiihealth.taxi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.iiihealth.taxi.model.TaxiMap;
import tw.iiihealth.taxi.model.TaxiMapService;

@Controller
@RequestMapping(path = "taximap")
public class TaxiMapController {

	@Autowired
	private TaxiMapService tMapService;
	
	@GetMapping(path = "/fronttaximap.controller")
	public String processTaxiMap() {		
		return "taxi/FrontSearchTaxi3";
	}
	
	@PostMapping(path = "/querytaximap")
	@ResponseBody
	public List<TaxiMap> Query(){
		return tMapService.searchTaxi();
	}
}
