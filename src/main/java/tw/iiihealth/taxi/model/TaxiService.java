package tw.iiihealth.taxi.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

@Service
@Transactional
public class TaxiService {

	@Autowired
	private  JavaMailSender mailSender;
	
	@Autowired
	freemarker.template.Configuration freemarkerConfig;

	@Autowired
	private TaxiRepository taxiRepository;

	public List<TaxiBean> search(String name) {

		return taxiRepository.Search(name);
	}

	public Page<TaxiBean> query(String name, Pageable pageable) {

		Page<TaxiBean> allQueryResults = taxiRepository.findAllBytname(name, pageable);
		return allQueryResults;
	}

	public TaxiBean findById(Integer id) {
		Optional<TaxiBean> pRep = taxiRepository.findById(id);
		if (pRep.isPresent()) {
			return pRep.get();
		}
		return null;
	}

	public List<TaxiBean> findAll() {
		return taxiRepository.findAll();
	}

	public Page<TaxiBean> findAllByPage(Pageable pageable) {
		return taxiRepository.findAll(pageable);
	}

	public TaxiBean insert(TaxiBean taxi) {
		return taxiRepository.save(taxi);
	}

	public TaxiBean update(TaxiBean taxi) {
		return taxiRepository.save(taxi);
	}

	public void deleteById(Integer id) {
		taxiRepository.deleteById(id);
	}

	// 模板mail(出貨通知)
	public void sendTemplateMail(String mail, String user, String taxi, String loc, 
									String date, String hour, String min, String tel) throws Exception {

		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
		helper.setFrom("iiieeit12907@gmail.com");
		helper.setTo(mail);
		helper.setSubject("主旨：[健康悠生網] 預約叫車通知");

		// 塞入變數
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("userName", user);
		model.put("taxi", taxi);
		model.put("loc", loc);
		model.put("date", date);
		model.put("hour", hour);
		model.put("min", min);
		model.put("tel", tel);

		// mail內容
		String templateString = FreeMarkerTemplateUtils
				.processTemplateIntoString(freemarkerConfig.getTemplate("BookTaxitemplate.html"), model);

		helper.setText(templateString, true);

		// 寄送
		mailSender.send(mimeMessage);
	}

}
