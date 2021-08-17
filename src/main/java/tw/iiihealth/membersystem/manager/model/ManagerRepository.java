package tw.iiihealth.membersystem.manager.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface ManagerRepository extends JpaRepository<Manager, Integer> {

	@Query(value = "from Manager where manageraccount = ?1")
	public Optional<Manager> searchAccount(String manageraccount);
	
    @Query("from Manager where verificationCode = ?1")
    public Manager searchVerificationCode(String code);
}
