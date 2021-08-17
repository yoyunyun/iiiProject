package tw.iiihealth.taxi.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.iiihealth.taxi.model.LocService;
import tw.iiihealth.taxi.model.Location;

@Controller
@RequestMapping(path="/taxi")
public class LocController {

	@Autowired
	private LocService locService;
	
	@GetMapping(path = "/locmainpage.controller")
	public String processQueryAll(Model m) {
		List<Location> listL=locService.findAll();
		m.addAttribute("listLoc",listL);
		return "taxi/SearchLocation3";
	}
	@GetMapping(path = "/addloc.controller")
	public String processAddAction(@ModelAttribute("addlocation") Location loc,Model m) {
		
		List<String> typeItem = new ArrayList<String>();
		typeItem.add("醫院");
		typeItem.add("藥局");
		typeItem.add("長照");
		m.addAttribute("typeItems",typeItem);
		
		List<String> hostypeItem = new ArrayList<String>();
		hostypeItem.add("綜合醫院");
		hostypeItem.add("西醫診所");
		hostypeItem.add("中醫診所");
		hostypeItem.add("牙醫診所");
		m.addAttribute("hostypeItems",hostypeItem);
		return "/taxi/newLocationForm2";
	}
	
	@PostMapping(path = "/addcheck")
	public String processAddCheck(@ModelAttribute("addlocation") Location loc,Model m) {
		m.addAttribute("locCheck",loc);
		return "taxi/DisplayLoc";
	}
	
	@PostMapping(path = "/addback")
	public String processAddBack(@ModelAttribute("locCheck") Location loc,Model m) {
		m.addAttribute("addlocation",loc);
		List<String> typeItem = new ArrayList<String>();
		typeItem.add("醫院");
		typeItem.add("藥局");
		typeItem.add("長照");
		m.addAttribute("typeItems",typeItem);
		
		List<String> hostypeItem = new ArrayList<String>();
		hostypeItem.add("綜合醫院");
		hostypeItem.add("西醫診所");
		hostypeItem.add("中醫診所");
		hostypeItem.add("牙醫診所");
		m.addAttribute("hostypeItems",hostypeItem);
		return "taxi/newLocationForm2";
	}
	
	@PostMapping(path = "/addloc")
	public String processAdd(@ModelAttribute("addlocation") Location loc,Model m) {
		locService.insert(loc);
		List<Location> listL=locService.findAll();
		m.addAttribute("listLoc",listL);
		return "taxi/SearchLocation3";
	}
	
//	@PostMapping(path = "/updateold.controller")
//	public String processUpdateOld(@ModelAttribute("updatelocation") Location loc, Model m) {
//	
//		return "taxi/updateLocationForm";
//	}
	
	@PostMapping(path = "/updateold.controller")
	public String processUpdateOld(@RequestParam(name="id") Integer id, Model m) {
		Location oldT = locService.findById(id);
		m.addAttribute("updatelocation",oldT);
		List<String> typeItem = new ArrayList<String>();
		typeItem.add("醫院");
		typeItem.add("藥局");
		typeItem.add("長照");
		m.addAttribute("typeItems",typeItem);
		
		List<String> hostypeItem = new ArrayList<String>();
		hostypeItem.add("綜合醫院");
		hostypeItem.add("西醫診所");
		hostypeItem.add("中醫診所");
		hostypeItem.add("牙醫診所");
		m.addAttribute("hostypeItems",hostypeItem);
		return "taxi/updateLocationForm";
	}
	
	@PostMapping(path = "/updatecheck.controller")
	public String processUpdateCheck(@ModelAttribute("updatelocation") Location loc, Model m) {

		m.addAttribute("listLoc",loc);
		return "taxi/updateDisplayLoc";
	}
	
	@PostMapping(path = "/updatebackloc.controller")
	public String processUpdateBack(@ModelAttribute("updatelocation") Location loc, Model m) {
		m.addAttribute("updatelocation",loc);
		List<String> typeItem = new ArrayList<String>();
		typeItem.add("醫院");
		typeItem.add("藥局");
		typeItem.add("長照");
		m.addAttribute("typeItems",typeItem);
		
		List<String> hostypeItem = new ArrayList<String>();
		hostypeItem.add("綜合醫院");
		hostypeItem.add("西醫診所");
		hostypeItem.add("中醫診所");
		hostypeItem.add("牙醫診所");
		m.addAttribute("hostypeItems",hostypeItem);
		return "taxi/updateLocationForm";
	}
	
	@PostMapping(path = "/deleteloc")
	public String processDeleteAction(@RequestParam(name="selected") Integer id,Model m) {
		locService.deleteById(id);
		List<Location> listL=locService.findAll();
		m.addAttribute("listLoc",listL);
		return "taxi/SearchLocation3";
	}
	
	
}
