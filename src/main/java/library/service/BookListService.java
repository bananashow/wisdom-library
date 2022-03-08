package library.service;

import java.util.ArrayList;

import library.DTO.BookListDTO;

public interface BookListService {
	
	// 등록된 도서 개수
	public int countBoard();
	
	// 도서 전체 리스트
	public ArrayList<BookListDTO> list(int limitStart);
	
	// 도서 찾기
	public ArrayList<BookListDTO> searchbook(String search, String searchText);
	
	// 재고 수 화면에 출력
	public String bookStockNum(String isbn);
	
	// 도서 대여 : 재고 수 -1 처리
	public void bookStock(String isbn);
	
	// 도서 대여 : 재고 수 +1 처리
	public void bookStockPlus(String isbn);
	
	//isbn으로 책 정보 가져오기
	public BookListDTO bookInfo(String isbn);
	
	// 도서 정보 수정
	public void bookInfoEdit(String isbn, String booktitle, String author, String genre, String company, int stock);
	
	// 도서 정보 삭제
	public void bookDelete(String isbn);

	// 도서 추가
	public void bookAdd(String isbn, String booktitle, String author, String genre, String company, int stock);

}
