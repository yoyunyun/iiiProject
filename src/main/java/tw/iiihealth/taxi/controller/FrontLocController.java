package tw.iiihealth.taxi.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.service.MemberService;
import tw.iiihealth.taxi.model.LocService;
import tw.iiihealth.taxi.model.Location;

@Controller
@RequestMapping(path = "/taxiFront")
@Transactional
public class FrontLocController {

	@Autowired
	private LocService locService;

	@Autowired
	private MemberService memberService;

	@GetMapping(path = "/frontlocmainpage.controller")
	public String processQueryLocMainPage() {
		return "taxi/FrontSearchLoc";
	}

	@GetMapping(path = "/booktaxi/frontloc.controller")
	public String processQueryLocLogin() {
		return "taxi/FrontSearchLoc";
	}

	@PostMapping(path = "/querylocall")
	@ResponseBody
	public List<Location> QueryLocAll() {
		return locService.findAll();
	}

	@PostMapping(path = "/queryloc/{cv}/{tv}/{tp}")
	@ResponseBody
	public List<Location> QueryLoc(@PathVariable("cv") String city, @PathVariable("tv") String town,
			@PathVariable("tp") String type) {

		if (town.equals("0")) {
			return locService.queryCity(city, type);
		} else {
			return locService.queryTown(town, type);
		}
	}

	@GetMapping(path = "/search/{id}")
	public String processSearchId(@PathVariable("id") int id, Model m) {

		Location oldT = locService.findById(id);
		String city = oldT.getCity();
		String type = oldT.getType();
		List<Location> listL = locService.queryCity(city, type);

		m.addAttribute("loc", oldT);
		m.addAttribute("listLoc", listL);
		return "taxi/LocIntro";
	}

	@PostMapping(path = "/search2/{id}")
	@ResponseBody
	public Location processSearchId2(@PathVariable("id") int id, Model m) {
		return locService.findById(id);
	}

	///////////// ???????????? //////////////////
	// Ajax ??????????????????
	@GetMapping(path = "/booktaxi/collect/{lid}")
	@ResponseBody
	public String collect(@PathVariable("lid") int lid) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Member member = memberService.getCurrentlyLoggedInMember(auth);

		// ??????????????????????????????
		for (Location tempLoc : member.getLocation()) {
			if (tempLoc.getId() == lid) {
				return "duplicate";
			}
		}

		// ???????????? ????????????
		Location loc = locService.findById(lid);

		// ??????join table
		member.addLoc(loc);

		return "success";
	}

	// ???????????????????????????
	@GetMapping(path = "/booktaxi/loccollect")
	public String showCollect(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Member member = memberService.getCurrentlyLoggedInMember(auth);

		List<Location> list = member.getLocation();
		model.addAttribute("list", list);

		return "taxi/LocCollection";
	}

	// ??????????????????
	@GetMapping(path = "/booktaxi/cancelcollect/{id}")
	@ResponseBody
	public List<Location> deletCollect(@PathVariable("id") int id) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Member member = memberService.getCurrentlyLoggedInMember(auth);

		Location loc = locService.findById(id);

		member.removeLoc(loc);

		return member.getLocation();
	}

}
