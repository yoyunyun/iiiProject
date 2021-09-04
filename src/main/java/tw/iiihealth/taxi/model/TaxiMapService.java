package tw.iiihealth.taxi.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TaxiMapService {

	@Autowired
	private TaxiMapRepository taxiMapRepository;
	
	public List<TaxiMap> searchTaxi(){
		return taxiMapRepository.findAll();
	}
	
	public TaxiMap updateMap(TaxiMap map) {
		return taxiMapRepository.save(map);
	}
	
}
