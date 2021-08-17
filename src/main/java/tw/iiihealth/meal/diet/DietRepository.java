package tw.iiihealth.meal.diet;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface DietRepository extends JpaRepository<DietBean, Integer> {

	@Query(value = "from DietBean where name =?1")
	public DietBean findDiet(String name);
	
	@Query(value = "from DietBean where type =?1")
	public ArrayList<DietBean> findTypeDiet(String type);
	
	@Query(value = "Select * From Diet", nativeQuery = true)
	public ArrayList<DietBean> findAllDiet();
	
}
