package tw.iiihealth.taxi.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional
public class TaxiService {

	@Autowired
	private TaxiRepository taxiRepository;
	
//	public List<TaxiBean> search(String name){
//
//		return taxiRepository.Search(name);
//	}
	
	public Page<TaxiBean> query(String name, Pageable pageable){

		Page<TaxiBean> allQueryResults = taxiRepository.findAllBytname(name, pageable);
		return allQueryResults;
	}
	
	public TaxiBean findById(Integer id) {
		Optional<TaxiBean> pRep = taxiRepository.findById(id);
		if(pRep.isPresent()) {
			return pRep.get();
		}
		return null;
	}
	
	
	public List<TaxiBean> findAll(){
		return taxiRepository.findAll();
	}
	
	public Page<TaxiBean> findAllByPage(Pageable pageable){
		return taxiRepository.findAll(pageable);
	}
	
	public TaxiBean insert(TaxiBean taxi) {
		return taxiRepository.save(taxi);			
	}
	
	public TaxiBean update(TaxiBean taxi) {
		return taxiRepository.save(taxi);			
	}
	
	public void deleteById(Integer id) {
		taxiRepository.deleteById(id);
	}
	
}
