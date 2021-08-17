package tw.iiihealth.meal.diet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("DietService")
@Transactional
public class DietService {
	
	@Autowired
	private DietRepository dietRepository;
	
	// 新增食品資料
	public DietBean insert(DietBean d) {
		return dietRepository.save(d);
	}
	
	// 修改食品資料
	public DietBean update(DietBean d) {
		return dietRepository.save(d);
	}
	
	// 刪除食品資料
	public void delete(DietBean d) {
		dietRepository.delete(d);
	}
	
	// 查詢食品資料庫
    public List<DietBean> findAllDiet(){
    	return dietRepository.findAllDiet();
    }
    
    // 查詢單筆
    public DietBean findDiet(String name){
    	return dietRepository.findDiet(name);
    }
	
	// 查詢分類食品資料
	public ArrayList<DietBean> findTypeDiet(String type) throws SQLException {
		return dietRepository.findTypeDiet(type);
	}
	
}
