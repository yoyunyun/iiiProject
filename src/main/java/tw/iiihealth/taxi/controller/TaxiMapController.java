package tw.iiihealth.taxi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.iiihealth.taxi.model.TaxiBean;
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
	
	
	//設定改變位置
	@PostMapping(path = "/movetaximap/{move}")
	@ResponseBody
	public void Move(@PathVariable("move") int move){
		
		List<TaxiMap> Taximove ;
		Taximove =  tMapService.searchTaxi();
		for(TaxiMap t : Taximove) {
			String[] array=t.getMap().split(",");
			double moveX=(Math.random()-0.5)*0.002*move;
			double moveY=(Math.random()-0.5)*0.002*move;
			double X=Double.valueOf(array[0]);
			double Y=Double.valueOf(array[1]);
				
			X=(X+moveX<25.0979 && X+moveX>24.88724) ? (X+moveX) : (X-2.3*moveX);
			Y=(Y+moveY<121.3175 && Y+moveY>121.02020) ? (Y+moveY) : (Y-3.7*moveY);
			
			t.setMap(String.valueOf(X)+","+String.valueOf(Y));
			tMapService.updateMap(t);
		}
	
		
	}
	
}
