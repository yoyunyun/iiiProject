package tw.iiihealth.membersystem.manager.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import tw.iiihealth.membersystem.manager.service.ManagerDetailsService;

@Configuration
@Order(1)
public class ManagerSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private ManagerDetailsService managerDetailsService;
	
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		.userDetailsService(managerDetailsService)
		.passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(HttpSecurity http) throws Exception {
		http
		.antMatcher("/Manager/**")
		.authorizeRequests().anyRequest().authenticated()
		.and().formLogin().loginPage("/Manager/login")
			.defaultSuccessUrl("/Manager/login/success", true)
			.failureUrl("/Manager/login/AccessDenied")
		.permitAll()
		.and().logout().logoutUrl("/Manager/logout").logoutSuccessUrl("/Manager/login")
		.and().exceptionHandling().accessDeniedPage("/Manager/AccessDenied");
		http.csrf().disable();
		
		
//		http
//		.authorizeRequests()
//		.antMatchers(HttpMethod.GET, "/Manager/**").authenticated()
//		.antMatchers(HttpMethod.GET).permitAll()
//		.antMatchers(HttpMethod.POST, "/Manager/**").authenticated()
//		.antMatchers(HttpMethod.POST).permitAll()
//		.anyRequest().authenticated()
//		.and()
//		.rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
//		.and()
//		.csrf().disable()
//		.formLogin().loginPage("/Manager/login").defaultSuccessUrl("/Manager/login/success",true).failureUrl("/Manager/login/AccessDenied").permitAll()
//        .and()
//        .logout().logoutUrl("/Manager/logout").logoutSuccessUrl("/Manager/login")
//        .and()
//        .exceptionHandling().accessDeniedPage("/Manager/AccessDenied");
	}

	
	
}
