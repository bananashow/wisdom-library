package library.serviceImp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.DTO.FreeBoardDTO;
import library.mapper.FreeBoardMapper;
import library.service.FreeBoardService;

@Service
public class FreeBoardServiceImp implements FreeBoardService {
	
	@Autowired
	FreeBoardMapper mapper;
	
	@Override
	public ArrayList<FreeBoardDTO> freeBoardList(int limitStart) {
		return mapper.freeBoardList(limitStart);
	}

	@Override
	public ArrayList<FreeBoardDTO> searchbook(String search, String searchText) {
		return mapper.searchBoard(search, searchText);
	}

	@Override
	public void boardWrite(String id, String title, String content) {
		mapper.boardWrite(id, title, content);
	}

	@Override
	public FreeBoardDTO boardReadMore(int bnum) {
		return mapper.boardReadMore(bnum);
	}

	@Override
	public void freeBoardEdit(String title, String content, int bnum) {
		mapper.freeBoardEdit(title, content, bnum);
	}

	@Override
	public void freeBoardDelete(int bnum) {
		mapper.freeBoardDelete(bnum);
	}

	@Override
	public void freeBoardHits(int bnum) {
		mapper.freeBoardHits(bnum);
	}

	@Override
	public int countBoard() {
		return mapper.countBoard();
	}



	
	
}
