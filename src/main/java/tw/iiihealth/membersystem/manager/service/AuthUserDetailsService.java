package tw.iiihealth.membersystem.manager.service;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.iiihealth.membersystem.manager.model.Manager;

@Service
public class AuthUserDetailsService implements UserDetailsService {

	@Autowired
	private ManagerService managerService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Manager manager = managerService.searchManageraccount(username);
		
		UserDetails user = new  User(manager.getManageraccount(), manager.getManagerpwd(), Collections.emptyList());
	
		return user;
	}
}
