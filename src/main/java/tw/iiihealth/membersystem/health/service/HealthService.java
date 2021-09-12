package tw.iiihealth.membersystem.health.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.iiihealth.membersystem.health.model.Health;
import tw.iiihealth.membersystem.health.model.HealthRepository;

@Service
@Transactional
public class HealthService {
	
	@Autowired
	private HealthRepository healthRepository;
	
	//檢查健康資料表是否存在
	public Health checkHealth(Integer memberid) {
		return healthRepository.checkHealth(memberid);
	}
	
	// 新增資料 or 修改資料
	public Health saveMember(Health health) {
		return healthRepository.save(health);
	}
	
	// 刪除單筆資料
	public void deleteHealth(Integer healthid) {
		healthRepository.deleteById(healthid);
	}

}
