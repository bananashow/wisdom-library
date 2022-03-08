package library.service;

import java.util.ArrayList;

import library.DTO.FreeBoardDTO;

public interface FreeBoardService {
	
	// 게시글 총 갯수
	public int countBoard();

	// 자유 게시판 리스트
	public ArrayList<FreeBoardDTO> freeBoardList(int limitStart);

	// 게시글 찾기
	public ArrayList<FreeBoardDTO> searchbook(String search, String searchText);

	// 게시글 작성
	public void boardWrite(String id, String title, String content);

	// 게시글 자세히 보기
	public FreeBoardDTO boardReadMore(int bnum);

	// 게시글 수정
	public void freeBoardEdit(String title, String content, int bnum);
	
	// 게시글 삭제
	public void freeBoardDelete(int bnum);

	// 게시글 자세히 보기 누르면 조회수 +1
	public void freeBoardHits(int bnum);
	

}
