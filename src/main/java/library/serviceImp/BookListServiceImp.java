package library.serviceImp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.DTO.BookListDTO;
import library.mapper.BookListMapper;
import library.service.BookListService;
@Service
public class BookListServiceImp implements BookListService {
	@Autowired
	BookListMapper mapper;

	@Override
	public ArrayList<BookListDTO> list(int limitStart) {
		return mapper.list(limitStart);
	}
	
	@Override
	public ArrayList<BookListDTO> searchbook(String search, String searchText) {
		return mapper.searchbook(search, searchText);
	}
	
	@Override
	public String bookStockNum(String isbn) {
		return mapper.bookStockNum(isbn);
	}

	@Override
	public void bookStock(String isbn) {
		mapper.bookStock(isbn);
	}

	@Override
	public BookListDTO bookInfo(String isbn) {
		return mapper.bookInfo(isbn);
	}

	@Override
	public void bookInfoEdit(String isbn, String booktitle, String author, String genre, String company, int stock) {
		mapper.bookInfoEdit(isbn, booktitle, author, genre, company, stock);
	}

	@Override
	public void bookDelete(String isbn) {
		mapper.bookDelete(isbn);
	}

	@Override
	public void bookAdd(String isbn, String booktitle, String author, String genre, String company, int stock) {
		mapper.bookAdd(isbn, booktitle, author, genre, company, stock);
	}

	@Override
	public int countBoard() {
		return mapper.countBoard();
	}

	@Override
	public void bookStockPlus(String isbn) {
		mapper.bookStockPlus(isbn);
	}

	
}
