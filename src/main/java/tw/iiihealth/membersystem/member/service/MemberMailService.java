package tw.iiihealth.membersystem.member.service;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import net.bytebuddy.utility.RandomString;
import tw.iiihealth.membersystem.member.model.Member;

@Service
public class MemberMailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService memberService;
	
	
	
	//找回密碼
	public void sendInlineMail(Member member, String password) throws Exception {
		
	    String toAddress = member.getMemberemail();
	    String fromAddress = "iiieeit12907@gmail.com";
	    String senderName = "健康悠生網";
	    String subject = "忘記密碼";
	    String content = "親愛的[[name]],<br>"
	            + "請使用我們為您準備的帳號密碼:<br><br>"
	    		+ "<table style=\"font-family: Arial, Helvetica, sans-serif; border-collapse: collapse; width: 1000px;\">"
	    		+ "<tr>"
	            + "<th style=\"padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #04AA6D; color: white; border: 1px solid #ddd; padding: px;\">姓名</th>\r\n"
	            + "<th style=\"padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #04AA6D; color: white; border: 1px solid #ddd; padding: 8px;\">權限</th>\r\n"
	            + "<th style=\"padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #04AA6D; color: white; border: 1px solid #ddd; padding: 8px;\">帳號</th>\r\n"
	            + "<th style=\"padding-top: 12px; padding-bottom: 12px; text-align: center; background-color: #04AA6D; color: white; border: 1px solid #ddd; padding: 8px;\">密碼</th>\r\n"
	            + "</tr>"
	            + "<tr style=\"background-color: #f2f2f2;\">"
	            + "<td style=\"border: 2px solid #ddd; padding: 8px; text-align: center;\">[[name]]</td>"
	            + "<td style=\"border: 2px solid #ddd; padding: 8px; text-align: center;\">[[role]]</td>"
	            + "<td style=\"border: 2px solid #ddd; padding: 8px; text-align: center;\">[[account]]</td>"
	            + "<td style=\"border: 2px solid #ddd; padding: 8px; text-align: center;\">[[password]]</td>"
	            + "</tr>"
	            + "</table>"
	    		+ "<br><br><img width=\"150px\" height=\"150px\" src=\"cid:laught\" >"
	            + "<h3><a href='http://localhost:8080/Member/login'>請點此登入</a></h3>"
	            + "謝謝,<br>"
	            + "健康悠生網，關心您";
	    
	    
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message, true);
	     
	    helper.setFrom(fromAddress, senderName);
	    helper.setTo(toAddress);
	    helper.setSubject(subject);
	     
	    content = content.replace("[[name]]", member.getMembername());
	    content = content.replace("[[role]]", member.getRole());
	    content = content.replace("[[account]]", member.getMemberaccount());
	    content = content.replace("[[password]]", password);
	     
		Resource resource = new ClassPathResource("static/images/laught.png");
		
		File file = resource.getFile();
		
	    helper.setText(content, true);
	    
	    helper.addInline("laught", file); 
	     
	    mailSender.send(message);
	    
	    
		
		}
	
	
	
	
	//信箱驗證(1)
	public void memberMailSave(Member member, String siteURL) throws UnsupportedEncodingException, MessagingException {
		
	    String randomCode = RandomString.make(64);
	    member.setVerificationCode(randomCode);
	    
    	member.setDisabled(true);
    	member.setAccountExpired(true);
    	member.setAccountLocked(true);
    	member.setCredentialsExpired(true);

    	memberService.saveMember(member);
	     
	    sendVerificationEmail(member, siteURL);
	}
	
	//信箱驗證(2)
	private void sendVerificationEmail(Member member, String siteURL)
	        throws MessagingException, UnsupportedEncodingException {
	    String toAddress = member.getMemberemail();
	    String fromAddress = "iiieeit12907@gmail.com";
	    String senderName = "健康悠生網";
	    String subject = "請驗證您註冊的帳戶";
	    String content = "親愛的[[name]],<br>"
	            + "請點選下面的連結來驗證您註冊的帳戶:<br>"
	            + "<h3><a href=\"[[URL]]\" target=\"_self\">請點此驗證</a></h3>"
	            + "謝謝,<br>"
	            + "健康悠生網，關心您";
	     
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message);
	     
	    helper.setFrom(fromAddress, senderName);
	    helper.setTo(toAddress);
	    helper.setSubject(subject);
	     
	    content = content.replace("[[name]]", member.getMembername());
	    String verifyURL = siteURL + "/verifyMember?code=" + member.getVerificationCode();
	     
	    content = content.replace("[[URL]]", verifyURL);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	     
	}
	
	//信箱驗證(3)
	public boolean verify(String verificationCode) {
		Member member = memberService.searchMailCode(verificationCode);
	     
	    if (member == null || member.isDisabled() == false ) {
	        return false;
	    } else {
	    	member.setVerificationCode("");
	    	member.setDisabled(false);
	    	member.setAccountExpired(false);
	    	member.setAccountLocked(false);
	    	member.setCredentialsExpired(false);
	    	member.setRole("MEMBER");
	    	
	    	memberService.saveMember(member);
	         
	        return true;
	    }
	     
	}

}
