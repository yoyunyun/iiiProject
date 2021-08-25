package tw.iiihealth.taxi.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LocRepository extends JpaRepository<Location, Integer> {

	@Query(value = "from Location where city = :city AND type = :type")
	public List<Location> SearchCity(@Param("city") String city, @Param("type") String type);
	
	@Query(value = "from Location where town = :town AND type = :type")
	public List<Location> SearchTown(@Param("town") String town, @Param("type") String type);
}
