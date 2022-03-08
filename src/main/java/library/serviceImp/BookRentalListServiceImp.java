package library.serviceImp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.DTO.BookRentalListDTO;
import library.mapper.BookRentalListMapper;
import library.service.BookRentalListService;

@Service
public class BookRentalListServiceImp implements BookRentalListService {

	@Autowired
	BookRentalListMapper mapper;

	@Override
	public ArrayList<BookRentalListDTO> rentalList(String id) {
		return mapper.rentalList(id);
	}

	@Override
	public void rentalBookInsert(String isbn, String booktitle, String id, String name, String email) {
		mapper.rentalBookInsert(isbn, booktitle, id, name, email);
	}

	@Override
	public ArrayList<BookRentalListDTO> rentalListAll(int limitStart) {
		return mapper.rentalListAll(limitStart);
	}

	@Override
	public void returnBook(int rnum) {
		mapper.returnBook(rnum);
	}

	@Override
	public int rentalBookCount() {
		return mapper.rentalBookCount();
	}

	@Override
	public ArrayList<BookRentalListDTO> rentBookSearch(String search, String searchText) {
		return mapper.rentBookSearch(search, searchText);
	}


}
