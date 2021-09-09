package tw.iiihealth.taxi.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BookTaxiService {

	@Autowired
	private BookTaxiRepository bookTaxiRepository;
	
	public BookTaxi insert(BookTaxi book) {
		return bookTaxiRepository.save(book);
	}
	
	public void deleteById(Integer book_id) {
		bookTaxiRepository.deleteById(book_id);
	}
}
