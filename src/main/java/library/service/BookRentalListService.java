package library.service;

import java.util.ArrayList;

import library.DTO.BookRentalListDTO;

public interface BookRentalListService {

	// 로그인 되어있는 회원의 대여 리스트
	public ArrayList<BookRentalListDTO> rentalList(String id);
	
	// 로그인 되어있는 회원으로 대여 도서 추가
	public void rentalBookInsert(String isbn, String booktitle, String id, String name, String email);

	// 천체 대여 리스트
	public ArrayList<BookRentalListDTO> rentalListAll(int limitStart);

	// 괸리자 미반납 -> 반납 처리
	public void returnBook(int rnum);
	
	//전체 대여 도서 개수
	public int rentalBookCount();
	
	// 대여한 도서 찾기
	public ArrayList<BookRentalListDTO> rentBookSearch(String search, String searchText);
	
}
