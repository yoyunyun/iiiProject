package tw.iiihealth.membersystem.manager.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import net.bytebuddy.utility.RandomString;
import tw.iiihealth.membersystem.manager.model.Manager;
import tw.iiihealth.membersystem.manager.model.ManagerRepository;

@Service
public class MailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private ManagerRepository managerRepository;
	
	//一封簡單郵件的傳送
	public void sendSimpleMail() throws Exception {
	SimpleMailMessage message = new SimpleMailMessage();
	message.setFrom("iiieeit12907@gmail.com");
	message.setTo("iiieeit12907@gmail.com");
	message.setSubject("主題：簡單郵件");
	message.setText("測試郵件內容");
	mailSender.send(message);
	}
	
	//通過MimeMessageHelper來傳送一封帶有附件的郵件
	public void sendAttachmentsMail() throws Exception {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
		helper.setFrom("iiieeit12907@gmail.com");
		helper.setTo("iiieeit12907@gmail.com");
		helper.setSubject("主題：有附件");
		helper.setText("有附件的郵件");
		Resource resource = new ClassPathResource("static/images/update.png");
		File file = resource.getFile();
		helper.addAttachment("附件-1.jpg", file);
		helper.addAttachment("附件-2.jpg", file);
		mailSender.send(mimeMessage);
		}
	
	//通過MimeMessageHelper實現在郵件正文中嵌入靜態資源
	public void sendInlineMail() throws Exception {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
		helper.setFrom("iiieeit12907@gmail.com");
		helper.setTo("iiieeit12907@gmail.com");
		helper.setSubject("主題：嵌入靜態資源");
		helper.setText("<html><body><img src=\"cid:weixin\" ></body></html>", true);
		Resource resource = new ClassPathResource("static/images/update.png");
		File file = resource.getFile();
		helper.addInline("weixin", file);
		mailSender.send(mimeMessage);
		}
	
	public void register(Manager manager, String siteURL) throws UnsupportedEncodingException, MessagingException {
//	    String encodedPassword = passwordEncoder.encode(user.getPassword());
//	    user.setPassword(encodedPassword);
	    System.out.println(siteURL); //
		
	    String randomCode = RandomString.make(64);
	    manager.setVerificationCode(randomCode);
	    manager.setEnabled(false);
	     
	    managerRepository.save(manager);
	     
	    sendVerificationEmail(manager, siteURL);
	}
	
	private void sendVerificationEmail(Manager manager, String siteURL)
	        throws MessagingException, UnsupportedEncodingException {
	    String toAddress = manager.getManageremail();
	    String fromAddress = "iiieeit12907@gmail.com";
	    String senderName = "Your company name";
	    String subject = "Please verify your registration";
	    String content = "Dear [[name]],<br>"
	            + "Please click the link below to verify your registration:<br>"
	            + "<h3><a href=\"[[URL]]\" target=\"_self\">請點此驗證</a></h3>"
	            + "Thank you,<br>"
	            + "Your company name.";
	     
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message);
	     
	    helper.setFrom(fromAddress, senderName);
	    helper.setTo(toAddress);
	    helper.setSubject(subject);
	     
	    content = content.replace("[[name]]", manager.getManagername());
	    String verifyURL = siteURL + "/verify?code=" + manager.getVerificationCode();
	     
	    content = content.replace("[[URL]]", verifyURL);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	     
	}
	
	public boolean verify(String verificationCode) {
		Manager manager = managerRepository.searchVerificationCode(verificationCode);
	     
	    if (manager == null || manager.isEnabled()) {
	        return false;
	    } else {
	    	manager.setVerificationCode(null);
	    	manager.setEnabled(true);
	    	managerRepository.save(manager);
	         
	        return true;
	    }
	     
	}

}
