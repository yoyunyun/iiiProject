package tw.iiihealth.taxi.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LocService {

	@Autowired
	private LocRepository locRepository;
	
	public Location findById(int id) {
		Optional<Location> pRep = locRepository.findById(id);
		if(pRep.isPresent()) {
			return pRep.get();
		}
		return null;
	}
	
	public List<Location> queryCity(String city, String type){
		return locRepository.SearchCity(city, type);
	}
	public List<Location> queryTown(String town, String type){
		return locRepository.SearchTown(town, type);
	}
	
	
	public List<Location> findAll(){
		return locRepository.findAll();
	}
	
	public Location insert(Location taxi) {
		return locRepository.save(taxi);			
	}
	
	public void deleteById(Integer id) {
		locRepository.deleteById(id);
	}
}
