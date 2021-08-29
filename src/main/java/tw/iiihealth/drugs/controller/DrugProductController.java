package tw.iiihealth.drugs.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.iiihealth.drugs.model.DrugProduct;
import tw.iiihealth.drugs.model.DrugProductService;


@SessionAttributes(names="user")
@Controller
@RequestMapping(path="/DrugProduct")
public class DrugProductController {
	
	@Autowired
	DrugProductService DrugProductService;
	
	
	@RequestMapping(path="findalldrugproduct")
	public String ListAllDrugProduct(Model model) {
		List<DrugProduct> list = DrugProductService.findAll();
		model.addAttribute("list", list);
		return "drugs/DrugProductlist";
	}
	
	@RequestMapping(path="findalldrugproductFront")
	public String ListAllDrugProductFront(Model model) {
		List<DrugProduct> list = DrugProductService.findAll();
		model.addAttribute("list", list);
		return "drugs/DrugProductFront";
	}
	
	
	
	@PostMapping(path="/showUpdate")
	public String QueryById(@RequestParam("eId") int eid, Model model) {
		DrugProduct DrugProduct = DrugProductService.findById(eid);
		model.addAttribute("DrugProduct", DrugProduct);
		return "drugs/DrugProductform";
	}
	
	
	
	
	@PostMapping(path = "/showFormForAdd")
	public String addDrugProduct(Model model) {
		
		DrugProduct DrugProduct = new DrugProduct();
		
		model.addAttribute("DrugProduct", DrugProduct);
		
		return "drugs/DrugProductform";
	}

	
	@RequestMapping(path = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("eId") int eId) {
		
		DrugProductService.delete(eId);
		
		return "redirect:/DrugProduct/findalldrugproduct";
	}
	
	
	
	
	
	@PostMapping(path="save")
	public String saveById(@ModelAttribute("DrugProduct") DrugProduct DrugProduct, 
						   @RequestParam("pic") MultipartFile multipartFile,
						   @RequestParam("pic2") MultipartFile multipartFile2,
						   HttpServletRequest request) throws Exception{
		
		
		
		if (multipartFile!= null && !multipartFile.isEmpty()
		&& multipartFile2!= null && !multipartFile2.isEmpty()
				) {
			
			// 抓取檔案名稱
			String fileName = multipartFile.getOriginalFilename();
			
			String suffixName = fileName.substring(fileName.lastIndexOf("."));
			
			//生成檔名稱通用方法(加入現在的時間以及亂數100)
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	        Random r = new Random();
	        StringBuilder tempName = new StringBuilder();
	        tempName.append(sdf.format(new Date())).append(r.nextInt(100)).append(suffixName);
			
			String saveName = tempName.toString();
			
			// 設定檔案路徑
			String saveDir  = request.getSession().getServletContext().getRealPath("/") + "DrugProductImg\\";
			
			// 創建目的資料夾
			File saveDirFile = new File(saveDir);
			saveDirFile.mkdirs();
			
			// 最終檔案路徑
			String saveFilePath = saveDir + File.separator+ saveName;
			File saveFile = new File(saveFilePath);
			
			
			// 儲存圖片
			multipartFile.transferTo(saveFile);
		
			// 將檔名存入DrugProduct
			DrugProduct.setBeforechange(saveName);

		
			// 抓取檔案名稱
			String fileName2 = multipartFile2.getOriginalFilename();
			
			String suffixName2 = fileName2.substring(fileName2.lastIndexOf("."));
			
			//生成檔名稱通用方法(加入現在的時間以及亂數100)
	        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd_HHmmss");
	        Random r2 = new Random();
	        StringBuilder tempName2 = new StringBuilder();
	        tempName2.append(sdf2.format(new Date())).append(r2.nextInt(100)).append(suffixName2);
			
			String saveName2 = tempName2.toString();
			
			// 設定檔案路徑
			String saveDir2  = request.getSession().getServletContext().getRealPath("/") + "DrugProductImg\\";
			
			// 創建目的資料夾
			File saveDirFile2 = new File(saveDir2);
			saveDirFile2.mkdirs();
			
			// 最終檔案路徑
			String saveFilePath2 = saveDir2 + File.separator+ saveName2;
			File saveFile2 = new File(saveFilePath2);
			
			
			// 儲存圖片
			multipartFile2.transferTo(saveFile2);
		
			// 將檔名存入DrugProduct
			DrugProduct.setAfterchange(saveName2);
			
			
		}
		
		DrugProductService.save(DrugProduct);
		
		
		return "redirect:/DrugProduct/findalldrugproduct";
	}

}