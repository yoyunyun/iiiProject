package tw.iiihealth.taxi.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.iiihealth.taxi.model.LocService;
import tw.iiihealth.taxi.model.Location;

@Controller
@RequestMapping(path = "/taxi")
public class LocController {

	@Autowired
	private LocService locService;

	@GetMapping(path = "/locmainpage.controller")
	public String processQueryAll(Model m) {

		List<Location> listL = locService.findAll();
		m.addAttribute("listLoc", listL);
		return "taxi/SearchLocation3";
	}

	@GetMapping(path = "/addloc.controller")
	public String processAddAction(@ModelAttribute("addlocation") Location loc, Model m) {

		List<String> typeItem = new ArrayList<String>();
		typeItem.add("醫院");
		typeItem.add("藥局");
		typeItem.add("長照");
		m.addAttribute("typeItems", typeItem);

		return "/taxi/newLocationForm2";
	}

	@PostMapping(path = "/addcheck")
	public String processAddCheck(@ModelAttribute("addlocation") Location loc,
			@RequestParam("pic") MultipartFile multipartFile, HttpServletRequest request, Model m) throws Exception {

		if (multipartFile != null && !multipartFile.isEmpty()) {

			// 抓取檔案名稱
			String fileName = multipartFile.getOriginalFilename();

			String suffixName = fileName.substring(fileName.lastIndexOf("."));

			// 生成檔名稱通用方法(加入現在的時間以及亂數100)
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
			Random r = new Random();
			StringBuilder tempName = new StringBuilder();
			tempName.append(sdf.format(new Date())).append(r.nextInt(100)).append(suffixName);

			String saveName = tempName.toString();

			// 設定檔案路徑
			String saveDir = request.getSession().getServletContext().getRealPath("/") + "LocationImg\\";

			// 創建目的資料夾
			File saveDirFile = new File(saveDir);
			saveDirFile.mkdirs();

			// 最終檔案路徑
			String saveFilePath = saveDir + File.separator + saveName;
			File saveFile = new File(saveFilePath);
			System.out.println("------------");
			System.out.println(saveFile);

			// 儲存圖片
			multipartFile.transferTo(saveFile);

			// 將檔名存入equip
			loc.setPhoto(saveName);

		}

		m.addAttribute("locCheck", loc);
		return "taxi/DisplayLoc";
	}

	@PostMapping(path = "/addback")
	public String processAddBack(@ModelAttribute("locCheck") Location loc, Model m) {
		m.addAttribute("addlocation", loc);
		List<String> typeItem = new ArrayList<String>();
		typeItem.add("醫院");
		typeItem.add("藥局");
		typeItem.add("長照");
		m.addAttribute("typeItems", typeItem);

		return "taxi/newLocationForm2";
	}

	@PostMapping(path = "/addloc")
	public String processAdd(@ModelAttribute("addlocation") Location loc, Model m) {
		locService.insert(loc);

		List<Location> listL = locService.findAll();
		m.addAttribute("listLoc", listL);
		return "taxi/SearchLocation3";
	}

	@PostMapping(path = "/updateold.controller")
	public String processUpdateOld(@RequestParam(name = "id") Integer id, Model m) {
		Location oldT = locService.findById(id);
		m.addAttribute("updatelocation", oldT);
		List<String> typeItem = new ArrayList<String>();
		typeItem.add("醫院");
		typeItem.add("藥局");
		typeItem.add("長照");
		m.addAttribute("typeItems", typeItem);

		return "taxi/updateLocationForm";
	}

	@PostMapping(path = "/updatecheck.controller")
	public String processUpdateCheck(@ModelAttribute("updatelocation") Location loc,
			@RequestParam("pic") MultipartFile multipartFile, HttpServletRequest request, Model m) throws Exception {

		if (multipartFile != null && !multipartFile.isEmpty()) {

			// 抓取檔案名稱
			String fileName = multipartFile.getOriginalFilename();

			String suffixName = fileName.substring(fileName.lastIndexOf("."));

			// 生成檔名稱通用方法(加入現在的時間以及亂數100)
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
			Random r = new Random();
			StringBuilder tempName = new StringBuilder();
			tempName.append(sdf.format(new Date())).append(r.nextInt(100)).append(suffixName);

			String saveName = tempName.toString();

			// 設定檔案路徑
			String saveDir = request.getSession().getServletContext().getRealPath("/") + "LocationImg\\";

			// 創建目的資料夾
			File saveDirFile = new File(saveDir);
			saveDirFile.mkdirs();

			// 最終檔案路徑
			String saveFilePath = saveDir + File.separator + saveName;
			File saveFile = new File(saveFilePath);

			// 刪除資料夾原本的圖片
			String deleteName = loc.getPhoto();
			if (deleteName != "" && deleteName != null) {
				String deleteFilePath = saveDir + File.separator + deleteName;
				File deleteFile = new File(deleteFilePath);
				deleteFile.delete();
			}

			// 儲存圖片
			multipartFile.transferTo(saveFile);

			// 將檔名存入equip
			loc.setPhoto(saveName);

		}

		m.addAttribute("listLoc", loc);
		return "taxi/updateDisplayLoc";
	}

	@PostMapping(path = "/updatebackloc.controller")
	public String processUpdateBack(@ModelAttribute("updatelocation") Location loc, Model m) {
		m.addAttribute("updatelocation", loc);
		List<String> typeItem = new ArrayList<String>();
		typeItem.add("醫院");
		typeItem.add("藥局");
		typeItem.add("長照");
		m.addAttribute("typeItems", typeItem);

		return "taxi/updateLocationForm";
	}

	@PostMapping(path = "/deleteloc")
	public String processDeleteAction(@RequestParam(name = "selected") Integer id, Model m) {
		locService.deleteById(id);
		List<Location> listL = locService.findAll();
		m.addAttribute("listLoc", listL);
		return "taxi/SearchLocation3";
	}

}
