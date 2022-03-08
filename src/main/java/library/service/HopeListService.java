package library.service;

import java.util.ArrayList;

import library.DTO.HopeListDTO;

public interface HopeListService {
	
	// 희망 도서 신청받기
	public void hopeListAdd(String id, String isbn, String booktitle, String author, String link);

	// 희망 도서 리스트 - 관리자 페이지
	public ArrayList<HopeListDTO> hopeList(int limitStart);
	
	// 희망 도서 삭제 - 관리자 페이지
	public void hopeDelete(String hnum);
	
	// 희망 도서 신청 개수
	public int hopeBookCount();

}
