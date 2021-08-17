package tw.iiihealth.taxi.model;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaxiRepository extends JpaRepository<TaxiBean, Integer> {
//	@Query(value = "from TaxiBean where tname like concat('%',?1,'%')")
//	public List<TaxiBean> Search(String name);
	
	Page<TaxiBean> findAllBytname(String tname, Pageable pageable);
}	
