package tw.iiihealth.drugs.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("one")
@Transactional
public class DrugService {

	@Autowired
	private DrugRepository DrugRepository;
	
	
	
	public List<Drug> findAll() {
		return DrugRepository.findAll();
	}

	
	
	public Drug findById(int eid) {
		Optional<Drug> eRep = DrugRepository.findById(eid);
		return eRep.get();
	}



	public void save(Drug Drug) {
		DrugRepository.save(Drug);
	}



	public void delete(int eId) {
		DrugRepository.deleteById(eId);
	}

}
