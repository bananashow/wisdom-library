package library.service;

import java.util.ArrayList;

import library.DTO.NoticeBoardDTO;

public interface NoticeBoardService {

	// 공지사항 화면에 뿌리기
	public ArrayList<NoticeBoardDTO> noticeList(int limitStart);
	
	// 공지사항 내용 자세히 보기
	public NoticeBoardDTO noticeRead(int nnum);
	
	// 공지사항 수정
	public void noticeEdit(String title, String content, String nnum);
	
	// 공지사항 삭제
	public void noticeDelete(String nnum);
	
	// 공지사항 글쓰기
	public void noticeInsert(String title, String content);
	
	// 공지사항 개수
	public int noticeCount();
}
