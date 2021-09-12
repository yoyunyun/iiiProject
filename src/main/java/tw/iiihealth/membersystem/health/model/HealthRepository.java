package tw.iiihealth.membersystem.health.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface HealthRepository extends JpaRepository<Health, Integer> {
    
    @Query("from Health where memberid = ?1")
    public Health checkHealth(Integer memberid);
    
}
