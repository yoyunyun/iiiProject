package tw.iiihealth.taxi.model;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BookTaxiService {

	@Autowired
	private BookTaxiRepository bookTaxiRepository;
	
	public BookTaxi findById(int mid) {
		Optional<BookTaxi> pRep = bookTaxiRepository.findById(mid);
		if (pRep.isPresent()) {
			return pRep.get();
		}
		return null;
	}
	
	public BookTaxi insert(BookTaxi book) {
		return bookTaxiRepository.save(book);
	}
	
	public void deleteById(Integer book_id) {
		bookTaxiRepository.deleteById(book_id);
	}
}
