package tw.iiihealth.drugs.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class DrugProductService {

	@Autowired
	private DrugProductRepository DrugProductRepository;
	
	
	
	public List<DrugProduct> findAll() {
		return DrugProductRepository.findAll();
	}

	
	
	public DrugProduct findById(int eid) {
		Optional<DrugProduct> eRep = DrugProductRepository.findById(eid);
		return eRep.get();
	}



	public void save(DrugProduct DrugProduct) {
		DrugProductRepository.save(DrugProduct);
	}



	public void delete(int eId) {
		DrugProductRepository.deleteById(eId);
	}

}