package tw.iiihealth.membersystem.manager.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login").setViewName("membersystem/Manager/ManagerLoginAP");
		registry.addViewController("/login/success").setViewName("membersystem/Manager/ManagerLoginSuccess");
		registry.addViewController("/logout").setViewName("membersystem/Manager/ManagerLoginAP");
//		registry.addViewController("/logout/turnback").setViewName("membersystem/Manager/ManagerLoginFail");
	}
}
