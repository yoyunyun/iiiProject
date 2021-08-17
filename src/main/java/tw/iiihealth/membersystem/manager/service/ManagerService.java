package tw.iiihealth.membersystem.manager.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.iiihealth.membersystem.manager.exception.UserNotFoundException;
import tw.iiihealth.membersystem.manager.model.Manager;
import tw.iiihealth.membersystem.manager.model.ManagerRepository;

@Service
@Transactional
public class ManagerService {

	@Autowired
	private ManagerRepository managerRepository;

	// 查詢全部資料
	public List<Manager> searchAllManager() {

		List<Manager> list = managerRepository.findAll();

		return list;
	}
	
	//確認帳號
	public Manager searchManageraccount(String manageraccount) {
		
		Optional<Manager> opManager = managerRepository.searchAccount(manageraccount);
	
		if(opManager.isEmpty()) {
			throw new UserNotFoundException("帳號或密碼不正確");
		}
		
		return opManager.get();
	
	}

	// 新增資料
	public Manager insertManager(Manager managerData) {

		Manager managerObj = managerRepository.save(managerData);

		return managerObj;
	}

	// 刪除單筆資料
	public void deleteManager(Manager managerData) {

		managerRepository.delete(managerData);
	}

	// 修改單筆資料
	public Manager updateManager(Manager managerData) {

		Manager managerObj = managerRepository.save(managerData);

		return managerObj;
	}
}
